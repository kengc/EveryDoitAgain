//
//  DetailViewController.h
//  EveryDoItAgain
//
//  Created by Kevin Cleathero on 2017-06-21.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EveryDoItAgain+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo *detailItem;

@property (strong, nonatomic) NSManagedObjectContext *addContext;

@property (nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UITextField *todoNameDetail;

@property (strong, nonatomic) IBOutlet UITextView *descriptionDetail;

@property (strong, nonatomic) IBOutlet UIDatePicker *todoDateDetail;

@property (strong, nonatomic) IBOutlet UIButton *saveButton;


- (void)setContext:(NSManagedObjectContext *)context;

@end

