//
//  StackoverTopMasterViewController.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "StackoverTopMasterViewController.h"

@interface StackoverTopMasterViewController () {
    NSMutableArray *_objects;
}

@property (nonatomic, strong) RequestManager *requestManager;
@property (nonatomic, strong) NSString *url;
@end


#define ST_ITEMS @"items"

@implementation StackoverTopMasterViewController

#pragma mark - Private Methods

- (RequestManager *)requestManager {
    if (!_requestManager) {
        _requestManager = [[RequestManager alloc] init];
    }
    
    return _requestManager;
}

- (IBAction)updateTable {
    [self.requestManager setURLString:self.url andHTTPMethod:RequestManagerHTTPMethodGET];
    [self.requestManager sendRequest];
}

#pragma mark - View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(updateTable) forControlEvents:UIControlEventValueChanged];
    
    self.url = [[APIManager standardManager] urlStringForStackOverflow];
    self.requestManager.delegate = self;
    [self.requestManager setURLString:self.url andHTTPMethod:RequestManagerHTTPMethodGET];
    [self.requestManager sendRequest];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    StackOverFlowQuestion *object = _objects[indexPath.row];
    
    cell.textLabel.text = object.title;
    cell.detailTextLabel.text = object.owner.displayName;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark Request Manager Delegate
- (void)requestManager:(RequestManager *)manager startProceedingRequest:(NSURLRequest *)request {
    // do nothing yet;
    [self.refreshControl beginRefreshing];
}

- (void)requestManager:(RequestManager *)manager didReceiveResponse:(NSURLResponse *)response {
    // do nothing yet
}

- (void)requestManager:(RequestManager *)manager didLoadResult:(id)result {
    _objects = [NSMutableArray array];
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSArray *items = (NSArray *)[result objectForKey:ST_ITEMS];
        
        for (id object in items) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                StackOverFlowQuestion *question = [StackOverFlowQuestion questionWithParams:object];
                [_objects addObject:question];
            }
        }
    }
    
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)requestManager:(RequestManager *)manager didFailWithError:(NSError *)error {
    [self.requestManager cancelRequest];
    [self.refreshControl endRefreshing];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error description]
                                                   delegate:self
                                          cancelButtonTitle:@"Ok, I got it"
                                          otherButtonTitles:nil];
    [alert show];
}


@end
