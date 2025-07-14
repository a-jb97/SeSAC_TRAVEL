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
    let adInfo: [String] = ["하와이 여행을 가고 싶다면? 수업이 있는데 가실 생각은 아니시죠?", "도쿄 여행 예약은? XCode로 직접 예약앱을 만들면 되겠네요!", "설마 UIKit 대신 SwiftUI를 사용하고 계신가요?", "배움에는 끝이 없습니다."]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = colors.randomElement()
        
        adInfoLabel.font = .boldSystemFont(ofSize: 17)
        adInfoLabel.textAlignment = .center
        adInfoLabel.numberOfLines = 0
        adInfoLabel.text = adInfo.randomElement()
        
        adLabel.clipsToBounds = true
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 3
        adLabel.numberOfLines = 0
    }
}
