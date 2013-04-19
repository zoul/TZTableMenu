#import "TZTextHeader.h"

@interface TZTextHeader ()
@property(strong, nonatomic) NSString *text;
@end

@implementation TZTextHeader

#pragma mark Initialization

- (id) init
{
    self = [super init];
    [self setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    [self setTextColor:[UIColor darkTextColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setPadding:CGSizeMake(40, 10)];
    [self setShadowColor:[UIColor clearColor]];
    [self setTextAlignment:NSTextAlignmentLeft];
    [self setShadowOffset:CGSizeZero];
    return self;
}

+ (id) textWithString: (NSString*) newText
{
    TZTextHeader *instance = [[self alloc] init];
    [instance setText:newText];
    return instance;
}

- (void) setText: (NSString*) newText
{
    _text = newText;
    [self setNeedsLayout];
    [self sizeToFit];
}

#pragma mark Multiline Support

- (NSArray*) textLines
{
    return [_text componentsSeparatedByString:@"\n"];
}

- (void) setLines: (NSArray*) lines
{
    NSMutableString *joined = [NSMutableString string];
    for (NSString *line in lines)
        [joined appendFormat:@"%@\n", line];
    [self setText:joined];
}

#pragma mark Layout

- (UILabel*) labelForString: (NSString*) string
{
    UILabel *label = [[UILabel alloc] init];
    [label setText:string];
    [label setFont:_font];
    [label setBackgroundColor:_backgroundColor];
    [label setTextColor:_textColor];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setShadowColor:_shadowColor];
    [label setShadowOffset:_shadowOffset];
    [label setTextAlignment:_textAlignment];
    [label setNumberOfLines:0];
    [label sizeToFit];
    return label;
}

- (void) sizeToFit
{
    int numberOfLines = [[self textLines] count];
    CGSize textSize = [_text sizeWithFont:_font forWidth:self.superview.frame.size.width lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat height = numberOfLines*textSize.height + _padding.height;
    [self setBounds:CGRectMake(0, 0, CGRectGetWidth([[self superview] bounds]), height)];
}

- (void) layoutSubviews
{
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }

    float width = self.superview.frame.size.width-_padding.width;
    float y = 0;
    for (NSString *line in [self textLines]) {
        CGSize size = [line sizeWithFont:_font constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
        UIView *label = [self labelForString:line];
        [label setFrame:CGRectMake(_padding.width/2, _padding.height/2+y, width, size.height)];
        [self addSubview:label];
        y += size.height + _lineSpacingCorrection;
    }

    [self sizeToFit];
}

@end
