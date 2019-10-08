//
//  UIViewController+Extension.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/10/04.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func initIndicator() -> UIActivityIndicatorView {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.gray
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
        return activityIndicator
    }
    
    func showActivityIndicator() -> UIActivityIndicatorView? {
        
        if let _  = self.view.viewWithTag(100000) {
            return nil
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.gray
        activityIndicator.tag = 100000
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func hideActivityIndicator(activityIndicator: UIActivityIndicatorView?) {
        
        if let indicator = activityIndicator {
            indicator.stopAnimating()
        }
    }
}
