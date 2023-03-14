//
//  ViewController.swift
//  exercicioNavegacao
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func tappedTela02Button(_ sender: UIButton) {
        
        let vc: Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
                // O pushViewController ele exibe a tela da controladora.
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
    }
    
    
    @IBAction func tappedTela03Button(_ sender: UIButton) {
        let vc: Tela03VC? = UIStoryboard(name: "Tela03VC", bundle: nil).instantiateViewController(withIdentifier: "Tela03VC") as? Tela03VC
        present(vc ?? UIViewController(), animated: true)
        
        }
    
    }
    


