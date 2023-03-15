//
//  SignupVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class SignupVC: UIViewController {
    var cls = Modle()
    @IBOutlet weak var passtxt: UITextField!
    @IBOutlet weak var mailtxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var passVW: UIView!
    @IBOutlet weak var mailVW: UIView!
    @IBOutlet weak var nameVW: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        passtxt.isSecureTextEntry = true

        passVW.layer.cornerRadius = 10
        passVW.layer.borderWidth = 2
        passVW.layer.borderColor = UIColor.gray.cgColor
        
        
        mailVW.layer.cornerRadius = 10
        mailVW.layer.borderWidth = 2
        mailVW.layer.borderColor = UIColor.gray.cgColor
        
        
        nameVW.layer.cornerRadius = 10
        nameVW.layer.borderWidth = 2
        nameVW.layer.borderColor = UIColor.gray.cgColor
        
   
        
        
        
        let texthhju = UITextField()
        nametxt.placeholder = "User name"
        nametxt.attributedPlaceholder = NSAttributedString(string: "User name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        let texthyuts = UITextField()
        mailtxt.placeholder = "Email id"
        mailtxt.attributedPlaceholder = NSAttributedString(string: "Email id", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let texthways = UITextField()
        passtxt.placeholder = "Creat Password"
        passtxt.attributedPlaceholder = NSAttributedString(string: "Creat Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    @IBAction func registerbtn(_ sender: Any) {
        
        if mailtxt.text != "" && nametxt.text != "" && passtxt.text != ""{
            cls.save(Name: nametxt.text ?? "", Password: passtxt.text ?? "", Emailid: mailtxt.text ?? "")
        }else{
            alrt(message: "Textfield Empty")
        }
        
        cls.fetch()
        cls.fetch()
        let value =  cls.fetchdata.contains(where: {
            $0.password == nametxt.text ?? "" && $0.username == passtxt.text ?? "" && $0.emailid == mailtxt.text ?? ""
        })
        
        if value{
            let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChoseVC")as! ChoseVC
            
            self.navigationController?.pushViewController(nav, animated: true)
            
            
        }else{
            alrt(message: "Sorry")
            nametxt.textColor = .red
            passtxt.textColor = .red
            mailtxt.textColor = .red
            
        }
        
      
        
    }
    @IBAction func signinbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninVC")as! SigninVC
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    
    func alrt(message: String ){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
        
    }
    
    @IBAction func eyebtn(_ sender: Any) {
        
        
        if passtxt.isSecureTextEntry == true{
            passtxt.isSecureTextEntry = false
        }else{
            passtxt.isSecureTextEntry = false
            passtxt.isSecureTextEntry = true
        }
    }
    

}
