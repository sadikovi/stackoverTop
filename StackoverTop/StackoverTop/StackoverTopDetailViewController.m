//
//  StackoverTopDetailViewController.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "StackoverTopDetailViewController.h"

@interface StackoverTopDetailViewController ()
- (void)configureView;
@end

@implementation StackoverTopDetailViewController

#pragma mark - Managing the detail item

- (void)setQuestion:(StackOverFlowQuestion *)newQuestion {
    if (_question != newQuestion) {
        _question = newQuestion;
        
        // Update the view.
        [self configureView];
    }
}

- (NSString *)stringFromArray:(NSArray *)array {
    NSString *result = [NSString string];
    for (NSString *object in array) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@   ", object]];
    }
    
    return result;
}

- (IBAction)openInSafari:(id)sender {
    NSURL *url = [NSURL URLWithString:_question.link];
    if (![[UIApplication sharedApplication] openURL:url])
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
}

- (void)configureView {
    // Update the user interface for the detail item.
    self.profileImage.image = _question.owner.profileImage;
    self.displayName.text = _question.owner.displayName;
    self.reputation.text = [NSString stringWithFormat:@"Reputation: %d", _question.owner.reputation];
    self.viewsCount.text = [NSString stringWithFormat:@"Views: %d", _question.viewsCount];
    self.answersCount.text = [NSString stringWithFormat:@"Answers: %d", _question.answersCount];
    self.score.text = [NSString stringWithFormat:@"Score: %d", _question.score];
    self.tags.text = [self stringFromArray:_question.tags];
    self.questionText.text = _question.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Question";
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
