//
//  ItemDetailViewController.m
//  Checklists
//
//  Created by Fu Jason on 31/03/2017.
//  Copyright © 2017 Fu Jason. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.itemToEdit!=nil){
        self.title=@"Edit Item";
        self.textFiled.text=self.itemToEdit.text;
        self.donBarButton.enabled=YES;
    }
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textFiled becomeFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return  nil;
}

- (IBAction)cancle:(id)sender {
    [self.delegate itemDetailViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    
    if(self.itemToEdit==nil){
   ChecklistItem *item=[[ChecklistItem alloc]init];
    item.text=self.textFiled.text;
    item.checked=NO;
    
    [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text=self.textFiled.text;
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText=[textField.text stringByReplacingCharactersInRange:range withString:string];
    
    self.donBarButton.enabled=([newText length]>0);
    return YES;
}
@end
