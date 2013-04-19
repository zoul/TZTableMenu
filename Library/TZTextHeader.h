@interface TZTextHeader : UIView

@property(strong) UIFont *font;
@property(strong) UIColor *backgroundColor;
@property(strong) UIColor *textColor;
@property(assign) UITextAlignment textAlignment;
@property(assign) CGFloat lineSpacingCorrection;
@property(strong) UIColor *shadowColor;
@property(assign) CGSize shadowOffset;
@property(assign) CGSize padding;

+ (id) textWithString: (NSString*) text;
- (void) setLines: (NSArray*) lines;

@end
