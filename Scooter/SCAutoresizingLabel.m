//
//  NWAutoresizingLabel.m
//  mbank
//
//  Created by kemm on 7/9/12.
//  Copyright (c) 2012 CIeNET. All rights reserved.
//

#import "SCAutoresizingLabel.h"

@implementation SCAutoresizingLabel

@synthesize upperSize = _upperSize;

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self _initialize];
	}
	return self;
}


- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self _initialize];
	}
	return self;
}

- (void)setText:(NSString *)string {
	[super setText:string];
	//设置自动行数与字符换行  
	self.numberOfLines = 0;
    
    //根据当前的ios的版本来自动选择需要的参数
//	self.lineBreakMode = UILineBreakModeWordWrap;
    self.lineBreakMode = NSLineBreakByWordWrapping;
	//计算实际frame大小，并将label的frame变成实际大小
	CGSize labelsize = [string sizeWithFont:self.font constrainedToSize:_upperSize lineBreakMode:NSLineBreakByWordWrapping];  
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, labelsize.height);
}

#pragma mark - Private
- (void)_initialize {
	_upperSize = CGSizeMake(320, 2000);
    self.backgroundColor = [UIColor clearColor];
    self.textColor = [UIColor whiteColor];
    self.font = [UIFont systemFontOfSize:14.0f];
}

@end
