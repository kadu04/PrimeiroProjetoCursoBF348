//
//  NameTableViewCell.swift
//  ExercicioDesafio1TableView
//
//  Created by Ricardo Massaki on 20/03/23.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(data: Car) {
        carImageView.image = data.image
        brandLabel.text = data.car
    }
    

    
}
