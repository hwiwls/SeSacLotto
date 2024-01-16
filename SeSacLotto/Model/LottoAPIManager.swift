//
//  LottoAPIManager.swift
//  SeSacLotto
//
//  Created by hwijinjeong on 1/16/24.
//

import UIKit
import Alamofire

struct LottoAPIManager {
    func callRequest(number: String, completionHandler: @escaping (String) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) {  response in
            switch response.result {
            case .success(let success):
                let arr: [String] = [String(success.drwtNo1), String(success.drwtNo2), String(success.drwtNo3), String(success.drwtNo4), String(success.drwtNo5), String(success.drwtNo6), String(success.bnusNo)]
                
                let convertedArr: String = arr.joined(separator: " ")
                
                completionHandler(convertedArr)
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
