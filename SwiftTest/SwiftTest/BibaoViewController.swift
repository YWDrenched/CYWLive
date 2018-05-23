//
//  BibaoViewController.swift
//  SwiftTest
//
//  Created by 陈友文 on 2018/5/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

import UIKit

class BibaoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView = UITableView()
    var dataArr:[String]?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (result) in
            self.dataArr = result
            self.tableView.reloadData()
        }
        setupUI()
        
    }
    
    func loadData(completion:@escaping (_ result:([String]))->()){
        DispatchQueue.global().async {
            print("模拟网络延迟")
            Thread.sleep(forTimeInterval: 3.0)
            let arr = ["☺️","😝","🤣","🙄","❤️","🌹","💰","😪","😴"]
            DispatchQueue.main.async {
                print("回到主线程，更新UI")
                completion(arr)
            }
        }  
    }
    
    func setupUI(){
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataArr = dataArr else {
            return 0
        }
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.selectionStyle = .none
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = dataArr?[indexPath.row]
        return cell!
    }


}
