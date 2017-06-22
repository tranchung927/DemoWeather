//
//  ViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/12/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    @IBOutlet weak var degreeLB: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var conditonLb: UILabel!
    
    var time: Date?
    
    var weather: Weather? {
        willSet {
            self.weather = DataServices.shared.weather
        }
        didSet{
            nameLb.text = self.weather?.city
            guard let degree = self.weather?.degree else {
                return
            }
            degreeLB.text = "\(degree)ºC"
            conditonLb.text = weather?.condition
//            guard let urlImage = weather?.imgURL else {
//                return
//            }
//            imageView.downloadImage(from: urlImage)
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
extension ContainerVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DataServices.shared.searchKey = searchBar.text ?? ""
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
}
