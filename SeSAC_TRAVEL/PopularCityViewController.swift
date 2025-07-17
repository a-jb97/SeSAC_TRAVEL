//
//  PopularCityViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/16/25.
//

import UIKit

class PopularCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var citySortSegment: UISegmentedControl!
    @IBOutlet var popularCityTableView: UITableView!
    
    let cityInfo: CityInfo = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        
        popularCityTableView.delegate = self
        popularCityTableView.dataSource = self
        
        popularCityTableView.register(xib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as! PopularCityTableViewCell
        
        cell.cityImage.kf.setImage(with: URL(string: cityInfo.city[indexPath.row].city_image))
        cell.cityNameLabel.text = "\(cityInfo.city[indexPath.row].city_name) | \(cityInfo.city[indexPath.row].city_english_name)"
        cell.cityExplainLabel.text = "  \(cityInfo.city[indexPath.row].city_explain)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
