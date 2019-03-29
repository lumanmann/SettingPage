//
//  ViewController.swift
//  SettingPage
//
//  Created by WY NG on 25/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.user.printAll()
    }

}

