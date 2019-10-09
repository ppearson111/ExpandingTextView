//
//  ExpandingTableViewFooterCell.swift
//  ExpandingTextView
//
//  Created by Paul Pearson on 10/8/19.
//  Copyright © 2019 RPM Consulting. All rights reserved.
//

import UIKit

class ExpandingTableViewFooterCell: UITableViewHeaderFooterView, UITextViewDelegate {

    // MARK: - Static
    static var nib:UINib { return UINib(nibName: identifier, bundle: nil) }
    static var identifier: String { return String(describing: self) }

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var baseLine: UIView!
    
    var delegate: ExpandingCellDelegate?
    
    // MARK: - Overrieds
    override func awakeFromNib() {
        super.awakeFromNib()
        commentTextView.delegate = self
    }

    
    // MARK: - Actions
    @IBAction func send(_ sender: Any) {
        print("send pressed")
    }
    
    // MARK: - Text View Delegate
    func textViewDidChange(_ textView: UITextView) {
        print("text view did change")
        if let delegate = self.delegate {
            delegate.updateCellHeight()
        }
    }
}
