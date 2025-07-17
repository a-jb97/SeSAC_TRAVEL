//
//  PopularCityViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/16/25.
//

import UIKit
import Kingfisher

class PopularCityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var citySortSegment: UISegmentedControl!
    @IBOutlet var popularCityCollectionView: UICollectionView!
    
    let cityInfo: CityInfo = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: "PopularCityCollectionViewCell", bundle: nil)
        
        popularCityCollectionView.register(xib, forCellWithReuseIdentifier: "PopularCityCollectionViewCell")
        popularCityCollectionView.delegate = self
        popularCityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (16 * 1.5) - (16 * 1.5)
        layout.itemSize = CGSize(width: cellWidth/3, height: cellWidth)
        layout.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        popularCityCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCityCollectionViewCell", for: indexPath) as! PopularCityCollectionViewCell
        
        cell.cityImageView.kf.setImage(with: URL(string: cityInfo.city[indexPath.row].city_image))
        cell.cityName.text = "\(cityInfo.city[indexPath.row].city_name) | \(cityInfo.city[indexPath.row].city_english_name)"
        cell.cityExplain.text = cityInfo.city[indexPath.row].city_explain
        
        return cell
    }
}
