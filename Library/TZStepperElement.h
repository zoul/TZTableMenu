#import "TZMenuElement.h"

@class TZStepperElement;

typedef void (^TZStepperElementAction)(TZStepperElement *sender, double newValue);

@interface TZStepperElement : TZMenuElement

@property(strong, readonly) UIStepper *stepper;
@property(copy) TZStepperElementAction action;

- (id) initWithCellStyle: (UITableViewCellStyle) style;
+ (id) stepperWithAction: (TZStepperElementAction) action;

@end
