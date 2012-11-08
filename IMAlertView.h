//
//  IMAlertView.h
//
//  Created by Ian Murray on 08-11-12.
//
//

#import <Foundation/Foundation.h>

typedef void(^SKAlertViewSimpleBlock)(void);
typedef void(^SKAlertViewButtonIndexBlock)(NSInteger buttonIndex);

@interface IMAlertView : UIAlertView <UIAlertViewDelegate>

- (IMAlertView *)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)addButtonWithTitle:(NSString *)title;
- (void)addButtonWithTitle:(NSString *)title handler:(IMAlertViewSimpleBlock)handler;

@end
