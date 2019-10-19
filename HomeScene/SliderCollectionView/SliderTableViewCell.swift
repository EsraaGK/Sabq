//
//  SliderTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate{

    
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        let nib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "SliderCollectionViewCell" )
        
        ( sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
            }

  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        return cell
    }
    
    
}
