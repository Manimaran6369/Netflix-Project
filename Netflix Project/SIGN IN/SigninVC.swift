//
//  SigninVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class SigninVC: UIViewController, UITextFieldDelegate {
    var cls = Modle()
    
    @IBOutlet weak var passtxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var nameVW: UIView!
    @IBOutlet weak var PassVW: UIView!
    
    var iconClick = true


    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        passtxt.isSecureTextEntry = true
        
        PassVW.layer.cornerRadius = 10
        PassVW.layer.borderWidth = 2
        PassVW.layer.borderColor = UIColor.gray.cgColor
        nameVW.layer.borderWidth = 2
        nameVW.layer.borderColor = UIColor.gray.cgColor
        nameVW.layer.cornerRadius = 10
        
        let texth349 = UITextField()
        nametxt.placeholder = "User name"
        nametxt.attributedPlaceholder = NSAttributedString(string: "User name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        
        
        
        let text129 = UITextField()
        passtxt.placeholder = "password"
        passtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

    }
    

    @IBAction func Signinbtn(_ sender: Any) {
        
        if passtxt.text != "" && nametxt.text != ""{
            cls.save(Name: nametxt.text ?? "" , Password: passtxt.text ?? "",Emailid: "")
        }else{
            alrt(message: "Textfield Empty")
        }
        
        cls.fetch()
        let value =  cls.fetchdata.contains(where: {
            $0.password == nametxt.text ?? "" && $0.username == passtxt.text ?? ""
        })
        
        if value{
            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
            
            self.navigationController?.pushViewController(cell, animated: true)
        }else{
            
            alrt(message: "Sorry")
            nametxt.textColor = .red
            passtxt.textColor = .red
        }
        
        
    }
    
    
    
    
    
    
    @IBAction func registerbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignupVC")as! SignupVC
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
  
    
    func alrt(message: String ){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    @IBAction func eyebtn(_ sender: UIButton) {
        if passtxt.isSecureTextEntry == true {
            passtxt.isSecureTextEntry = false
           } else {
               passtxt.isSecureTextEntry = false
               passtxt.isSecureTextEntry = true
           }
         
       }
    
    }
    

