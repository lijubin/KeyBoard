# KeyBoard
1.[LJBKeyBoard keyBoardWithSuperView:self.view scrollView:nil delegate:self];
superView默认为控制器的根视图。
scrollView 在根视图上使用scrollView或者tableView时使用。计算偏移量。
#pragma mark - 键盘代理事件微调偏移量
//可选项。用于键盘和输入框之前的距离控制。
- (CGFloat)ljbKeyBoardGetSmallY {
    return 10;
}