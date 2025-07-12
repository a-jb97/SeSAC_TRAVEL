//
//  TravelTableViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/11/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = 15
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.numberOfLines = 3
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 17)
        subtitleLabel.textColor = .systemGray2
        
        dateLabel.font = UIFont.systemFont(ofSize: 15)
        dateLabel.textAlignment = .right
        dateLabel.textColor = .systemGray2
    }
}
