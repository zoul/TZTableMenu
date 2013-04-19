#import "TZMenuElement.h"

@class TZButtonElement;

typedef void (^TZButtonElementAction)(TZButtonElement *sender);

@interface TZButtonElement : TZMenuElement

@property(copy) TZButtonElementAction action;

- (id) initWithCellStyle: (UITableViewCellStyle) style;

+ (id) buttonWithLabel: (NSString*) label action: (TZButtonElementAction) action;
+ (id) buttonWithLabel: (NSString*) label target: (id) target action: (SEL) action;

@end
