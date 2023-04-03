//
//  ViewController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 02/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var logoAppImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var drawNumberButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    var alert: AlertController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        blockedDrawNumberButton()
        configTableView()
        configTextEndColors()
        alert = AlertController(controller: self)
    }
    
    func configTextEndColors() {
        nameTextField.placeholder = "Digite seu nome"
        nameTextField.delegate = self
        tableView.backgroundColor = .black
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(EmptyTableViewCell.nib(), forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
    
    func blockedDrawNumberButton() {
        if viewModel.isListPersonEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
    }

    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
        viewModel.drawNumber()
    }
}


extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.checkPersonPayer(indexPath: indexPath) {
            print("Parabéns você foi sorteado, então pague a conta")
            alert?.showAlert(title: "Muito bom", message: "Agora é sua vez, pague a conta ;)")
            viewModel.removeAll()
        } else {
            print("Uffa, voce escapou")
            viewModel.removePerson(indexPath: indexPath)
        }
        blockedDrawNumberButton()
        tableView.reloadData()
    }
    
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if viewModel.isListPersonEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: viewModel.loadCurrentPerson(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}


extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !(textField.text?.isEmpty ?? false) {
            viewModel.appendPerson(name: textField.text ?? "")
            tableView.reloadData()
            blockedDrawNumberButton()
        }
        nameTextField.text = ""
        return true
    }
}
