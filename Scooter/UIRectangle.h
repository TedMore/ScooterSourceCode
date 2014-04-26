//
//  UIAutoresizingLabel.h
//  Scooter
//
//  Created by xingyanl on 14-4-2.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIDrawRectangle(frame, top)				([[UIRectangle  alloc] initWithFrame:frame andInsets:UIEdgeInsetsMake(top, 0, 0, 0)])

@interface UIRectangle : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets) insets;
- (id)initWithInsets:(UIEdgeInsets) insets;

@end
