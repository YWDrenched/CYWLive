//
//  ViewController.swift
//  SwiftTest
//
//  Created by 陈友文 on 2018/5/21.
//  Copyright © 2018年 陈友文. All rights reserved.
//

import UIKit





class ViewController: UIViewController{
    
    var btn1 = UIButton()
    var arr:[String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        demo01(name: "老张", age: nil)
        
//        demo02(age: 50)
        
//        demo03()

        btn1.addTarget(self, action: #selector(btn1Click), for: UIControlEvents.touchUpInside)
        btn1.setTitle("点我1", for: UIControlState.normal)
        btn1.frame = CGRect(x:50 , y: 400, width: 50, height: 50)
        btn1.backgroundColor = UIColor.green
        view.addSubview(btn1)
    }
    
    func demo03(){
        for i in 0..<5 {
            print(i)
        }
    }
    

    func demo02(age:Int)  {
        switch age {
        case 1,2,3:
            print("小屁孩")
        case 18:
            print("哟可以上网了")
        case 50:
            print("老腊肉")
        default:
            print("结束")
        }
    }
    
    func demo01(name:String?,age:Int?) {
        guard let name = name, let age = age else {
                print("name或者age为nil")
                return;
        }
        print(name+String(age))
    }
    


    
    
    @objc func btn1Click(){
        print("btn1点我")
        let bibao = BibaoViewController()
        navigationController?.pushViewController(bibao, animated: true)
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
    // MARK:qweqwe
    @objc func btnClick() {
        print("btn点我")
     }
}




