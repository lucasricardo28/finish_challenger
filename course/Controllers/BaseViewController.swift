//
//  BaseViewController.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import UIKit

class BaseViewController: UIViewController {

    let loadingAlertController = UIAlertController(title: "Carregando", message: nil, preferredStyle: .alert)
    let showMessageAlert:UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureAlert()
    }
    
    func configureAlert(){
        
        let height = NSLayoutConstraint(item: loadingAlertController.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 270)
        let width = NSLayoutConstraint(item: loadingAlertController.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 270)
        loadingAlertController.view.addConstraint(height)
        loadingAlertController.view.addConstraint(width)
        
        let newView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 50, width: 100, height: 100))
        
        loadingAlertController.view.addSubview(newView)
        
        newView.isHidden = false
        
        newView.color = .red
        newView.layer.cornerRadius = 10
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        showMessageAlert.addAction(ok)
    }
    

    func dismissView(){
        dismiss(animated: true, completion: nil)
    }

}

extension BaseViewController: BaseProtocol{
    func showMessage(_ title: String, _ message: String) {
        DispatchQueue.main.async {
            self.showMessageAlert.title = title
            self.showMessageAlert.message = message
            self.present(self.showMessageAlert, animated: true, completion: nil)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.present(self.loadingAlertController, animated: true, completion: nil)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loadingAlertController.dismiss(animated: true, completion: nil)
        }
    }
}
