//
//  ViewController.swift
//  HistoryTagVPN
//
//  Created by yicheng on 16/11/18.
//  Copyright © 2018年 xiaoxiaohljz. All rights reserved.
//

import UIKit
import NetworkExtension

let kProxyServiceVPNStatusNotification = "kProxyServiceVPNStatusNotification"

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hotSiteButton: UIButton!
    @IBOutlet var connectButton: UIButton!
    var index = 0
    var dataSourece = [VPNModel]()
    
    var status: VPNStatus {
        didSet(o) {
            updateConnectButton()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.status = .off
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(onVPNStatusChanged), name: NSNotification.Name(rawValue: kProxyServiceVPNStatusNotification), object: nil)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hotSiteButton.alpha = 0
//        -------------填写你的信息---------
        let defaultVPNModel = VPNModel(ss_address: "", ss_port: 0, ss_method: "", ss_password: "",ss_name:"默认服务器")
        defaultVPNModel.ss_isSelector = true
        self.dataSourece.append(defaultVPNModel)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.status = VpnManager.shared.vpnStatus
    }
    
    @objc func onVPNStatusChanged(){
        self.status = VpnManager.shared.vpnStatus
    }
    
    func updateConnectButton(){
        switch status {
        case .connecting:
            connectButton.setTitle("连接中...", for: UIControlState())
        case .disconnecting:
            connectButton.setTitle("断开连接中...", for: UIControlState())
        case .on:
            connectButton.setTitle("断开连接", for: UIControlState())
            UIView.animate(withDuration: 0.5, animations: {
                self.hotSiteButton.alpha = 1
            })
        case .off:
            connectButton.setTitle("连接", for: UIControlState())
            UIView.animate(withDuration: 0.5, animations: {
                self.hotSiteButton.alpha = 0
            })
        }
        connectButton.isEnabled = [VPNStatus.on,VPNStatus.off].contains(VpnManager.shared.vpnStatus)
        
        
    }
    
    @IBAction func connectTap(_ sender: AnyObject) {
        let isFirst = UserDefaults.standard.object(forKey: "firstInstall") as? Bool
        if(VpnManager.shared.vpnStatus == .off){
            if let first = isFirst{
                if first{
                    VpnManager.shared.connect(config:self.dataSourece[self.index])
                    return
                }
            }
            let alertView = UIAlertController(title: "使用协议", message: "本工具不会收集任何用户隐私,同时也不承担使用过程中造成的任何法律责任", preferredStyle: .alert)
            let argees = UIAlertAction(title: "同意", style: .default) { (_) in
                VpnManager.shared.connect(config:self.dataSourece[self.index])
                UserDefaults.standard.set(true, forKey: "firstInstall")
            }
            let unArgees = UIAlertAction(title: "拒绝", style: .cancel) { (_) in }
            alertView.addAction(argees)
            alertView.addAction(unArgees)
            self.present(alertView, animated: true, completion: nil)
        }else{
            VpnManager.shared.disconnect()
        }
    }
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourece.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.dataSourece[indexPath.row].ss_name
        if self.dataSourece[indexPath.row].ss_isSelector {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        VpnManager.shared.disconnect()
        for object in self.dataSourece{
            object.ss_isSelector = false
        }
        self.index = indexPath.row
        self.dataSourece[indexPath.row].ss_isSelector = true
        self.tableView.reloadData()
    }
    
    @IBAction func unwindSave(unwindSegue: UIStoryboardSegue){
        if let vc = unwindSegue.source as? CustomServiceTableViewController{
            self.dataSourece.append(vc.vpnModel)
            self.tableView.reloadData()
        }
    }
    
}

