//
//  FirstViewController.swift
//  To Do List
//
//  Created by Marvin Sagastume on 10/22/18.
//  Copyright © 2018 Innovaze. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemsTable: UITableView!
    var itemsInList = [String]()
    
    @available(iOS 2.0, *)
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInList.count
    }
    
    @available(iOS 2.0, *)
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = itemsInList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let tempItemsInList = UserDefaults.standard.object(forKey: "itemsInList") {
            self.itemsInList = tempItemsInList as! [String]
            itemsTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tempItemsInList = UserDefaults.standard.object(forKey: "itemsInList")
            var itemsInList = tempItemsInList as! [String]
            itemsInList.remove(at: indexPath.row)
            UserDefaults.standard.set(itemsInList, forKey: "itemsInList")
            self.itemsInList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let tempItemsInList = UserDefaults.standard.object(forKey: "itemsInList") {
            self.itemsInList = tempItemsInList as! [String]
            itemsTable.reloadData()
        }
    }
}
