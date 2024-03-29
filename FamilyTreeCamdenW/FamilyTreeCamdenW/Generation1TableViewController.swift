//
//  Generation1TableViewController.swift
//  FamilyTreeCamdenW
//
//  Created by Camden Webster on 2/14/24.
//

import UIKit

class Generation1TableViewController: UITableViewController {

    var family = [Person]()
    let greatGrandParent = Family.familyMembers[0]
    var currentGeneration = [Person]()
    
    @IBSegueAction func ShowGeneration2(_ coder: NSCoder) -> Generation2TableViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Nothing seleted!")}
        let parentOfChild = currentGeneration[indexPath.row]
        return Generation2TableViewController(coder: coder, parentOfChild: parentOfChild)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentGeneration.append(greatGrandParent)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomNameCell.self)", for: indexPath) as? CustomNameCell
        else { fatalError("Could not create custom name cell")}
        
        // Set up the name label string
        let fullName = "\(currentGeneration[indexPath.row].firstName) \(currentGeneration[indexPath.row].lastName)"
        cell.nameLabel?.text = fullName
        
        // Set up the spouse label string
        cell.spouse.text = findSpouseName(currentGeneration[indexPath.row])
        
        // Set up birthdate string
        cell.birthDate.text = "Born: \(formatBirthDate(currentGeneration[indexPath.row].birthDate))"
        cell.thumbnail.image = currentGeneration[indexPath.row].image
        return cell
    }
    
    // Set titles for section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Great Grandparents"
    }

}
