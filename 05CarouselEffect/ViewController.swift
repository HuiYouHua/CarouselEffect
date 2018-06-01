//
//  ViewController.swift
//  05CarouselEffect
//
//  Created by 华惠友 on 2017/8/24.
//  Copyright © 2017年 华惠友. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cellID = "CollectionViewCell"
    let dataArray = CellModel.createModel()
    lazy var myCollection: UICollectionView = {
        () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let myCollection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollection.bounds = CGRect(x: 0, y: 0, width: 400, height: 600)
        myCollection.center = CGPoint(x: self.view.frame.width / 2.0, y: self.view.frame.height / 2.0)
        myCollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: self.cellID)
        myCollection.delegate = self
        myCollection.dataSource = self
        myCollection.backgroundColor = UIColor.clear
        
        return myCollection
    }()
    
    lazy var imageView: UIImageView = {
        () -> UIImageView in
        let imageView = UIImageView(image: UIImage(named: "blue.png"))
        imageView.frame = self.view.frame
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CarouselEffect"
        view.addSubview(imageView)
        view.addSubview(myCollection)
    }


}

// MARK: - 代理
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! CollectionViewCell
        cell.cellModel = dataArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}












