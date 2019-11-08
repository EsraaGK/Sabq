//
//  HomeViewController.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import SkeletonView

class HomeViewController: BaseViewController<HomePresenter>, UITableViewDelegate, HomeViewProtocol {
    
    @IBOutlet private weak var homeTableView: UITableView!
    lazy var adapter = HomeAdapter(tableView: homeTableView)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
     
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.backgroundColor = UIColor.homeBackGroundColor
       
        adapter.reloadData = homeTableView.reloadData
        
        homeTableView.delegate = self
        homeTableView.dataSource = adapter
        
        homeTableView.register(OrdinaryCellTableViewCell.nib,
                               forCellReuseIdentifier: OrdinaryCellTableViewCell.identifier)
        
        homeTableView.register(SliderTableViewCell.nib,
                               forCellReuseIdentifier: SliderTableViewCell.identifier)
        
        homeTableView.register(VideoHomeTableViewCell.nib,
                               forCellReuseIdentifier: VideoHomeTableViewCell.identifier)
        
        homeTableView.register(ImagesTableViewCell.nib,
                               forCellReuseIdentifier: ImagesTableViewCell.identifier)
        
        homeTableView.register(ArticlesTableViewCell.nib, forCellReuseIdentifier: ArticlesTableViewCell.identifier)
        
        //skelton view cell SkeletonTableViewCell
        homeTableView.register(SkeletonTableViewCell.nib,
                               forCellReuseIdentifier: SkeletonTableViewCell.identifier)
        
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
        let gradient = SkeletonGradient(baseColor: UIColor.skeltonViewBaseColor)
        view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
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
//    func setTabBarControllerNavigationBar() {
//    self.tabBarController?.navigationItem.hidesBackButton = true
//           self.tabBarController?.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "img_logo"))
//
//               let rightBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notification-icon").withRenderingMode(.alwaysOriginal),
//                                                  style: .done,
//                                                  target: self,
//                                                  action: #selector(HomeModule.logoutUser) )
//               self.tabBarController?.navigationItem.rightBarButtonItem = rightBarItem
//
//               let leftBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "img_user").withRenderingMode(.alwaysOriginal),
//                                                 style: .done,
//                                                 target: self,
//                                                 action: #selector(HomeModule.logoutUser) )
//                self.tabBarController?.navigationItem.leftBarButtonItem = leftBarItem
//
//        if #available(iOS 11.0, *) {
//            //self.navigationBar.tintColor = .red
//                //UIColor(named: "TabbarBGColor")
//           //  self.tabBarController?.moreNavigationController.isTranslucent = false
//               } else {
//                   // Fallback on earlier versions
//               }
//    }
}
