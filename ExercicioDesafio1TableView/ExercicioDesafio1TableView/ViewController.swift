//
//  ViewController.swift
//  ExercicioDesafio1TableView
//
//  Created by Ricardo Massaki on 17/03/23.

// Fazer uma TableView que carregue o nome de 5 marcas de carros, e carregue uma imagem de um carro para cada célula. Quando a pessoa clicar no carro, deve imprimir a marca do veículo selecionado.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Car] = [
        Car(car:"HONDA", image: UIImage(named: "honda") ?? UIImage()),
        Car(car:"TOYOTA", image: UIImage(named: "toyota") ?? UIImage()),
        Car(car:"NISSAN", image: UIImage(named: "nissan") ?? UIImage()),
        Car(car:"DAYHATSU", image: UIImage(named: "dayhatsu") ?? UIImage()),
        Car(car:"MAZDA", image: UIImage(named: "mazda") ?? UIImage())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableView.backgroundColor = .systemCyan
    }
}
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        cell?.accessoryType = .checkmark
        if indexPath.row % 2 == 0 {
            cell?.backgroundColor = .systemGreen
        } else {
            cell?.backgroundColor = .systemYellow
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
        
    }
    
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(data[indexPath.row].car)
        }
    }
    

