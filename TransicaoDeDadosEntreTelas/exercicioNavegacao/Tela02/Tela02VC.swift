//
//  Tela02VC.swift
//  exercicioNavegacao
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class Tela02VC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        nameLabel.text = name
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
