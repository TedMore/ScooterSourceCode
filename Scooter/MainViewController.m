//
//  MainViewController.m
//  Scooter
//
//  Created by xingyanl on 3/23/14.
//  Copyright (c) 2014 liustarsun. All rights reserved.
//

#import "MainViewController.h"
#import "ConnectivityViewController.h"
#import "SCAutoresizingLabel.h"

@interface MainViewController ()

// private方法
- (void)_initView;
- (void)_initPortraitView;
- (void)_initLandscapeView;
- (void)_goToConnectivity;
- (void)_addPickerToActionsheet;
- (void)_selectLanguageList:(int)languageID;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initView];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Deside which view is self.view? landscape or portrait");
    [self setPortraitView:self.portraitView landscapeView:self.landscapeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)
toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setOrientationView:toInterfaceOrientation duration:duration portraitView:self.portraitView landscapeView:self.landscapeView];
}

#pragma mark - UIPickerViewDataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 4;
}

#pragma mark - UIPickerViewDelegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_languages objectAtIndex:row];
}

#pragma mark - UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIPickerView *pickerView = (UIPickerView *) [actionSheet viewWithTag:101];
    NSInteger number = [pickerView selectedRowInComponent:0];
    [_selectPortraitBtn setTitle:[_languages objectAtIndex:number] forState:UIControlStateNormal];
    [_selectLandscapeBtn setTitle:[_languages objectAtIndex:number] forState:UIControlStateNormal];
    
    // 选择系统使用的语言
    [self _selectLanguageList:(int)number];
    [self performSelector:@selector(_goToConnectivity) withObject:nil afterDelay:1];
}

- (IBAction)selectButtonPressed:(id)sender {
    [self _addPickerToActionsheet];
    
}

#pragma mark - Private Methods
- (void)_initView {
    
    // 语言数组
    _languages = [[NSArray alloc] initWithObjects:@"中文", @"ENGLISH", @"FRANCE", @"AMARICAN", nil];
    [self _initPortraitView];
    [self _initLandscapeView];
}

- (void)_initPortraitView
{
    // 设置标签的显示属性
    _languagePortraitLabel.text = LocalizeString(@"SelectLanguage");
    // 设置Button的属性
    [_selectPortraitBtn setTitle:LocalizeString(@"DisplayLanguage") forState:UIControlStateNormal];
    _selectPortraitBtn.center = CGPointMake(_selectPortraitBtn.center.x, _languagePortraitLabel.center.y);
}

- (void)_initLandscapeView
{
    _languageLandscapeLabel.text = LocalizeString(@"SelectLanguage");
    
    [_selectLandscapeBtn setTitle:LocalizeString(@"DisplayLanguage") forState:UIControlStateNormal];
    _selectLandscapeBtn.center = CGPointMake(_selectLandscapeBtn.center.x, _languageLandscapeLabel.center.y);
}

- (void)_goToConnectivity
{
    ConnectivityViewController *connectivityViewCtrl = [[ConnectivityViewController alloc] init];
    [self.navigationController pushViewController:connectivityViewCtrl animated:YES];
}

//讲选择器添加到acionSheet上面
- (void)_addPickerToActionsheet
{
    NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n": @"\n\n\n\n\n\n\n\n\n\n\n";
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:LocalizeString(@"SelectLanguage"), nil];
    [actionSheet showInView:self.view];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.tag = 101;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    
    [actionSheet addSubview:pickerView];
}

- (void)_selectLanguageList:(int)languageID
{
    switch (languageID) {
        case EChinese:
            ChangeLocalizeString(CHINESE);
            break;
            
        case EGeman:
            ChangeLocalizeString(GEMAN);
            break;
            
        case ESpanish:
            ChangeLocalizeString(SPANISH);
            break;
            
        case EDutch:
            ChangeLocalizeString(DUTCH);
            break;
            
        default:
            ChangeLocalizeString(ENGLISH);
            break;
    }
    
    // 代码冗余，如何进一步优化
    _languageLandscapeLabel.text = LocalizeString(@"SelectLanguage");
    _languagePortraitLabel.text = LocalizeString(@"SelectLanguage");
}

@end
