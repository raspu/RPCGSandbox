//
//  RPIndiceViewController.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPIndiceViewController.h"

@interface RPIndiceViewController ()

@end

@implementation RPIndiceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    content = @{_t(@"BASE"):
                @{
                    _t(@"LINE"):@"RPLineaView",
                    _t(@"SQUARE"):@"RPCuadradoView",
                    _t(@"ARC"):@"RPArcView",
                    _t(@"CIRCLE"):@"RPCircleView",
                }
                ,
                _t(@"COMP"):
                @{
                    _t(@"TRIANGLE"):@"RPTrianguloView",
                    _t(@"ALPHA"):@"RPTransparenciaView",
                    _t(@"THING"):@"RPAlgoView",
                    _t(@"FINGERTRAP"):@"RPFingerTrapView",
                    _t(@"FRACTAL"):@"RPFractalView"
    
                 },
                _t(@"TXTIMG"):
                @{
                    _t(@"IMAGE"):@"RPImageView",
                    _t(@"TEXT"):@"RPTextView"
                },
                _t(@"EXTRA"):
                @{
                   _t(@"GRADIENT"):@"RPGradienteView",
                   _t(@"ANIMFRAC"):@"RPAnimatedFractalView"
                }
              };
    
    kys = [[content allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2)
                    {
                        return [obj1 compare:obj2];
                    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [content count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [[content objectForKey:[kys objectAtIndex:section]]count];
}


- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [kys objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *d = [content objectForKey:[kys objectAtIndex:indexPath.section]];
    NSArray *k = [[d allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2)
           {
               return [obj1 compare:obj2];
           }];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [k objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *d = [content objectForKey:[kys objectAtIndex:indexPath.section]];
    NSArray *k = [[d allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2)
                  {
                      return [obj1 compare:obj2];
                  }];

    NSString *class = [d objectForKey:[k objectAtIndex:indexPath.row]];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = [[NSClassFromString(class) alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
