//
//  ViewController.swift
//  HW2
//
//  Created by Hümeyra Şahin on 21.12.2021.
//

import UIKit


class ViewController: UIViewController, SecondViewControllerDelegate {
// SecondViewControllerDelegate
    
    
    @IBOutlet weak var fullName: UILabel!
    //var senderID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if senderID == "NotificationCenter" {
            NotificationCenter.default.addObserver(self, selector: #selector(showFullname), name: Notification.Name("getFullName"), object: nil)
       // }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSecondVC" {
            if let destination = segue.destination as? SecondViewController {
                //senderID = destination.senderID
                destination.delegate = self
                destination.makeFullname = { name, surname in
                    self.fullName.text = "\(name) \(surname)"
                    
                }
                 
            }
        }
    }
    
    func getFullName(name: String, surname: String) {
        fullName.text = "\(name) \(surname)"
    }
    
    
    @objc func showFullname(notification: Notification){
        
        //will executed if data sent with notificaiton center
        
        guard let name = notification.userInfo?["name"] as? String else {return}
        guard let surname = notification.userInfo?["surname"] as? String else {return}
        fullName.text = "\(name) \(surname)"
       // print("show full name log print")
    }
    
    //deinitilaziton for memory management 
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

