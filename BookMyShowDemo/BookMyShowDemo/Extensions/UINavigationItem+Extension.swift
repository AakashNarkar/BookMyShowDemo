//
//  UINavigationItem+Extension.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

// MARK: - UINavigationItem + Extension
extension UINavigationItem {
    func setTitle(title:String, subtitle:String) {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.sizeToFit()
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subtitle
        subTitleLabel.font = UIFont.systemFont(ofSize: 10)
        subTitleLabel.textAlignment = .center
        subTitleLabel.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [subTitleLabel, titleLabel])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        let width = max(titleLabel.frame.size.width, subTitleLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        titleLabel.sizeToFit()
        subTitleLabel.sizeToFit()
        
        self.titleView = stackView
    }
}
