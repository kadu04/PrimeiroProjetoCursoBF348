//
//  ViewController.swift
//  exercicioNavegacao
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // print(#function)  -> é a mesma coisa que ->  print("viewDidLoad")
        print(#function)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
    }

    
    @IBAction func tappedTela02Button(_ sender: UIButton) {
        
        let vc: Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        
        let fullName = "\(nameTextField.text ?? "") \(lastNameTextField.text ?? "")"
        vc?.name = fullName
       
                // O pushViewController ele exibe a tela da controladora.
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
    }
    
    
    @IBAction func tappedTela03Button(_ sender: UIButton) {
        let vc: Tela03VC? = UIStoryboard(name: "Tela03VC", bundle: nil).instantiateViewController(withIdentifier: "Tela03VC") as? Tela03VC
        vc?.address = addressTextField.text ?? ""
        present(vc ?? UIViewController(), animated: true)
        
        }
    
    }
    


