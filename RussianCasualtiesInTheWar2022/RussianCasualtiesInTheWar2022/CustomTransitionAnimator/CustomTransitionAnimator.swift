//
//  CustomTransitionAnimator.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 17.07.2022.
//

import UIKit

class CustomTransitionAnimator: NSObject,
                                UIViewControllerAnimatedTransitioning,
                                CAAnimationDelegate {
    
    let duration = 1.8
    var originFrame: CGRect = CGRect.zero //start point of animation transition
    var operation: UINavigationController.Operation = .pop
    
    weak var storedContext: UIViewControllerContextTransitioning?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //передаем во вне наш переход для манипуляций в других методах
       // storedContext = transitionContext
        
        if operation == .push {
            
            let container = transitionContext.containerView
            let fromView = transitionContext.view(forKey: .from)
            let startView = transitionContext.view(forKey: .to)
            //startView?.alpha = 0
            guard let startView = startView,
                  let fromView = fromView
            else {
                return
            }
            startView.alpha = 0
            //start and finish frames of animation
            let initFrame =  originFrame
            let finalFrame = startView.frame
            
            //define scale index of animation
            let XscaleIndex = initFrame.width/finalFrame.width
            let YscaleIndex = initFrame.height/finalFrame.height
            
            let scaleTransform = CGAffineTransform(scaleX: XscaleIndex, y: YscaleIndex)
            
                startView.transform = scaleTransform
                startView.center = CGPoint(x: initFrame.midX, y: initFrame.midY)
                startView.clipsToBounds = true
                startView.layer.cornerRadius = 20
           
            
            if let toView = transitionContext.view(forKey: .to) {
                container.addSubview(toView)
            }
            container.bringSubviewToFront(startView)
            
            UIView.animate(withDuration: duration,
                           delay: 0.1,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.2,
                           options: [.curveEaseIn]) {
                fromView.backgroundColor = .darkGray
                startView.transform = CGAffineTransform.identity
                startView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
                startView.alpha = 1.0
            } completion: { done in
                fromView.backgroundColor =  UIColor(named: "customBackgroundColor")
                transitionContext.completeTransition(done)
            }
            
        } else if operation == .pop {
            
            let container = transitionContext.containerView
            let fromView = transitionContext.view(forKey: .from)
            let startView = transitionContext.view(forKey: .from)
            guard let startView = startView,
                  let fromView = fromView
            else {
                transitionContext.completeTransition(false)
                return
            }
    
            //start and finish frames of animation
            let initFrame = startView.frame
            let finalFrame = originFrame
            
            //define scale index of animation
            let XscaleIndex = finalFrame.width/initFrame.width
            let YscaleIndex = finalFrame.height/initFrame.height
            
            if let toView = transitionContext.view(forKey: .to) {
                container.addSubview(toView)
            }
            container.bringSubviewToFront(startView)
            UIView.animate(withDuration: duration,
                           delay: 0.3,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.1,
                           options: [.curveEaseOut]) {
                fromView.backgroundColor = .darkGray
                startView.transform = CGAffineTransform(scaleX: XscaleIndex, y: YscaleIndex)
                startView.frame = self.originFrame
                startView.alpha = 0
            } completion: { done in
                fromView.backgroundColor = UIColor(named: "customBackgroundColor")
                transitionContext.completeTransition(done)
            }
        }
    }
}
