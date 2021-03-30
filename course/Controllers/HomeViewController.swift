//
//  HomeViewController.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    var homeViewModel:HomeViewModel?
    
    @IBOutlet weak var labelEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeViewModel = HomeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let optionalEmail = homeViewModel?.loadingEmail()
        
        if let email = optionalEmail {
            labelEmail.text = email
        }
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
