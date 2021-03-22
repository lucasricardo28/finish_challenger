//
//  InitialViewController.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import UIKit

class InitialViewController: UIViewController {
    
    var initialViewModel:InitialViewModel = InitialViewModel()
    
    let showAlert = UIAlertController(title: "Carregando", message: nil, preferredStyle: .alert)
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAlert()
    }
    
    func configureAlert(){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = #imageLiteral(resourceName: "img_primary") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
    }
    
    func verifyEmail(_ emailString:String){
        guard emailString != "" else {
            return
        }
        initialViewModel.requestInitial(emailString);
    }

    @IBAction func validateEmailAction(_ sender: Any) {
        verifyEmail(emailTextField.text!)
    }
}

extension InitialViewController: InitialProtocol{
    func close() {
        showAlert.dismiss(animated: true, completion: nil)
    }
    
    func load() {
        self.present(showAlert, animated: true, completion: nil)
    }
    
    func showMessage(_ message: String, _ isSuccess: Bool) {
        if isSuccess {
            present(showAlert, animated: true, completion: nil)
        }else{
            
        }
    }
}
