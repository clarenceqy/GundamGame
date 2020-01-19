//
//  Utility.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/29/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import Foundation

class Utility{
    
    func name_to_cost(name: String)->String{
        switch name{
        case "Bellca":
            return "340C"
        case "CrossX1mod":
            return "380C"
        case "CrossX3":
            return "380C"
        case "OLGCannon":
            return "340C"
        case "Ball":
            return "160C"
        case "Dom":
            return "280C"
        case "G_Tank":
            return ""
        case "GLine":
            return "300C"
        case "GM_Command":
            return "240C"
        case "GM_Defense":
            return "320C"
        case "GM_Land":
            return "220C"
        case "GM_Light":
            return "300C"
        case "GM_Sniper":
            return "220C"
        case "GM_Special":
            return "340C"
        case "GM3":
            return "340C"
        case "Hi_Gelugugu":
            return "320C"
        case "Hi_ZAKU":
            return "300C"
        case "Ifrite":
            return "340C"
        case "Qiang":
            return "300C"
        case "Turtle":
            return "220C"
        case "ZAKU_Cannon":
            return "220C"
        case "ZAKU1":
            return "200C"
        case "ZaKU2S":
            return "240C"
        case "Skygrass":
            return "360C"
        case "F91":
            return "360C"
        case "X1Full":
            return "400C"
        case "RichelB":
            return "340C"
        case "Banshee_EF":
            return "400C"

        default :
            return "280"
        }
    }
    
    func CoredatanametoLocalname(name:String)->String?{
        let newstrname = "str_gundamname_" + name
        return NSLocalizedString(newstrname, comment: "")
    }
}
