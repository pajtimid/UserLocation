//
//  Extensions.swift
//  UserLocation
//
//  Created by Pajtim on 6/1/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import Foundation



@IBDesignable extension UIView {
    
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func setShadows(){
        let layer = self.layer
        
        let shadowPath = UIBezierPath(rect: self.bounds)
        layer.masksToBounds = false
        layer.shouldRasterize = false
        layer.shadowColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowOpacity = 1
        layer.borderColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.05).cgColor
        layer.borderWidth = 0.5
        layer.shadowPath = shadowPath.cgPath
    }
    
    func setRoundedToView(_ viewToRound: UIView, byCorners: UIRectCorner){
        //[.topRight, .bottomLeft],
        let path = UIBezierPath(roundedRect:viewToRound.bounds,
                                byRoundingCorners:byCorners,
                                cornerRadii: CGSize(width: 20, height:  20))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        viewToRound.layer.mask = maskLayer
    }
}

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
