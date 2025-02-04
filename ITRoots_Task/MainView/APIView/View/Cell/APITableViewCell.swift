//
//  APITableViewCell.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class APITableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(data: ApiModel?) {
        titleLabel.text = data?.title
        bodyTextView.text = data?.body
    }
    
}
