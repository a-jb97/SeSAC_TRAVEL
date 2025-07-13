//
//  TravelInfoTableViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/12/25.
//

import UIKit
import Kingfisher

class TravelInfoTableViewController: UITableViewController {
    
    var travelInfo: TravelInfo = TravelInfo()
    let numberFormatter: NumberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        travelInfo.travel[sender.tag].like?.toggle()
        tableView.reloadData()
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
