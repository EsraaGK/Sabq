//
//  HomeViewController.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, UITableViewDelegate, HomeViewProtocol {

    @IBOutlet weak var homeTableView: UITableView!
  lazy var adapter = HomeAdapter(tableView: homeTableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.reloadData = homeTableView.reloadData
        
        homeTableView.delegate = self
        homeTableView.dataSource = adapter
        
        let nib = UINib(nibName: "OrdinaryCellTableViewCell", bundle: Bundle.main)
        homeTableView.register(nib, forCellReuseIdentifier: "OrdinaryCellTableViewCell")
     
        let nibSlider = UINib(nibName: "SliderTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibSlider, forCellReuseIdentifier: "SliderTableViewCell")
       presenter.getNews(forPage: 1)
    }
    
    override func loadDataFailed(with error: Error?) {
        print("loadDataFailed from HOME VIEW")
    }
    
    override func loadDataSuccess(date: Any) {
         let news =  (date as? [[Material]])!
        adapter.add(items: news )
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
