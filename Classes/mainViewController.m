//
//  mainViewController.h
//  fonts
//
//  Created by maliy on 12/11/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import "mainViewController.h"


@implementation mainViewController

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
		fonts = [[NSMutableDictionary alloc] init];
		
		for (NSString *familyName in [UIFont familyNames])
		{
			[fonts setObject:[UIFont fontNamesForFamilyName:familyName] forKey:familyName];
		}
	}
	return self;
}

- (void) dealloc
{
	[fonts release];
	[super dealloc];
}



#pragma mark tableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSInteger rv = [fonts count];
	return rv;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	NSInteger rv = [[fonts objectForKey:[[fonts allKeys] objectAtIndex:section]] count];
	return rv;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCell *rv = nil;
	
	static NSString *cellID = @"fontCell_ID";
	rv = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (rv == nil)
	{
		rv = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
	}
	NSString *fontName = [[fonts objectForKey:[[fonts allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	rv.textLabel.text = fontName;
	rv.textLabel.font = [UIFont fontWithName:fontName size:14];
	
	return rv;
}

- (void) deselect
{
	[tv deselectRowAtIndexPath:[tv indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSelector:@selector(deselect) withObject:nil afterDelay:.5];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[fonts allKeys] objectAtIndex:section];
}

#pragma mark -

- (void) viewDidAppear:(BOOL) animated
{
}

- (void) viewDidDisappear:(BOOL) animated
{
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = NSLocalizedString(@"Fonts", @"");
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
	
	self.view = contentView;
	[contentView release];

	
	tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
	tv.delegate = self;
	tv.dataSource = self;
	tv.autoresizesSubviews = YES;
	tv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:tv];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
}



@end
