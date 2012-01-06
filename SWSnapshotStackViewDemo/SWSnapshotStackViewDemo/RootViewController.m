////////////////////////////////////////////////////////////////////////////
/*!
 ** \file RootViewController.m
 ** \brief Root View Controller class implementation file
 ** \author Scott White (support@scottwhite.id.au, http://github.com/snwau)
 **
 ** The root (and only) view controller responsible for displaying and
 ** controlling a Snapshot Stack View and associated controls for 
 ** demonstrating its capabilities such as dynamic frame adjustment,
 ** support for all image aspects and the selectable display modes (single
 ** or stack).
 **
 ** Copyright (c) 2012 Scott White. All rights reserved.
 **
 ** This program is free software: you can redistribute it and/or modify
 ** it under the terms of the GNU General Public License as published by
 ** the Free Software Foundation, either version 3 of the License, or
 ** (at your option) any later version.
 ** 
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU General Public License for more details.
 ** 
 ** You should have received a copy of the GNU General Public License
 ** along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 **
 ** \see RootViewController.h
 */
// Documentation of the code is formatted for use with the documentation
// package Doxygen (see http://www.doxygen.org/).
//
// Project     : Snapshot Stack View Demonstration
// Platform    : iOS SDK 3.0+
//
////////////////////////////////////////////////////////////////////////////

#import "RootViewController.h"


// ********************************************************************** //
// ROOT VIEW CONTROLLER CLASS
// ********************************************************************** //

#pragma mark Root View Controller class

@implementation RootViewController


// ********************************************************************** //
// PROPERTIES

#pragma mark Properties

@synthesize displayStackSwitch = m_displayStackSwitch;
@synthesize imageFrameSize = m_imageFrameSize;
@synthesize imageSelection = m_imageSelection;
@synthesize sizeSlider = m_sizeSlider;
@synthesize snapshotStackView = m_snapshotStackView;


// ********************************************************************** //
// INSTANCE METHODS

#pragma mark Instance Methods

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}


// ********************************************************************** //

- (void)viewDidLoad
{
  [super viewDidLoad];
  
	// Do any additional setup after loading the view, typically from a nib.
  
#if 1  
  // Tested with the views contentMode set to redraw (forces call to drawRect:
  // on change of views frame) enabled and disabled.
  m_snapshotStackView.contentMode = UIViewContentModeRedraw;
#endif  
  
  m_snapshotStackView.displayAsStack = m_displayStackSwitch.on;
  m_snapshotStackView.image = [UIImage imageNamed:@"350D_IMG_3157_20071030w.jpg"];
}


// ********************************************************************** //

- (void)viewDidUnload
{
  [super viewDidUnload];
 
  // Release any retained subviews of the main view.
  self.displayStackSwitch = nil;
  self.imageFrameSize = nil;
  self.imageSelection = nil;
  self.sizeSlider = nil;
  self.snapshotStackView = nil;
}


// ********************************************************************** //

/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
 */


// ********************************************************************** //

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// ********************************************************************** //
// ACTION METHODS

#pragma mark Action Methods

- (IBAction)displayStackSwitchValueChanged:(id)sender
{
  m_snapshotStackView.displayAsStack = m_displayStackSwitch.on;
}


// ********************************************************************** //

- (IBAction)imageSelectionValueChanged:(id)sender
{
  switch (m_imageSelection.selectedSegmentIndex)
  {
    case 0:      
      m_snapshotStackView.image = [UIImage imageNamed:@"350D_IMG_3157_20071030w.jpg"];
      break;

    case 1:
      m_snapshotStackView.image = [UIImage imageNamed:@"IMG_5737_081229w7sq.jpg"];
      break;
     
    case 2:
      m_snapshotStackView.image = [UIImage imageNamed:@"IMG_2777_080216w6s.jpg"];
      break;
      
    default:
      m_snapshotStackView.image = nil;
  }
}


// ********************************************************************** //

- (IBAction)sizeSliderValueChanged:(id)sender
{
  CGFloat sizeDelta = m_sizeSlider.maximumValue - m_sizeSlider.value;

  CGRect newFrame = CGRectMake (floor (20 + (sizeDelta / 2.0)),
                                floor (20 + (sizeDelta / 2.0)), 
                                floor (m_sizeSlider.value),
                                floor (m_sizeSlider.value));
  m_snapshotStackView.frame = newFrame; 
  
  m_imageFrameSize.text = [NSString stringWithFormat:@"(%.0f x %.0f)", floor (m_sizeSlider.value),
                           floor (m_sizeSlider.value)];
}


// ********************************************************************** //

@end  // @RootViewController

// End of file