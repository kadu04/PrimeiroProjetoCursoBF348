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
    // cellForRowAt - Popular a celula
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
    //canEditRowAt - para editar a tela
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //para remover um item (celula por exemplo)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        // data.remove(at: indexPath.row)
        //Tomar muito cuidado ao usar "reloadData
        tableView.reloadData()
    }
}
    
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(data[indexPath.row].car)
        }
    }
    

