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
        performSegue(withIdentifier: "GoScreen02", sender: nil)
        
    }
    
    @IBAction func tappedGoScreen03(_ sender: UIButton) {
        performSegue(withIdentifier: "GoScreen03", sender: nil)
    }
    
    

}

