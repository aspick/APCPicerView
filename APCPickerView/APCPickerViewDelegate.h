//
//  APCPickerViewDelegate.h
//  APCPickerView
//
//  Created by aspick on 2014/02/28.
//  Copyright (c) 2014年 aspick. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APCPickerViewDelegate <NSObject>

@optional

- (void)touchesBeginOnPickerView:(UIPickerView*)pickerView;
- (void)touchesEndOnPickerView:(UIPickerView*)pickerView;

@end
