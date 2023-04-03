//
//  RegisterTableViewCell.swift
//  Desafio1TableViewAvancadoBF348
//
//  Created by Ricardo Massaki on 20/03/23.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var professionLabel: UILabel!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    
    static let identifier: String = "RegisterTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupCell(data: Employee) {
        self.userImageView.image = data.image
        self.nameLabel.text = "Nome \(data.name)"
        self.ageLabel.text = "Idade \(String(data.age))"
        self.professionLabel.text = "Profissão \(data.profession)"
        self.salaryLabel.text = "Salário \(data.salary)"
        
        if data.isEnableHeart {
            self.heartButton.tintColor = .red
        } else {
            self.heartButton.tintColor = .blue
        }
    }


    @IBAction func tappedHeartButton(_ sender: UIButton) {
        
    }
}
