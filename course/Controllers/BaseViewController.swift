//
//  BaseViewController.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import UIKit

class BaseViewController: UIViewController {

    let showAlert = UIAlertController(title: "Carregando", message: nil, preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

    func dismissView(){
        dismiss(animated: true, completion: nil)
    }

}

extension BaseViewController: BaseProtocol{
    func showLoading() {
        DispatchQueue.main.async {
            self.present(self.showAlert, animated: true, completion: nil)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.showAlert.dismiss(animated: true, completion: nil)
        }
    }
}
