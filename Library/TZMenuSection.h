#import "TZMenuElement.h"

@interface TZMenuSection : NSObject

@property(strong, readonly) NSArray *elements;
@property(strong, readonly) NSArray *visibleElements;

@property(strong) UIView *headerView;
@property(strong) UIView *footerView;

+ (id) sectionWithElements: (NSArray*) elements;
- (void) addElement: (TZMenuElement*) element;

@end
