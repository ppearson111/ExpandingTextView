//
//  ExpandingTableViewCell.swift
//  ExpandingTextView
//
//  Created by Paul Pearson on 10/7/19.
//  Copyright © 2019 RPM Consulting. All rights reserved.
//

import UIKit

class ExpandingTableViewCell: UITableViewCell {

    var delegate: ExpandingCellDelegate?
    var cellIndexPath: IndexPath!
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ExpandingTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = self.delegate {
            delegate.updateCellHeight()
        }
    }
}
