#import "TZMenuSection.h"

@implementation TZMenuSection

#pragma mark Initialization

- (id) init
{
    self = [super init];
    _elements = [NSArray array];
    return self;
}

+ (id) sectionWithElements: (NSArray*) elements
{
    TZMenuSection *section = [[self alloc] init];
    for (TZMenuElement *element in elements) {
        [section addElement:element];
    }
    return section;
}

- (void) addElement: (TZMenuElement*) element
{
    _elements = [_elements arrayByAddingObject:element];
}

- (NSArray*) visibleElements
{
    NSMutableArray *visible = [NSMutableArray array];
    for (TZMenuElement *element in _elements) {
        if (![element isHidden]) {
            [visible addObject:element];
        }
    }
    return visible;
}

@end
