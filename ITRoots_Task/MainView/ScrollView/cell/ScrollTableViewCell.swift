//
//  ScrollTableViewCell.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit

class ScrollTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
