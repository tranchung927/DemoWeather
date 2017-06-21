//
//  TableViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class WeatherComingTVC: UITableViewController {
    @IBOutlet weak var colectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NotificationKey.data, object: nil)
    }
    func updateData() {
        colectionView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return colectionView
    }
}
extension WeatherComingTVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServices.shared.weather?.weatherObjectarray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherHourCell
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
