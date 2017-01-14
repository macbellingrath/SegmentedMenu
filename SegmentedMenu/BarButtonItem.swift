//
//  BarButtonItem.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/14/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit

class Hamburger: UIBarButtonItem {
  
  /// hamburger menu item convenience initializer
  ///
  /// - Parameters:
  ///   - target: target for selector
  ///   - selector: action on tap
  convenience init(target: Any?, action: Selector) {
    let image = #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate)
    self.init(image: image, style: .plain, target: target, action: action)
  }

  override init() {
    super.init()
  }
 
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class MagnifyingGlass: UIBarButtonItem {
  
  convenience init(target: Any?, action: Selector?) {
    self.init(barButtonSystemItem: .search, target: target, action: action)
  }

  override init() {
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
