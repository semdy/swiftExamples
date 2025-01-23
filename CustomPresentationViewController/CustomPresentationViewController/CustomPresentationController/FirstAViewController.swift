//
//  FirstAViewController.swift
//  CustomPresentationViewController
//
//  Created by Chu Guimin on 16/9/8.
//  Copyright © 2016年 Chu Guimin. All rights reserved.
//

import UIKit

class FirstAViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    
    let greetings = ["hello swift", "hello world", "hello oc", "hello ios"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPadding(textField: usernameTextField)
        setPadding(textField: passwordTextField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signButtonPressed(_ sender: UIButton) {
        let uname =  (usernameTextField.text ?? "") as String
        let pwd =  (passwordTextField.text ?? "") as String
        print(uname, pwd)
    }
    
    @IBAction func randomButtonPresssed(_ sender: UIButton) {
        let rnd = Int.random(in: 0...(greetings.count - 1))
        displayLabel.text = greetings[rnd]
    }
    
    func setPadding(textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
