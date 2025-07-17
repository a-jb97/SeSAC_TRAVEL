//
//  PopularCityViewController.swift
//  SeSAC_TRAVEL
//
//  Created by 전민돌 on 7/16/25.
//

import UIKit

class PopularCityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var citySortSegment: UISegmentedControl!
    @IBOutlet var popularCityCollectionView: UICollectionView!
    
    let cityInfo: CityInfo = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
