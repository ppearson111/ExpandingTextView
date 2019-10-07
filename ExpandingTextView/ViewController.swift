//
//  ViewController.swift
//  ExpandingTextView
//
//  Created by Paul Pearson on 10/7/19.
//  Copyright © 2019 RPM Consulting. All rights reserved.
//

import UIKit


protocol ExpandingCellDelegate {
    func updateCellHeight (indexPath: IndexPath, comment:String)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableView.automaticDimension

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! ExpandingTableViewCell
            cell.cellIndexPath = indexPath
            cell.delegate = self
            cell.textView.text = "enter note here..."
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1")!
            cell.textLabel?.text = "Some cell in section: \(indexPath.section)"
            cell.detailTextLabel?.text = "Row: \(indexPath.row)"
            return cell
        }
    }
    
}

extension ViewController: ExpandingCellDelegate {
    func updateCellHeight(indexPath: IndexPath, comment: String) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
