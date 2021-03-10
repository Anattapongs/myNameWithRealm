//
//  ViewController.swift
//  myNameWithRealm
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addNameViewButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "inputNameViewController", sender: nil)
    }
    
}

