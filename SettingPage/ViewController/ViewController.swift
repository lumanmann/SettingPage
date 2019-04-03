//
//  ViewController.swift
//  SettingPage
//
//  Created by WY NG on 25/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import UIKit

enum EditingType: String {
    case name = "姓名"
    case account = "帳號"
    case password = "密碼"
}

class ViewController: UITableViewController{

    let settingOption : [EditingType] = [.name, .account , .password]
    var user = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "設定"
        
        let nib = UINib(nibName: "OptionTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: "optionCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "foodCell")
        self.tableView.tableFooterView = UIView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.user.printAll()
    }
    
   
    private func configSectiononeOptionCell() -> OptionTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell") as? OptionTableViewCell else {
            return nil
        }
        cell.uiswitch.isOn = self.user.isEditable
        cell.trueStr = "可編輯"
        cell.falseStr = "不可編輯"
        cell.updateUI()
        cell.switchChanged = {
            self.user.isEditable = cell.uiswitch.isOn
            self.tableView.reloadData()
        }
        
        return cell
    }
    

    // MARK: UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1 {
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return user.favouriteFood.count + 1
        }
        
        if section == 0 {
            if user.isEditable {
                return settingOption.count + 1
            }
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, indexPath.row == 0{
            return configSectiononeOptionCell() ?? UITableViewCell()
        }  else if indexPath.section == 0 {
            let cell = super.tableView(tableView, cellForRowAt: indexPath)
            cell.detailTextLabel?.textColor = .blue
            let opt = settingOption[indexPath.row-1]
            cell.textLabel?.text = opt.rawValue
            switch opt {
            case.name:
                cell.detailTextLabel?.text = user.name ?? "無"
            case .account:
                cell.detailTextLabel?.text = user.account ?? "無"
            case.password:
                var str = ""
                if let pw = user.password, pw.count > 0 {
                    for _ in pw {
                        str += "*"
                    }
                    cell.detailTextLabel?.text = str
                } else {
                    cell.detailTextLabel?.text = "尚未設定"
                }
            }
            
            return cell
        }
        
        if indexPath.section == 1, indexPath.row != 0{
            var cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "foodCell")
            }
            cell?.textLabel?.text = user.favouriteFood[indexPath.row-1]
            return cell!
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0, indexPath.row > 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditingViewController") as! EditingViewController
            vc.user = self.user
            vc.type = settingOption[indexPath.row-1]
            self.navigationController?.pushViewController(vc, animated: true)
        } else if  indexPath.section == 1, indexPath.row == 0 {
             let vc = FoodTableViewController()
            vc.user = self.user
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
   
    
    
}

