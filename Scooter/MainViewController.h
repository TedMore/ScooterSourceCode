//
//  MainViewController.h
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "UIBaseViewController.h"

@interface MainViewController : UIBaseViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate>
{
    NSArray *_languages;
}

//竖屏及其界面元素
@property (strong, nonatomic) IBOutlet UIView *portraitView;
//选择语言
@property (strong, nonatomic) IBOutlet UIButton *selectPortraitBtn;
//标签显示
@property (strong, nonatomic) IBOutlet UILabel *languagePortraitLabel;
//背景图片
@property (strong, nonatomic) IBOutlet UIView *portraitImage;

//横屏及其界面元素
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@property (strong, nonatomic) IBOutlet UIButton *selectLandscapeBtn;
@property (strong, nonatomic) IBOutlet UILabel *languageLandscapeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *landscapeImage;


- (IBAction)selectButtonPressed:(id)sender;

@end
