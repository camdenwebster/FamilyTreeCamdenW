//
//  Family.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/14/24.
//
import UIKit

// MARK: Family
enum Family {
    static let familyMembers: [Person] = [
        Person(id: 1, firstName: "John", lastName: "Smith", spouseID: 2, birthDate: Date(timeIntervalSince1970: -2835940370), parentIDs: [0], maidenName: "none"),
        Person(id: 2, firstName: "Jane", lastName: "Smith", spouseID: 1, birthDate: Date(timeIntervalSince1970: -2678087570), parentIDs: [0], maidenName: "Johnson"),
        Person(id: 3, firstName: "Bob", lastName: "Smith", spouseID: 5, birthDate: Date(timeIntervalSince1970: -1573722770), parentIDs: [1, 2], maidenName: nil),
        Person(id: 5, firstName: "Sally", lastName: "Smith", spouseID: 3, birthDate: Date(timeIntervalSince1970: -1479028370), parentIDs: [0], maidenName: "Thompson"),
        Person(id: 4, firstName: "Jill", lastName: "Anderson", spouseID: 6, birthDate: Date(timeIntervalSince1970: -1415869970), parentIDs: [1, 2], maidenName: "Smith"),
        Person(id: 6, firstName: "Jim", lastName: "Anderson", spouseID: 4, birthDate: Date(timeIntervalSince1970: -374490770), parentIDs: [0], maidenName: nil),
        Person(id: 7, firstName: "Bill", lastName: "Smith", spouseID: 8, birthDate: Date(timeIntervalSince1970: -319733230), parentIDs: [4, 6], maidenName: nil),
        Person(id: 8, firstName: "Judy", lastName: "Smith", spouseID: 7, birthDate: Date(timeIntervalSince1970: 225125230), parentIDs: [0], maidenName: "Jackson"),
        Person(id: 9, firstName: "Tom", lastName: "Smith", spouseID: nil, birthDate: Date(timeIntervalSince1970: 631152000), parentIDs: [7, 8], maidenName: nil),
        Person(id: 10, firstName: "Nancy", lastName: "Smith", spouseID: nil, birthDate: Date(timeIntervalSince1970: -469185170), parentIDs: [4, 6], maidenName: nil),
        Person(id: 11, firstName: "Jim", lastName: "Smith", spouseID: nil, birthDate: Date(timeIntervalSince1970: -626951570), parentIDs: [3, 5], maidenName: nil)
    ]
}

// MARK: Helper methods
func formatBirthDate(_ birthDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: birthDate)
}

func findChildren(for familyMember: Person) -> [Person] {
    var matchingChildren = [Person]()
    // Loop through list of family members
    for person in Family.familyMembers {
        // Loop through the parentIDs array for each family member
        for id in person.parentIDs {
            // Try to match the parent ID of the given person to the family member passed in the argument above
            // If a match is found, we know that's a child of the parent passed in the argument and we can add it to the matching children array
            if id == familyMember.id {
                print("Matching child: \(person.id)")
                matchingChildren.append(person)
            }
        }
    }
    return matchingChildren
}

func findSpouseName(_ familyMember: Person) -> String {
    var spouseString: String
    if let spouseID = familyMember.spouseID {
        // Find this family member's spouse by filtering through the family
        guard let matchingSpouse = Family.familyMembers.first(where: { $0.id == spouseID }) else {
            fatalError("Could not find spouse")
        }
        print("Matching spouse: \(matchingSpouse.id)")
        spouseString = "Married: \(matchingSpouse.firstName) \(matchingSpouse.lastName)"
        // Append maiden name, if there is one
        if let maidenName = matchingSpouse.maidenName {
            spouseString.append(" (\(maidenName))")
        }
    } else {
        spouseString = "Not married"
    }
    return spouseString
}
