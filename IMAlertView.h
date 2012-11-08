//
//  IMAlertView.h
//
//  Created by Ian Murray on 08-11-12.
//
//

#import <Foundation/Foundation.h>

typedef void(^IMAlertViewSimpleBlock)(void);
typedef void(^IMAlertViewButtonIndexBlock)(NSInteger buttonIndex);

@interface IMAlertView : UIAlertView <UIAlertViewDelegate>

+ (IMAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message;

- (IMAlertView *)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)addButtonWithTitle:(NSString *)title;
- (void)addButtonWithTitle:(NSString *)title handler:(IMAlertViewSimpleBlock)handler;

@end
