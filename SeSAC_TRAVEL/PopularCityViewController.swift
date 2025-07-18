//
//  PopularCityViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/16/25.
//

import UIKit
import Kingfisher

class PopularCityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var popularCityCollectionView: UICollectionView!
    
    private var city = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: "PopularCityCollectionViewCell", bundle: nil)
        
        popularCityCollectionView.register(xib, forCellWithReuseIdentifier: "PopularCityCollectionViewCell")
        popularCityCollectionView.delegate = self
        popularCityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth
        layout.itemSize = CGSize(width: cellWidth/2.5, height: cellWidth/1.5)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        popularCityCollectionView.collectionViewLayout = layout
    }
    
    @IBAction func filterAllButtonTapped(_ sender: UIButton) {
        let all = CityInfo().city
        var filter: [City] = []
        
        for item in all {
            filter.append(item)
        }
        
        dump(filter)
        city = filter
        popularCityCollectionView.reloadData()
    }
    
    @IBAction func filterDomesticButtonTapped(_ sender: UIButton) {
        let domestic = CityInfo().city
        var filter: [City] = []
        
        for item in domestic {
            if item.domestic_travel == true {
                filter.append(item)
            }
        }
        
        dump(filter)
        city = filter
        popularCityCollectionView.reloadData()
    }
    
    @IBAction func filterOverseasButtonTapped(_ sender: UIButton) {
        let overseas = CityInfo().city
        var filter: [City] = []
        
        for item in overseas {
            if item.domestic_travel == false {
                filter.append(item)
            }
        }
        
        dump(filter)
        city = filter
        popularCityCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCityCollectionViewCell", for: indexPath) as! PopularCityCollectionViewCell
        
        cell.cityImageView.kf.setImage(with: URL(string: city[indexPath.row].city_image))
        cell.cityName.text = "\(city[indexPath.row].city_name) | \(city[indexPath.row].city_english_name)"
        cell.cityExplain.text = city[indexPath.row].city_explain
        
        return cell
    }
}
