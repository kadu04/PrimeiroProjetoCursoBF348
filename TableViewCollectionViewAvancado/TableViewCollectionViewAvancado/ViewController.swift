//
//  ViewController.swift
//  TableViewCollectionViewAvancado
//
//  Created by Ricardo Massaki on 29/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var vehicleList: [Vehicle] = [
        Vehicle(title: "Carro", list: ["car1","car2","car3","car4","car5","car6"]),
        Vehicle(title: "Motocicleta", list: ["moto1","moto2","moto3","moto4","moto5","moto6"]),
        Vehicle(title: "Avião", list: ["avião1","avião2","avião3","avião4","avião5","avião6"]),
        Vehicle(title: "Caça", list: ["caça1","caça2","caça3","caça4","caça5","caça6"]),
        Vehicle(title: "Trem", list: ["trem1","trem2","trem3","trem4","trem5","trem6"]),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
        tableView.backgroundColor = .lightGray
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // abordagem com GUARD LET
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell else { return UITableViewCell() }
//        cell.setupCell(data: vehicleList[indexPath.row])
//        return cell
        
        // Abordagem com IF LET
//        if let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell {
//            cell.setupCell(data: vehicleList[indexPath.row])
//            return cell
//        }
//            return UITableViewCell()
        
        
        // Abordagem com opcionalidade
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
        cell?.backgroundColor = .systemBlue
        cell?.setupCell(data: vehicleList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 386
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

