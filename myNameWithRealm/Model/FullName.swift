//
//  FullName.swift
//  myNameWithRealm
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import Foundation
import RealmSwift

class FullName: Object {
    @objc dynamic var fullName = ""
    
    static func create(withName inputName: String) -> FullName {
        let name = FullName()
        name.fullName = inputName
        
        return name
    }
}


