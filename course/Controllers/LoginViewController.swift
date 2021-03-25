//
//  LoginViewController.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var loginViewModel:LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginViewModel = LoginViewModel()
        loginViewModel?.delegate = self
        
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func buttonLoginAction(_ sender: Any) {
        loginViewModel?.requestLogin(textFieldEmail.text!, textFieldPassword.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
