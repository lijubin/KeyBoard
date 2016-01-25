//
//  ThreeTableViewCell.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "ThreeTableViewCell.h"

@implementation ThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewController:(UIViewController *)viewController {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor grayColor];
        UITextField *textField = [[UITextField alloc] init];
        textField.delegate = viewController;
        self.textField = textField;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:textField];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textField.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end
