//
//  ViewController.swift
//  TestProject
//
//  Created by 東原　与生 on 2018/09/10.
//  Copyright © 2018年 yo_higashihara. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var webview1: WKWebView!
    @IBOutlet weak var baseviewheight: NSLayoutConstraint!
    
    private var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        webview1.load(URLRequest(url: URL(string: "https://www.google.com/")!))
        animateTest()
    }
    
    override func viewDidLayoutSubviews() {
        indicator = initIndicator()
    }
    
    @IBAction func tapIndicatorBtn(_ sender: Any) {
        indicator.start()
    }
    
    @IBAction func tapHideIndicatorBtn(_ sender: Any) {
        indicator.stop()
    }
    
    @IBAction func hoge(_ sender: Any) {
        print("hoge")
    }
    
    @IBAction func tapScrollBtn(_ sender: Any) {
        
        let scrollVC = UIStoryboard.init(name: "ScrollView", bundle: nil).instantiateInitialViewController() as! ScrollVC
        present(scrollVC, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        //baseView.frame = CGRect(x: baseView.frame.minX, y: baseView.frame.minY, width: baseView.frame.width, height: baseView.frame.height + 200)
        
        // baseviewheight.constant = 500
        // baseView.layoutIfNeeded()
        
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
    
    private func animateTest() {
        // CAReplicatorLayerを生成、追加
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = view.bounds
        view.layer.addSublayer(replicatorLayer)
        
        // sourceになるSublayerを生成、追加
        let circle = CALayer()
        circle.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        circle.position = view.center
        circle.position.x -= 30
        circle.backgroundColor = UIColor.black.cgColor
        circle.cornerRadius = 5
        circle.backgroundColor = UIColor.white.cgColor
        replicatorLayer.addSublayer(circle)
        
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        // 上下のアニメーション
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = view.center.y + 25
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circle.add(animation, forKey: "animation")
        
        replicatorLayer.instanceDelay = 0.1
    }
}

