//
//  AddTodoViewController.h
//  EveryDoItAgain
//
//  Created by Kevin Cleathero on 2017-06-21.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTodoViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *addContext;

- (void)setDetailItem:(NSManagedObjectContext *)context;

@property (strong, nonatomic) IBOutlet UITextField *todoTitleAdd;

@property (strong, nonatomic) IBOutlet UITextView *todoDescriptionAdd;
@property (strong, nonatomic) IBOutlet UIDatePicker *todoDateAdd;


@end
