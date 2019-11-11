//
//  ScrollCollectionViewCell.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/11/11.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

protocol ScrollCellDelegate: AnyObject {
    func btnTapped(cell: ScrollCollectionViewCell)
}

class ScrollCollectionViewCell: UICollectionViewCell {
    
    var index: IndexPath!
    
    weak var delegate: ScrollCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        delegate?.btnTapped(cell: self)
    }
}
