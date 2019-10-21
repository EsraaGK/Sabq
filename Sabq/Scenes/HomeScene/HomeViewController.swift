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
        
        let nibVideo = UINib(nibName: "VideoHomeTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibVideo, forCellReuseIdentifier: "VideoHomeTableViewCell")
        
        presenter.getNews(forPage: 1)
        presenter.getVideos()
        presenter.getImages()
    }
    
    override func loadDataFailed(with error: Error?) {
        print("loadDataFailed from HOME VIEW")
    }
    
    override func loadDataSuccess(date: Any) {
         let news =  (date as? [[Material]])!
        adapter.add(items: news )
    }
    
    func loadVideosSuccess(date: Any){
        let videos =  (date as? [Material])!
        adapter.add(item: videos, at: 5)
    }
    func loadImagesSuccess(date: Any){
        let images =  (date as? [Material])!
        adapter.add(item: images, at: 11)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController!.pushViewController(DetailsViewController(), animated: false) 
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(integerLiteral: 517)
        default:
            return CGFloat(integerLiteral: 121)
        }
    }

}
