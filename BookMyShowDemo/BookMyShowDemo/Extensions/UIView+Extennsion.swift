//
//  UIView+Extennsion.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

extension UIView {
    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 20 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: bounds.maxY - layer.shadowRadius, width: bounds.width - 106, height: layer.shadowRadius)).cgPath
    }
}
