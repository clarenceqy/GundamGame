//
//  GarageCell.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

class GarageCell: UITableViewCell {
    @IBOutlet weak var gundamimage: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var costlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let topColor = #colorLiteral(red: 0.1658218124, green: 0.1428644858, blue: 0.5535176079, alpha: 1)
//        let buttomColor = #colorLiteral(red: 0.1958577205, green: 0.07502472192, blue: 0.2716925761, alpha: 1)
//        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
//        let gradientLocations:[NSNumber] = [0.0, 1.0]
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = gradientColors
//        gradientLayer.locations = gradientLocations
//        if let theframe = self.backgroundView?.frame{
//            gradientLayer.frame = theframe
//        }
//        
//        self.layer.insertSublayer(gradientLayer, at: 0)
        let defaults = UserDefaults.standard
        let emblem = defaults.object(forKey: "LaunchScreen") as! String
        if emblem == "EF"{
            self.backgroundColor = #colorLiteral(red: 0.1265517979, green: 0.4784313725, blue: 1, alpha: 1)
        }
        if emblem == "ZN"{
            self.backgroundColor = #colorLiteral(red: 1, green: 0.08404085115, blue: 0, alpha: 1)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
