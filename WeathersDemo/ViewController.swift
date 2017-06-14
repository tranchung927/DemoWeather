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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
}

extension ViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool  {
//            }
//
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DataServices.shared.searchKey = searchBar.text ?? ""
        
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        DataServices.shared.searchKey = searchBar.text ?? ""
        return true

    }
}
