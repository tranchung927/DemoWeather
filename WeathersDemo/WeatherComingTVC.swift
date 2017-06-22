//
//  TableViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/21/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class WeatherComingTVC: UITableViewController {
    @IBOutlet var dayOfWeekCell: [UILabel]!
    @IBOutlet var iconCell: [UIImageView]!
    @IBOutlet var maxDegreeCell: [UILabel]!
    @IBOutlet var minDegreeCell: [UILabel]!
    
    @IBOutlet weak var maxDegree: UILabel!
    @IBOutlet weak var minDegree: UILabel!
    @IBOutlet weak var dayOfWeek: UILabel!
    @IBOutlet weak var colectionView: UICollectionView!
    
    var weatherDay: Weather? {
        willSet {
            self.weatherDay = DataServices.shared.weather
        }
        didSet{
            let dayCurrent = weatherDay?.timeCurrent ?? 0
            let create =  Date(timeIntervalSince1970: dayCurrent)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "VI")
            
            let day = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: create) - 1]
            dayOfWeek.text = day
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NotificationKey.data, object: nil)
    }
    
    func dayWeek(day: TimeInterval) -> String {
        let create = Date(timeIntervalSince1970: day)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "VI")
        let dayVI = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: create) - 1]
        return dayVI
    }
    func updateData() {
        colectionView.reloadData()
        self.weatherDay = DataServices.shared.weather
//        let weatherMinMax = weatherDay?.weatherDateObjectArray ?? []
//        for item in weatherMinMax {
//            maxDegree.text = "\(item.maxtemp)"
//            minDegree.text = "\(item.mintemp)"
//        }
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
        print(DataServices.shared.weather?.weatherObjectarray.count ?? 0)
        return DataServices.shared.weather?.weatherObjectarray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherHourCell
        if let weather = DataServices.shared.weather?.weatherObjectarray[indexPath.row] {
            let create = Date(timeIntervalSince1970: weather.timeHour)
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
