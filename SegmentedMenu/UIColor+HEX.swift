//
//  UIColor+HEX.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/15/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit

extension UIColor {
  
  static let lightGrayBackground = hexStringToUIColor(hex: "DADDE2")
  static let pink = hexStringToUIColor(hex: "FE8989")
  static let darkBlue = hexStringToUIColor(hex: "354A63")
  static let almostWhite = hexStringToUIColor(hex: "EEF0F5")
  
  private static func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    
    if ((cString.characters.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
}
