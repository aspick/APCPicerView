//
//  APCPickerView.h
//  APCPickerView
//
//  Created by aspick on 2014/02/28.
//  Copyright (c) 2014年 aspick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APCPickerViewDelegate.h"

@interface APCPickerView : UIPickerView

@property (assign, nonatomic) BOOL touching;
@property (weak, nonatomic) id<UIPickerViewDataSource,UIPickerViewDelegate,APCPickerViewDelegate> delegate;

@end
