#import "TZButtonElement.h"
#import "TZMenuElement+Private.h"

@implementation TZButtonElement

#pragma mark Initialization

- (id) initWithCellStyle: (UITableViewCellStyle) style
{
    self = [super init];
    [self setCell:[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:nil]];
    return self;
}

- (id) init
{
    return [self initWithCellStyle:UITableViewCellStyleDefault];
}

#pragma mark Convenience Initializers

+ (id) buttonWithLabel: (NSString*) label action: (TZButtonElementAction) action
{
    TZButtonElement *button = [[self alloc] init];
    [[[button cell] textLabel] setText:label];
    [button setAction:action];
    return button;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

+ (id) buttonWithLabel: (NSString*) label target: (id) target action: (SEL) action
{
    return [self buttonWithLabel:label action:^(TZButtonElement *sender) {
        [target performSelector:action];
    }];
}

#pragma clang diagnostic pop

- (void) setEnabled: (BOOL) enabled
{
    [super setEnabled:enabled];
    [[[self cell] textLabel] setEnabled:enabled];
    [[self cell] setSelectionStyle:enabled ?
        UITableViewCellSelectionStyleBlue :
        UITableViewCellSelectionStyleNone];
}

- (void) performSelectAction
{
    if ([self isEnabled] && _action) {
        _action(self);
    }
}

@end
