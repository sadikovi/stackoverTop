//
//  StackoverTopDetailViewController.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackOverFlowQuestion.h"

@interface StackoverTopDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *reputation;
@property (weak, nonatomic) IBOutlet UILabel *viewsCount;
@property (weak, nonatomic) IBOutlet UILabel *answersCount;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *tags;
@property (weak, nonatomic) IBOutlet UILabel *questionText;

@property (strong, nonatomic) StackOverFlowQuestion *question;

@end
