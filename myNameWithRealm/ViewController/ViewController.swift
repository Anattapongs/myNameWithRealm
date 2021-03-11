//
//  ViewController.swift
//  myNameWithRealm
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        read()
    }

    func read() {
        let data = realm.objects(FullName.self)
        if data.isEmpty {
            performSegue(withIdentifier: "inputNameViewController", sender: nil)
        }
        
        if let name = data.first?.fullName {
            self.nameLabel.text = "Hello: \(name) 👋"
        }
        
    }
    
    @IBAction func addNameViewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "inputNameViewController", sender: nil)
    }
    
    @IBAction func deleteNameButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive, handler: { _ in
            try! self.realm.write {
                self.realm.deleteAll()
                self.nameLabel.text = "Your name"
            }
        }))
        present(alert, animated: true)
    }
    
    
}

