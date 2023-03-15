//
//  ExpoVC8.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class ExpoVC8: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinbtn(_ sender: Any) {
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SigninVC")as! SigninVC
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
    @IBAction func nextbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpoVC9")as! ExpoVC9
        
        self.navigationController?.pushViewController(cell, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
