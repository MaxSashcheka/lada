//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSColorsTVC.h"

@interface RSColorsTVC ()

@property (nonatomic, strong) NSArray<NSString *>*colors;

@end

@implementation RSColorsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 50;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"ColorCell"];
    _colors = [RSColorsTVC sampleColors];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSUserDefaults standardUserDefaults] setInteger:self.selectedColorIndex forKey:@"selectedColorIndex"];
}

+ (NSArray<NSString *> *)sampleColors {
    return @[
        @"#be2813",
        @"#3802da",
        @"#467c24",
        @"#808080",
        @"#8e5af7",
        @"#f07f5a",
        @"#f3af22",
        @"#3dacf7",
        @"#e87aa4",
        @"#0f2e3f",
        @"#213711",
        @"#511307",
        @"#92003b",
    ];;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType  = indexPath.row == _selectedColorIndex
        ? UITableViewCellAccessoryCheckmark
        : UITableViewCellAccessoryNone;
    cell.textLabel.text = _colors[indexPath.row];
    [cell.textLabel setColorAsInText];
    return cell;
}
  
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *selectedColorIndexPath = [NSIndexPath indexPathForRow:_selectedColorIndex inSection:0];
    [tableView cellForRowAtIndexPath:selectedColorIndexPath].accessoryType = UITableViewCellAccessoryNone;
    
    _selectedColorIndex = indexPath.row;
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

@end
