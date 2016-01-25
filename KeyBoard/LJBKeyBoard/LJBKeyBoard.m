//
//  LJBKeyBoard.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "LJBKeyBoard.h"

@implementation LJBKeyBoard

- (instancetype)init {
    if (self = [super init]) {
        [self keyBoard];
    }
    return self;
}

- (void)keyBoard {
    //键盘弹出的通知。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    //键盘隐藏的通知。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - 获取键盘弹出通知
- (void)keyBoardShow:(NSNotification *)note {
    NSDictionary *dict = note.userInfo;
    CGRect endRect = [dict[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat endKeyY = 0;
    UIView *view = [self.delegate ljbKeyBoardSuperView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        endKeyY = view.frame.size.height - endRect.size.width;
    } else {
        endKeyY = endRect.origin.y;
    }
    UIScrollView *scrollView = [self.delegate ljbKeyBoardScrollView];
    CGPoint offSet = scrollView.contentOffset;
    CGFloat currTextMaxY = [self.delegate ljbKeyBoardGetMaxY];
    CGFloat Fheight = (scrollView.frame.origin.y + currTextMaxY-offSet.y);
    if (Fheight > endKeyY) {
        view.transform = CGAffineTransformMakeTranslation(0, endKeyY - Fheight);
    }
}

#pragma mark - 获取键盘隐藏通知
- (void)keyBoardHide:(NSNotification *)note {
    UIView *view = [self.delegate ljbKeyBoardSuperView];
    view.transform = CGAffineTransformIdentity;
}

@end
