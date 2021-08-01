//
//  TodayAnimationTransition.swift.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

fileprivate let transitonDuration: TimeInterval = 1.0


enum AnimationType {
    case present
    case dismiss
    case drag
}

class TodayAnimationTransition: NSObject {
    let animationType: AnimationType!
    
    init(animationType: AnimationType) {
        self.animationType = animationType
        super.init()
    }
}

extension TodayAnimationTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitonDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if animationType == .present {
            animationForPresent(using: transitionContext)
        } else if animationType == .dismiss {
            animationForDismiss(using: transitionContext)
        }
    }
    
    func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        //1.Get fromVC and toVC
        guard let fromVC = transitionContext.viewController(forKey: .from) as? UITabBarController else { return }
        guard let tableViewController = fromVC.viewControllers?.first as? TodayViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? CardDetailViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: fromVC.view)        
        //2.Set presentation original size.
        toVC.view.frame = frame
        toVC.scrollView.imageView.frame.size.width = GlobalConstants.todayCardSize.width
        toVC.scrollView.imageView.frame.size.height = GlobalConstants.todayCardSize.height
        
        containerView.addSubview(toVC.view)
        
        //3.Change original size to final size with animation.
        UIView.animate(withDuration: transitonDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            toVC.view.frame = UIScreen.main.bounds
            toVC.scrollView.imageView.frame.size.width = kScreenW
            toVC.scrollView.imageView.frame.size.height = GlobalConstants.cardDetailTopImageH
            toVC.closeBtn.alpha = 1
            
            
            
            fromVC.tabBar.frame.origin.y = kScreenH
        }) { (completed) in
            transitionContext.completeTransition(completed)
        }
    }
    
    func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? CardDetailViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? UITabBarController else { return }
        guard let tableViewController = toVC.viewControllers?.first as? TodayViewController else { return }
        guard let selectedCell = tableViewController.selectedCell else { return }
        
        
        UIView.animate(withDuration: transitonDuration - 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn , animations: {
            let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: toVC.view)
            fromVC.view.frame = frame
            fromVC.view.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius
            fromVC.scrollView.imageView.frame.size = GlobalConstants.todayCardSize

            fromVC.closeBtn.alpha = 0
            
            fromVC.scrollView.titleView.frame.origin.y = selectedCell.titleView.frame.origin.y
            fromVC.scrollView.subtitleView.frame.origin.y = selectedCell.subtitleView.frame.origin.y
            fromVC.scrollView.descView.frame.origin.y = selectedCell.descView.frame.origin.y
            

            toVC.tabBar.frame.origin.y = kScreenH - toVC.tabBar.frame.height
        }) { (completed) in
            transitionContext.completeTransition(completed)
            toVC.view.addSubview(toVC.tabBar)

        }
    }
    
   

}
