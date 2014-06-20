//
//  APIManager.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "APIManager.h"

#define URL @"http://api.stackexchange.com/2.2/questions?"
#define END_OF_URL_PARAMETERS @"site=stackoverflow"

@implementation APIManager

+ (APIManager *)standardManager {
    static APIManager *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [self new];
    });
    
    return sharedObject;
}

- (NSString *)urlStringForParameters:(NSDictionary *)params {
    NSString *parameters = [NSString string];
    
    for (id key in params) {
        id value = [params objectForKey:key];
        parameters = [parameters stringByAppendingString:[NSString stringWithFormat:@"%@=%@&", key, value]];
    }
    
    return [NSString stringWithFormat:@"%@%@", URL, [parameters stringByAppendingString:END_OF_URL_PARAMETERS]];
}

- (NSString *)orderFor:(APIManagerOrder)order {
    if (order == APIManagerOrderAsc) {
        return @"asc";
    }
    
    if (order == APIManagerOrderDesc) {
        return @"desc";
    }
    
    return nil;
}

- (NSString *)sortFor:(APIManagerSort)sort {
    if (sort == APIManagerSortActivity)
        return @"activity";
    if (sort == APIManagerSortCreation)
        return @"creation";
    if (sort == APIManagerSortHot)
        return @"hot";
    if (sort == APIManagerSortMonth)
        return @"month";
    if (sort == APIManagerSortVotes)
        return @"votes";
    if (sort == APIManagerSortWeek)
        return @"week";
    
    return nil;
}

- (NSTimeInterval)timeintervalForDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}

- (NSString *)urlStringForStackOverflowForPage:(NSInteger)page andPageSize:(NSInteger)pageSize andFromDate:(NSDate *)fromDate andToDate:(NSDate *)toDate andOrder:(APIManagerOrder)order andSort:(APIManagerSort)sort {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSString stringWithFormat:@"%d", page], PAGE,
                            [NSString stringWithFormat:@"%d", pageSize], PAGESIZE,
                            [NSString stringWithFormat:@"%.f", [self timeintervalForDate:fromDate]], FROMDATE,
                            [NSString stringWithFormat:@"%.f", [self timeintervalForDate:toDate]], TODATE,
                            [self orderFor:order], ORDER,
                            [self sortFor:sort], SORT,
                            nil];
    
    return [self urlStringForParameters:params];
}

// custom method to return what we need
// if you want to change parameters, just change parameters below

- (NSString *)urlStringForStackOverflow {    
    NSCalendar *defaultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [defaultCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *components = [defaultCalendar components:unitFlags fromDate:[NSDate date]];
    
    [components setDay:[components day] + 2]; // + 2 days from current date
    NSDate *toDate = [defaultCalendar dateFromComponents:components];
    
    [components setDay:[components day] - 3]; // - 1 day from current date
    NSDate *fromDate = [defaultCalendar dateFromComponents:components];
    
    
    return [self urlStringForStackOverflowForPage:1
                                      andPageSize:10
                                      andFromDate:fromDate
                                        andToDate:toDate
                                         andOrder:APIManagerOrderAsc
                                          andSort:APIManagerSortHot];
    
}

@end
