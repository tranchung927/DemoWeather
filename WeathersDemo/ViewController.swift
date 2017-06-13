//
//  ViewController.swift
//  WeathersDemo
//
//  Created by Tran Chung on 6/12/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var conditonLb: UILabel!
    @IBOutlet weak var degreLb: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var degree: Int!
    var condition: String!
    var imgURL: String!
    var city: String!
    var exists: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlRequest = URLRequest(url: URL(string: "http://api.apixu.com/v1/current.json?key=19c25d79bf234b12af0101146171206&q=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error == nil {
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let current = json["current"] as? [String : AnyObject] {
                        if let temp = current["temp_c"] as? Int {
                            self.degree = temp
                        }
                        if let condition = current["condition"] as? [String : AnyObject] {
                            self.condition = condition["text"] as! String
                            self.imgURL = condition["icon"] as! String
                        }
                    }
                    if let location = json["location"] as? [String : AnyObject] {
                        self.city = location["name"] as? String
                    }
                    
                    if let _ = json["error"] {
                        self.exists = false
                    }
                    DispatchQueue.main.async {
                        if self.exists {
                            self.degreLb.text = self.degreLb.description
                        }
                    }
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }
    }

}

