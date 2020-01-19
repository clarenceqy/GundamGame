//
//  DrawResultVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

class DrawResultVC: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    @IBOutlet weak var returnBtn: UIButton!
    
    var resultnamelist: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        returnBtn.setTitle(NSLocalizedString("str_returntogarage", comment: ""), for: .normal)

        let topColor = #colorLiteral(red: 0.1658218124, green: 0.1428644858, blue: 0.5535176079, alpha: 1)
        let buttomColor = #colorLiteral(red: 0.1958577205, green: 0.07502472192, blue: 0.2716925761, alpha: 1)
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        if let resultname = resultnamelist{
            image1.image = UIImage(named: resultname[0])
            image2.image = UIImage(named: resultname[1])
            image3.image = UIImage(named: resultname[2])
            image4.image = UIImage(named: resultname[3])
            image5.image = UIImage(named: resultname[4])
            image6.image = UIImage(named: resultname[5])
            image7.image = UIImage(named: resultname[6])
            image8.image = UIImage(named: resultname[7])
            image9.image = UIImage(named: resultname[8])
            image10.image = UIImage(named:resultname[9])
        }
        
        image1.alpha = 0
        image2.alpha = 0
        image3.alpha = 0
        image4.alpha = 0
        image5.alpha = 0
        image6.alpha = 0
        image7.alpha = 0
        image8.alpha = 0
        image9.alpha = 0
        image10.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
        UIView.animate(withDuration: 1.0,animations: {
            self.image1.alpha = 1.0
            self.image2.alpha = 1.0
            self.image3.alpha = 1.0
        }
            , completion: {(finished:Bool) in
                UIView.animate(withDuration: 1.0, animations: {
                    self.image4.alpha = 1.0
                    self.image5.alpha = 1.0
                    self.image6.alpha = 1.0
                }, completion: {(finished:Bool) in
                    UIView.animate(withDuration: 1.0, animations: {
                        self.image7.alpha = 1.0
                        self.image8.alpha = 1.0
                        self.image9.alpha = 1.0
                        self.image10.alpha = 1.0
                    }, completion: nil)
                })
        })
        
        
    }
    

}
