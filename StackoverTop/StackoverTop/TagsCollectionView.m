//
//  TagsCollectionView.m
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import "TagsCollectionView.h"

@interface TagsCollectionView()
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) NSArray *data;
@end

@implementation TagsCollectionView

- (id)initWithFrame:(CGRect)frame andArray:(NSArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        [aFlowLayout setItemSize:CGSizeMake(frame.size.width, frame.size.height)];
        [aFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        self.collection = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:aFlowLayout];
        
        [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        self.collection.delegate = self;
        self.collection.dataSource = self;
        [self addSubview:self.collection];
        
        self.data = [NSArray arrayWithArray:array];
    }
    return self;
}

#pragma mark - Collection View

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(50, 20);
    
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
