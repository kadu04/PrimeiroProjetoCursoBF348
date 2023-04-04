//
//  ViewController.swift
//  TableViewCollectionViewAvancado
//
//  Created by Ricardo Massaki on 29/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ViewModel = ViewModel()
    
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
        return viewModel.numberOfRowsInSection
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
        cell?.setupCell(data: viewModel.loadCurrentVehicle(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

