//
//  FourViewController.m
//  KeyBoard
//
//  Created by lijubin on 16/7/7.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "FourViewController.h"
#import "LJBKeyBoard.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //键盘代理设置(设置代理全局，必须实现)
    [LJBKeyBoard keyBoardWithSuperView:self.view scrollView:nil delegate:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
