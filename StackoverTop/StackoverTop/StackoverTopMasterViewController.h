//
//  StackoverTopMasterViewController.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackoverTopDetailViewController.h"
#import "RequestManager.h"
#import "APIManager.h"
#import "StackOverFlowQuestion.h"
#import "StackOverFlowOwner.h"

@interface StackoverTopMasterViewController : UITableViewController
<RequestManagerDelegate>

@end
