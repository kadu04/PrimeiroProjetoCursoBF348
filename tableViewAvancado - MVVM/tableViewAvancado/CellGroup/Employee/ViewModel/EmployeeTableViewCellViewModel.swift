//
//  NameTableViewCell01ViewModel.swift
//  tableViewAvancado
//
//  Created by Ricardo Massaki on 03/04/23.
//

import UIKit

class EmployeeTableViewCellViewModel {
    
    private var employee: Employee?
    
    func setEmployee(employee: Employee) {
        self.employee = employee
    }

    var name: String {
        return "Nome: \(employee?.name ?? "")"
    }

    var profession: String {
        return "Profissão: \(employee?.profession ?? "")"
    }

    var salary: String {
        return "Salário: \(employee?.salary ?? "")"
    }

    var age: String {
        return "Idade: \(employee?.age ?? 0)"
    }


}


