//
//  ViewController.swift
//  PrimeiroAppCollectionView
//
//  Created by Ricardo Massaki on 28/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    var data: [String] = ["car1", "car2", "car3", "car4", "car5", "car6"]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemCyan
        // para acessar o "Scroll direction", vertical e horizontal de modo programática
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            // sempre colocar, para que a collectionView obedeça tudo que agnt setar.
            layout.estimatedItemSize = .zero
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    // número de ítens por section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // criação das células
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell(nameImage: data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //indicar a altura/largura da célula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
}
