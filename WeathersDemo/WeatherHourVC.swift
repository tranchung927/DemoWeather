//
//  WeatherHour.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/19/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WeatherHourVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NotificationKey.data, object: nil)
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func reloadData() {
        collectionView.reloadData()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = DataServices.shared.weather?.weatherObjectarray.count else {
            return 0
        }
        return number
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WeatherHourCell
        if let weather = DataServices.shared.weather?.weatherObjectarray[indexPath.row] {
                        let create =  Date(timeIntervalSince1970: weather.timeHour)
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "VI")
                        dateFormatter.timeStyle = .short
                        let str = dateFormatter.string(from: create)
            
                        cell.degree.text = "\(weather.tempCHour)ºC"
                        cell.time.text = "\(str)"
                        cell.item.downloadImage(from: weather.iconHour)
                    }
        return cell
    }
}
