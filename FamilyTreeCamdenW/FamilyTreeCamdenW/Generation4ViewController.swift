//
//  Generation4ViewController.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/17/24.
//

import UIKit

class Generation4TableViewController: UITableViewController {
    let parentOfChild: Person
    // Array to hold the children of the person who is selected, filtered from the array of all family members
    var currentGeneration = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentGeneration = findChildren(for: parentOfChild)
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

