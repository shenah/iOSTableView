//
//  ViewController.swift
//  CustomViewUse
//
//  Created by 503-03 on 2018. 11. 12..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ar : [Dictionary<String, String>] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic1 = ["name":"Strangers", "language":"Korean", "image":"strangers.jpg"]
        let dic2 = ["name":"Fantastic Bests", "language":"English", "image":"fantasticbests.jpg"]
        let dic3 = ["name":"Bohemian Rhapsody", "language":"English", "image":"BohemianRhapsody.jpg"]
        let dic4 = ["name":"Paul", "language":"English", "image":"Paul.jpg"]
        let dic5 = ["name":"Harvie and the Magic Museum", "language":"English", "image":"Harvie and the Magic Museum.jpg"]
        ar.append(dic1)
        ar.append(dic2)
        ar.append(dic3)
        ar.append(dic4)
        ar.append(dic5)
        //테이블 뷰의 delegate, datasourse 설정
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustcomCell
        
        //데이터 찾아오기
        var dic = ar[indexPath.row]
        cell.name.text = dic["name"]
        cell.language.text = dic["language"]
        cell.img.image = UIImage.init(named: dic["image"]!)
        
        return cell
    }
    
    //셀의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
