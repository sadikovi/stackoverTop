//
//  StackOverFlowQuestion.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "StackOverFlowQuestion.h"

@interface StackOverFlowQuestion()

@property (nonatomic, strong) NSArray *pTags;
@property (nonatomic, strong) StackOverFlowOwner *pOwner;
@property (nonatomic) BOOL pIsAnswered;
@property (nonatomic, strong) NSString *pTitle;
@property (nonatomic) NSInteger pViewsCount;
@property (nonatomic) NSInteger pAnswersCount;
@property (nonatomic) NSInteger pScore;
@property (nonatomic, strong) NSString *pLink;

@end

#define ST_TAGS         @"tags"
#define ST_OWNER        @"owner"
#define ST_IS_ANSWERED  @"is_answered"
#define ST_VIEW_COUNT   @"view_count"
#define ST_ANSWER_COUNT @"answer_count"
#define ST_SCORE        @"score"
#define ST_LINK         @"link"
#define ST_QUESTION_ID  @"question_id"
#define ST_TITLE        @"title"

@implementation StackOverFlowQuestion

#pragma mark - Setters

- (NSArray *)tags {
    return self.pTags;
}

- (StackOverFlowOwner *)owner {
    return self.pOwner;
}

- (BOOL)isAnswered {
    return self.pIsAnswered;
}

- (NSString *)title {
    return self.pTitle;
}

- (NSInteger)viewsCount {
    return self.pViewsCount;
}

- (NSInteger)answersCount {
    return self.pAnswersCount;
}

- (NSInteger)score {
    return self.pScore;
}

- (NSString *)link {
    return self.pLink;
}

// lazy instanciation for array
- (NSArray *)pTags {
    if (!_pTags)
        _pTags = [NSArray array];
    
    return _pTags;
}

// lazy instanciation for owner
- (StackOverFlowOwner *)_pOwner {
    if (!_pOwner)
        _pOwner = [[StackOverFlowOwner alloc] init];
    
    return _pOwner;
}


- (id)initWithTags:(NSArray *)tags andOwner:(NSDictionary *)ownerParams andTitle:(NSString *)title andIsAnswered:(BOOL)isAns andViewsCount:(NSInteger)viewsCount andAnsweresCount:(NSInteger)answeresCount andScore:(NSInteger)sc andLink:(NSString *)link {
    self = [super init];
    
    if (self) {
        self.pTags = tags;
        self.pOwner = [[StackOverFlowOwner alloc] initWithParams:ownerParams];
        self.pTitle = title;
        self.pIsAnswered = isAns;
        self.pViewsCount = viewsCount;
        self.pAnswersCount = answeresCount;
        self.pScore = sc;
        self.pLink = link;
    }
    
    return self;
}

- (id)initWithParams:(NSDictionary *)params {
    NSArray *tags = (NSArray *)[params objectForKey:ST_TAGS];
    NSDictionary *owner = [params objectForKey:ST_OWNER];
    NSString *title = (NSString *)[params objectForKey:ST_TITLE];
    BOOL isAnswered = [[params objectForKey:ST_IS_ANSWERED] boolValue];
    NSInteger viewsCount = [[params objectForKey:ST_VIEW_COUNT] integerValue];
    NSInteger answersCount = [[params objectForKey:ST_ANSWER_COUNT] integerValue];
    NSInteger score = [[params objectForKey:ST_SCORE] integerValue];
    NSString *link = (NSString *)[params objectForKey:ST_LINK];
    
    return [self initWithTags:tags
                     andOwner:owner
                     andTitle:title
                andIsAnswered:isAnswered
                andViewsCount:viewsCount
             andAnsweresCount:answersCount
                     andScore:score
                      andLink:link];
}

+ (StackOverFlowQuestion *)questionWithParams:(NSDictionary *)params {
    StackOverFlowQuestion *question = [[StackOverFlowQuestion alloc] initWithParams:params];
    return question;
}

@end
