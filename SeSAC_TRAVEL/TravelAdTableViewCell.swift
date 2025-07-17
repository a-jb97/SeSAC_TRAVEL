//
//  TravelAdTableViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/14/25.
//

import UIKit

class TravelAdTableViewCell: UITableViewCell {
    
    @IBOutlet var adInfoLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    let colors: [UIColor] = [.blue, .orange, .green, .brown, .purple]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = colors.randomElement()
        
        adInfoLabel.font = .boldSystemFont(ofSize: 17)
        adInfoLabel.textAlignment = .center
        adInfoLabel.numberOfLines = 0
        
        adLabel.clipsToBounds = true
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 3
        adLabel.numberOfLines = 0
    }
}
