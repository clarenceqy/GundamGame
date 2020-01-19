//
//  TabBarVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let vcarray = self.viewControllers{
            vcarray[0].title = NSLocalizedString("str_garage", comment: "")
            vcarray[1].title = NSLocalizedString("str_draw", comment: "")
            vcarray[2].title = NSLocalizedString("str_setting", comment: "")
        }
        
        let defaults = UserDefaults.standard
        let initialswitch = defaults.object(forKey: "Music") as! Bool
        if initialswitch == true{
            MusicPlayer.shared.startBackgroundMusic()
        }
       
    }
    

    

}
