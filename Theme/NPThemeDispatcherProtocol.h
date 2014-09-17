//
//  NPThemeDispatcherProtocol.h
//  NewsPacker
//
//  Created by Akira Matsuda on 2013/10/24.
//  Copyright (c) 2013年 Akira Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NPThemeDispatcherProtocol <NSObject>

@required
+ (void)showAlert:(NSString *)title message:(NSString *)message selectedBlock:(void (^)(NSInteger index))selectedBlock  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)buttons;
+ (void)showActionSheet:(UIView *)view title:(NSString *)title selectedBlock:(void (^)(NSInteger index))selectedBlock cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)buttons;

@end
