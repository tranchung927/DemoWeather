//
//  ViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/12/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool  {
//            }
//
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DataServices.shared.searchKey = searchBar.text ?? ""
        guard let weather = DataServices.shared.weather else {
            return
        }
        self.weather = weather
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        DataServices.shared.searchKey = searchBar.text ?? ""
        return true

    }
}
