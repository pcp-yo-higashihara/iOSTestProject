//
//  UIImageView+Extension.swift
//  TestProject
//
//  Created by 東原　与生 on 2020/02/01.
//  Copyright © 2020 yo_higashihara. All rights reserved.
//
import UIKit

extension UIImage {
    func tint(color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        let drawRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: .destinationIn, alpha: 1)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage
    }
}
