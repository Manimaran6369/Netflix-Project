//
//  ExpoVC7.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class ExpoVC7: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    

    @IBAction func signinbtn(_ sender: Any) {
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninVC")as! SigninVC
        
        
        self.navigationController?.pushViewController(cell, animated: true)
        
    }
    
    
    @IBAction func nextbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpoVC8")as! ExpoVC8
        
        
        self.navigationController?.pushViewController(cell, animated: true)
        
    }
}
