//
//  ThreeTableViewCell.h
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewController:(UIViewController *)viewController;


@property(nonatomic,weak)UITextField *textField;

@end
