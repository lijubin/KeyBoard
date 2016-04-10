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
 *  textField的最大Y值 CGRectGetMaxY(textField.frame)
 */
- (CGFloat)ljbKeyBoardGetMaxY;

@end

@interface LJBKeyBoard : UIView

/**
*  定义在viewDidLoad 视图加载完成中
*
*  @param superView  self.view 键盘弹出层
*  @param scrollView scrollView的偏移量 scrollView 或者 tableView
                     没有scrollView时，请传nil
*  @param delegate   self 控制器
*
*  @return 返回值不需要接收
*/
+ (instancetype)keyBoardWithSuperView:(UIView *)superView scrollView:(UIScrollView *)scrollView delegate:(id)delegate;

@property(assign)id<LJBKeyBoardDelegate>delegate;


@end
