//
//  ViewController.swift
//  Todo
//
//  Created by Charlie Botello on 4/5/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item()]
//    var itemsArray = [
//        Item(title: "Revise Trunk Club Items"),
//        Item(title: "Get Protein"),
//        Item(title: "Get Protein"),
//        Item(title: "Get Milk")
//    ]
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newItem = Item()
        newItem.title = "Revise Truck Club items"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Save the Whales"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Pickup egss"
        itemArray.append(newItem3)
        
        
        
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//           itemsArray = items
//        }
        
//        if let items = defaults.object(forKey: "Item") as? [Item] {
//            itemsArray = items
//        }
        
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = item.title
        
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Configure the cell...
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // replaces
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on out UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()

            
        }
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField

            
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

