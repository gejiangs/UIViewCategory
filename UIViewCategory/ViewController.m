//
//  ViewController.m
//  UIViewAdd
//
//  Created by gejiangs on 2019/3/5.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Add.h"
#import "Masonry.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)   UITableView *tableView;
@property (nonatomic, strong)   NSMutableArray *contentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"UIView+Add";
    [self initData];
    [self initUI];
}

-(void)initData
{
    
    [self.contentArray addObject:@{@"v":@"UILabel", @"t":@(ViewTypeLabel)}];
    [self.contentArray addObject:@{@"v":@"UITextField", @"t":@(ViewTypeTextField)}];
    [self.contentArray addObject:@{@"v":@"UITextView", @"t":@(ViewTypeTextView)}];
    [self.contentArray addObject:@{@"v":@"UIButton", @"t":@(ViewTypeButton)}];
}

-(void)initUI
{
    self.tableView = [self.view addTableView:UITableViewStylePlain delegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    cell.textLabel.text = self.contentArray[indexPath.row][@"v"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.type = [self.contentArray[indexPath.row][@"t"] integerValue];
    vc.title = self.contentArray[indexPath.row][@"v"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - lazy load
-(NSMutableArray *)contentArray
{
    if (_contentArray == nil) {
        _contentArray = [NSMutableArray array];
    }
    return _contentArray;
}

@end
