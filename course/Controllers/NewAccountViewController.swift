//
//  NewAccountViewController.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import UIKit

class NewAccountViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func buttonNextStepAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "FinishAccountView") as! FinishAccountViewController


        self.show(secondVC, sender: self)
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
