//
//  EveryButton.swift
//  Every
//
//  Created by 東原　与生 on 2019/08/06.
//  Copyright © 2019 Pcphase. All rights reserved.
//

import UIKit

enum EveryButtonType: Int {
    case normal
    case attention
    case inactive
}

@IBDesignable
class EveryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAutoShrink()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAutoShrink()
    }
    
    var everyButtonType: EveryButtonType = .normal
    
    @IBInspectable
    var everyButtonTypeAdapter: Int {
        get {
            return everyButtonType.rawValue
        }
        set {
            everyButtonType = EveryButtonType(rawValue: newValue) ?? .normal
            
            cornerRadius = frame.size.height / 2
            titleLabel?.font = UIFont(name: "HiraginoSans-W3", size: 20)
            switch everyButtonType {
            case .normal:
                isUserInteractionEnabled = true
                backgroundColor = UIColor.white
                borderWidth = 1
                borderColor = UIColor.gray
                tintColor = UIColor.black
                
            case .attention:
                isUserInteractionEnabled = true
                backgroundColor = UIColor.red
                borderWidth = 0
                tintColor = UIColor.black
                
            case .inactive:
                isUserInteractionEnabled = false
                backgroundColor = UIColor.gray
                borderWidth = 0
                tintColor = UIColor.gray
            }
        }
    }
    
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    // ボタンサイズに応じて文字サイズを切り替える(小さいボタンのとき文字を小さくする)
    private func setAutoShrink() {
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.6
    }
}
