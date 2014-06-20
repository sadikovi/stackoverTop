//
//  TagsCollectionView.h
//  StackoverTop
//
//  Created by Ivan Sadikov on 20/06/14.
//  Copyright (c) 2014 Ivan Sadikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagsCollectionView : UIView
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (id)initWithFrame:(CGRect)frame andArray:(NSArray *)array;

@end
