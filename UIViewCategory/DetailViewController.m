//
//  DetailViewController.m
//  UIViewAdd
//
//  Created by gejiangs on 2019/3/5.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import "DetailViewController.h"
#import "Masonry.h"
#import "UIView+Add.h"

@interface DetailViewController ()<UITextFieldDelegate, UITextViewDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.type) {
        case ViewTypeLabel:
            [self addLabel];
            break;
        case ViewTypeButton:
            [self addButton];
            break;
        case ViewTypeTextField:
            [self addTextField];
            break;
        case ViewTypeTextView:
            [self addTextView];
            break;
        default:
            break;
    }
}

-(void)addLabel
{
    UILabel *lbl = [self.view addLabel:@"this is label" font:[UIFont systemFontOfSize:16] color:[UIColor redColor]];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

-(void)addButton
{
    UIButton *btn = [self.view addButton:@"Touch Me" target:self action:@selector(touchAction)];
    btn.backgroundColor = [UIColor grayColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.offset(100);
    }];
}

-(void)touchAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"Touch Me" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *a1 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    
    UIAlertAction *a2 = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Sure");
    }];
    
    [alert addAction:a1];
    [alert addAction:a2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)addTextField
{
    UITextField *tf = [self.view addTextField:@"tf" placeholder:@"Please input ..." delegate:self];
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.offset(200);
    }];
}

-(void)addTextView
{
    UITextView *tv = [self.view addTextView:@"tv" delegate:self];
    tv.font = [UIFont systemFontOfSize:17];
    tv.backgroundColor = [UIColor grayColor];
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.offset(200);
    }];
}

#pragma mark - UITextField Delegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textField.text:%@", textField.text);
}

#pragma mark - UITextView Delegate
-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"textView.text:%@", textView.text);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
