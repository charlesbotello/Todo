//
//  ViewController.swift
//  Todo
//
//  Created by Charlie Botello on 4/5/21.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemsArray = ["Revise Truck Club items", "Get Protein", "Get milk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = itemsArray[indexPath.row]
        
        return cell
    }

}

