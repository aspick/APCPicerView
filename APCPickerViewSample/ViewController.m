//
//  ViewController.m
//  APCPickerViewSample
//
//  Created by aspick on 2014/03/03.
//  Copyright (c) 2014年 aspick. All rights reserved.
//

#import "ViewController.h"
#import "APCPickerView.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray * pickerViewData;
@property (nonatomic,strong) NSTimer * closeTimer;
@property (nonatomic,assign) NSInteger selectedRow;
@property (nonatomic,weak) APCPickerView * pickerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.pickerViewData = @[@(1), @(2), @(3), @(4), @(5)];
    self.selectedRow = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPickerView{
    APCPickerView * pickerView = [[APCPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [pickerView selectRow:self.selectedRow inComponent:0 animated:NO];
    CGSize pickerViewSize = pickerView.frame.size;
    CGSize selfSize = self.view.frame.size;
    
    CGRect displayedFrame = CGRectMake(0, selfSize.height-pickerViewSize.height, pickerViewSize.width, pickerViewSize.height);
    CGRect hiddenFrame = CGRectMake(0, selfSize.height, pickerViewSize.width, pickerViewSize.height);
    pickerView.frame = hiddenFrame;
    self.pickerView = pickerView;
    [self.view addSubview:pickerView];
    
    [UIView transitionWithView:self.view duration:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        pickerView.frame = displayedFrame;
    } completion:^(BOOL finished) {
        //
    }];
}

- (void)closePickerView{
    self.closeTimer = nil;
    CGSize selfSize = self.view.frame.size;
    CGSize pickerViewSize = self.pickerView.frame.size;
    CGRect hiddenFrame = CGRectMake(0, selfSize.height, pickerViewSize.width, pickerViewSize.height);
    [UIView transitionWithView:self.view duration:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.pickerView.frame = hiddenFrame;
    } completion:^(BOOL finished) {
        [self.pickerView removeFromSuperview];
        self.pickerView = nil;
    }];
}

- (IBAction)showButtonPushed:(id)sender {
    [self showPickerView];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerViewData.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@",self.pickerViewData[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectedRow = row;
    self.label.text = [NSString stringWithFormat:@"Selected: %@",self.pickerViewData[row]];
}

#pragma mark - APCPicerViewDelegate

- (void)touchesBeginOnPickerView:(UIPickerView *)pickerView{
    if(self.closeTimer){
        [self.closeTimer invalidate];
        self.closeTimer = nil;
    }
}

- (void)touchesEndOnPickerView:(UIPickerView *)pickerView{
    if(self.closeTimer){
        [self.closeTimer invalidate];
        self.closeTimer = nil;
    }
    self.closeTimer = [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(closePickerView) userInfo:nil repeats:NO];
}
@end
