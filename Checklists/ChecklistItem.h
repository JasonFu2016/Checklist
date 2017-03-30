//
//  ChecklistItem.h
//  Checklists
//
//  Created by Fu Jason on 29/03/2017.
//  Copyright © 2017 Fu Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;

-(void)toggleChecked;

@end
