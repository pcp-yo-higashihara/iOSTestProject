//
//  ScrollVC.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/11/06.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class ScrollVC: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
 
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ScrollCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "customCell")
        
    // レイアウト設定
    let layout = collectionView.collectionViewLayout as! FlowLayout
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal        
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
    }
}


extension ScrollVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! ScrollCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor.blue
        case 1:
            cell.backgroundColor = UIColor.red
        case 2:
            cell.backgroundColor = UIColor.green
        case 3:
            cell.backgroundColor = UIColor.gray
        case 4:
            cell.backgroundColor = UIColor.orange
        default:
            cell.backgroundColor = UIColor.black
        }
        
        return cell
    }    
}

