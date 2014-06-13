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
    [self setTextAlignment:(UITextAlignment)NSTextAlignmentLeft];
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
    [label setTextAlignment:(NSTextAlignment)_textAlignment];
    [label setNumberOfLines:0];
    [label sizeToFit];
    return label;
}

- (void) sizeToFit
{
    int numberOfLines = (int) [[self textLines] count];
    CGRect boundingRect = [_text boundingRectWithSize:self.superview.frame.size options:0 attributes:nil context:nil];
    CGFloat height = numberOfLines*CGRectGetHeight(boundingRect) + _padding.height;
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
        CGRect boundingRect = [_text boundingRectWithSize:CGSizeMake(width, 1000) options:0 attributes:nil context:nil];
        UIView *label = [self labelForString:line];
        [label setFrame:CGRectMake(_padding.width/2, _padding.height/2+y, width, CGRectGetHeight(boundingRect))];
        [self addSubview:label];
        y += CGRectGetHeight(boundingRect) + _lineSpacingCorrection;
    }

    [self sizeToFit];
}

@end
