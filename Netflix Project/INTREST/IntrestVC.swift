//
//  IntrestVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class IntrestVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var NSview: NSLayoutConstraint!
    
    

    
    var age = ["Comedy","Drama","Horror","Science fiction","Thriller","Western ","Crime film","Narrative","Romance", "Adventure","Documentary","Fiction","History","Musical ","Fantasy","Animation","Epic","Epic ","Mystry","Action","War and military"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return age.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ICVC", for: indexPath)as! ICVC
        cell.lblc.text = age[indexPath.row]
        
        cell.layer.cornerRadius = 17.5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.backgroundColor = UIColor.black.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 3 , height: collectionView.frame.size.width / 3)
    }
    
    @IBAction func backbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChoseVC")as! ChoseVC
        
        self.navigationController?.popViewController(animated: true)
        
        
        
        
    }
    
    @IBAction func skipbtn(_ sender: Any) {
        
        let nav  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    @IBAction func Morebtn(_ sender: Any) {
        if NSview.constant == 210{
            NSview.constant = 400
        }else{
            NSview.constant = 210
        }
    }
    
}
