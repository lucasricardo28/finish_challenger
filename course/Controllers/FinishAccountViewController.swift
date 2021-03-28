//
//  PasswordViewController.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import UIKit

class FinishAccountViewController: BaseViewController , FinishAccountProtocol {
    
    // MARK: - PROTOCOL
    func sendHomeView() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            nextViewController.modalPresentationStyle = .fullScreen

            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - VIEW MODEL
    var finishAccountViewModel:FinishAccountViewModel?
    
    // MARK: - OUTLET
    @IBOutlet weak var textFiedPassword: UITextField!
    @IBOutlet weak var textFieldAConfirmPassword: UITextField!
    
    // MARK: - VARS
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishAccountViewModel = FinishAccountViewModel()
    }
    
    // MARK: - ACTION
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func buttonSaveAction(_ sender: Any) {
        guard let currentUser = user else {
            showMessage("Error", ValidateMessage.invalidUserObject.rawValue)
            return
        }
        
        finishAccountViewModel?.createNewUser(currentUser, textFieldAConfirmPassword.text!)
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
