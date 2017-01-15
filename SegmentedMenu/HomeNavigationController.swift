//
//  HomeNavigationController.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/14/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController, UINavigationBarDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.addDropShadow()
    navigationBar.setTitleVerticalPositionAdjustment(-20, for: .default)
  }
  
  override func viewDidLayoutSubviews() {
    navigationBar.frame.size.height = UIScreen.main.bounds.height / 8
    navigationBar.setNeedsLayout()
    super.viewDidLayoutSubviews()
  }
}
