/*
 Copyright 2016-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "SnackbarExampleSupplemental.h"
#import "MaterialSnackbar+ColorThemer.h"
#import "MaterialSnackbar+TypographyThemer.h"

static NSString * const kCellIdentifier = @"Cell";

@implementation SnackbarExample

- (void)setupExampleViews:(NSArray *)choices {
  self.choices = choices;
  self.view.backgroundColor = [UIColor whiteColor];
  [self.collectionView registerClass:[MDCCollectionViewTextCell class]
          forCellWithReuseIdentifier:kCellIdentifier];
  [MDCSnackbarColorThemer applySemanticColorScheme:self.colorScheme];
  [MDCSnackbarTypographyThemer applyTypographyScheme:self.typographyScheme];
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.choices.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  MDCCollectionViewTextCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier
                                                forIndexPath:indexPath];
  cell.textLabel.text = self.choices[indexPath.row];
  cell.accessibilityTraits = cell.accessibilityTraits | UIAccessibilityTraitButton;
  cell.isAccessibilityElement = YES;
  cell.accessibilityIdentifier = cell.textLabel.text;
  cell.accessibilityLabel = cell.textLabel.text;
  return cell;
}

@end

@implementation SnackbarSimpleExample (CatalogByConvention)

+ (NSArray *)catalogBreadcrumbs {
  return @[ @"Snackbar", @"Snackbar" ];
}

+ (NSString *)catalogDescription {
  return @"Snackbars provide brief messages about app processes at the bottom of the screen.";
}

+ (BOOL)catalogIsPrimaryDemo {
  return YES;
}

+ (BOOL)catalogIsPresentable {
  return YES;
}

+ (BOOL)catalogIsDebug {
  return NO;
}

@end

@implementation SnackbarOverlayViewExample (CatalogByConvention)

+ (NSArray *)catalogBreadcrumbs {
  return @[ @"Snackbar", @"Snackbar Overlay View" ];
}

+ (BOOL)catalogIsPrimaryDemo {
  return NO;
}

+ (BOOL)catalogIsPresentable {
  return YES;
}

@end

@implementation SnackbarInputAccessoryViewController (CatalogByConvention)

+ (NSArray *)catalogBreadcrumbs {
  return @[ @"Snackbar", @"Snackbar Input Accessory" ];
}

+ (BOOL)catalogIsPrimaryDemo {
  return NO;
}

+ (BOOL)catalogIsPresentable {
  return NO;
}

+ (BOOL)catalogIsDebug {
  return NO;
}

@end

@implementation SnackbarSuspensionExample (CollectionView)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  MDCCollectionViewTextCell *cell =
  [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier
                                            forIndexPath:indexPath];

  cell.textLabel.text = self.choices[indexPath.row];
  cell.isAccessibilityElement = YES;
  cell.accessibilityTraits = cell.accessibilityTraits | UIAccessibilityTraitButton;
  cell.accessibilityLabel = cell.textLabel.text;
  if (indexPath.row > 2) {
    UISwitch *editingSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [editingSwitch setTag:indexPath.row];
    [editingSwitch addTarget:self
                      action:@selector(handleSuspendStateChanged:)
            forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = editingSwitch;
    cell.accessibilityValue = editingSwitch.isOn ? @"on" : @"off";
  } else {
    cell.accessoryView = nil;
    cell.accessibilityValue = nil;
  }

  return cell;
}

@end

@implementation SnackbarSuspensionExample (CatalogByConvention)

+ (NSArray *)catalogBreadcrumbs {
  return @[ @"Snackbar", @"Snackbar Suspension" ];
}

+ (BOOL)catalogIsPrimaryDemo {
  return NO;
}

+ (BOOL)catalogIsPresentable {
  return YES;
}

@end
