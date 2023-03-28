//
//  CustomCollectionViewCell.swift
//  PrimeiroAppCollectionView
//
//  Created by Ricardo Massaki on 28/03/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    
    static let identifier: String = "CustomCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    // Ciclo de vida da cell, podendo compara com o viewDidLoad da ViewController
    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
        
    }
    
    func setupCell(nameImage: String) {
        carImageView.image = UIImage(named: nameImage)
    }

}
