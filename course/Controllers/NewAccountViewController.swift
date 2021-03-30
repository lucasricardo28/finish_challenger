//
//  NewAccountViewController.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import UIKit

class NewAccountViewController: BaseViewController, NewAccountProtocol {
    
    // MARK: - VIEW MODEL
    var newAccountViewModel:NewAccountViewModel?
    
    // MARK: - OUTLET
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    // MARK: - PROTOCOL
    func showNextStep() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "sgNewAccountToFinishAccount", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        newAccountViewModel = NewAccountViewModel()
        newAccountViewModel?.baseProtocolDelegate = self
        newAccountViewModel?.newAccountProtocolDelegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgNewAccountToFinishAccount" {
            if let finishSegue = segue.destination as? FinishAccountViewController {
                finishSegue.user = User(id: nil, name: textFieldName.text!, surname: textFieldSurname.text!, email: textFieldEmail.text!)
            }
        }
    }
    
    // MARK: - ACTION
    @IBAction func buttonBackAction(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func buttonNextStepAction(_ sender: Any) {
        newAccountViewModel?.sendNextStep(textFieldName.text!, textFieldSurname.text!, textFieldEmail.text!)
    }

}
