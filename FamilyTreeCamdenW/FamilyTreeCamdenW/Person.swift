//
//  Person.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/16/24.
//

import UIKit

struct Person {
    let id: Int
    let firstName: String
    let lastName: String
    let spouseID: Int
    let bloodRelative: Bool
    let birthDate: Date
    let parentID: Int
    let childrenIDs: [Int]
    let maidenName: String?
    
    var image: UIImage {
        return UIImage(systemName: "\(firstName.first?.lowercased() ?? "a").square.fill")!
    }
}
