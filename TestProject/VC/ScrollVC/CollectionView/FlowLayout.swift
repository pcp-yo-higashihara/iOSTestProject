//
//  FlowLayout.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/11/11.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    let kFlickVelocityThreshold: CGFloat = 0.2
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // 指を離したタイミングでのページ番号
        let currentPage = (self.collectionView?.contentOffset.x)! / pageWidth()
        
        if (fabs(velocity.x) > kFlickVelocityThreshold) {
            // velocity.x が閾値より大きい場合 (アイテムを左右にフリックした場合)
            
            // velocity.x が正の場合は、currentPage を切り上げた値を「スクロール先のページ番号」とする (負の場合はその逆)
            let nextPage: CGFloat = (velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage)
            
            // 「スクロール先のページ番号」と「ページ幅」を掛けて contentOffset.x を計算する
            // contentOffset.y は proposedContentOffset.y をそのまま設定
            return CGPoint(x: nextPage * pageWidth(), y: proposedContentOffset.y)
        } else {
            // velocity.x が閾値以下の場合 (アイテムをドラッグした後に指を離した場合)
            
            // currentPage を四捨五入して「スクロール先のページ番号」とする
            // contentOffset は「velocity.x が閾値より大きい場合」と同様に計算
            return CGPoint(x: (round(currentPage) * self.pageWidth()), y: proposedContentOffset.y)
        }
    }
    
    func pageWidth() -> CGFloat {
        return self.itemSize.width
    }
}
