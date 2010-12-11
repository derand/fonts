//
//  mainViewController.h
//  fonts
//
//  Created by maliy on 12/11/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface mainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
	UITableView *tv;
	
	NSMutableDictionary *fonts;
}

@end
