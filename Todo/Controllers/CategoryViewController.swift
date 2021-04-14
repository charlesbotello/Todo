//
//  CategoryViewController.swift
//  Todo
//
//  Created by Charlie Botello on 4/13/21.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray: [String] = ["Chores", "Work"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categoryArray[indexPath.row]
        
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: Constant.categoryCell, for: indexPath)
        
        categoryCell.textLabel?.text = category
        
        return categoryCell
    }
    
    //MARK: - Data Manipulation Methods
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            if let newCategory = textField.text {
                self.categoryArray.append(newCategory)
                print(self.categoryArray)
                self.tableView.reloadData()
            }
            
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new category"
            textField = alertTextfield
            print(textField)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView Datasource Methods
    
    //MARK: - TableView Delegate Methods
    
    //MARK: - Data Manipulation Methods
}
