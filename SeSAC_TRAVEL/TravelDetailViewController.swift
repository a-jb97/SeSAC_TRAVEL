//
//  TravelDetailViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/15/25.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {
    
    @IBOutlet var travelSiteImage: UIImageView!
    @IBOutlet var travelSiteLabel: UILabel!
    @IBOutlet var travelSiteSubtitle: UILabel!
    @IBOutlet var otherSiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        let url = URL(string: TravelInfo().travel.first?.travel_image ?? "")
        
        navigationItem.title = "관광지 화면"
        
        travelSiteImage.kf.setImage(with: url)
        travelSiteImage.clipsToBounds = true
        travelSiteImage.contentMode = .scaleAspectFill
        travelSiteImage.layer.cornerRadius = 10
        
        travelSiteLabel.font = .boldSystemFont(ofSize: 30)
        travelSiteLabel.textAlignment = .center
        
        travelSiteSubtitle.font = .boldSystemFont(ofSize: 20)
        travelSiteSubtitle.textAlignment = .center
        travelSiteSubtitle.numberOfLines = 2
        
        otherSiteButton.setTitle("다른 관광지 보러 가기", for: .normal)
        otherSiteButton.clipsToBounds = true
        otherSiteButton.layer.cornerRadius = 27
        otherSiteButton.backgroundColor = UIColor.accent
    }
    
    @IBAction func otherSiteButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
