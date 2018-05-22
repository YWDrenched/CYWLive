//
//  ViewController.swift
//  SwiftTest
//
//  Created by 陈友文 on 2018/5/21.
//  Copyright © 2018年 陈友文. All rights reserved.
//

import UIKit




class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var btn1 = UIButton()
    var tableView = UITableView()
    
    let arr:[String] = ["哈哈","呵呵","嘿嘿","嘻嘻"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
//        view.addSubview(btn)
        
        btn1.addTarget(self, action: #selector(btn1Click), for: UIControlEvents.touchUpInside)
        btn1.setTitle("点我1", for: UIControlState.normal)
        btn1.frame = CGRect(x:50 , y: 400, width: 50, height: 50)
        btn1.backgroundColor = UIColor.green
//        view.addSubview(btn1)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell==nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellID")
        }
        cell?.detailTextLabel?.text = arr[indexPath.row]
        return cell!
    }
    
    
    @objc func btn1Click(){
        print("btn1点我")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    函数
    func sum(a:Int,b:Int) -> Int {
        return a + b
    }
    
    
    
    //懒加载
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        btn.setTitle("haha", for: UIControlState(rawValue: 0))
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.layer.cornerRadius = btn.bounds.height / 2
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    
    
    
    @objc func btnClick() {
        print("btn点我")
     }
}




