//
//  UIActivityIndicatorView+Extension.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/10/04.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func start() {
        self.startAnimating()
        self.isHidden = false
    }
    
    func stop() {
        self.stopAnimating()
        self.isHidden = true
    }
}
