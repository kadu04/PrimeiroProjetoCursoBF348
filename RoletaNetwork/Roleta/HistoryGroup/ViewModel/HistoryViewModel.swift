//
//  HistoryViewModel.swift
//  Roleta
//
//  Created by Ricardo Massaki on 04/04/23.
//

import UIKit

class HistoryViewModel {
    
    
    private let service: HistoryService = HistoryService()
    
    func fetchHistory() {
        service.getHistoryFromJson { result, failure in
            if let result = result {
                print(result)
            } else {
                print("deu ruim")
            }
        }
        
    }

}
