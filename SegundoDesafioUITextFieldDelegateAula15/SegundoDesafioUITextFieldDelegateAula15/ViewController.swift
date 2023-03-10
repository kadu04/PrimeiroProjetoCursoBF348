//
//  ViewController.swift
//  SegundoDesafioUITextFieldDelegateAula15
//  Created by Ricardo Massaki on 08/03/23.

// Desafio 2-
// Crie uma tela de cadastro contendo 4 campos de texto (nome, endereço, senha, confirmar senha), e 1 botão cadastrar.
// Objetivo do App: Faça uma validação campo a campo, onde se o campo estiver vazio, represente uma borda vermelha de espessura 2.0, se não, manter ele em sua cor padrão (lightGray).
// Quando o foco estiver no teclado, a cor da sua borda será azul.
// O botão por default vem desabilitado, e só poderá ser habilitado quando TODOS os campos forem preenchidos e os textFields confirmar senha e senha forem iguais.
// Caso os valores dos textFields senha e confirmar senha forem diferentes, deve apresentar borda vermelha para ambos.
// Quando o botão estiver habilitado, deverá apresentar na área de debug a mensagem, "Cadastro realizado com sucesso".


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }
    
    func configTextField() {
        registerButton.isEnabled = false
        view.backgroundColor = .cyan
        nameTextField.placeholder = "Digite seu nome:"
        addressTextField.placeholder = "Digite seu endereço:"
        passwordTextField.placeholder = "Digite sua senha:"
        confirmPasswordTextField.placeholder = "Confirme sua senha:"
        
        nameTextField.delegate = self
        addressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        addressTextField.layer.borderWidth = 2
        addressTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        confirmPasswordTextField.layer.borderWidth = 2
        confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        nameTextField.layer.cornerRadius = 12
        addressTextField.layer.cornerRadius = 12
        passwordTextField.layer.cornerRadius = 12
        confirmPasswordTextField.layer.cornerRadius = 12
        registerButton.layer.cornerRadius = 10
        
        nameTextField.clipsToBounds = true
        addressTextField.clipsToBounds = true
        passwordTextField.clipsToBounds = true
        confirmPasswordTextField.clipsToBounds = true
        registerButton.clipsToBounds = true
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        print("Cadastro realizado com sucesso!!")
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.hasText {
            textField.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
        
        if nameTextField.text == "" || addressTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            registerButton.isEnabled = false
            
        } else {
            
            if passwordTextField.text == confirmPasswordTextField.text {
                registerButton.isEnabled = true
                passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
                confirmPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
                registerButton.isEnabled = false
            }
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
