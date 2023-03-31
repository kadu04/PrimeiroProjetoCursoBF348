//
//  ViewController.swift
//  DesafioTabBarBF348
//
//  Created by Ricardo Massaki on 30/03/23.
//
// DesafioTabBarBF348
// Crie uma tela em uma TabBar
// Cria uma UIImage
// Crie 2 botões
// Crie 1 Label "Nome"
// Crie uma TableView
// Crie uma célula customizável (.xib)
// Objetivo:
// Usuário poderá escolher uma foto da galeria, ou da camera, e depois e escrever eu nome, ele poderá pressionar sob o adicionar.
// Quando adicionar, deverá aparecer na TableView o nome e a imagem.


import UIKit

class Tela01ViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var photoEditButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [User] = []
    
    let imagePicker: UIImagePickerController = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configImagePicker()
        configTextEndColors()
    }
    
    func configImagePicker() {
        imagePicker.delegate = self
    }
    
    func configTextEndColors() {
        nameTextField.placeholder = "Digite seu nome:"
        nameLabel.text = "Nome"
        addButton.setTitle("Adicionar", for: .normal)
        photoEditButton.setTitle("Editar", for: .normal)
        userImageView.image = UIImage(systemName: "person.circle.fill")
        userImageView.tintColor = .black
        nameTextField.delegate = self
    }
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    
    @IBAction func tappedPhotoEditButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    

    @IBAction func tappedAddButton(_ sender: UIButton) {
        if textFieldIsNotEmpty() {
            data.append(User(name: nameTextField.text ?? "", image: userImageView.image ?? UIImage()))
            tableView.reloadData()
            nameTextField.text = ""
        } else {
            let alertController = UIAlertController(title: "Atenção!!", message: "Informe o nome corretamente", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(ok)
            present(alertController, animated: true)
        }
    }
    
    func textFieldIsNotEmpty() -> Bool {
        if nameTextField.text?.isEmpty ?? true || nameTextField.text?.hasPrefix(" ") ?? true {
            return false
        } else {
            return true
        }
    }
}

extension Tela01ViewController: UITableViewDelegate {
    
}

extension Tela01ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        cell?.setupCell(user: data[indexPath.row])
        if indexPath.row % 2 == 0 {
            cell?.backgroundColor = .systemBlue
        } else {
            cell?.backgroundColor = .systemCyan
        }
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
}

extension Tela01ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension Tela01ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.userImageView.image = image
        }
        picker.dismiss(animated: true)
    }
}
