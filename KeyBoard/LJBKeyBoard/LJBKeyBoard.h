//
//  LJBKeyBoard.h
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJBKeyBoardDelegate <NSObject>

/**
 *  获取根控制器 self.view
 */
- (UIView *)ljbKeyBoardSuperView;

/**
 * scrollView的偏移量 scrollView 或者 tableView
 * 没有scrollView时，请传nil
 */
- (UIScrollView *)ljbKeyBoardScrollView;

/**
 *  textField的最大Y值 CGRectGetMaxY(textField.frame)
 */
- (CGFloat)ljbKeyBoardGetMaxY;

@end

@interface LJBKeyBoard : UIView



@property(assign)id<LJBKeyBoardDelegate>delegate;


@end
