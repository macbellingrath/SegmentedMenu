//
//  UIView+DropShadow.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/15/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit

public extension UIView {
  
  public struct DropShadow {
    let color: CGColor
    let offset: CGSize
    let radius: CGFloat
    let opacity: Float
    let rounded: Bool
    
    static let below = DropShadow(color: UIColor.lightGray.cgColor,
                                 offset: CGSize(width: 0, height: 1),
                                 radius: 2,
                                 opacity: 0.6,
                                 rounded: false)
    
    static let above = DropShadow(color: below.color,
                                 offset: CGSize(width: below.offset.width, height: -below.offset.height),
                                 radius: below.radius,
                                 opacity: below.opacity,
                                 rounded: false)
    
    static let roundedBelow = DropShadow(color: below.color,
                                        offset: below.offset,
                                        radius: below.radius,
                                        opacity: below.opacity,
                                        rounded: true)
  }
  
  /// add drop shadow to view
  ///
  /// - Parameter dropShadow: default is below
  public func addDropShadow(dropShadow: DropShadow = .below) {
    layer.shadowColor   = dropShadow.color
    layer.shadowOffset  = dropShadow.offset
    layer.shadowRadius  = dropShadow.radius
    layer.shadowOpacity = dropShadow.opacity
    let rect            = CGRect(x: 0, y: 1, width: frame.width, height: frame.height)
    layer.shadowPath    = dropShadow.rounded ?
      UIBezierPath(roundedRect: rect, cornerRadius: layer.cornerRadius).cgPath :
      UIBezierPath(rect: rect).cgPath
    layer.masksToBounds = false
  }
  
}
