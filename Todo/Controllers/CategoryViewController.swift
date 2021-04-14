//
//  CategoryViewController.swift
//  Todo
//
//  Created by Charlie Botello on 4/13/21.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategories()
        
    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categoryArray[indexPath.row]
        
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: Constant.categoryCell, for: indexPath)
        
        categoryCell.textLabel?.text = category.name
        
        return categoryCell
    }
    
    //MARK: - Data Manipulation Methods
    // Save data and load data CRUD
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            
            if !(textField.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
                newCategory.name = textField.text
                self.categoryArray.append(newCategory)

                self.saveCategories()
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
    
    func saveCategories() {
        
        do {
            try self.context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
//        var requestCategory: NSFetchRequest<Category>
//        requestCategory = Category.fetchRequest()
        do {
            categoryArray = try self.context.fetch(request)
        } catch {
            print("error fetching data from context \(error)")
        }
        self.tableView.reloadData()
    }
    
    //MARK: - TableView Delegate Methods
    // Leave alone what would happen if cell pressed
    

}
