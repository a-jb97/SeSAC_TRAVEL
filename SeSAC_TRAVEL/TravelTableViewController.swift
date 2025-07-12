//
//  TravelTableViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/11/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let magazineInfo: MagazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyMMdd"
        let date = dateFormat.date(from: magazineInfo.magazine[indexPath.row].date)
        
        let myDateFormat = DateFormatter()
        myDateFormat.dateFormat = "yy년 MM월 dd일"
        
        cell.photoImageView.kf.setImage(with: URL(string: magazineInfo.magazine[indexPath.row].photo_image))
        cell.titleLabel.text = magazineInfo.magazine[indexPath.row].title
        cell.subtitleLabel.text = magazineInfo.magazine[indexPath.row].subtitle
        cell.dateLabel.text = myDateFormat.string(from: date!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 510
    }
}
