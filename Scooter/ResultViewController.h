//
//  ResultViewController.h
//  Scooter
//
//  Created by xingyanl on 14-4-3.
//  Copyright (c) 2014年 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"

@interface ResultViewController : UIBaseViewController

@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIView *landscapeView;

@property (strong, nonatomic) IBOutlet UIImageView *portraitImageView;

@property (strong, nonatomic) IBOutlet UIImageView *landscapeImageView;

@property (nonatomic) BOOL connected;

@end
