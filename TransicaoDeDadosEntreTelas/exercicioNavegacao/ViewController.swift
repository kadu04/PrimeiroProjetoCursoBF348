//
//  ViewController.swift
//  exercicioNavegacao
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class ViewController: UIViewController {

    // viewDidLoad -> é o primeiro ciclo de vida a ser disparado, e tem ciclo de vida único, só é disparado uma única vez.
    override func viewDidLoad() {
        super.viewDidLoad()
    // print(#function)  -> é a mesma coisa que ->  print("viewDidLoad")
        print(#function)
    }
    
// Life Cycle -> cico de vida
    // viewWillAppear -> pode ser disparado várias vezes. Ele é um pré disparo, uma pré vizualização. Antes da nossa tela apresentar, ele já é disparado.
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    // viewDidAppear -> é utilizado, depois que o usuário vê toda a tela montada. é utilizado mais para parte de animação. ele aparece qdo vc pausa uma animação por exemplo.
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    // viewDidDisappear -> é um método que é disparado, qdo a tela desaparece por inteira. Utilizamos ele para desalocar alguma coisa da memória
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    // viewWillDisappear -> é o método disparado, antes da nossa tela desaparecer.
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
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
    


