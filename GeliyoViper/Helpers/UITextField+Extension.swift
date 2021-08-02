//
//  UITextField+Extension.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 1.08.2021.
//

import Foundation
import UIKit

extension UITextField {
    func makeRoundedAndShadow() {
        self.borderStyle = .none
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.3
        self.layer.backgroundColor = UIColor.white.cgColor
    }
}
