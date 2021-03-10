//
//  ViewController.swift
//  myNameWithRealm
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        read()
    }

    func read() {
        let data = realm.objects(FullName.self)
        if data.isEmpty {
            performSegue(withIdentifier: "inputNameViewController", sender: nil)
        }
    }
    
    @IBAction func addNameViewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "inputNameViewController", sender: nil)
    }
    
}

