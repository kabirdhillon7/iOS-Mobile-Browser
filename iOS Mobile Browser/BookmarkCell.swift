//
//  BookmarkCell.swift
//  iOS ACME Mobile Browser
//
//  Created by Kabir Dhillon on 8/1/22.
//

import UIKit

class BookmarkCell: UITableViewCell {
    
    @IBOutlet weak var bookmarkNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
