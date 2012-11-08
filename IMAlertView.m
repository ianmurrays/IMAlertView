//
//  IMAlertView.m
//
//  Created by Ian Murray on 08-11-12.
//
//

#import "IMAlertView.h"

@interface IMAlertView ()

@property (nonatomic,copy) IMAlertViewButtonIndexBlock buttonBlock;
@property (nonatomic,copy) IMAlertViewSimpleBlock cancelBlock;

@property (nonatomic,strong) NSMutableDictionary *dictionaryHandlers;

@end

@implementation IMAlertView

+ (IMAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message
{
    return [[IMAlertView alloc] initWithTitle:title message:message];
}

- (IMAlertView *)initWithTitle:(NSString *)title message:(NSString *)message
{
    self = [super initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    if (self)
    {
        self.dictionaryHandlers = [NSMutableDictionary dictionary];
        self.delegate = self;
    }
    
    return self;
}

- (void)addButtonWithTitle:(NSString *)title
{
    [self addButtonWithTitle:title handler:^{}];
}

- (void)addButtonWithTitle:(NSString *)title handler:(IMAlertViewSimpleBlock)handler
{
    NSString *buttonIndex = [NSString stringWithFormat:@"%d", [super addButtonWithTitle:title]];
    [self.dictionaryHandlers setObject:[handler copy] forKey:buttonIndex];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == self.cancelButtonIndex && self.cancelBlock)
    {
        self.cancelBlock();
        return;
    }
    
    if (self.buttonBlock)
    {
        self.buttonBlock(buttonIndex);
    }
    else
    {
        NSString *dictionaryIndex = [NSString stringWithFormat:@"%d", buttonIndex];
        IMAlertViewSimpleBlock handler = self.dictionaryHandlers[dictionaryIndex];
        handler();
    }
}

@end
