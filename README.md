


## 使用说明
```objective-c

#import "UIView+Add.h"

UILabel *lbl    = [self.view addLabel];
UILabel *lbl2   = [self.view addLabel:@"lab2"];
UILabel *lbl3   = [self.view addLabel:@"lab3" font:[UIFont boldSystemFontOfSize:20]];
UILabel *lbl4   = [self.view addLabel:@"lab4" font:[UIFont systemFontOfSize:25] color:[UIColor redColor]];

//创建的默认numberOfLines为0
lbl2.numberOfLines = 1;
[lbl mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.offset(50);
    make.left.offset(10);
    make.right.offset(-10);
}];

//其它UITextField、UITextView创建方式都一样，简单，一看就懂
```
