//
//  HomeViewController.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, UITableViewDelegate, HomeViewProtocol {
   
    @IBOutlet private weak var homeTableView: UITableView!
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
        
        let nibImage = UINib(nibName: "ImagesTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibImage, forCellReuseIdentifier: "ImagesTableViewCell")
        
        let nibArticle = UINib(nibName: "ArticlesTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibArticle, forCellReuseIdentifier: "ArticlesTableViewCell")
        //skelton view cell SkeletonTableViewCell
        let nibSkeleton = UINib(nibName: "SkeletonTableViewCell", bundle: Bundle.main)
        homeTableView.register(nibSkeleton, forCellReuseIdentifier: "SkeletonTableViewCell")
        
        homeTableView.showAnimatedSkeleton()
        
        presenter.getNews(forPage: 1)
    }
    
    override func loadDataFailed(with error: Error?) {
        print("loadDataFailed from HOME VIEW")
    }
    
    override func loadDataSuccess(date: Any) {
        homeTableView.hideSkeleton()
        
        guard let news = (date as? [[Material]]) else { return }
        let tempSlider = SliderCellModel(material: news[0])
        let tempOrdinary = news[1].map { OrdinaryCellModel(material: $0) }
        adapter.addToSlider(item: tempSlider)
        adapter.add(items: tempOrdinary)
         presenter.getVideos()// coz videos response arrives before home response so it isn't injected in the array
    }
    
    func loadVideosSuccess(date: Any) { guard let videos = (date as? [Material]) else { return }
        let videosModel = VideosModel(materials: videos)
        adapter.add(item: videosModel, at: 5)
         presenter.getImages()
    }
    func loadImagesSuccess(date: Any) {
       guard let images = (date as? [Material]) else { return }
        let imagesModel = ImagesModel(materials: images)
        adapter.add(item: imagesModel, at: 11)
         presenter.getArticles()
    }
    
    func loadArticlesSuccess(date: Any) {
       guard let articles = (date as? [Material]) else { return }
        let articlesModel = ArticlesModel(materials: articles)
        adapter.add(item: articlesModel, at: 16)
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.navigationController!.pushViewController(DetailsViewController(), animated: false)
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(integerLiteral: 517)
        default:
            switch indexPath.row {
            case 5: return CGFloat(integerLiteral: 384)//videos
            case 11: return CGFloat(integerLiteral: 349)//images
            case 16: return CGFloat(integerLiteral: 370)//articles
            default:  return CGFloat(integerLiteral: 121)
            }
        }
    }
   
}
