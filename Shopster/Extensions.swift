//
//  Extensions.swift
//  Shopster
//
//  Created by Nakul Sakhuja on 17/12/17.
//  Copyright © 2017 GetThisDone. All rights reserved.
//

import Foundation

extension UITextField{
    func setBottomBorder(image: UIImage) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 26, height: 16))
        imageView.contentMode = .scaleAspectFit
        let image = image
        imageView.image = image
        self.leftView = imageView
        self.leftViewMode = .always
    }
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.autocorrectionType = .no
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
