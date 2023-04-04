//
//  ViewModel.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 03/04/23.
//

import UIKit

class ViewModel {
    
    let employeeList: [Employee] = [
        Employee(name: "Ricardo", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Mauricio", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Graziela", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Júlia", age: 30, profession: "Developer IOS", salary: "1.000,00", imageUser: UIImage(systemName: "person.circle") ?? UIImage(), isEnableHeart: true)
    ]
    
    var numberOfRowsInSection: Int {
        return employeeList.count + CellSpec.userTableViewCell.rawValue
    }
    
    func loadCurrentUser() -> User {
        return User(name: TypeString.ricardo.rawValue, image: UIImage(systemName: TypeString.star.rawValue) ?? UIImage())
    }
    
    func loadCurrentEmployee(indexPath: IndexPath) -> Employee {
        return employeeList[indexPath.row - 1]
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 131
        } else {
            return 184
        }
    }

}
