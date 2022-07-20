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
    
    let duration = 0.8
    var originFrame: CGRect = CGRect.zero //start point of animation transition
    var operation: UINavigationController.Operation = .pop
    
    weak var storedContext: UIViewControllerContextTransitioning?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //передаем во вне наш переход для манипуляций в других методах
        storedContext = transitionContext
        
        if operation == .push {
            
           let container = transitionContext.containerView
            
            let startView = transitionContext.view(forKey: .to)
            startView?.alpha = 0
            
            guard let startView = startView else {
                return
            }
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
                           initialSpringVelocity: 0.3,
                           options: [.curveEaseOut]) {
                startView.transform = CGAffineTransform.identity
                startView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
                startView.alpha = 1.0
            } completion: { done in
                transitionContext.completeTransition(done)
            }
            
        } else if operation == .pop {
            
            let container = transitionContext.containerView
            let startView = transitionContext.view(forKey: .from)
            guard let startView = startView else {
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
                           delay: 0.1,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0.3,
                           options: [.curveEaseIn]) {
                startView.transform = CGAffineTransform(scaleX: XscaleIndex, y: YscaleIndex)
                startView.frame = self.originFrame
                startView.alpha = 0
            } completion: { done in
                transitionContext.completeTransition(done)
            }
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let context = storedContext {
          context.completeTransition(!context.transitionWasCancelled)
          //reseet logo
          let fromVC = context.viewController(forKey: .from)
            print("VC",fromVC)
            //удалить анимашку
          fromVC?.view.layer.mask = nil
          let toVC = context.viewController(forKey: .to) as? DetailViewController
          toVC?.view.layer.mask = nil
        }
        //удалить переход
        storedContext = nil
    }
    
}
