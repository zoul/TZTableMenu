#import "TZMenu.h"

static const CGFloat TZDefaultHeaderHeight = 36;
static const CGFloat TZDefaultFooterHeight = 31;

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

- (NSString*) tableView: (UITableView*) tableView titleForHeaderInSection: (NSInteger) index
{
    return [[_sections objectAtIndex:index] headerText];
}

- (UIView*) tableView: (UITableView*) tableView viewForHeaderInSection: (NSInteger) index
{
    TZMenuSection *section = [_sections objectAtIndex:index];
    return [section headerText] ? nil : [section headerView];
}

- (CGFloat) tableView: (UITableView*) tableView heightForHeaderInSection: (NSInteger) index
{
    TZMenuSection *section = [_sections objectAtIndex:index];
    return [section headerText] ? TZDefaultHeaderHeight :
        CGRectGetHeight([[section headerView] bounds]);
}

- (NSString*) tableView: (UITableView*) tableView titleForFooterInSection: (NSInteger) index
{
    return [[_sections objectAtIndex:index] footerText];
}

- (UIView*) tableView: (UITableView*) tableView viewForFooterInSection: (NSInteger) index
{
    TZMenuSection *section = [_sections objectAtIndex:index];
    return [section footerText] ? nil : [section footerView];
}

- (CGFloat) tableView: (UITableView*) tableView heightForFooterInSection: (NSInteger) index
{
    TZMenuSection *section = [_sections objectAtIndex:index];
    return [section footerText] ? TZDefaultFooterHeight :
        CGRectGetHeight([[section footerView] bounds]);
}

@end
