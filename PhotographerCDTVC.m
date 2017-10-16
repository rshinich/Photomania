//
//  PhotographerCDTVC.m
//  Photomania
//
//  Created by 张忠瑞 on 2017/8/7.
//  Copyright © 2017年 张忠瑞. All rights reserved.
//

#import "PhotographerCDTVC.h"
#import "Photographer+CoreDataProperties.h"
#import "PhotoDatabaseAvailability.h"

@interface PhotographerCDTVC ()

@end

@implementation PhotographerCDTVC


- (void)awakeFromNib
{
    
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:PhotoDatabaseAvailabilityNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                      self.managedObjectContext = note.userInfo[PhotoDatabaseAvailabilityContext];
                                                  }];
    
}


- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedStandardCompare:)]];
    request.fetchLimit = 100;
    
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Photographer Cell"];
    
    Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = @"abc";
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu photos",[photographer.photos count]];
    
    
    
    return cell;
}

@end
