//
//  ViewController.swift
//  Roleta
//
//  Created by Ricardo Massaki on 02/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoAppImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var drawNumberButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var listPerson: [Person] = []
    
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    
    var person: Person?
    
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
        if listPerson.isEmpty {
            drawNumberButton.isEnabled = false
            drawNumberButton.alpha = 0.5
        } else {
            drawNumberButton.isEnabled = true
            drawNumberButton.alpha = 1
        }
    }

    @IBAction func tappedDrawNumberButton(_ sender: UIButton) {
        
        self.person = listPerson.randomElement()
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.listPerson[indexPath.row] === self.person {
            print("Parabéns você foi sorteado, então pague a conta")
            alert?.showAlert(title: "Muito bom", message: "Agora é sua vez, pague a conta ;)")
            listPerson.removeAll()
        } else {
            print("Uffa, voce escapou")
            listPerson.remove(at: indexPath.row)
        }
        blockedDrawNumberButton()
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if listPerson.count == 0 {
            return 1
        } else {
            return listPerson.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if listPerson.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listPerson.count == 0 {
            return 248
        } else {
            return 92
        }
    }
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !(textField.text?.isEmpty ?? false) {
            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
            tableView.reloadData()
            blockedDrawNumberButton()
        }
        nameTextField.text = ""
        return true
    }
}
