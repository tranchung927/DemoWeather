//
//  ViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/12/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
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
