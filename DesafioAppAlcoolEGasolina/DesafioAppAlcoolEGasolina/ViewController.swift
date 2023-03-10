//
//  ViewController.swift
//  DesafioAppAlcoolEGasolina
//  Created by Ricardo Massaki on 10/03/23.
//
// Crie um repositório para o aplicativo. Durante todo o desenvolvimento, deverá ir criando commits e realizando o push. Ao final do projeto, todo o código deverá estar na branch da develop.
// O aplicativo tem a finalidade de comparar os preços do alcool e a gasolina.
// Se a diferença for maior que 70% deve utilizar gasolina, se não alcool.
// Fazer tratativas para estado vazio, o usuário não pode relizar o calculo, sem ter os dois valores preenchidos.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var ethanolPriceLabel: UILabel!
    
    @IBOutlet weak var gasPriceLabel: UILabel!
    
    @IBOutlet weak var ethanolPriceTextField: UITextField!
    
    @IBOutlet weak var gasPriceTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configFontsEColors()
        
    }
    
    func configFontsEColors() {
        view.backgroundColor = .systemIndigo
        logoImageView.image = UIImage(named: "gas")
        ethanolPriceLabel.text = "Preço Álcool"
        gasPriceLabel.text = "Preço Gasolina"
        ethanolPriceTextField.font = UIFont.boldSystemFont(ofSize: 18)
        gasPriceTextField.font = UIFont.boldSystemFont(ofSize: 18)
        
        gasPriceTextField.placeholder = "2,99"
        ethanolPriceTextField.placeholder = "Ex: 1,99"
        gasPriceTextField.textAlignment = .center
        ethanolPriceTextField.textAlignment = .center
        
        gasPriceTextField.keyboardType = .decimalPad
        ethanolPriceTextField.keyboardType = .decimalPad
        
        gasPriceTextField.
        
        gasPriceTextField.delegate = self
        ethanolPriceTextField.delegate = self
        
        calculateButton.setTitle("Calcular", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.backgroundColor = .blue
        
        resultLabel.text = "Digite os preços!"
        resultLabel.textColor = .white
        resultLabel.backgroundColor = .blue
        
        calculateButton.isEnabled = false
        calculateButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        }
    
    
    
    
    
    @IBAction func tappedCalculateButton(_ sender: UIButton) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        //Segunda abordagem (que é mais usada)
        let ethanolPrice: Double = (formatter.number(from: ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        let gasPrice: Double = (formatter.number(from: gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        if ethanolPrice / gasPrice > 0.7 {
            resultLabel.text = "Melhor utilizar gasolina"
        } else {
            resultLabel.text = "Melhor urilizar álcool"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    //removido pq não tem necessidade de usar.
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if gasPriceTextField.text == "" || ethanolPriceTextField.text == ""{
            calculateButton.isEnabled = false
        } else {
            calculateButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

