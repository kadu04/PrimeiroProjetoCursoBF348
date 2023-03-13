//
//  ViewController.swift
//  navegacaoBF
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedGoScreen02(_ sender: UIButton) {
        // Exibindo Modal de modo programática. É receitinha de bolo, sempre vai ser assim!!
//        let vc: Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        // O present exibe a MODAL
//        present(vc ?? UIViewController(), animated: true)
        
        //Exibindo NAVIGATION de maneira programática.
        let vc: Tela02VC? = UIStoryboard(name: "Tela02VC", bundle: nil).instantiateViewController(withIdentifier: "Tela02VC") as? Tela02VC
        // O pushViewController ele exibe a tela da controladora.
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        
    }
    
        // Exibindo Modal de modo programática. É receitinha de bolo, sempre vai ser assim!!
    @IBAction func tappedGoScreen03(_ sender: UIButton) {
        // Exibindo Modal de modo programática.
        let vc: Tela03VC? = UIStoryboard(name: "Tela03VC", bundle: nil).instantiateViewController(withIdentifier: "Tela03VC") as? Tela03VC
        present(vc ?? UIViewController(), animated: true)
       
    }

}

