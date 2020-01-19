//
//  GachaVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/28/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

protocol GachaVCDelegate: class {
    func addedGundam()
}

class GachaVC: UIViewController {
    
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var Draw10Button: UIButton!
    @IBOutlet weak var poolLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    
    weak var delegate: GachaVCDelegate?
    
    var Manager = GachaManager()
    var gacha = CoreDataStack.shared.Gachas[0] as? Gacha
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("str_draw", comment: "")
        
        let topColor = #colorLiteral(red: 0.1658218124, green: 0.1428644858, blue: 0.5535176079, alpha: 1)
        let buttomColor = #colorLiteral(red: 0.1958577205, green: 0.07502472192, blue: 0.2716925761, alpha: 1)
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        tileLabel.text = NSLocalizedString("str_draw", comment: "")
        mainimage.image = UIImage(named: "dx_vol73")
        image1.image = UIImage(named: "dx_vol73")
        image2.image = UIImage(named: "dx_vol74")
        image3.image = UIImage(named: "dx_vol75")
        
        resetBtn.setTitle(NSLocalizedString("str_reset", comment: ""), for: .normal)
        
        CoreDataStack.shared.update()
        
        if let tempgacha = gacha{
            poolLabel.text = tempgacha.vol73pool!.count.description + "/100"
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onMainimageSwipped(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .right{
            if mainimage.image == UIImage(named: "dx_vol73"){
                mainimage.image = UIImage(named: "dx_vol75")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol75pool!.count.description + "/100"
                }
            }
            else if mainimage.image == UIImage(named: "dx_vol74"){
                mainimage.image = UIImage(named: "dx_vol73")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol73pool!.count.description + "/100"
                }
            }
            else if mainimage.image == UIImage(named: "dx_vol75"){
                mainimage.image = UIImage(named: "dx_vol74")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol74pool!.count.description + "/100"
                }
            }
        }
    }
    @IBAction func onMainimageSwippedleft(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            if mainimage.image == UIImage(named: "dx_vol73"){
                mainimage.image = UIImage(named: "dx_vol74")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol74pool!.count.description + "/100"
                }
            }
            else if mainimage.image == UIImage(named: "dx_vol74"){
                mainimage.image = UIImage(named: "dx_vol75")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol75pool!.count.description + "/100"
                }
            }
            else if mainimage.image == UIImage(named: "dx_vol75"){
                mainimage.image = UIImage(named: "dx_vol73")
                if let tempgacha = gacha{
                    poolLabel.text = tempgacha.vol73pool!.count.description + "/100"
                }
            }
        }
    }
    
    @IBAction func image1Tapped(_ sender: UITapGestureRecognizer) {
        mainimage.image = UIImage(named: "dx_vol73")
        if let tempgacha = gacha{
            poolLabel.text = tempgacha.vol73pool!.count.description + "/100"
        }
    }
    @IBAction func image2Tapped(_ sender: UITapGestureRecognizer) {
        mainimage.image = UIImage(named: "dx_vol74")
        if let tempgacha = gacha{
            poolLabel.text = tempgacha.vol74pool!.count.description + "/100"
        }
    }
    @IBAction func image3Tapped(_ sender: UITapGestureRecognizer) {
        mainimage.image = UIImage(named: "dx_vol75")
        if let tempgacha = gacha{
            poolLabel.text = tempgacha.vol75pool!.count.description + "/100"
        }
    }
    
    @IBAction func onresetBtnTapped(_ sender: UIButton) {
        resetAlert(title: NSLocalizedString("str_Mind",comment: "")) { _ in
            var currpool = 73
            if self.mainimage.image == UIImage(named: "dx_vol74"){
                currpool = 74
            }
            if self.mainimage.image == UIImage(named: "dx_vol75"){
                currpool = 75
            }
            self.Manager.resetpool(poolnum: currpool)
            self.poolLabel.text = "100/100"
        }
    }
    
    func resetAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = NSLocalizedString("str_checkreset",comment: "")
        let alert = UIAlertController(title: NSLocalizedString("str_Mind",comment: ""), message: alertMsg, preferredStyle: .actionSheet)
        
        let resetAction = UIAlertAction(title: NSLocalizedString("str_reset",comment: ""), style: .default, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_Cancel",comment: ""), style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(resetAction)
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DrawResultVCSegue"{
            var result: [String]?
            if let vc = segue.destination as? DrawResultVC{
                //var Manager = GachaManager()
                var currpool = 73
                
                if mainimage.image == UIImage(named: "dx_vol73"){
                    //poolLabel.text = temp!.vol73pool!.count.description + "/100"
                }
                if mainimage.image == UIImage(named: "dx_vol74"){
                    currpool = 74
                    //poolLabel.text = temp!.vol74pool!.count.description + "/100"
                }
                if mainimage.image == UIImage(named: "dx_vol75"){
                    currpool = 75
                    //poolLabel.text = temp!.vol75pool!.count.description + "/100"
                }
                result = Manager.drawTen(volnum: currpool)
                vc.resultnamelist = result
                //vc.detailItem = detailItem
                //vc.delegate2 = self
            }
            
            checkandaddnewgundam(namelist: result)
        }
    }
    
    func checkandaddnewgundam(namelist: [String]?){
        CoreDataStack.shared.updateItem()
        var items = CoreDataStack.shared.items
        if let tempnamelist = namelist{
            if tempnamelist.count != 0{
                var cmpname: [String] = []
                for item in items{
                    let tempitem = item as! Gundam
                    cmpname.append(tempitem.name!)
                }
                for tempname in tempnamelist{
                    if cmpname.contains(tempname) == false{
                        var imageData: UIImage?
                        imageData = UIImage(named: tempname)
                        guard let BinaryimageData = imageData?.pngData() else {return}
                        let utility = Utility()
                        let cost = utility.name_to_cost(name: tempname)
                        CoreDataStack.shared.saveItem(name: tempname, cost: cost, image: BinaryimageData as NSData)
                        cmpname.append(tempname)
                    }
                }
            }
        }
        delegate?.addedGundam()
        
    }
    
}

