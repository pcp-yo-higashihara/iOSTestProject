//
//  EveryDialog.swift
//  
//
//  Created by 東原　与生 on 2019/12/26.
//

import UIKit

class EveryDialog: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: EveryButton!
    @IBOutlet weak var secondButton: EveryButton!
        
    private var tapFirstButtonAction: (() -> Void)?
    private var tapSecondButtonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    private func loadNib() {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else { return }
        view.frame = CGRect(x: 0, y: 0, width: UIApplication.shared.keyWindow?.frame.width ?? bounds.width, height: UIApplication.shared.keyWindow?.frame.height ?? bounds.height)
        addSubview(view)
    }
    
    /// ダイアログの表示/アクションデータを設定
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - firstButtonTitle: 1つ目のボタンのタイトル
    ///   - secondButtonTitle: 2つ目のボタンのタイトル
    ///   - tapFirstButtonAction: 1つ目のボタンタップ時アクション
    ///   - tapSecondButtonAction: 2つ目のボタンタップ時アクション
    func configureDialog(title: String, firstButtonTitle: String, secondButtonTitle: String, tapFirstButtonAction: (() -> Void)?, tapSecondButtonAction: (() -> Void)?) {
        
        firstButton.setTitle(firstButtonTitle, for: .normal)
        secondButton.setTitle(secondButtonTitle, for: .normal)
        self.tapFirstButtonAction = tapFirstButtonAction
        self.tapSecondButtonAction = tapSecondButtonAction
        
        firstButton.isUserInteractionEnabled = true
        secondButton.isUserInteractionEnabled = true
    }
    
    func showDialog(on vc: UIViewController) {
        self.tag = 200_000
        vc.view.animateAddSubView(addTargetView: self, completion: nil)
    }
    
    func hideDialog() {
        guard let dialogView = viewWithTag(200_000) else {
            return
        }
        dialogView.animateRemoveView(completion: nil)
    }
    
    @IBAction func tapFirstButton(_ sender: Any) {
        tapFirstButtonAction?()
    }
    
    @IBAction func tapSecondButton(_ sender: Any) {
        tapSecondButtonAction?()
    }
}
