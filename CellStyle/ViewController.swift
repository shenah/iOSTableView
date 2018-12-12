//
//  ViewController.swift
//  CellStyle
//
//  Created by 503-03 on 2018. 11. 9..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    //출력할 데이터 배열
    var data : [VO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vo1 = VO()
        vo1.name = "Fantastic Bests"
        vo1.image = "fantasticbests.jpg"
        vo1.language = "English"
        data.append(vo1)
        
        let vo2 = VO()
        vo2.name = "Halloween"
        vo2.image = "halloween.jpg"
        vo2.language = "English"
        data.append(vo2)
        
        let vo3 = VO()
        vo3.name = "Intimate Strangers"
        vo3.image = "strangers.jpg"
        vo3.language = "Korean"
        data.append(vo3)
        
        self.title = "영화"
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    //document의 required - 섹션 별 행의 개수를 리턴하는 필수 재정의 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    //cell를 리턴하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        let sub = data[indexPath.row]
        cell?.textLabel?.text = sub.name
        cell?.detailTextLabel?.text = sub.language
        cell?.imageView?.image = UIImage.init(named: sub.image)
        
        return cell!
    }
    
}

