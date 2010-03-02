//
//  MainController.m
//  ScreenStuff
//
//  Created by Aleks Nesterow on 3/2/10.
//	aleks.nesterow@gmail.com
//	
//  Copyright © 2010 Screen Customs s.r.o.
//	All rights reserved.
//

#import "MainController.h"

#import "RatingViewStandAloneController.h"
#import "RatingViewInTableView.h"

#import "SCMemoryManagement.h"

@implementation MainController

@synthesize ratingViewStandAloneController = _ratingViewStandAloneController,
ratingViewInTableView = _ratingViewInTableView;

#pragma mark init / dealloc

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

- (void)dealloc {
	
	SC_RELEASE_SAFELY(_ratingViewStandAloneController);
	SC_RELEASE_SAFELY(_ratingViewInTableView);
	
    [super dealloc];
}

#pragma mark UIView lifecycle

- (void)viewDidLoad {
	
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

#pragma mark Orientation handling

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

#pragma mark UITableView callbacks

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {

	switch (section) {
		case 0:
			return 2;
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"cell-identifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]
				autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	switch (indexPath.section) {
		case 0: {
			switch (indexPath.row) {
				case 0:
					cell.textLabel.text = NSLocalizedString(@"As a stand-alone control", @"");
					break;
				case 1:
					cell.textLabel.text = NSLocalizedString(@"In a UITableView", @"");
					break;
			}
		}
	}
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	switch (section) {
		case 0:
			return NSLocalizedString(@"RatingView", @"");
	}
	
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	switch (indexPath.section) {
		case 0: {
			switch (indexPath.row) {
				case 0:
					[self.navigationController pushViewController:self.ratingViewStandAloneController animated:YES];
					break;
				case 1:
					[self.navigationController pushViewController:self.ratingViewInTableView animated:YES];
					break;
			}
			break;
		}
	}
}

@end
