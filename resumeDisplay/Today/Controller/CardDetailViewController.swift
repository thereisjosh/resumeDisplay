//
//  CardDetailViewController.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    static var detailTextForCell = ""
    static var titleTextForCell = ""
    static var subtitleTextForCell = ""
    static var descTextForCell = ""

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var dismissClosure: (()->())?
    //the point when start to interactive
    var interactiveStartingPoint: CGPoint?

    var draggingDownToDismiss = false
    
    let cell: TodayTableViewCell!
    
    //Var for text to display on detail vc
    var detailText = ""
    
    //Var for title to display on card
    var titleText = ""
    var subtitleText = ""
    var descText = ""
    
    var dismissalAnimator: UIViewPropertyAnimator?
    


    private lazy var dismissalScreenEdgePanGesture: DismissalScreenEdgePanGesture = {
        let pan = DismissalScreenEdgePanGesture()
        pan.edges = .left
        return pan
    }()
    
    final class DismissalScreenEdgePanGesture: UIScreenEdgePanGestureRecognizer {}
    
    
    
    lazy var dismissPanGesture: UIPanGestureRecognizer = {
        let ges = UIPanGestureRecognizer()
        ges.maximumNumberOfTouches = 1
        ges.addTarget(self, action: #selector(handleDismissalPan(gesture:)))
        ges.delegate = self
        return ges
    }()
    
    lazy var scrollView: DetailScrollView = {
        let frame = self.view.bounds
        let view = DetailScrollView(frame: frame)
        view.delegate = self
        return view
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: kScreenW - 20 - 30, y: 20, width: 30, height: 30)
        btn.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return btn
    }()
    
    init(cell: TodayTableViewCell) {
        self.cell = cell
        super.init(nibName: nil, bundle: nil)
        self.setupTranstion()
    }
    
    private func setupTranstion() {
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getImageFromCell()
        getTextFromCell()
        getTitleFromCell()
        getSubTitleFromCell()
        getDescFromCell()
    }
    
    private func setupUI() {
        self.view.backgroundColor = UIColor.systemBackground
        self.view.layer.masksToBounds = true
        view.addSubview(scrollView)
        view.addSubview(closeBtn)
        view.addGestureRecognizer(dismissPanGesture)
        
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    private func getImageFromCell() {
        scrollView.imageView.image = cell.bgImageView.image
    }
    
    // As you are getting images from cell, you have to get its detail text too to populate the detailVC. This is the proper way.
    
    private func getTextFromCell() {
        scrollView.textView.text = CardDetailViewController.detailTextForCell
        
    }
    
    private func getTitleFromCell() {
        scrollView.titleView.text = CardDetailViewController.titleTextForCell
    }
    
    private func getSubTitleFromCell() {
        scrollView.subtitleView.text = CardDetailViewController.subtitleTextForCell
    }
    
    private func getDescFromCell() {
        scrollView.descView.text = CardDetailViewController.descTextForCell
    }
    
    
    
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
        closeBtn.alpha = 0
        dismissClosure?()
    }
    
    func didCancelDismissalTransition() {
        // Clean up
        interactiveStartingPoint = nil
        dismissalAnimator = nil
        draggingDownToDismiss = false
    }
    
    func didSuccessfullyDragDownToDismiss() {
        dismiss(animated: true)
    }
    
    @objc func handleDismissalPan(gesture: UIPanGestureRecognizer) {
        if !draggingDownToDismiss {
            return
        }
      
        let startingPoint: CGPoint
        
        if let p = interactiveStartingPoint {
            startingPoint = p
        } else {
            startingPoint = gesture.location(in: nil)
            interactiveStartingPoint = startingPoint
        }

        let currentLocation = gesture.location(in: nil)
        
        var progress = (currentLocation.y - startingPoint.y) / 100
        
        //prevent viewController bigger when scrolling up
        if currentLocation.y <= startingPoint.y {
            progress = 0
        }
        
        if progress >= 1.0 {
            dismiss(animated: true, completion: nil)
            dismissClosure?()
            stopDismissPanGesture(gesture)
            return
        }

        let targetShrinkScale: CGFloat = 0.86
        let currentScale: CGFloat = 1 - (1 - targetShrinkScale) * progress
        
        switch gesture.state {
        case .began,.changed:
            scrollView.isScrollEnabled = false
            gesture.view?.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
            gesture.view?.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius * (progress)
            scrollView.showsVerticalScrollIndicator = false
            closeBtn.alpha = 1-progress
        case .cancelled,.ended:
            scrollView.isScrollEnabled = true
            stopDismissPanGesture(gesture)
            closeBtn.alpha = 1-progress
        default:
            break
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Without this, when user drag down and lift the finger fast at the top, there'll be some scrolling going on.
        // This check prevents that.
        if velocity.y > 0 && scrollView.contentOffset.y <= 0 {
            scrollView.contentOffset = .zero
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }

    private func stopDismissPanGesture(_ gesture: UIPanGestureRecognizer) {
        draggingDownToDismiss = false
        interactiveStartingPoint = nil
        scrollView.showsVerticalScrollIndicator = true
        
        UIView.animate(withDuration: 0.2) {
            gesture.view?.transform = CGAffineTransform.identity

        }
    }

}

extension CardDetailViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TodayAnimationTransition(animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TodayAnimationTransition(animationType: .dismiss)
    }
    

    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CardPresentationController(presentedViewController: presented, presenting: presenting)
    }
}


extension CardDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset = .zero
            draggingDownToDismiss = true
        }
    }
}

extension CardDetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
