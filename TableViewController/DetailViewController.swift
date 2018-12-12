//
//  DetailViewController.swift
//  TableViewController
//
//  Created by 503-03 on 2018. 11. 13..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    // 상위에서 넘겨주는 웹 주소를 저장할 변수 생성
    var address : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swift에서는 변수에 값을 대입할 때 nil이면 false, 데이터가 있으면 true를 리턴합니다.
        if let addr = address{
           
            //URL 인코딩을 해줘야 합니다.
            let url = addr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            
            let urlWeb = URL.init(string: url!)
            let urlRequest = URLRequest.init(url: urlWeb!)
            webView.load(urlRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
