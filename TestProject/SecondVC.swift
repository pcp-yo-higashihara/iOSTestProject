//
//  SecondVC.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/07/10.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var redView: UIView!
    
    var redViewHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fixViewFrame(_ sender: Any) {
        let val = CGFloat.random(in: 10 ... 300)
        if let _ = redViewHeightConstraint {
            redViewHeightConstraint!.isActive = false
        }
        redViewHeightConstraint = redView.heightAnchor.constraint(equalToConstant: val)
        redViewHeightConstraint?.isActive = true
    }
}
