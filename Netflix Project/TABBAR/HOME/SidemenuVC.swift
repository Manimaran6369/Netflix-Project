//
//  SidemenuVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/18/23.
//

import UIKit

class SidemenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profielbtn(_ sender: Any) {
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfilVC")as! ProfilVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
   
    @IBAction func languvagebtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChoseVC")as! ChoseVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
    @IBAction func jonersbtn(_ sender: Any) {
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JonVC")as!JonVC
        
        self.navigationController?.pushViewController(cell, animated: true)
        
    }
    @IBAction func populartvbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PoplurVC")as! PoplurVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
    @IBAction func kidsbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KidsVC")as! KidsVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
}
