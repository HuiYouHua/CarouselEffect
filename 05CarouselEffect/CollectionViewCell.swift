//
//  CollectionViewCell.swift
//  05CarouselEffect
//
//  Created by 华惠友 on 2017/8/24.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        () -> UIImageView in
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        () -> UILabel in
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.alpha = 0.7
        return label
    }()
    
    var cellModel: CellModel? {
        didSet {
            self.imageView.image = cellModel?.featuredImage
            self.descriptionLabel.text = cellModel?.description
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        self.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 50)
        descriptionLabel.frame = CGRect(x: 0, y: self.frame.height - 50, width: self.frame.width, height: 50)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    
    
    
    
    
    
    
    
}
