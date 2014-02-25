#import "TZMenu.h"

@implementation TZMenu

- (id) init
{
    self = [super init];
    _sections = [NSArray array];
    return self;
}

- (void) addSection: (TZMenuSection*) section
{
    _sections = [_sections arrayByAddingObject:section];
}

- (TZMenuElement*) elementAtIndexPath: (NSIndexPath*) indexPath
{
    TZMenuSection *section = [_sections objectAtIndex:[indexPath section]];
    return [[section visibleElements] objectAtIndex:[indexPath row]];
}

#pragma mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView
{
    return [_sections count];
}

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section
{
    return [[[_sections objectAtIndex:section] visibleElements] count];
}

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
    return [[self elementAtIndexPath:indexPath] cell];
}

#pragma mark UITableViewDelegate

- (void) tableView: (UITableView*) tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
    [[self elementAtIndexPath:indexPath] performSelectAction];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView*) tableView: (UITableView*) tableView viewForHeaderInSection: (NSInteger) section
{
    return [[_sections objectAtIndex:section] headerView];
}

- (UIView*) tableView: (UITableView*) tableView viewForFooterInSection: (NSInteger) section
{
    return [[_sections objectAtIndex:section] footerView];
}

- (CGFloat) tableView: (UITableView*) tableView heightForHeaderInSection: (NSInteger) section
{
    return CGRectGetHeight([[[_sections objectAtIndex:section] headerView] bounds]);
}

- (CGFloat) tableView: (UITableView*) tableView heightForFooterInSection: (NSInteger) section
{
    return CGRectGetHeight([[[_sections objectAtIndex:section] footerView] bounds]);
}

@end
