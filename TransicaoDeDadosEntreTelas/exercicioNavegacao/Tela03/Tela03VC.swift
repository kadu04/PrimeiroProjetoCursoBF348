//
//  Tela03VC.swift
//  exercicioNavegacao
//
//  Created by Ricardo Massaki on 13/03/23.
//

import UIKit

class Tela03VC: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    var address: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        addressLabel.text = address
        

        // Do any additional setup after loading the view.
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
