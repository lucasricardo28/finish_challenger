//
//  PasswordViewController.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import UIKit

class FinishAccountViewController: BaseViewController {

    @IBOutlet weak var labelEmail: UILabel!
    
    var userEmail:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelEmail.text = userEmail
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
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
