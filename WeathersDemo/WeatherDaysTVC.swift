//
//  WeatherDaysTVC.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/16/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class WeatherDaysTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NotificationKey.data, object: nil)
    }
    
    func handleNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> Int {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
        let date = Date(timeIntervalSince1970: interval)
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour], from: date)
        let hour = comp.hour
        return hour!
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let number = DataServices.shared.weather?.weatherObjectarray.count else {
            return 0
        }
        return number
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherHourCell
//        if let weather = DataServices.shared.weather?.weatherObjectarray[indexPath.row] {
//            
//            let create =  Date(timeIntervalSince1970: weather.timeHour)
//            let dateFormatter = DateFormatter()
//            dateFormatter.locale = Locale(identifier: "VI")
//            dateFormatter.timeStyle = .short
//            let str = dateFormatter.string(from: create)
//
//            cell.temp_Hour.text = "\(weather.tempCHour)ºC"
//            cell.text_Hour.text = weather.textHour
//            cell.time_Hour.text = "\(str)"
//            cell.icon_Hour.downloadImage(from: weather.iconHour)
//        }
//        return cell
//    }
}
