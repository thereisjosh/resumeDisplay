//
//  OnboardingViewController.swift
//  resume
//
//  Created by Joshua Ang on 18/6/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
   
    var slides: [OnboardingSlide] = []
    
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Find Out More", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
                    OnboardingSlide(title: "Lorem Ipsum", description: "Age  |  Current Occupation", image: #imageLiteral(resourceName: "cover_4")),
                    OnboardingSlide(title: "About Me", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus arcu et magna vulputate suscipit. Morbi lobortis tempus tempus. Morbi id sem quis diam laoreet gravida. Sed laoreet ipsum sem, sed tristique mi consequat et. Aenean in nunc nec turpis commodo ornare. Morbi consequat purus nec orci imperdiet, ac luctus elit gravida. Quisque in sem eget ipsum aliquam gravida ut in nulla.", image: #imageLiteral(resourceName: "cover_4")),
                    OnboardingSlide(title: "My Hobbies", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus arcu et magna vulputate suscipit. Morbi lobortis tempus tempus. Morbi id sem quis diam laoreet gravida. Sed laoreet ipsum sem, sed tristique mi consequat et. Aenean in nunc nec turpis commodo ornare. Morbi consequat purus nec orci imperdiet, ac luctus elit gravida. Quisque in sem eget ipsum aliquam gravida ut in nulla.", image: #imageLiteral(resourceName: "cover_4"))
                ]
        
        
        pageControl.numberOfPages = slides.count

    }
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeTC") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
