#import "TZStepperElement.h"
#import "TZMenuElement+Private.h"

@implementation TZStepperElement

- (id) initWithCellStyle: (UITableViewCellStyle) style
{
    self = [super init];

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:nil];
    [[cell textLabel] setText:@"Foo"];

    _stepper = [[UIStepper alloc] init];
    [_stepper addTarget:self action:@selector(handleValueChange:)
        forControlEvents:UIControlEventValueChanged];

    [cell setAccessoryView:_stepper];
    [self setCell:cell];

    return self;
}

- (id) init
{
    return [self initWithCellStyle:UITableViewCellStyleDefault];
}

+ (id) stepperWithAction: (TZStepperElementAction) action
{
    TZStepperElement *stepper = [[self alloc] init];
    [stepper setAction:action];
    return stepper;
}

- (void) handleValueChange: (UIStepper*) sender
{
    if (_action) {
        _action(self, [sender value]);
    }
}

@end
