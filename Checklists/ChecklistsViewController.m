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
    return 5;
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    
    if(item.checked){
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;
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

@end
