//
//  ThirdViewController.swift
//  resume
//
//  Created by Joshua Ang on 16/7/21.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 0, y: 270, width: kScreenW, height: 20))
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        configurePageControl()
    }

    
    func collectionSetup() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        layout.itemSize = CGSize(width: kScreenW, height: 50)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
    
        
        let myCollectionView:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 300), collectionViewLayout: layout)
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.isPagingEnabled = true
        myCollectionView.ut_registerClassCell(UserCollectionViewCell.self)
        myCollectionView.backgroundColor = .clear
        myCollectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(myCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.ut_dequeueReusable(UserCollectionViewCell.self, for: indexPath)
        myCell.backgroundColor = .clear
        if indexPath.row == 0 {
            myCell.slideDescLabel.text = "English"
            myCell.slideTitleLabel.text = "Native"
            myCell.slideImageView.image = #imageLiteral(resourceName: "en")
            myCell.imageBackground.backgroundColor = .secondarySystemFill
        } else if indexPath.row == 1 {
            myCell.slideDescLabel.text = "Mandarin"
            myCell.slideTitleLabel.text = "Native"
            myCell.slideImageView.image = #imageLiteral(resourceName: "cn")
            myCell.imageBackground.backgroundColor = .secondarySystemFill
            
        }
        
        return myCell
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
    }
    
    func configurePageControl() {
        self.pageControl.numberOfPages = 1
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = .clear
        self.pageControl.hidesForSinglePage = true
        self.pageControl.backgroundStyle = .minimal
        self.pageControl.pageIndicatorTintColor = .tertiaryLabel
        self.pageControl.currentPageIndicatorTintColor = .label
        self.view.addSubview(pageControl)
     }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
