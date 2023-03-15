//
//  ViewController.swift
//  TransitarObjetosEntreTelas
//
//  Created by Ricardo Massaki on 14/03/23.

// Desafio
// Criar uma tela que contenha 4 textFields.
// (nome, sobrenome, idade, profissão)
// Criar um objeto chamado Pessoa.
// Objetivo do desafio -> Transitar dados entre telas.
// Leva as informações digitadas nos campos de texto através de um objeto para a tela 02.
// Exibir os respectivos valores as propriedades do objeto nos textos das labels.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var profissionTextField: UITextField!
    
    @IBOutlet weak var goScreen02Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }
    
    func configTextField() {
        view.backgroundColor = .systemBlue
        goScreen02Button.setTitle("Entrar", for: .normal)
        goScreen02Button.backgroundColor = .systemBrown
        goScreen02Button.setTitleColor(.black, for: .normal)
        goScreen02Button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        goScreen02Button.layer.cornerRadius = 10
    }

    
    @IBAction func tappedGoScreen02Button(_ sender: UIButton) {
        
        //Exibindo NAVIGATION de maneira programática.
        let vc: Screen02? = UIStoryboard(name: "Screen02", bundle: nil).instantiateViewController(withIdentifier: "Screen02") as? Screen02
        
        let ricardo = Pessoa(nome: nameTextField.text ?? "", sobrenome: lastNameTextField.text ?? "", idade: ageTextField.text ?? "", profissao: profissionTextField.text ?? "")
        
        vc?.ricardo = ricardo
        
        // O pushViewController ele exibe a tela da controladora.
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
        print("Entrou no App com sucesso !!")
        
    }
}

struct Pessoa {
    var nome: String
    var sobrenome: String
    var idade: String
    var profissao: String
}
