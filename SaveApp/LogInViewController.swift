//
//  LogInViewController.swift
//  SaveApp
//
//  Created by Aitor Pagán on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var idUser: NSNumber?
    
    let userFacade = UserFacade()

    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func SignIn(sender: UIButton) {
        
        let nickIntroduced : String = NicknameTextField.text!
        let passwordIntroduced : String = PasswordTextField.text!
        idUser = communicationFacade.checkLogin(nickIntroduced, password: passwordIntroduced)
        //print("\n\n\n",idUser.stringValue,"\n\n\n")
    }
    
    let communicationFacade = CommunicationFacade()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        let alert = UIAlertView()
        alert.title = "Error"

        alert.addButtonWithTitle("OK")
        if idUser?.integerValue == -1{
            alert.message = "Invalid Password"
            alert.show()
            return false
        }else if idUser?.integerValue == -2{
            alert.message = "Invalid User"
            alert.show()
            return false
        }else{
            let nickname = NicknameTextField.text
            let password = PasswordTextField.text
            userFacade.saveUser(idUser!, nickname: nickname!, password: password!)
            return true
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "validLoginSegue"{
 
        }
        
    }
    

}
