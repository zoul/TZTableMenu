#import "TZLabelElement.h"
#import "TZMenuElement+Private.h"

@implementation TZLabelElement

- (id) initWithCellStyle: (UITableViewCellStyle) style
{
    self = [super init];
    [self setCell:[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:nil]];
    [[[self cell] textLabel] setEnabled:NO];
    [[self cell] setSelectionStyle:UITableViewCellSelectionStyleNone];
    return self;
}

- (id) init
{
    return [self initWithCellStyle:UITableViewCellStyleDefault];
}

+ (id) labelWithText: (NSString*) text
{
    TZLabelElement *label = [[self alloc] init];
    [[[label cell] textLabel] setText:text];
    return label;
}

@end
