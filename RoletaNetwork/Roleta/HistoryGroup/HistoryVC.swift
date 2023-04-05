//
//  HistoryVC.swift
//  Roleta
//
//  Created by Ricardo Massaki on 04/04/23.
//

import UIKit

class HistoryVC: UIViewController {
    
    
    let viewModel: HistoryViewModel = HistoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHistory()

        
    }
}
