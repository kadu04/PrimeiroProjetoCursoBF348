//
//  ViewController.swift
//  Desafio1TableViewAvancadoBF348
//
//  Created by Ricardo Massaki on 20/03/23.
//

import UIKit

enum CellSpec: Int {
    case  nameTableViewCell = 1
}

class ViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    let data: [Employee] = [
        Employee(name: "Ricardo", age: 22, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "boy") ?? UIImage(), isEnableHeart: true),
        Employee(name: "Graziela", age: 22, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "girl") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Mariana", age: 20, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "girl") ?? UIImage(), isEnableHeart: false),
        Employee(name: "Júlia", age: 20, profession: "Developer IOS", salary: "1.000,00", image: UIImage(named: "girl") ?? UIImage(), isEnableHeart: false),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.register(RegisterTableViewCell.nib(), forCellReuseIdentifier: RegisterTableViewCell.identifier)
        tableView.backgroundColor = .systemBlue
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + CellSpec.nameTableViewCell.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
            cell?.setupCell(data: User(name: "Ricardo", image: UIImage(named: "flag") ?? UIImage()))
            cell?.backgroundColor = .systemCyan
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.identifier, for: indexPath) as? RegisterTableViewCell
            cell?.setupCell(data: data[indexPath.row - 1])
            if indexPath.row % 2 == 0 {
                cell?.backgroundColor = .systemGreen
            } else {
                cell?.backgroundColor = .systemYellow
            }
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 131
        } else {
            return 174
        }
    }
}
    
    extension ViewController: UITableViewDelegate {
        
    }

