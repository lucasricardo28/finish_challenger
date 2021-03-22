//
//  PrimaryButton.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import Foundation
import UIKit

@IBDesignable
class PrimaryButton: UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
