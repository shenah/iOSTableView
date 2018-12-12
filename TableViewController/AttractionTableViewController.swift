//
//  AttractionTableViewController.swift
//  TableViewController
//
//  Created by 503-03 on 2018. 11. 12..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController {

    //이미지 파일 이름을 저장할 배열
    var attrImages = [String]()
    
    //레이블에 출력할 텍스트 배열
    var attrNames = [String]()
    
    //하위 뷰 컨트롤러에 넘겨줄 URL 배열
    var attrURLs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "보고 싶은 영화"
        
        
        attrImages = ["strangers.jpg", "fantasticbests.jpg", "BohemianRhapsody.jpg", "Paul.jpg", "Harvie and the Magic Museum.jpg"]
        attrNames = ["완벽한 타인", "신비한 동물들과 그린델왈드의 범죄", "보헤미안 랩소디", "바울", "박물관이 진짜 살아있다"]
        attrURLs = ["https://namu.wiki/w/완벽한 타인",
                    "https://namu.wiki/w/신비한 동물들과 그린델왈드의 범죄",
                    "https://namu.wiki/w/보헤미안 랩소디",
                    "https://namu.wiki/w/바울",
                    "https://namu.wiki/w/박물관이 진짜 살아있다",]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return attrNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AttracionTableViewCell
        
        cell.attrLabel.text = attrNames[indexPath.row]
        
        cell.attrImage.image = UIImage.init(named: attrImages[indexPath.row])
        return cell
    }
    
    //셀 높이 설정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 200
    }

    //셀을 선택했을 때 호출되는 메소드
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 하위 뷰 컨트롤러 가져오기
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //하위 뷰 컨트롤러 타이틀 설정
        //detailViewController.title = "하위 뷰 컨트롤러"
        //전환 애니메이션 설정
        //detailViewController.modalTransitionStyle = .coverVertical
        detailViewController.address = attrURLs[indexPath.row]
        //화면 이동
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }*/
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let detailViewController = segue.destination as! DetailViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow
        let row = indexPath?.row
        
        detailViewController.title = attrNames[row!]
        detailViewController.address = attrURLs[row!]
     }
}
