//
//  TravelInfoTableViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/12/25.
//

import UIKit
import Kingfisher

// 피드백 : 이미지 다운샘플링, 리팩토링, 문자열 상수화, 함수 위치 고민, 중복코드 병합(가독성 향상)
class TravelInfoTableViewController: UITableViewController {
    
    var travelInfo: TravelInfo = TravelInfo()
    var adInfo: String? = AdInfo().adInfoList.randomElement()
    let numberFormatter: NumberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travelInfo.travel[indexPath.row].ad == true {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "TravelAdTableViewCell", for: indexPath) as! TravelAdTableViewCell
            
            adCell.adInfoLabel.text = adInfo
            
            return adCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityInfo", for: indexPath) as! TravelInfoTableViewCell
            
            cell.titleLabel.text = travelInfo.travel[indexPath.row].title
            cell.descriptionLabel.text = travelInfo.travel[indexPath.row].description
            cell.rateSaveLabel.text = "\(convertGradeToStar(indexPath: indexPath)) · 저장 \(numberFormatter.string(for: travelInfo.travel[indexPath.row].save ?? 0)!)"
            cell.travelImage.kf.setImage(with: URL(string: travelInfo.travel[indexPath.row].travel_image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"))
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)
            
            if travelInfo.travel[indexPath.row].like == true {
                cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                cell.likeButton.tintColor = .red
            } else {
                cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                cell.likeButton.tintColor = .white
            }
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if travelInfo.travel[indexPath.row].ad == true {
            return UITableView.automaticDimension
        } else {
            return 170
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if travelInfo.travel[indexPath.row].ad == false {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "TravelDetailViewController") as! TravelDetailViewController
            
            viewController.siteImage = travelInfo.travel[indexPath.row].travel_image ?? "이미지 없음"
            viewController.siteLabel = travelInfo.travel[indexPath.row].title
            viewController.siteSubtitle = travelInfo.travel[indexPath.row].description ?? "설명 없음"
            
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "AdDetailViewController") as! AdDetailViewController
            let navigationView = UINavigationController(rootViewController: viewController)
            
            viewController.adDescription = adInfo
            
            navigationView.modalPresentationStyle = .fullScreen
            present(navigationView, animated: true)
        }
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        travelInfo.travel[sender.tag].like?.toggle()
        if travelInfo.travel[sender.tag].like == true {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            sender.tintColor = .red
        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            sender.tintColor = .white
        }
    }
    
    func convertGradeToStar(indexPath: IndexPath) -> String {
        var star: String = ""
        
        switch travelInfo.travel[indexPath.row].grade ?? 0.0 {
        case 1.0...1.9:
            star = "⭐️"
        case 2.0...2.9:
            star = "⭐️⭐️"
        case 3.0...3.9:
            star = "⭐️⭐️⭐️"
        case 4.0...4.9:
            star = "⭐️⭐️⭐️⭐️"
        case 5.0...:
            star = "⭐️⭐️⭐️⭐️⭐️"
        default:
            star = ""
        }
        
        return star
    }
}
