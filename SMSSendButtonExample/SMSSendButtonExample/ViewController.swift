//
//  ViewController.swift
//  SMSSendButtonExample
//
//  Created by ChuGuimin on 16/1/23.
//  Copyright © 2016年 cgm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sendButton: UIButton!
    
    var countdownTimer: Timer?
    
    var remainingSeconds: Int = 0 {
        didSet {
            sendButton.setTitle("验证码已发送(\(remainingSeconds)秒后重新获取)", for: .normal)
            
            if remainingSeconds <= 0 {
                sendButton.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
//                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime(_:)), userInfo: nil, repeats: true)
                
                countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                    self?.updateTime(timer)
                }
                
                remainingSeconds = 5
                
                sendButton.backgroundColor = UIColor.gray
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
                sendButton.backgroundColor = UIColor.red
            }
            
            sendButton.isEnabled = !newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        sendButton = UIButton()
        sendButton.frame = CGRect(x: 40, y: 100, width: view.bounds.width - 80, height: 40)
        sendButton.backgroundColor = UIColor.red
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.setTitle("获取验证码", for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonClick(_:)), for: .touchUpInside)
        
        self.view.addSubview(sendButton)
    }
    
    @objc func sendButtonClick(_ sender: UIButton) {
        isCounting = true
    }
    
    @objc func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
    }

    deinit {
        countdownTimer?.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

