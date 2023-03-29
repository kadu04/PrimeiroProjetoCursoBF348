//
//  ViewController.swift
//  TableViewCollectionView
//
//  Created by Ricardo Massaki on 28/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var carList: [String] = ["car1", "car2", "car3", "car4", "car5", "car6"]
    var bikeList: [String] = ["moto1", "moto2", "moto3", "moto4", "moto5", "moto6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
        tableView.backgroundColor = .systemBlue
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
            cell?.setupCell(name: carList, title: "Carro")
            cell?.backgroundColor = .systemYellow
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
            cell?.setupCell(name: bikeList, title: "Motocicleta")
            cell?.backgroundColor = .systemYellow
            return cell ?? UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 372
    }
}
    
    extension ViewController: UITableViewDelegate {
}

