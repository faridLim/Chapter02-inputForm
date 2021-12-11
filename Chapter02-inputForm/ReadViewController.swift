//
//  ReadViewController.swift
//  Chapter02-inputForm
//
//  Created by 임재헌 on 2021/12/11.
//

import UIKit

class ReadViewController: UIViewController {
    var pEmail : String?
    var pUPdate  : Bool?
    var pInterval : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //배경 색상을 설정 (커스텀 코드를 이용하여 뷰컨트롤러 인스턴스를 생성할 경우, 루트뷰의 기본색상 값이 비어있어 검은색으로 표시되는데 이를 방지)
        self.view.backgroundColor = .white
        
        //레이블 객체를 정의
        let email = UILabel()
        let upadate = UILabel()
        let interval = UILabel()
        //레이블 위치와 영역 정의
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        upadate.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        //전달 받은 값을 레이블에 표시
        guard let pmail = self.pEmail else{return}
        guard let pterval = self.pInterval else {return}
        email.text = "전달받은 이메일 : \(pmail)"
        
        upadate.text = "업데이트 여부 : \(self.pUPdate == true ? "업데이트 함" : "업데이트 안함")"
        interval.text =  "업데이트 주기 : \(Int(pterval)) 분마다"
        
        self.view.addSubview(email)
        self.view.addSubview(upadate)
        self.view.addSubview(interval)
        
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
