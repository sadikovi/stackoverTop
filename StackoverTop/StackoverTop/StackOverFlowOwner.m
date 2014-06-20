//
//  StackOverFlowOwner.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "StackOverFlowOwner.h"

#define REPUTATION      @"reputation"
#define USER_ID         @"user_id"
#define USER_TYPE       @"user_type"
#define PROFILE_IMAGE   @"profile_image"
#define DISPLAY_NAME    @"display_name"
#define LINK            @"link"

@interface StackOverFlowOwner()

@property (nonatomic) NSInteger pReputation;
@property (nonatomic, strong) NSString *pUserId;
@property (nonatomic, strong) NSString *pProfileImageUrl;
@property (nonatomic, strong) NSString *pDisplayName;
@property (nonatomic, strong) NSString *pLink;

@end


@implementation StackOverFlowOwner

#pragma mark - Setters

- (NSInteger)reputation {
    return self.pReputation;
}

- (NSString *)userId {
    return self.pUserId;
}

- (NSString *)profileImageUrl {
    return  self.pProfileImageUrl;
}

- (NSString *)displayName {
    return self.pDisplayName;
}

- (NSString *)link {
    return self.pLink;
}

#pragma mark - Init and setup methods

- (id)initWithReputation:(NSInteger)reputation andUserId:(NSString *)userid andProfileImage:(NSString *)profileImage andDisplayName:(NSString *)name andLink:(NSString *)link {
    self = [super init];
    if (self) {
        self.pReputation = reputation;
        self.pUserId = userid;
        self.pProfileImageUrl = profileImage;
        self.pDisplayName = name;
        self.pLink = link;
    }
    
    return self;
}

- (id)initWithParams:(NSDictionary *)ownerParams {
    NSInteger reputation = [[ownerParams objectForKey:REPUTATION] integerValue];
    NSString *userid = (NSString *)[ownerParams objectForKey:USER_ID];
    NSString *profileImage = (NSString *)[ownerParams objectForKey:PROFILE_IMAGE];
    NSString *name = (NSString *)[ownerParams objectForKey:DISPLAY_NAME];
    NSString *link = (NSString *)[ownerParams objectForKey:LINK];
    
    return [self initWithReputation:reputation andUserId:userid andProfileImage:profileImage andDisplayName:name andLink:link];
}

+ (StackOverFlowOwner *)ownerWithParams:(NSDictionary *)ownerParams {
    return nil;
}


@end
