//
//  ViewController.swift
//  Chapter02-inputForm
//
//  Created by 임재헌 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {
    //전역 변수로 선언하는 이유는 타 메소드에서 접근하기 위함
    var paramEmail : UITextField!
    var paramUpdate : UISwitch!
    var paramInterval : UIStepper!
    var txtUpdate : UILabel!
    var txtInterval : UILabel!
    
    override func viewDidLoad() {
        
        
        //1. 내비게이션 바 타이틀을 입력한다.
        self.navigationItem.title = "설정"
        
        //2. 이메일 레이블을 생성하거 영역과 기본 문구를 설정한다.
        let lblEmail = UILabel()
        lblEmail.frame =  CGRect(x: 30 , y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        //3.레이블의 폰트를 설정한다.
        lblEmail.font = UIFont(name: "HanaCM", size: 14)
        
        //3. 레이블을 루트 뷰에 추가한다.
        self.view.addSubview(lblEmail)
        
        //자동갱신 레이블 생성
        let lblUpdate  = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        //갱신주기 레이블 생성
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        //이메일 입력을 위한 텍스트 필드를 추가
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        //테두리스타일
        self.paramEmail.borderStyle = .roundedRect
        //글자 정렬
        self.paramEmail.textAlignment = NSTextAlignment.left
        //폰트사이즈를 텍스트 필드 너비에 맞게 조정
        self.paramEmail.adjustsFontSizeToFitWidth = true
        //값이 입력되기전 입력 내용에대한 가이드라인 제공
        self.paramEmail.placeholder = "이메일 예) gjsl1457@gmail.com"
        //첫글자 대문자 해제
        self.paramEmail.autocapitalizationType = .none
        
        self.view.addSubview(self.paramEmail)
        
        //스위치 객체를 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        //스위치 기본상태를 On으로 설정
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(self.paramUpdate)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_sender:)), for: .valueChanged)
        
        //스테퍼 객체를 생성
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        //스테퍼 값 변경단위
        self.paramInterval.stepValue = 1
        //초기값 설정
        self.paramInterval.value = 0
        self.view.addSubview(self.paramInterval)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_sender:)), for: .valueChanged)
        
        //스위치 객체의 값을 표현할 레이블 생성
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        self.view.addSubview(self.txtUpdate)
        
        //스테퍼의 값을 텍스트로 표현할 레이블을 추가
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        
        self.view.addSubview(self.txtInterval)
        
        //전송 버튼을 내비게이션 아이템에 추가하고, submit메소드에 연결
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_sender:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
        }
    //스위치의 이벤트와 연결할 메소드
    @objc func presentUpdateValue(_sender : UISwitch){
        self.txtUpdate.text = (_sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    //스테퍼의 이벤트와 연결할 메소드
    @objc func presentIntervalValue(_sender : UIStepper){
        self.txtInterval.text = "\(Int(_sender.value))분 마다"
    }
    
    //전송버튼의 이벤트 메소드 구현
    @objc func submit(_sender : Any){
        let rvc  = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUPdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }

}

/*
 //지원하는 폰트 패밀리목록을 확인
 let fonts = UIFont.familyNames
 for f in fonts{
     print("\(f)")
 }
 
 //폰트패밀리 내에 실제 지원하는 각 폰트이름이 들어있음
 let fonts = UIFont.fontNames(forFamilyName : "Menlo")
 
 */

