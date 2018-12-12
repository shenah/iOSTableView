//
//  ViewController.swift
//  Grouping
//
//  Created by 503-03 on 2018. 11. 12..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //출력할 문자열을 저장할 변수
    var data:Array<String> = []
    //분류한 데이터들을 저장할 변수
    var sectionData: Array<Dictionary<String, Any>> = []
    //분류할 때 사용할 한글 자음 배열
    var indexes : Array<String> = []
    
    //문자열 매개변수로 받아서 첫글자의 자음을 리턴하는 메소드
    func subtract(data : String)->String{
        var result = data.compare("나")
        if result == ComparisonResult.orderedAscending{
            return "ㄱ"
        }
        result = data.compare("다")
        if result == ComparisonResult.orderedAscending{
            return "ㄴ"
        }
        result = data.compare("라")
        if result == ComparisonResult.orderedAscending{
            return "ㄷ"
        }
        result = data.compare("마")
        if result == ComparisonResult.orderedAscending{
            return "ㄹ"
        }
        result = data.compare("바")
        if result == ComparisonResult.orderedAscending{
            return "ㅁ"
        }
        result = data.compare("사")
        if result == ComparisonResult.orderedAscending{
            return "ㅂ"
        }
        result = data.compare("아")
        if result == ComparisonResult.orderedAscending{
            return "ㅅ"
        }
        result = data.compare("자")
        if result == ComparisonResult.orderedAscending{
            return "ㅇ"
        }
        result = data.compare("차")
        if result == ComparisonResult.orderedAscending{
            return "ㅈ"
        }
        result = data.compare("카")
        if result == ComparisonResult.orderedAscending{
            return "ㅊ"
        }
        result = data.compare("타")
        if result == ComparisonResult.orderedAscending{
            return "ㅋ"
        }
        result = data.compare("파")
        if result == ComparisonResult.orderedAscending{
            return "ㅌ"
        }
        result = data.compare("하")
        if result == ComparisonResult.orderedAscending{
            return "ㅍ"
        }
        
        return "ㅎ"
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data = ["반바스텐", "루드구리트", "리카르트", "베르캄프", "로벤", "앙리", "지단", "음바페", "호나우두", "메시", "기린샤", "마라도나", "캠페스", "바티스루타", "시어러", "뮐러", "차범근", "김주성", "최용수", "윤정환", "하정무", "웨아", "바조", "제라드"]
        indexes = ["ㄱ", "ㄴ","ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        
        //
        var temp : [[String]] = Array(repeating: Array(), count: indexes.count)
        
        var i = 0
        while i<indexes.count {
            var j = 0
            while j<data.count{
                
                if indexes[i] == subtract(data: data[j]){
                    temp[i].append(data[j])
                }
                j = j + 1
            }
            
            i = i + 1
        }
        
        i = 0
        while i < indexes.count{
            if temp[i].count > 0 {
                var dic : Dictionary <String, Any> = [:]
                dic["sectionTitle"] = indexes[i]
                dic["name"] = temp[i]
                sectionData.append(dic)
            }
            i = i + 1
        }
        
        //그룹 별 오름차순 정열
        i = 0
        while i<indexes.count {
            if temp[i].count>=2{
                temp[i].sort()
            }
            i = i + 1
        }

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    //섹션 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    //그룹 티이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //그룹 번호에 해당하는 Dictionary 데이터 가져오기
        var dic = sectionData[section]
        //데이트가 Any로 설정되었기에 데이터를 꺼낼때 강제 형변환을 해야 합니다.
        let sectionTitle = (dic["sectionTitle"] as! NSString) as String
        return sectionTitle
    }
    //섹션 별 행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dic = sectionData[section]
        let ar = (dic["name"] as! NSArray) as Array
        return ar.count
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        var dic = sectionData[indexPath.section]
        let ar = (dic["name"] as! NSArray) as Array
        cell?.textLabel?.text = (ar[indexPath.row] as! NSString) as String
        return cell!
    }
    
    //섹션 인덱스 설정
    func sectionIndexTitles(for tableView: UITableView) -> [String]?{
        return indexes
    }
    //섹션 인덱스를 선택했을 때 이동하는 메소드
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int{
        //
        var i = 0
        while i < sectionData.count{
            var dic = sectionData[i]
            let sectionTitle = (dic["sectionTitle"] as! NSString) as String
            if title == sectionTitle{
                return i
            }
            i = i + 1
        }
        //동일한 인덱스를 찾지 못하면 아무것도 하지 않음
        return -1
    }
}
