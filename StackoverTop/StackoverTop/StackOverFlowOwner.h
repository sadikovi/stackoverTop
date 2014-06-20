//
//  StackOverFlowOwner.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManager.h"

@interface StackOverFlowOwner : NSObject

@property (nonatomic, readonly) NSInteger reputation;
@property (nonatomic, strong, readonly) NSString *userId;
@property (nonatomic, strong, readonly) NSString *profileImageUrl;
@property (nonatomic, strong, readonly) NSString *displayName;
@property (nonatomic, strong, readonly) NSString *link;
@property (nonatomic, strong) UIImage *profileImage;

+ (StackOverFlowOwner *)ownerWithParams:(NSDictionary *)ownerParams;
- (id)initWithParams:(NSDictionary *)ownerParams;
- (id)initWithReputation:(NSInteger)reputation andUserId:(NSString *)userid andProfileImage:(NSString *)profileImage andDisplayName:(NSString *)name andLink:(NSString *)link;

@end
