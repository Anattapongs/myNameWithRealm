//
//  inputNameViewController.swift
//  myNameWithRealm
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import UIKit
import RealmSwift

class inputNameViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func write(name: String) {
        let name = FullName.create(withName: name)
        try! realm.write {
            realm.add(name)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if nameTextField.text?.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "Please enter name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if let name = nameTextField.text {
                write(name: name)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
