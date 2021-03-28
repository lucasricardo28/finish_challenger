//
//  LoginViewController.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import UIKit

class LoginViewController: BaseViewController , LoginProtocol{
    
    // MARK: - PROTOCOL
    func showLogin() {
        showNextViewController()
    }
    
    // MARK: - OUTLET
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    // MARK: - VIEW MODEL
    var loginViewModel:LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginViewModel = LoginViewModel()
        loginViewModel?.baseProtocolDelegate = self
        loginViewModel?.loginProtocolDelegate = self
        
        textFieldEmail.text = "alan@iosi726.com.br"
        textFieldPassword.text = "iosi2020"
    }
    
    // MARK: - ACTION
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func buttonLoginAction(_ sender: Any) {
        loginViewModel?.requestLogin(textFieldEmail.text!, textFieldPassword.text!)
    }
    
    // MARK: - FUNCTION
    func showNextViewController(){
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            nextViewController.modalPresentationStyle = .fullScreen

            self.present(nextViewController, animated: true, completion: nil)
        }
    }

}
