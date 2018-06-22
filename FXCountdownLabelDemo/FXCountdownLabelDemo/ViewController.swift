//
//  ViewController.swift
//  FXCountdownLabelDemo
//
//  Created by lingyongdai on 2018/6/22.
//  Copyright © 2018年 lingyongdai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let startTimeStr = "2018/06/22 16:01:01"
    let endTimeStr = "2018/06/25 17:00:00"
    var timeLb : FXCountdownLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLb = FXCountdownLabel(frame: CGRect(x: 60, y: 200, width: 200, height: 40))
        timeLb.backgroundColor = UIColor.gray
        timeLb.textColor = UIColor.white
        timeLb.textAlignment = .center
        view.addSubview(timeLb)
        timeLb.startTimeStr = startTimeStr;
        timeLb.endTimeStr = endTimeStr;
        timeLb.refresh()
        
        
        let btn = UIButton(frame: CGRect(x: 60, y: 300, width: 200, height: 40))
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("刷新", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    @objc func refresh() -> Void {
        
        timeLb.refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

