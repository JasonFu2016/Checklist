//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by Fu Jason on 31/03/2017.
//  Copyright © 2017 Fu Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *) controller;

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;


@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>
- (IBAction)cancle:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *donBarButton;
@property (nonatomic,weak) id<ItemDetailViewControllerDelegate> delegate;
@property (nonatomic,strong) ChecklistItem *itemToEdit;

@end
