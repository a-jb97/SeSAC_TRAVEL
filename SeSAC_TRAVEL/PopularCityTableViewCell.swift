//
//  PopularCityTableViewCell.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/16/25.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    static let identifier: String = "PopularCityTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImage.roundCorners(cornerRadius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
        cityImage.contentMode = .scaleAspectFill
        
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        
        cityExplainLabel.textColor = .white
        cityExplainLabel.font = .systemFont(ofSize: 15)
        cityExplainLabel.backgroundColor = .black.withAlphaComponent(0.7)
        cityExplainLabel.roundCorners(cornerRadius: 15, maskedCorners: [.layerMaxXMaxYCorner])
    }
}

extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
