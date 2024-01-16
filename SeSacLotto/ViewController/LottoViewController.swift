//
//  ViewController.swift
//  SeSacLotto
//
//  Created by hwijinjeong on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var lottoPickerView = UIPickerView()
    let numberList: [Int] = Array(1...1025).reversed()  // 최근 회차부터 보이도록
    let manager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTextField()
        configPickerView()
        configResultLabel()
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(numberList[row]) 회차"
        
        manager.callRequest(number: String(numberList[row])) { value in
            self.resultLabel.text = "당첨번호: \(value)"
        }
    }
    
    // 피커뷰 목록에 대한 제목(?)을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row]) 회차"
    }
    
    func configTextField() {
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView
        numberTextField.text = "1025 회차"
    }
    
    func configPickerView() {
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
    
    func configResultLabel() {
        manager.callRequest(number: "1025") { value in
            self.resultLabel.text = "당첨번호: \(value)"
        }
    }
}
