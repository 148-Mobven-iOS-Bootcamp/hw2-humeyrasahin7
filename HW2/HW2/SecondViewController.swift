//
//  SecondViewController.swift
//  HW2
//
//  Created by Hümeyra Şahin on 21.12.2021.
//

import UIKit


protocol SecondViewControllerDelegate: AnyObject {
    func getFullName(name: String, surname: String)
}


/*enum Button: UIButton{
    typealias RawValue = UIButton.
    
    case sendButton
    case sendWithDelegate
    case sendWithClosure
}
*/

class SecondViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    
    //var senderID = ""
    
   weak var delegate: SecondViewControllerDelegate?
    
   var makeFullname: ((_ name: String, _ surname: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //senderID = ""
        
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if let nameText = nameText.text, let surnameText = surnameText.text {
            NotificationCenter.default.post(
                        name: Notification.Name(rawValue: "getFullName"),
                        object: nil,
                        userInfo: ["name": nameText,
                                   "surname": surnameText]
                    )
            
            dismiss(animated: true)
            //senderID = "NotificationCenter"
            //print(senderID)
        }
        
    }
    
    @IBAction func sendWithDelegate(_ sender: Any) {
        if let nameText = nameText.text, let surnameText = surnameText.text{
            delegate?.getFullName(name: nameText, surname: surnameText)
            //senderID = "Delegate"
            dismiss(animated: true)
            //print(senderID)
        }
    }
    
    @IBAction func sendWithClosure(_ sender: Any) {
        if let nameText = nameText.text, let surnameText = surnameText.text, let makeFullname = makeFullname{
            makeFullname(nameText, surnameText)
            //senderID = "Closure"
            dismiss(animated: true)
            //print(senderID)
        }
    }
    
    
}
