//
//  PickerVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 12/1/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit

protocol PickerVCDelegate: class {
    func rearrange(type: String)
}

class PickerVC: UIViewController {

    @IBOutlet weak var Showpicker: UIPickerView!
    
    let optionlist = [NSLocalizedString("str_hightolow", comment: ""),NSLocalizedString("str_lowtohigh", comment: "")]
    weak var delegate: PickerVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.rearrange(type: optionlist[Showpicker.selectedRow(inComponent: 0)])
    }
}


extension PickerVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return optionlist.count
    }
    
}
extension PickerVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionlist[row]
        
    }
    
}
