#import "TZViewController.h"
#import "TZButtonElement.h"
#import "TZStepperElement.h"
#import "TZTextHeader.h"
#import "TZMenu.h"

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
        [TZButtonElement buttonWithLabel:@"File Source" action:^(id sender) {
            [sender flashCheckmark];
            NSLog(@"Foo");
        }],
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

@end
