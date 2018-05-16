//
//  CustomServiceTableViewController.swift
//  HistoryTagVPN
//
//  Created by 神奇海螺 on 2018/4/28.
//  Copyright © 2018年 LSJH. All rights reserved.
//

import UIKit

class CustomServiceTableViewController: UITableViewController {

    var vpnModel = VPNModel()
    
    @IBOutlet weak var port: UITextField!
    @IBOutlet weak var service: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var method: UITextField!
    @IBOutlet weak var ssname: UITextField!

    @IBOutlet weak var encryptTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        if let ssservice = self.service.text,ssservice.count > 0{
            self.vpnModel.ss_address = ssservice
        }else{
            self.service.backgroundColor = UIColor.red
            return
        }
        if let ssport = self.port.text,let ssint = Int(ssport){
            self.vpnModel.ss_port = ssint
        }else{
            self.port.backgroundColor = UIColor.red
            return
        }
        if let sspassword = self.password.text,sspassword.count > 0{
            self.vpnModel.ss_password = sspassword
        }else{
            self.service.backgroundColor = UIColor.red
            return
        }
        
        if let ssname = self.ssname.text,ssname.count > 0 {
            self.vpnModel.ss_name = ssname
        }else{
             self.vpnModel.ss_name = "未命名服务器\(NSDate().timeIntervalSince1970 * 100000)"
        }
        
        self.vpnModel.ss_method = self.method.text!
        
        self.performSegue(withIdentifier: "custom", sender: self)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        let cycVc = unwindSegue.source as! SelectorEncryptTableViewController
       self.encryptTextField.text = cycVc.value
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
