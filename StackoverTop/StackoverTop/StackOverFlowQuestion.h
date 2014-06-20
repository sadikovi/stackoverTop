//
//  StackOverFlowQuestion.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverFlowOwner.h"

@interface StackOverFlowQuestion : NSObject

@property (nonatomic, strong, readonly) NSArray *tags;
@property (nonatomic, strong, readonly) StackOverFlowOwner *owner;
@property (nonatomic, readonly) BOOL isAnswered;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger viewsCount;
@property (nonatomic, readonly) NSInteger answersCount;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong, readonly) NSString *link;

- (id)initWithParams:(NSDictionary *)params;
+ (StackOverFlowQuestion *)questionWithParams:(NSDictionary *)params;

+ (StackOverFlowQuestion *)questionWithTags:(NSArray *)tags andOwner:(NSDictionary *)ownerParams andTitle:(NSString *)title andIsAnswered:(BOOL)isAnswered andViewsCount:(NSInteger)viewsCount andAnsweresCount:(NSInteger)answeresCount andScore:(NSInteger)score andLink:(NSString *)link;

- (id)initWithTags:(NSArray *)tags andOwner:(NSDictionary *)ownerParams andTitle:(NSString *)title andIsAnswered:(BOOL)isAns andViewsCount:(NSInteger)viewsCount andAnsweresCount:(NSInteger)answeresCount andScore:(NSInteger)sc andLink:(NSString *)link;


@end
