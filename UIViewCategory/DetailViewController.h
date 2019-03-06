//
//  DetailViewController.h
//  UIViewAdd
//
//  Created by gejiangs on 2019/3/5.
//  Copyright © 2019 gejiangs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger) {
    ViewTypeLabel = 0,
    ViewTypeTextField,
    ViewTypeTextView,
    ViewTypeButton,
    ViewTypeScrollView,
    ViewTypeCollectionView
}ViewType;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic, assign)   ViewType type;

@end

NS_ASSUME_NONNULL_END
