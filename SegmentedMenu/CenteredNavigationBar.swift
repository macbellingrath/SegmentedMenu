//
//  CenteredNavigationBar.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/15/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit
// Centers NavBar contents
class NavBar: UINavigationBar {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    for subview in subviews {
      subview.frame = {
        var subviewFrame = subview.frame
        let navheight = self.frame.height
        let buttonHeight = subviewFrame.height
        subviewFrame.origin.y = (navheight - buttonHeight) / 2
        return subviewFrame
      }()
    }
  }
}
