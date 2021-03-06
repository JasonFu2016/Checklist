//
//  ViewController.m
//  Checklists
//
//  Created by Fu Jason on 28/03/2017.
//  Copyright © 2017 Fu Jason. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController{
    NSMutableArray *_items;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    //Do any additional setup after loading the view, typically from a nib.
    
    
    _items=[[NSMutableArray alloc]initWithCapacity:20];
    
    ChecklistItem *item;
    
    item=[[ChecklistItem alloc]init];
    item.text=@"观看嫦娥飞天和玉兔升空的视频";
    item.checked=NO;
    [_items addObject:item];
    
    item=[[ChecklistItem alloc]init];
    item.text=@"了解Sony a7和MBP的价格";
    item.checked=NO;
    [_items addObject:item];
    
    item=[[ChecklistItem alloc]init];
    item.text=@"复习视频教程";
    item.checked=NO;
    [_items addObject:item];

    item=[[ChecklistItem alloc]init];
    item.text=@"看地心引力";
    item.checked=NO;
    [_items addObject:item];
    

    item=[[ChecklistItem alloc]init];
    item.text=@"看西甲巴萨惜败的比赛回放";
    item.checked=NO;
    [_items addObject:item];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    
    UILabel *lable=(UILabel *)[cell viewWithTag:1001];
    
    if (item.checked) {
        lable.text=@"√";
    }else{
        lable.text=@"";
    }
}

-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    
    UILabel *lable=(UILabel *)[cell viewWithTag:1000];
    
    lable.text=item.text;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ChecklistsItem"];
    
    ChecklistItem *item=_items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    ChecklistItem *item=_items[indexPath.row];
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths=@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item{
    
    NSInteger newRowIndex=[_items count];
    [_items addObject:item];
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:newRowIndex inSection:0];
    
    NSArray *indexPaths=@[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item{
    NSInteger index=[_items indexOfObject:item];
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddItem"]){
        //1
        UINavigationController *navigationController=segue.destinationViewController;
        
        //2
        ItemDetailViewController *controller=(ItemDetailViewController *)navigationController.topViewController;
        
        //3
        controller.delegate=self;
        
    }else if ([segue.identifier isEqualToString:@"EditItem"]){
        UINavigationController *navigationController=segue.destinationViewController;
        
        ItemDetailViewController *controller=(ItemDetailViewController *)navigationController.topViewController;
        
        controller.delegate=self;
        
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
        
        controller.itemToEdit=_items[indexPath.row];
    }
}
@end
