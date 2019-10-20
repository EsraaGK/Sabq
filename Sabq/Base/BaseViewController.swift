//
//  BaseViewController.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController<Presenter:BasePresenterProtocol>: UIViewController{
    
    
    
    // MARK: - Public Variables
    
    // MARK: - Private Variables
    
    var presenter:Presenter!
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
    
    func loadDataFailed(with error: Error?) {
        
    }
    
    func loadDataSuccess(date: Any) {
        
    }
    
}

