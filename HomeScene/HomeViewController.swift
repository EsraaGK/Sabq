//
//  HomeViewController.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        let nib = UINib(nibName: "OrdinaryCellTableViewCell", bundle: Bundle.main)
        homeTableView.register(nib, forCellReuseIdentifier: "OrdinaryCellTableViewCell")
     
        let nibSlider = UINib(nibName: "SliderTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibSlider, forCellReuseIdentifier: "SliderTableViewCell")
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = homeTableView!.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            return cell
        default:
            let cell = homeTableView!.dequeueReusableCell(withIdentifier: "OrdinaryCellTableViewCell", for: indexPath) as! OrdinaryCellTableViewCell
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController!.pushViewController(DetailsViewController(), animated: false) 
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return CGFloat(integerLiteral: 517)
        default:
            return CGFloat(integerLiteral: 121)
        }
    }

}
