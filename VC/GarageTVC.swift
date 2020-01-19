//
//  GarageTVC.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/29/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit
import CoreData

class GarageTVC: UITableViewController,GachaVCDelegate,PickerVCDelegate{
    let utility = Utility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        CoreDataStack.shared.update()
        self.title = NSLocalizedString("str_garage", comment: "")
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataStack.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? GarageCell else {
            fatalError("Expected Cell")
        }
        
        if let item = CoreDataStack.shared.items[indexPath.row] as? Gundam {
            if let itemname = item.name{
                cell.namelabel?.text = utility.CoredatanametoLocalname(name: itemname)
                //print(cell.namelabel?.text)
            }
            if let itemcost = item.cost{
                cell.costlabel?.text = itemcost
            }
            if let gundamimage = item.image{
                cell.gundamimage.image = UIImage(data : gundamimage as! Data)
                //print(cell.gundamimage.description)
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PickerVCSegue"{
            if let vc = segue.destination as? PickerVC{
                vc.delegate = self
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = CoreDataStack.shared.items[indexPath.row] as? Gundam {
                deletionAlert(title: NSLocalizedString("str_Alert",comment: "")) { _ in
                    CoreDataStack.shared.deleteItem(item: item)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = NSLocalizedString("str_checkdelete",comment: "")
        let alert = UIAlertController(title: NSLocalizedString("str_Alert",comment: ""), message: alertMsg, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("str_Delete",comment: ""), style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_Cancel",comment: ""), style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func addedGundam(){
        CoreDataStack.shared.update()
        tableView.reloadData()
    }
    
    func rearrange(type: String) {
        if type == NSLocalizedString("str_lowtohigh", comment: ""){
            CoreDataStack.shared.updateItem()
            CoreDataStack.shared.updateItembysortLtoH()
            
        }else{
            CoreDataStack.shared.updateItembysortHtoL()
        }
        tableView.reloadData()
    }
    
    

}


