//
//  PortfolioTableViewCell.swift
//  resume
//
//  Created by Joshua Ang on 13/7/21.
//

import UIKit

class PortfolioTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
        var viewPhotos: UICollectionView!
        weak var viewController: UIViewController?
        var raynproofImage: [UIImage] = [
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
        ]
        var resumeImage: [UIImage] = [
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
            UIImage(named: "cover_4")!,
        ]
    
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            viewPhotos = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
            viewPhotos.collectionViewLayout = layout
            viewPhotos.showsHorizontalScrollIndicator = false
            viewPhotos.ut_registerClassCell(PhotoCollectionViewCell.self)
            collectionSetup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func collectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 155, height: 155)
        
        let viewPhotos:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 180), collectionViewLayout: layout)
        
        viewPhotos.dataSource = self
        viewPhotos.delegate = self
        viewPhotos.ut_registerClassCell(PhotoCollectionViewCell.self)
        viewPhotos.backgroundColor = .clear
        viewPhotos.showsHorizontalScrollIndicator = false
        contentView.addSubview(viewPhotos)
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = Int()
        if viewPhotos.tag == 0 {
                count = raynproofImage.count
            } else if viewPhotos.tag == 1 {
                count = resumeImage.count
            }
        return count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.ut_dequeueReusable(PhotoCollectionViewCell.self, for: indexPath)
        myCell.backgroundColor = .clear
        myCell.cornerRadius = 5
            if viewPhotos.tag == 0 {
                myCell.slideImageView.image = raynproofImage[indexPath.item]
            } else if viewPhotos.tag == 1 {
                myCell.slideImageView.image = resumeImage[indexPath.item]
            }
        return myCell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        print("hello")
//    }

    
    @objc func presentGalleryViewController() {
        let navController = UIStoryboard(name: "Gallery", bundle: nil).instantiateViewController(withIdentifier: "GalleryNavigationControllerID")
        navController.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        viewController?.view.window!.layer.add(transition, forKey: kCATransition)
        viewController?.present(navController, animated: false, completion: nil)
        
    }
    
}




