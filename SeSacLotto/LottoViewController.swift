//
//  ViewController.swift
//  SeSacLotto
//
//  Created by hwijinjeong on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    var lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1025).reversed()  // 최근 회차부터 보이도록

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTextField()
        configPickerView()
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
        numberTextField.text = "\(numberList[row])회차"
    }
    
    // 피커뷰 목록에 대한 제목(?)을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
    
    func configTextField() {
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView
    }
    
    func configPickerView() {
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
}
