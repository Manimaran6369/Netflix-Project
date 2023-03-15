//
//  ExpoVC9.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class ExpoVC9: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signinbtn(_ sender: Any) {
        let col = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninVC")as! SigninVC
        
        self.navigationController?.pushViewController(col, animated: true)
        
    }
    @IBAction func nextbtn(_ sender: Any) {
        let col = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninVC")as! SigninVC
        
        self.navigationController?.pushViewController(col, animated: true)
        
    }
    
}
