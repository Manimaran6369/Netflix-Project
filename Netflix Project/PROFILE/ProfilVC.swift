//
//  ProfilVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class ProfilVC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var img: UIImageView!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img.layer.cornerRadius = img.frame.size.width / 2
        img.layer.cornerRadius = 34
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
    }
    

    @IBAction func picbtn(_ sender: Any) {
        
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            img.image = image
            
        }
        dismiss(animated: true)
        
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
