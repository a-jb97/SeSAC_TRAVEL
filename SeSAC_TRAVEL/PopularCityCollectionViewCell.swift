//
//  PopularCityCollectionViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/17/25.
//

import UIKit

class PopularCityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.clipsToBounds = true
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = cityImageView.frame.width / 1.8
        
        cityName.font = .boldSystemFont(ofSize: 17)
        cityName.textAlignment = .center
        
        cityExplain.font = .systemFont(ofSize: 15)
        cityExplain.textColor = .gray
        cityExplain.textAlignment = .center
    }
}
