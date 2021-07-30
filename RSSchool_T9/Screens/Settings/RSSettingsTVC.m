//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSSettingsTVC.h"

@interface RSSettingsTVC ()

@property(nonatomic) NSInteger selectedColorIndex;
@property(nonatomic) BOOL      drawStories;

@end

@implementation RSSettingsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 51;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.selectedColorIndex = [NSUserDefaults selectedColorIndexIfPersistedOr:4];
    self.drawStories = [NSUserDefaults drawStoriesIfPersistedOr:YES];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    RSDrawStoriesCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [[NSUserDefaults standardUserDefaults] setBool:cell.drawStoriesSwitch.isOn forKey:@"drawStories"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 0
        ? [[RSDrawStoriesCell alloc] initWithSwitchTurnedOn:self.drawStories]
        : [self strokeColorCell];
}

- (UITableViewCell *)strokeColorCell {
    UITableViewCell *strokeColorCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    strokeColorCell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
    strokeColorCell.textLabel.text       = @"Stroke color";
    strokeColorCell.detailTextLabel.text = [RSColorsTVC sampleColors][self.selectedColorIndex];
    strokeColorCell.selectionStyle       = UITableViewCellSelectionStyleNone;
    [strokeColorCell.detailTextLabel setColorAsInText];
    return strokeColorCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        RSColorsTVC *colorsTVC = [[RSColorsTVC alloc] initWithStyle:UITableViewStyleInsetGrouped];
        colorsTVC.selectedColorIndex = self.selectedColorIndex;
        [self.navigationController pushViewController:colorsTVC animated:YES];
    }
}


@end
