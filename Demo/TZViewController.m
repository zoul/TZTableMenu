#import "TZViewController.h"
#import "TZTableMenu.h"

@interface TZViewController ()
@property(strong) TZMenu *menu;
@property(strong) UITableView *tableView;
@end

@implementation TZViewController

- (void) loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    _tableView = [[UITableView alloc] initWithFrame:appFrame style:UITableViewStyleGrouped];
    [self setView:_tableView];
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    _menu = [[TZMenu alloc] init];
    [_tableView setDelegate:_menu];
    [_tableView setDataSource:_menu];

    [_menu addSection:[TZMenuSection sectionWithElements:@[
        [TZButtonElement buttonWithLabel:@"Block Callback" action:^(id sender) {
            [sender flashCheckmark];
            NSLog(@"Foo");
        }],
        [TZButtonElement buttonWithLabel:@"Target/Action" target:self
            action:@selector(targetActionSampleMethod:)],
        [TZLabelElement labelWithText:@"Just a Label"],
    ]]];

    TZMenuSection *section = [TZMenuSection sectionWithElements:@[
        [TZStepperElement stepperWithAction:^(id sender, double newValue) {
            [[[sender cell] textLabel] setText:[NSString stringWithFormat:@"Fade-In: %0.0fs", newValue]];
        }],
        [TZStepperElement stepperWithAction:^(id sender, double newValue) {
            [[[sender cell] textLabel] setText:[NSString stringWithFormat:@"Fade-Out: %0.0fs", newValue]];
        }],
    ]];

    [section setHeaderText:@"Fading"];
    [section setFooterText:@"Doesn’t do anything, really"];
    [_menu addSection:section];
}

- (void) targetActionSampleMethod: (TZButtonElement*) sender
{
    NSLog(@"Action sender: %@", sender);
}

@end
