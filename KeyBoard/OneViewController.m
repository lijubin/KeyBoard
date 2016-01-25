//
//  OneViewController.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "OneViewController.h"
#import "LJBKeyBoard.h"

@interface OneViewController ()<LJBKeyBoardDelegate,UITextFieldDelegate>

@property(nonatomic,strong)LJBKeyBoard *keyboard;
@property(assign)NSInteger selTag;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    for (int i = 0; i < 10; i++) {
        UITextField *textField = [[UITextField alloc] init];
        textField.tag = i + 1;
        textField.placeholder = [NSString stringWithFormat:@"%d",i + 1];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.frame = CGRectMake(10, 100 + 60 * i, 200, 50);
        textField.delegate = self;
        [self.view addSubview:textField];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEdit)];
    
    //键盘代理设置(设置代理全局，必须实现)
    self.keyboard = [[LJBKeyBoard alloc] init];
    self.keyboard.delegate = self;
}

- (void)endEdit {
    [self.view endEditing:YES];
}

#pragma mark - 键盘代理事件(必须实现以下三个代理)
- (UIView *)ljbKeyBoardSuperView {
    return self.view;
}

- (UIScrollView *)ljbKeyBoardScrollView {
    return nil;
}

- (CGFloat)ljbKeyBoardGetMaxY {
    UITextField *textField = (UITextField *)[self.view viewWithTag:self.selTag];
    
    return CGRectGetMaxY(textField.frame);
}

#pragma textField代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.selTag = textField.tag;
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
