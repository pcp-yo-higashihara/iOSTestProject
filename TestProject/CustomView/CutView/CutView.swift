//
//  CutView.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/12/18.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class CutView: UIView{
    
    private let bezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(x: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(x: 10)
    }
    
    private func setup(x: CGFloat) {
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        
        bezierPath.addLine(to: CGPoint(x: bounds.width, y: 0))
        
        bezierPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height - x))
        bezierPath.addLine(to: CGPoint(x: bounds.width - x, y: bounds.height))
        bezierPath.addLine(to: CGPoint(x: x, y: bounds.height))
        bezierPath.addLine(to: CGPoint(x: 0, y: bounds.height - x))
        
        bezierPath.close()
    }
    
    override func draw(_ rect: CGRect) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        layer.mask = shapeLayer
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if bezierPath.contains(point) {
            return self
        }
        return nil
    }
    
}

