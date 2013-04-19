@interface TZMenuElement : NSObject

@property(strong, readonly) UITableViewCell *cell;
@property(assign, getter = isEnabled) BOOL enabled;
@property(assign, getter = isHidden) BOOL hidden;

- (void) performSelectAction;

@end
