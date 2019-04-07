//
//  FoodTableViewController.swift
//  SettingPage
//
//  Created by WY NG on 29/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import UIKit
var foods = ["柑", "蘋果", "葡萄", "香蕉", "楊桃", "梨", "鳳梨", "文旦", "西瓜"]

class FoodTableViewController: UITableViewController {
    var user: UserInfo?
    
    var foodTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFood))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    @objc func addFood(_ sender: UIBarButtonItem) {
        print("add food")
        let alert = UIAlertController(title: "新增食物", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            self.foodTextField = textField
            self.foodTextField.placeholder = "請輸入食物的名字"
        }
        
        let confirmAction = UIAlertAction(title: "確定", style: .default) { (_) in
            if let food = self.foodTextField.text, food.count > 0 {
                foods.append(food)
                
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath(row: foods.count-1, section: 0)], with: .fade)
                self.tableView.endUpdates()
                
            } else {
                print("input error")
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        cell?.textLabel?.text = foods[indexPath.row]
        
        if let checkedFood = user?.favouriteFood {
            if checkedFood.contains(foods[indexPath.row]) {
                cell?.accessoryType = .checkmark
            } else {
                cell?.accessoryType = .none
            }
        }

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let checkedFood = self.user?.favouriteFood else {
            return
        }
        let cell = tableView.cellForRow(at: indexPath)
        let food = foods[indexPath.row]
        if checkedFood.contains(food) {
            cell!.accessoryType = .none
            user?.removeFood(food)
        } else {
            user?.favouriteFood.append(food)
            cell!.accessoryType = .checkmark
        }
        
        
    }
   
    /* EXTRAS
     
     https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614966-tableview
     -> Returns the depth of the specified row to show its hierarchical position in the section.
     
     https://stackoverflow.com/questions/45379230/why-it-needs-tableview-indentationlevelforrowat-when-inserting-cell-into-a-t
     “when you override the data source for a static table view cell, you also need to provide the delegate method tableView(_:indentationLevelForRowAt:)”
     “the standard data source doesn’t know anything about the cell at row 2 in section 1 (the one with the date picker), because that cell isn’t part of the table view’s design in the storyboard.”
     當覆蓋了靜態的cell數據源方法時需要提供一個代理方法。
     因為數據源對新加進來的cell一無所知，所以要使用這個代理方法
     
     */
    
}
