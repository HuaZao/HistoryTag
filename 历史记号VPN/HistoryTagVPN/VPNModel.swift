//
//  VPNModel.swift
//  HistoryTagVPN
//
//  Created by 神奇海螺 on 2018/4/28.
//  Copyright © 2018年 LSJH. All rights reserved.
//

import UIKit

class VPNModel: NSObject{
    
    var ss_address = String()
    var ss_port = Int()
    var ss_method = String()
    var ss_password = String()
    var ss_name = String()
    var ss_isSelector = false
    var ymal_conf:String{
        get{
            return self.getRuleConf()
        }
    }
    
  fileprivate func getRuleConf() -> String{
        let Path = Bundle.main.path(forResource: "NEKitRule", ofType: "conf")
        let Data = try? Foundation.Data(contentsOf: URL(fileURLWithPath: Path!))
        let str = String(data: Data!, encoding: String.Encoding.utf8)!
        return str
    }
    
    convenience init(ss_address:String,ss_port:Int,ss_method:String,ss_password:String,ss_name:String) {
        self.init()
        self.ss_address = ss_address
        self.ss_port = ss_port
        self.ss_method = ss_method
        self.ss_password = ss_password
        self.ss_name = ss_name
    }
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(ss_address, forKey:"ss_address")
//        aCoder.encode(ss_address, forKey:"ss_address")
//        aCoder.encode(ss_method, forKey:"ss_method")
//        aCoder.encode(ss_password, forKey:"ss_password")
//        aCoder.encode(ss_name, forKey:"ss_name")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        if let ss_address = aDecoder.decodeObject(forKey:"ss_address") as? String{
//            self.ss_address = ss_address
//        }
//        if let ss_port = aDecoder.decodeObject(forKey:"ss_port") as? Int{
//            self.ss_port = ss_port
//        }
//        if let ss_method = aDecoder.decodeObject(forKey:"ss_method") as? String{
//            self.ss_method = ss_method
//        }
//        if let ss_password = aDecoder.decodeObject(forKey:"ss_password") as? String{
//            self.ss_password = ss_password
//        }
//        if let ss_name = aDecoder.decodeObject(forKey:"ss_name") as? String{
//            self.ss_name = ss_name
//        }
//    }
    
}


extension VPNModel{
    
//    private static func path()->String{
//        let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
//        let path = documentsPath!.appendingFormat("/VPNList")
//        return path
//    }
//
//    func save(){
//        NSKeyedArchiver.archiveRootObject(self, toFile: VPNModel.path())
//    }
//
//    static func getVPNList()->[VPNModel]?{
//        return NSKeyedUnarchiver.unarchiveObject(withFile: self.path()) as? [VPNModel]
//    }
}
