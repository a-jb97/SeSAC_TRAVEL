//
//  TravelInfoTableViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/12/25.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var rateSaveLabel: UILabel!
    @IBOutlet var travelImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 3
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 2
        rateSaveLabel.textColor = .gray
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 10
        likeButton.tintColor = .white
    }
}
