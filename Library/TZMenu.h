#import "TZMenuSection.h"

@interface TZMenu : NSObject <UITableViewDataSource, UITableViewDelegate>

@property(strong, readonly) NSArray *sections;

- (void) addSection: (TZMenuSection*) section;

@end
