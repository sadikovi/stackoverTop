//
//  APIManager.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <Foundation/Foundation.h>

// public parameters for API
#define PAGE        @"page"
#define PAGESIZE    @"pagesize"
#define FROMDATE    @"fromdate"
#define TODATE      @"todate"
#define ORDER       @"order"
#define SORT        @"sort"
#define SITE        @"site"

enum {
    APIManagerOrderAsc,
    APIManagerOrderDesc
} typedef APIManagerOrder;

enum {
    APIManagerSortHot,
    APIManagerSortActivity,
    APIManagerSortVotes,
    APIManagerSortCreation,
    APIManagerSortMonth,
    APIManagerSortWeek
} typedef APIManagerSort;

@interface APIManager : NSObject

+ (APIManager *)standardManager;
- (NSString *)urlStringForParameters:(NSDictionary *)params;
- (NSString *)urlStringForStackOverflow;

@end