//
//  MyPageQuestionTableViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/08.
//

import UIKit

class MyPageQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var showPickerView: UITextField!
    var selectQuestion = ""
    
    let questions = ["자주하는 질문 베스트 10", "회원문의", "주문/결제", "취소/교환/반품", "배송문의", "쿠폰/적립금", "서비스 이용 및 기타"]
        
    override func awakeFromNib() {
        super.awakeFromNib()
    
        textFieldSetup()
        pickerViewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func textFieldSetup() {
        
        showPickerView.rightViewMode = .always
        let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.down")
        imageView.image = image
        imageView.tintColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: showPickerView.frame.width, height: showPickerView.frame.height)
        showPickerView.rightView = imageView
        showPickerView.tintColor = .clear
    }
    
    func pickerViewSetup() {
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 피커뷰 툴바추가
        let pickerToolbar : UIToolbar = UIToolbar()
        pickerToolbar.barStyle = .default
        pickerToolbar.isTranslucent = true  // 툴바가 반투명인지 여부 (true-반투명, false-투명)
        pickerToolbar.backgroundColor = .lightGray
        pickerToolbar.sizeToFit()   // 서브뷰만큼 툴바 크기를 맞춤
        
        // 피커뷰 툴바에 확인/취소 버튼추가
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)   // 버튼추가
        pickerToolbar.isUserInteractionEnabled = true   // 사용자 클릭 이벤트 전달
        
        showPickerView.inputView = pickerView // 피커뷰 추가
        showPickerView.inputAccessoryView = pickerToolbar // 피커뷰 툴바 추가
        
    }
    
    // 피커뷰 > 확인 클릭
       @objc func onPickDone() {
        showPickerView.text = selectQuestion
        showPickerView.resignFirstResponder()
        selectQuestion = ""
       }
       
       // 피커뷰 > 취소 클릭
       @objc func onPickCancel() {
        showPickerView.resignFirstResponder() // 피커뷰를 내림 (텍스트필드가 responder 상태를 읽음)
        selectQuestion = ""
       }
}

extension MyPageQuestionTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectQuestion = questions[row]
    }
    
    
}
