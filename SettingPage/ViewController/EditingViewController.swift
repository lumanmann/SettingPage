//
//  EditingViewController.swift
//  SettingPage
//
//  Created by WY NG on 25/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import UIKit



class EditingViewController: UIViewController {
    
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var user: UserInfo?
    var type: EditingType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let type = type {
            discriptionLabel.text = "請輸入\(type.rawValue):"
        }
        
    }

    @IBAction func saveClicked(_ sender: UIButton) {
        guard let text = textField.text, text.count > 0 else{
            return
        }
        
        guard let type = self.type else{
            return
        }
        
        switch type {
        case .name:
            user?.name = text
        case .account:
            user?.account = text
        case .password:
            user?.password = text
        }
        
    }
    

}
