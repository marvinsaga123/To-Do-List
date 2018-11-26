//
//  SecondViewController.swift
//  To Do List
//
//  Created by Marvin Sagastume on 10/22/18.
//  Copyright © 2018 Innovaze. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newItemName: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func addNewItem(_ sender: Any) {
        
        let itemName = newItemName.text!
        
        if (itemName == "") {
            
            statusLabel.text = "Cannot add item with no name to to-do list! Please try again!"
            return
            
        } else if let tempItemsInList = UserDefaults.standard.object(forKey: "itemsInList") {
            
            var itemsInList = tempItemsInList as! [String]
            
            // check if the to-do list already contains the item currently in question to be added
            if (itemsInList.contains(itemName)) {
                statusLabel.text = "Cannot add duplicate item to to-do list! Please try again!"
                return
            }
            
            itemsInList.append(itemName)
            UserDefaults.standard.set(itemsInList, forKey: "itemsInList")
            
        } else {
            
            let itemsInList = [itemName]
            UserDefaults.standard.set(itemsInList, forKey: "itemsInList")
            
        }
        
        newItemName.text = ""
        statusLabel.text = "Successfully added \"" + itemName + "\" to your to-do list!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewItem(newItemName)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        statusLabel.text = ""
    }
}
