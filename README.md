# Family Tree
This project served as a learning exercise for UITableViewController in UIKit.

## Ingredients
* `Person` struct
	* Attributes:
		* `id` (Int)
		* `firstName` (String)
		* `lastName` (String)
		* `spouseID` (Optional Int)
		* `birthDate` (Date)
		* `parentIDs` (Array of Ints)
		* `maidenName` (Optional String)
		* `image` (UIImage)
* `Family` Enum
	* Contains
		* `familyMembers` array, containing the Person objects to make up the family
		* `formatBirthDate`: helper method to return a date string based on the Date property in the given Person object
		* `findChildren`: helper method to return an array of Person objects who would be the children matching the given Person
		* `findSpouseName`: helper method to return the name of the spouse of a given Person object
* `currentGeneration`
	* Array which will hold the members of the family to be displayed on the screen
* `greatGrandparent`
	* `Person` constant which will be the first level of the tree
* TableViewController for each of the 4 generations
* NavigationController embedded in first view controller

## Directions
1. Set up TableVeiwControllers for each of the 4 generations
	1. First generation will have a navigation controller embedded within it
2. Create a segue for the prototype cell on each table view controller to link it to the next view
3. Create a custom prototype cell to allow for additional data like the spouse name and birth date to be displayed in the cell
4. When a cell is tapped, display the children of that person on the next screen
