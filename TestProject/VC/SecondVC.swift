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
    @IBOutlet weak var imageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.image = imageView1.image?.tint(color: .red)
    }
    
    @IBAction func fixViewFrame(_ sender: Any) {
        let val = CGFloat.random(in: 10 ... 300)
        if let _ = redViewHeightConstraint {
            redViewHeightConstraint!.isActive = false
        }
        redViewHeightConstraint = redView.heightAnchor.constraint(equalToConstant: val)
        redViewHeightConstraint?.isActive = true
    }
    
    @IBAction func showDialog(_ sender: Any) {
        let dialog = EveryDialog()
        dialog.configureDialog(title: "hofe", firstButtonTitle: "hoge", secondButtonTitle: "hoge", tapFirstButtonAction: nil, tapSecondButtonAction: dialog.hideDialog)
        self.view.addSubview(dialog)
    }
    
    @IBAction func dismissTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
