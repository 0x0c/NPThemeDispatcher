//
//  NPThemeDispatcher.m
//  NewsPacker
//
//  Created by Akira Matsuda on 2013/10/16.
//  Copyright (c) 2013年 Akira Matsuda. All rights reserved.
//

#import "NPThemeDispatcher.h"
#import <objc/runtime.h>

@implementation NPThemeDispatcher

static NSString *const NPThemeDispatcherThemeClassString = @"NPThemeDispatcherThemeClassString";

+ (id)currentTheme
{
	return NSClassFromString([[NSUserDefaults standardUserDefaults] stringForKey:NPThemeDispatcherThemeClassString]);
}

+ (void)setTheme:(Class)clazz
{
	[[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%s", class_getName(clazz)] forKey:NPThemeDispatcherThemeClassString];
}

+ (void)showAlert:(NSString *)title message:(NSString *)message selectedBlock:(void (^)(NSInteger index))selectedBlock  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)buttons
{
	id clazz = [NPThemeDispatcher currentTheme];
	if([clazz conformsToProtocol:@protocol(NPThemeDispatcherProtocol)]) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[clazz showAlert:title message:message selectedBlock:selectedBlock cancelButtonTitle:cancelButtonTitle otherButtonTitles:buttons];
		});
	}
}

+ (void)showActionSheet:(UIView *)view title:(NSString *)title selectedBlock:(void (^)(NSInteger index))selectedBlock cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)buttons
{
	id clazz = [NPThemeDispatcher currentTheme];
	if([clazz conformsToProtocol:@protocol(NPThemeDispatcherProtocol)]) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[clazz showActionSheet:view title:title selectedBlock:selectedBlock cancelButtonTitle:cancelButtonTitle  destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:buttons];
		});
	}
}

@end

@implementation UITableView (ThemeDispatcher)

+ (void)appendTheme
{
	id<NPThemeTableViewProtocol> clazz = [NPThemeDispatcher currentTheme];
	[[UITableView appearance] setBackgroundColor:[clazz tableViewBackgroundColor]];
	if ([clazz respondsToSelector:@selector(separatorStyle)]) {
		[[UITableView appearance] setSeparatorStyle:[clazz separatorStyle]];
	}
	if ([clazz respondsToSelector:@selector(scrollIndicatorStyle)]) {
		[[UITableView appearance] setIndicatorStyle:[clazz scrollIndicatorStyle]];
	}
}

- (void)appendTheme
{
	id<NPThemeTableViewProtocol> clazz = [NPThemeDispatcher currentTheme];
	[self setBackgroundColor:[clazz tableViewBackgroundColor]];
	if ([clazz respondsToSelector:@selector(separatorStyle)]) {
		[self setSeparatorStyle:[clazz separatorStyle]];
	}
	if ([clazz respondsToSelector:@selector(scrollIndicatorStyle)]) {
		[self setIndicatorStyle:[clazz scrollIndicatorStyle]];
	}
}

@end

@implementation UITableViewCell (ThemeDispatcher)

- (void)appendTheme
{
	id<NPThemeTableViewProtocol> clazz = [NPThemeDispatcher currentTheme];
	[[UITableViewCell appearance] setBackgroundColor:[clazz tableViewCellBackgroundColor]];
	if ([clazz respondsToSelector:@selector(tableViewCellTextLabelTextColor)]) {
		self.textLabel.textColor = [clazz tableViewCellTextLabelTextColor];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellTextLabelFont)]) {
		self.textLabel.font = [clazz tableViewCellTextLabelFont];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellTextLabelShadowColor)]) {
		self.textLabel.shadowColor = [clazz tableViewCellTextLabelShadowColor];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellTextLabelShadowOffset)]) {
		self.textLabel.shadowOffset = [clazz tableViewCellTextLabelShadowOffset];
	}
	
	if ([clazz respondsToSelector:@selector(tableViewCellDetailTextLabelTextColor)]) {
		self.detailTextLabel.textColor = [clazz tableViewCellDetailTextLabelTextColor];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellDetailTextLabelFont)]) {
		self.detailTextLabel.font = [clazz tableViewCellDetailTextLabelFont];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellDetailTextLabelShadowColor)]) {
		self.detailTextLabel.shadowColor = [clazz tableViewCellDetailTextLabelShadowColor];
	}
	if ([clazz respondsToSelector:@selector(tableViewCellDetailTextLabelShadowOffset)]) {
		self.detailTextLabel.shadowOffset = [clazz tableViewCellDetailTextLabelShadowOffset];
	}
}

@end

@implementation UINavigationBar (ThemeDispatcher)

+ (void)appendTheme
{
	id<NPThemeNavigationBarProtocol> clazz = [NPThemeDispatcher currentTheme];
	[[UINavigationBar appearance] setTintColor:[clazz navigationBarTintColor]];
	if ([clazz respondsToSelector:@selector(navigationBarBackgroundImage)]) {
		[[UINavigationBar appearance] setBackgroundImage:[clazz navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
	}
	[[UINavigationBar appearance] setBarStyle:[clazz navigationBarStyle]];
}

@end

@implementation UIToolbar (ThemeDispatcher)

+ (void)appendTheme
{
	id<NPThemeToolbarProtocol> clazz = [NPThemeDispatcher currentTheme];
	[[UIToolbar appearance] setTintColor:[clazz toolBarTintColor]];
	if ([clazz respondsToSelector:@selector(toolBarBackgroundImage)]) {
		[[UIToolbar appearance] setBackgroundImage:[clazz toolBarBackgroundImage] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
	}
	if ([clazz respondsToSelector:@selector(tookBarBarTintColor)]) {
		[[UIToolbar appearance] setBarTintColor:[clazz tookBarBarTintColor]];
	}
	[[UIToolbar appearance] setBarStyle:[clazz toolBarStyle]];
}

@end

@implementation UIBarButtonItem (ThemeDispatcher)

+ (void)appendTheme
{
	id<NPThemeBarButtonItemProtocol> clazz = [NPThemeDispatcher currentTheme];
	if ([clazz respondsToSelector:@selector(barButtonItemBackgroundImage)]) {
		[[UIBarButtonItem appearance] setBackgroundImage:[clazz barButtonItemBackgroundImage] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	}
	if ([clazz respondsToSelector:@selector(portraitBackButtonBackgroundImage)]) {
		[[UIBarButtonItem appearance] setBackButtonBackgroundImage:[clazz portraitBackButtonBackgroundImage] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	}
	if ([clazz respondsToSelector:@selector(landscapeBackButtonBackgroundImage)]) {
		[[UIBarButtonItem appearance] setBackButtonBackgroundImage:[clazz landscapeBackButtonBackgroundImage] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
	}
}

@end
