//
//  AddTodoViewController.m
//  EveryDoItAgain
//
//  Created by Kevin Cleathero on 2017-06-21.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "AddTodoViewController.h"
#import "ToDo+CoreDataProperties.h"

@interface AddTodoViewController ()

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSManagedObjectContext *)context {
    if (_addContext != context) {
        _addContext = context;
    }
}

- (IBAction)doneAction:(UIButton *)sender {
    
    ToDo *newTodo = [[ToDo alloc] initWithContext:self.addContext];
    newTodo.todoTitle = self.todoTitleAdd.text;
    newTodo.todoDescription = self.todoDescriptionAdd.text;
    newTodo.timestamp = self.todoDateAdd.date;
    
    NSError *error = nil;

    
    //the actual save command is here "commit"
    BOOL isSuccess = [self.addContext save:&error];
    if (!isSuccess) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
