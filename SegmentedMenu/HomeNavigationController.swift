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
    navigationBar.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
    navigationBar.addDropShadow()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    navigationBar.frame.size.height = UIScreen.main.bounds.height / 8
  }
}

