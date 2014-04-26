//
//  UIAutoresizingLabel.m
//  Scooter
//
//  Created by xingyanl on 14-4-2.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "UIRectangle.h"

@implementation UIRectangle


- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if(self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.insets = insets;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont boldSystemFontOfSize:20.0f];
    }
    return self;
}

- (id)initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if(self) {
        self.insets = insets;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
