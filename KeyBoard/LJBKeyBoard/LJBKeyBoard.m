//
//  LJBKeyBoard.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "LJBKeyBoard.h"

@interface LJBKeyBoard ()

@property(nonatomic,weak)UIView *superView;
@property(nonatomic,weak)UIScrollView *scrollView;
@property(assign)CGFloat tmpSuperY;
@property(assign)CGFloat currTextMaxY;
@end

@implementation LJBKeyBoard

- (instancetype)init {
    if (self = [super init]) {
        [self keyBoard];
    }
    return self;
}

+ (instancetype)keyBoardWithSuperView:(UIView *)superView scrollView:(UIScrollView *)scrollView delegate:(id)delegate {
    LJBKeyBoard *keyBoard = [[self alloc] init];
    keyBoard.delegate = delegate;
    [superView addSubview:keyBoard];
    keyBoard.superView = superView;
    keyBoard.scrollView = scrollView;
    
    return keyBoard;
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
    self.currTextMaxY = 0;
    self.tmpSuperY = 0;
    [self getResponderView:self.superView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        endKeyY = self.superView.frame.size.height - endRect.size.width;
    } else {
        endKeyY = endRect.origin.y;
    }
    UIScrollView *scrollView = self.scrollView;
    CGPoint offSet = scrollView.contentOffset;
    if ([self.delegate respondsToSelector:@selector(ljbKeyBoardGetSmallY)]) {
        self.currTextMaxY += [self.delegate ljbKeyBoardGetSmallY];
    }
    CGFloat Fheight = (self.currTextMaxY-offSet.y);
    if (Fheight > endKeyY) {
        self.superView.transform = CGAffineTransformMakeTranslation(0, endKeyY - Fheight);
    }
}

#pragma mark - 计算响应者链条
- (BOOL)getResponderView:(UIView *)view {
    BOOL isFind = NO;
    if (view.subviews.count > 0) {
        self.tmpSuperY += view.frame.origin.y;
        for (UIView *subView in view.subviews) {
            if ([subView isFirstResponder]) {
                self.currTextMaxY = self.tmpSuperY + CGRectGetMaxY(subView.frame);
                isFind = YES;
                break;
            } else {
                isFind = NO;
                if (subView.subviews.count > 0) {
                    isFind = [self getResponderView:subView];
                }
            }
        }
        if (!isFind) {
            self.tmpSuperY -= view.frame.origin.y;
        }
    } else {
        self.tmpSuperY = 0;
    }
    return isFind;
}

#pragma mark - 获取键盘隐藏通知
- (void)keyBoardHide:(NSNotification *)note {
    self.superView.transform = CGAffineTransformIdentity;
}

@end
