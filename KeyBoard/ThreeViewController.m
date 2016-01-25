//
//  ThreeViewController.m
//  KeyBoard
//
//  Created by 李居彬 on 16/1/25.
//  Copyright © 2016年 ljb. All rights reserved.
//

#import "ThreeViewController.h"
#import "LJBKeyBoard.h"
#import "ThreeTableViewCell.h"

@interface ThreeViewController ()<LJBKeyBoardDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(assign)NSInteger selTag;
@property(nonatomic,strong)LJBKeyBoard *keyboard;
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 64, self.view.frame.size.width, 200);
    [self.view addSubview:view];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(view.frame)) style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEdit)];
    
    //键盘代理设置(设置代理全局，必须实现)
    self.keyboard = [LJBKeyBoard new];
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
    return self.tableView;
}

- (CGFloat)ljbKeyBoardGetMaxY {
    CGFloat cellHeight = [self tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selTag - 1 inSection:0]];
    return cellHeight * self.selTag;
}

#pragma mark - tableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellID";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID viewController:self];
    }
    cell.textField.tag = indexPath.row + 1;
    
    return cell;
}

#pragma textField代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.selTag = textField.tag;
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
