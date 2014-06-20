//
//  StackOverFlowOwner.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverFlowOwner : NSObject

@property (nonatomic, readonly) NSInteger reputation;
@property (nonatomic, strong, readonly) NSString *userId;
@property (nonatomic, strong, readonly) NSString *profileImage;
@property (nonatomic, strong, readonly) NSString *displayName;
@property (nonatomic, strong, readonly) NSString *link;

+ (StackOverFlowOwner *)ownerWithParams:(NSDictionary *)ownerParams;
- (id)initWithParams:(NSDictionary *)ownerParams;
- (id)initWithReputation:(NSInteger)reputation andUserId:(NSString *)userid andProfileImage:(NSString *)profileImage andDisplayName:(NSString *)name andLink:(NSString *)link;

@end
