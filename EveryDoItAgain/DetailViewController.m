//
//  DetailViewController.m
//  EveryDoItAgain
//
//  Created by Kevin Cleathero on 2017-06-21.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo+CoreDataProperties.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = self.detailItem.timestamp.description;
        self.detailDescriptionLabel.text = self.detailItem.todoTitle;
        
        self.todoNameDetail.text = self.detailItem.todoTitle;
        self.descriptionDetail.text = self.detailItem.todoDescription;
        self.todoDateDetail.date = self.detailItem.timestamp;
        NSLog(@"%@", self.todoDateDetail.date);
    
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)setIndexPath:(NSIndexPath *)indexpath {
    if (_indexPath != indexpath) {
        _indexPath = indexpath;
        
    }
}

- (void)setContext:(NSManagedObjectContext *)context {
    if (_addContext != context) {
        _addContext = context;
        
    }
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(ToDo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
- (IBAction)doneAction:(UIButton *)sender {
    
    NSFetchRequest *fetched = [[NSFetchRequest alloc] init];
    [fetched setEntity:[NSEntityDescription entityForName:@"ToDo" inManagedObjectContext:self.addContext]];
    
    //set error all the todos here
    NSArray *results = [self.addContext executeFetchRequest:fetched error:nil];
    
    //set indexpath proerpty
    ToDo *updateTodo = [results objectAtIndex:self.indexPath.row];
    
    
    //ToDo *newTodo = [[ToDo alloc] initWithContext:self.addContext];
    
    updateTodo.todoTitle = self.todoNameDetail.text;
    updateTodo.todoDescription = self.descriptionDetail.text;
    updateTodo.timestamp = self.todoDateDetail.date;
    
    NSError *error = nil;
    
    //[self.addContext updatedObjects:[self.fetchedResultsController objectAtIndexPath:indexPath]];
    
    //the actual save command is here "commit"
    //BOOL isSuccess = [self.addContext save:&error];
    BOOL isSuccess = [self.addContext updatedObjects];
    if (!isSuccess) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    self.saveButton.enabled = NO;


}


@end
