//
//  Generation3TableViewController.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/15/24.
//

import UIKit

class Generation3TableViewController: UITableViewController {
    let parentOfChild: Person
    // Array to hold the children of the person who is selected, filtered from the array of all family members
    var currentGeneration = [Person]()
    
    @IBSegueAction func ShowGeneration4(_ coder: NSCoder) -> Generation4TableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Nothing seleted!")}
        let parentOfChild = currentGeneration[indexPath.row]
        return Generation4TableViewController(coder: coder, parentOfChild: parentOfChild)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for childID in parentOfChild.childrenIDs {
            guard let matchingChild = Family.familyMembers.first(where: { $0.id == childID }) else {
                return
            }
            print("Adding person ID \(childID) to currentGeneration")
            print("Matching children: \(matchingChild)")
            currentGeneration.append(matchingChild)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("This should never be called!") }
    init?(coder: NSCoder, parentOfChild: Person) {
        self.parentOfChild = parentOfChild
        super.init(coder: coder)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Adding \(currentGeneration.count) rows to view")
        return currentGeneration.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomNameCell.self)", for: indexPath) as? CustomNameCell
            else { fatalError("Could not create custom name cell") }

        // Set up the name label string
        cell.nameLabel?.text = "\(currentGeneration[indexPath.row].firstName) \(currentGeneration[indexPath.row].lastName)"
        
        // Set up the spouse label string
        cell.spouse.text = findSpouseName(currentGeneration[indexPath.row])
        
        // Set up birthdate string
        cell.birthDate.text = "Born: \(formatBirthDate(currentGeneration[indexPath.row].birthDate))"
        cell.thumbnail.image = currentGeneration[indexPath.row].image
        return cell
    }
    
    // Set titles for section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Children of \(parentOfChild.firstName) \(parentOfChild.lastName)"
    }

}
