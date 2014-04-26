//
//  NWAutoresizingLabel.h
//  mbank
//
//  Created by kemm on 7/9/12.
//  Copyright (c) 2012 CIeNET. All rights reserved.
//

#import <UIKit/UIKit.h>

#define InitializeAutoLabel(xLocation, yLocation) ([[SCAutoresizingLabel alloc] initWithFrame:CGRectMake(xLocation, yLocation, 0.0f, 0.0f)])

@interface SCAutoresizingLabel : UILabel

//设置一个上限CGSize
@property (nonatomic, assign) CGSize upperSize;

- (void)_initialize;

@end

