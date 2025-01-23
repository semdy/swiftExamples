//
//  FirstBViewController.swift
//  CustomPresentationViewController
//
//  Created by Chu Guimin on 16/9/8.
//  Copyright © 2016年 Chu Guimin. All rights reserved.
//

import UIKit

class FirstBViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setDelegate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setDelegate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDelegate() {
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissAction(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

extension FirstBViewController: UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningAnimator()
    }
}

class TransitioningAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toViewController = transitionContext.viewController(forKey: .to), // 修复了 key
            let toView = transitionContext.view(forKey: .to) // 修复了 key
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        // 获取最终的 frame
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        // 设置目标视图的初始位置
        toView.frame.origin.x = finalFrame.width
        containerView.addSubview(toView)
        
        // 动画设置
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.frame.origin.x = 0
        }) { completed in
            // 完成动画后通知 transitionContext 完成
            transitionContext.completeTransition(completed)
        }
    }
}

