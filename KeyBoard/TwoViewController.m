//
//  TwoViewController.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "TwoViewController.h"
#import "LJBKeyBoard.h"

@interface TwoViewController ()<LJBKeyBoardDelegate,UITextFieldDelegate>
@property(nonatomic,weak)UIScrollView *scrollView;
@property(assign)NSInteger selTag;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 64, self.view.frame.size.width, 200);
    [self.view addSubview:view];
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.frame = CGRectMake(0, CGRectGetMaxY(view.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(view.frame));
    scrollView.contentSize = CGSizeMake(0, 1000);
    [self.view addSubview:scrollView];
    for (int i = 0; i < 10; i++) {
        UITextField *textField = [[UITextField alloc] init];
        textField.tag = i + 1;
        textField.placeholder = [NSString stringWithFormat:@"%d",i + 1];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.frame = CGRectMake(10, 100 + 60 * i, 200, 50);
        textField.delegate = self;
        [scrollView addSubview:textField];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEdit)];
    
    //键盘代理设置(设置代理全局，必须实现)
    [LJBKeyBoard keyBoardWithSuperView:self.view scrollView:self.scrollView delegate:self];
}

- (void)endEdit {
    [self.view endEditing:YES];
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

#pragma mark - 键盘代理事件(必须实现以下代理)
- (CGFloat)ljbKeyBoardGetMaxY {
    UITextField *textField = (UITextField *)[self.view viewWithTag:self.selTag];
    
    return CGRectGetMaxY(textField.frame);
}

@end
