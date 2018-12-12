//
//  ViewController.swift
//  TableView
//
//  Created by 503-03 on 2018. 11. 9..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //table에 출력할 데이터 배열 생성
    var names : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        names.append("아메리카노")
        names.append("카페라떼")
        names.append("카페모카")
        names.append("카라멜 마끼아또")
        names.append("홍차")
        names.append("유자차")
        
        //테이블 뷰의 delegate 와 dataSource 지장
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    //document의 required - 섹션 별 행의 개수를 리턴하는 필수 재정의 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return names.count
    }
    
    //셀을 리턴하는
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = names[indexPath.row]
        
        return cell!
    }
}
