//
//  CurrentWeatherLocationVC.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/15/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class CurrentWeatherLocationVC: UIViewController {

    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var conditonLb: UILabel!
    @IBOutlet weak var degreLb: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var weather: Weather? {
        willSet {
            self.weather = DataServices.shared.weather
        }
        didSet{
            nameLb.text = self.weather?.city
            guard let degree = self.weather?.degree else {
                return
            }
            degreLb.text = "\(degree)"
            conditonLb.text = weather?.condition
            guard let urlImage = weather?.imgURL else {
                return
            }
            imageView.downloadImage(from: urlImage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: NotificationKey.data, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateData() {
        self.weather = DataServices.shared.weather
    }
}
