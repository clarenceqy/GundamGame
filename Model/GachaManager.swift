//
//  GachaManager.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/30/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import Foundation
import CoreData

class GachaManager{
    
    var Gachas: Gacha?
    
    init(){
        //CoreDataStack.shared.deleteall()
        //CoreDataStack.shared.deleteallItem()
        CoreDataStack.shared.updateGacha()
        if CoreDataStack.shared.Gachas.count == 0{
            let vol73pool = [String]()
            let vol74pool = [String]()
            let vol75pool = [String]()
            print("Gachas Count is 0")
            CoreDataStack.shared.saveGacha(vol73pool: vol73pool, vol74pool: vol74pool, vol75pool: vol75pool)
        }
        Gachas = CoreDataStack.shared.Gachas[0] as? Gacha
        checkandresetpool()
        
        
    }
    
    func checkandresetpool(){
        
        if Gachas?.vol73pool?.count == 0{
            //print("Reset vol73")
            resetpool(poolnum: 73)
        }
        if Gachas?.vol74pool?.count == 0{
            resetpool(poolnum: 74)
        }
        if Gachas?.vol75pool?.count == 0{
            resetpool(poolnum: 75)
        }
    }
    
    func resetpool(poolnum: Int){
        var vol73pool = Gachas?.vol73pool
        var vol74pool = Gachas?.vol74pool
        var vol75pool = Gachas?.vol75pool
        var newpool = [String]()
        let namelist = ["Ball" ,"Dom", "G_Tank", "GLine", "GM_Command", "GM_Defense", "GM_Land", "GM_Light", "GM_Sniper",
                        "GM_Special", "GM3", "Hi_Gelugugu", "Hi_ZAKU", "Ifrite", "Qiang", "Turtle", "ZAKU_Cannon", "ZAKU1",
                        "ZAKU2S"]//19
        
        for name in namelist{
            for index in 1...5{
                newpool.append(name)
            }
        }
        
        if(poolnum == 73){
            newpool.append("Bellca")
            newpool.append("CrossX1mod")
            newpool.append("CrossX3")
            newpool.append("OLGCannon")
            newpool.append("Ball")
            newpool.shuffle()
            vol73pool = newpool
        }
        else if(poolnum == 74){
            newpool.append("Skygrass")
            newpool.append("F91")
            newpool.append("X1Full")
            newpool.append("Ball")
            newpool.append("Ball")
            newpool.shuffle()
            vol74pool = newpool
        }
        else{
            newpool.append("RichelB")
            newpool.append("Banshee_EF")
            newpool.append("Ball")
            newpool.append("Ball")
            newpool.append("Ball")
            newpool.shuffle()
            vol75pool = newpool
        }
        if let oldGachas = Gachas{
            CoreDataStack.shared.deleteGacha(item: oldGachas)
        }
        CoreDataStack.shared.saveGacha(vol73pool: vol73pool!, vol74pool: vol74pool!, vol75pool: vol75pool!)
        Gachas = CoreDataStack.shared.Gachas[0] as? Gacha
        //print(vol73pool?.count)
        //print(Gachas?.vol73pool?.count)
        print(CoreDataStack.shared.Gachas.count)
        
    }
    
    func drawTen(volnum: Int) -> [String]{
         var result = [String]()
        if volnum == 73{
            if var vol73 = Gachas?.vol73pool{
                
                for i in 0...9{
                    result.append(vol73[0])
                    vol73.remove(at: 0)
                }
                let vol74pool = Gachas?.vol74pool
                let vol75pool = Gachas?.vol75pool
                if let oldGachas = Gachas{
                    CoreDataStack.shared.deleteGacha(item: oldGachas)
                }
                CoreDataStack.shared.saveGacha(vol73pool: vol73, vol74pool: vol74pool!, vol75pool: vol75pool!)
                return result
            }
        }
        else if volnum == 74{
            if var vol74 = Gachas?.vol74pool{
                
                for i in 0...9{
                    result.append(vol74[0])
                    vol74.remove(at: 0)
                }
                let vol73pool = Gachas?.vol73pool
                let vol75pool = Gachas?.vol75pool
                if let oldGachas = Gachas{
                    CoreDataStack.shared.deleteGacha(item: oldGachas)
                }
                CoreDataStack.shared.saveGacha(vol73pool: vol73pool!, vol74pool: vol74, vol75pool: vol75pool!)
                return result
            }
        }
        else{
            if var vol75 = Gachas?.vol75pool{
               
                for i in 0...9{
                    result.append(vol75[0])
                    vol75.remove(at: 0)
                }
                let vol73pool = Gachas?.vol73pool
                let vol74pool = Gachas?.vol74pool
                if let oldGachas = Gachas{
                    CoreDataStack.shared.deleteGacha(item: oldGachas)
                }
                CoreDataStack.shared.saveGacha(vol73pool: vol73pool!, vol74pool: vol74pool!, vol75pool: vol75)
                return result
            }
        }
        return result
        
    }
    
    
    
}

