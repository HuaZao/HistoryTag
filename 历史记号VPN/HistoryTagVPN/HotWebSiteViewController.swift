//
//  HotWebSiteViewController.swift
//  HistoryTagVPN
//
//  Created by 神奇海螺 on 2018/4/28.
//  Copyright © 2018年 LSJH. All rights reserved.
//

import UIKit
import SafariServices

class HotWebSiteViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    struct HotWebSiteModel {
        var siteTitle = String()
        var siteImage = String()
        var siteWebURL = String()
    }
    
    var siteTitleArray = ["谷歌","Youtube","维基百科","Twitter","Facebook","Tumblr"]
    
    var webSiteDataSource = [HotWebSiteModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSite()
    }
    
    private func initSite(){
        let googleModel = HotWebSiteModel(siteTitle: "谷歌", siteImage: "谷歌", siteWebURL: "https://www.google.com")
        let youtubeModel = HotWebSiteModel(siteTitle: "Youtube", siteImage: "Youtu", siteWebURL: "https://www.youtube.com")
        let wikiModel = HotWebSiteModel(siteTitle: "维基百科", siteImage: "维基", siteWebURL: "https://zh.wikipedia.org")
        let twitterModel = HotWebSiteModel(siteTitle: "Twitter", siteImage: "twitter", siteWebURL: "https://twitter.com")
        let facebookModel = HotWebSiteModel(siteTitle: "Facebook", siteImage: "facebook", siteWebURL: "https://www.facebook.com")
        let TumblrModel = HotWebSiteModel(siteTitle: "Tumblr", siteImage: "Tumblr", siteWebURL: "https://www.tumblr.com")
        self.webSiteDataSource = [googleModel,youtubeModel,wikiModel,twitterModel,facebookModel,TumblrModel]
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.webSiteDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = cell.viewWithTag(101) as! UIImageView
        let lable = cell.viewWithTag(102) as! UILabel
        imageView.image = UIImage(named: self.webSiteDataSource[indexPath.row].siteImage)
        lable.text = self.webSiteDataSource[indexPath.row].siteTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: self.webSiteDataSource[indexPath.row].siteWebURL)
        let safariVC = SFSafariViewController(url: url!)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    
}
