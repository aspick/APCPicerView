//
//  APCPickerView.m
//  APCPickerView
//
//  Created by aspick on 2014/02/28.
//  Copyright (c) 2014年 aspick. All rights reserved.
//

#import "APCPickerView.h"

@interface APCPickerView ()
@end

@implementation APCPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configureView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self configureView];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)configureView{
    self.touching = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touchesEnded:) name:@"UIViewAnimationDidStopNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touchesEnded:) name:@"DidEndSmoothScrolling" object:nil];
}

- (void)touchesBegan:(NSNotification*)notify{
    if(self.touching){
        return;
    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(touchesBeginOnPickerView:)]){
        [self.delegate touchesBeginOnPickerView:self];
    }
    
    self.touching = YES;
}

- (void)touchesEnded:(NSNotification*)notify{
    if(!self.touching){
        return;
    }
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(touchesEndOnPickerView:)]){
        [self.delegate touchesEndOnPickerView:self];
    }
    
    self.touching = NO;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    [self touchesBegan:nil];
    return [super hitTest:point withEvent:event];
}

@end
