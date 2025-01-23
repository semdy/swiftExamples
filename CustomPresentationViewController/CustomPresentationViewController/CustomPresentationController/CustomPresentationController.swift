//
//  CustomPresentationController.swift
//  CustomPresentationViewController
//
//  Created by Chu Guimin on 16/9/8.
//  Copyright © 2016年 Chu Guimin. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {

    override func presentationTransitionWillBegin() {
        print("willBegin")
        
        
        
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (context) in
            
            
            }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        print("didEnd")
    }
    
    override func dismissalTransitionWillBegin() {
        
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        
    }
}
