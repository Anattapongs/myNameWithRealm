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
        
        if let name = data.last?.fullName {
            self.nameLabel.text = "Hello: \(name) 👋"
        }
        
    }
    
    @IBAction func addNameViewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "inputNameViewController", sender: nil)
    }
    
}

