//
//  RegisterViewController.swift
//  giftList
//
//  Created by Raein Teymouri on 10/20/17.
//  Copyright © 2017 Raein Teymouri. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func registerUser(_ sender: UIButton) {
        
        guard let emailText = email.text, let passwordText = password.text
            else {
                print("invalid user and password")
                return
        }
        Firebase.Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user,error ) in
            if (error != nil){
                print(error!)
                return
            }
            self.performSegue(withIdentifier: "LoginAfterRegister", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
