//
//  OptionTableViewCell.swift
//  SettingPage
//
//  Created by WY NG on 25/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var uiswitch: UISwitch!
    var switchChanged: (()->Void)?
    var trueStr: String?
    var falseStr: String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        self.uiswitch.isOn = !self.uiswitch.isOn
        updateUI()
        if let action = switchChanged {
            action()
        }
        
    }
    
    func updateUI() {
        guard let uiswitch = uiswitch else {
            print("cannot find uiswitch")
            return
        }
        switch uiswitch.isOn {
        case true:
            title.text = trueStr
        default:
            title.text = falseStr
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
