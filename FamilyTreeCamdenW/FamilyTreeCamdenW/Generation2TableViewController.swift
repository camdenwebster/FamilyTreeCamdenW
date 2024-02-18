//
//  Generation2TableViewController.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/15/24.
//

import UIKit

class Generation2TableViewController: UITableViewController {
    let parentOfChild: Person
    // Array to hold the children of the person who is selected, filtered from the array of all family members
    var currentGeneration = [Person]()
    
    @IBSegueAction func ShowGeneration3(_ coder: NSCoder) -> Generation3TableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Nothing seleted!")}
        let parentOfChild = currentGeneration[indexPath.row]
        return Generation3TableViewController(coder: coder, parentOfChild: parentOfChild)
    }

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
