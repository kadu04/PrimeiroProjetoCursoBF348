//
//  ViewController.swift
//  PrimeiroProjetoTableViewBF348
//
//  Created by Ricardo Massaki on 15/03/23.
//

import UIKit

// Passo a passo:
// Criar a TableView
// Fazer a ligação
// Configurar a TableView
// Criar célula
// Configurar célula
// Registrar a célula
// Configurar exibição da célula

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = ["Ricardo", "Graziela", "Mariana", "Júlia", "Kiyoko", "Yuki", "Miguel", "Hana", "Raji", "Pretinha"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NameTableViewCell.nib(), forCellReuseIdentifier: NameTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource {
    // Indicar a quantidade de linhas por sessão
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Popular a celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as? NameTableViewCell
//        print(indexPath.row)
        cell?.setupCell(name: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("O aluno selecionado foi: \(data[indexPath.row])")
    }
    
}

