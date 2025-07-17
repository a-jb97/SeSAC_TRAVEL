//
//  PopularCityCollectionViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/17/25.
//

import UIKit

class PopularCityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.clipsToBounds = true
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = cityImageView.frame.width / 2
        
    }

}
