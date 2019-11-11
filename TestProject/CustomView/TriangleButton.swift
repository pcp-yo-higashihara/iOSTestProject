//
//  File.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/10/15.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class TriangleButton: UIButton {
    
    private let bezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        bezierPath.move(to: CGPoint(x: bounds.width, y: 0))
        bezierPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
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
