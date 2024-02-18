/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

// MARK:- Reusable SFSymbol Images
//enum FamilySymbols {
//  case bookmark
//  case bookmarkFill
//  case book
//  case letterSquare(letter: Character?)
//  
//  var image: UIImage {
//    let imageName: String
//    switch self {
//    case .bookmark, .book:
//      imageName = "\(self)"
//    case .bookmarkFill:
//      imageName = "bookmark.fill"
//    case .letterSquare(let letter):
//      guard let letter = letter?.lowercased(),
//      let image = UIImage(systemName: "\(letter).square")
//        else {
//          imageName = "square"
//          break
//      }
//      return image
//    }
//    return UIImage(systemName: imageName)!
//  }
//}

// MARK:- Library
enum Family {
    static let familyMembers: [Person] = [
        Person(id: 1, firstName: "John", lastName: "Smith", spouseID: 2, bloodRelative: true, birthDate: Date(timeIntervalSince1970: -2835940370), parentID: 0, childrenIDs: [3, 4], maidenName: "none"),
        Person(id: 2, firstName: "Jane", lastName: "Smith", spouseID: 1, bloodRelative: false, birthDate: .now, parentID: 0, childrenIDs: [3, 4], maidenName: "Johnson"),
        Person(id: 3, firstName: "Bob", lastName: "Smith", spouseID: 5, bloodRelative: true, birthDate: .now, parentID: 1, childrenIDs: [7, 10], maidenName: nil),
        Person(id: 5, firstName: "Sally", lastName: "Smith", spouseID: 3, bloodRelative: false, birthDate: .now, parentID: 0, childrenIDs: [7, 10], maidenName: "Thompson"),
        Person(id: 4, firstName: "Jill", lastName: "Anderson", spouseID: 6, bloodRelative: true, birthDate: .now, parentID: 3, childrenIDs: [], maidenName: "Smith"),
        Person(id: 6, firstName: "Jim", lastName: "Anderson", spouseID: 4, bloodRelative: false, birthDate: .now, parentID: 0, childrenIDs: [], maidenName: nil),
        Person(id: 7, firstName: "Bill", lastName: "Smith", spouseID: 8, bloodRelative: true, birthDate: .now, parentID: 4, childrenIDs: [9], maidenName: nil),
        Person(id: 8, firstName: "Judy", lastName: "Smith", spouseID: 7, bloodRelative: false, birthDate: .now, parentID: 0, childrenIDs: [9], maidenName: "Jackson"),
        Person(id: 9, firstName: "Tom", lastName: "Smith", spouseID: 0, bloodRelative: true, birthDate: .now, parentID: 4, childrenIDs: [0], maidenName: nil),
        Person(id: 10, firstName: "Nancy", lastName: "Smith", spouseID: 0, bloodRelative: true, birthDate: .now, parentID: 4, childrenIDs: [], maidenName: nil)
    ]
    

}

func formatBirthDate(_ birthDate: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: birthDate)
}

func findSpouseName(_ familyMember: Person) -> String {
    var spouseString: String
    if familyMember.spouseID != 0 {
        // Find this family member's spouse by filtering through the family
        guard let matchingSpouse = Family.familyMembers.first(where: { $0.id == familyMember.spouseID }) else {
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
    
//  
//  static func saveImage(_ image: UIImage, forPerson person: Person) {
//      let imageURL = FileManager.documentDirectoryURL.appendingPathComponent("-\(person.id)")
//      if let jpgData = image.jpegData(compressionQuality: 0.7) {
//        try? jpgData.write(to: imageURL, options: .atomicWrite)
//      }
//    }
//    
//    static func loadImage(forPerson person: Person) -> UIImage? {
//      let imageURL = FileManager.documentDirectoryURL.appendingPathComponent("-\(person.id)")
//      return UIImage(contentsOfFile: imageURL.path)
//    }
//  }
//
//
//  extension FileManager {
//    static var documentDirectoryURL: URL {
//      return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
//    }
//  }

