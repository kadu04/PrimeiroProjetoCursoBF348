//
//  CarTableViewCellViewModel.swift
//  TableViewCollectionViewAvancado
//
//  Created by Ricardo Massaki on 04/04/23.
//

import UIKit

class CarTableViewCellViewModel {
    
   private var data: [String] = []
    
    func setListNameImage(data: [String]) {
        self.data = data
    }
    
    var numberOfItemsInSection: Int {
        return data.count
    }
    
    func loadCurrentNameImage(indexPath: IndexPath) -> String {
        return data[indexPath.row]
    }

}
