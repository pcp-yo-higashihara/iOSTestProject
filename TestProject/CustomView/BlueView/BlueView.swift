//
//  BlueView.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/10/15.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class BlueView: UIView {
    
    override init(frame: CGRect) {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
    }
    
    override func draw(_ rect: CGRect) {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.draw(rect)
    }
    
    // MARK: - 制約に関するメソッド
    
    override func updateConstraints() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.updateConstraints()
    }
    
    override func setNeedsUpdateConstraints() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsUpdateConstraints()
    }
    
    override func updateConstraintsIfNeeded() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.updateConstraintsIfNeeded()
    }
    
    // MARK: - 制約に関するメソッド
    
    override func layoutSubviews() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.layoutSubviews()
        
        self.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
    }
    
    override func setNeedsLayout() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.setNeedsLayout()
    }
    
    override func layoutIfNeeded() {
        print(NSStringFromClass(type(of: self)).components(separatedBy: ".")[1] + ":" + #function)
        super.layoutIfNeeded()
    }
}
