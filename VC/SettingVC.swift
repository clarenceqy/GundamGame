//
//  SettingVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var VolumeLabel: UILabel!
    @IBOutlet weak var BGMswitchLabel: UILabel!
    @IBOutlet weak var LauchScreenLabel: UILabel!
    @IBOutlet weak var visitBtn: UIButton!
    @IBOutlet weak var volumeslider: UISlider!
    @IBOutlet weak var musicswitch: UISwitch!
    @IBOutlet weak var segcontrol: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        let topColor = #colorLiteral(red: 0.1658218124, green: 0.1428644858, blue: 0.5535176079, alpha: 1)
        let buttomColor = #colorLiteral(red: 0.1958577205, green: 0.07502472192, blue: 0.2716925761, alpha: 1)
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        VolumeLabel.text = NSLocalizedString("str_volume", comment: "")
        BGMswitchLabel.text = NSLocalizedString("str_musicswitch", comment: "")
        LauchScreenLabel.text = NSLocalizedString("str_launchoptions", comment: "")
        visitBtn.setTitle(NSLocalizedString("str_vistoursite", comment: ""), for: .normal)
        
        let defaults = UserDefaults.standard
        let initialvolume = defaults.object(forKey: "Volume") as! Float
        let initialswitch = defaults.object(forKey: "Music") as! Bool
        
        volumeslider.value = initialvolume
        if initialswitch == true{
            musicswitch.isOn = true
        }
        if initialswitch == false{
            musicswitch.isOn = false
        }
        
        segcontrol.setTitle(NSLocalizedString("str_EF", comment: ""), forSegmentAt: 0)
        segcontrol.setTitle(NSLocalizedString("str_ZN", comment: ""), forSegmentAt: 1)
    }
    
    @IBAction func VolumeChanged(_ sender: UISlider) {
        MusicPlayer.shared.changeVolume(volume: sender.value)
        let defaults = UserDefaults.standard
        defaults.set(sender.value, forKey: "Volume")
    }
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        if sender.isOn == false{
            MusicPlayer.shared.stopMusic()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "Music")
        }
        else{
            MusicAlert(title: NSLocalizedString("str_Mind", comment: "")){
                _ in
                MusicPlayer.shared.startBackgroundMusic()
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "Music")
            }
            
        }
    }
    
    @IBAction func onSelectionChanged(_ sender: UISegmentedControl) {
        let index = segcontrol.selectedSegmentIndex
        if index == 0{
            let defaults = UserDefaults.standard
            defaults.set("EF", forKey: "LaunchScreen")
        }
        else{
            let defaults = UserDefaults.standard
            defaults.set("ZN", forKey: "LaunchScreen")
        }
        
    }
    
    
    
    
    func MusicAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = NSLocalizedString("str_checkMusic",comment: "")
        let alert = UIAlertController(title: NSLocalizedString("str_Mind",comment: ""), message: alertMsg, preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: NSLocalizedString("str_Confirm",comment: ""), style: .default, handler: completion)
        
        alert.addAction(confirmAction)
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
}
