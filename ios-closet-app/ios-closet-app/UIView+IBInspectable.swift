//
//  UIView+IBInspectable.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/29.
//

import UIKit

extension UIView {
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }

  var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }

  var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }


  var shadowColor: CGColor? {
    get {
      return layer.shadowColor
    }
    set {
      layer.shadowColor = newValue
    }
  }

  var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }
}
