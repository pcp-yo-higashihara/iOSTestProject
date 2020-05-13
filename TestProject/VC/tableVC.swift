//
//  tableVC.swift
//  TestProject
//
//  Created by 東原　与生 on 2019/12/02.
//  Copyright © 2019 yo_higashihara. All rights reserved.
//

import UIKit

class tableVC: UIViewController {

    var items = [
        "a","a","a","a","a","a","a","a","a","a",
        "b","b","b","b","b","b","b","b","b","b",
        "c","c","c","c","c","c","c","c","c","c",
        "d","d","d","d","d","d","d","d","d","d",
        "e","e","e","e","e","e","e","e","e","e",
                 ]
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func reload(_ sender: Any) {
        items = [
            "あ","あ","あ","あ","あ","あ","あ","あ","あ","あ",
            "あ","あ","あ","あ","あ","あ","あ","あ","あ","あ",
            "あ","あ","あ","あ","あ","あ","あ","あ","あ","あ",
        ]
        table.reloadData()
    }
    
    @IBAction func reloadACell(_ sender: Any) {
        
        items[10] = "変えたよ！"
        table.reloadRows(at: [IndexPath(row: 10, section: 0)], with: .automatic)
    }
}


extension tableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(items[indexPath.row])：\(indexPath.row)番目のセルだよ"
        return cell
    }
}


