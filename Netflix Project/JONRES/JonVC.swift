//
//  JonVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/11/23.
//

import UIKit

class JonVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    

    var pho = ["36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"]
    var nm = ["Comedy","Drama","Horror","Science fiction","Thriller","Western","Crime film","Narrative","Romance","Adventure","Documentary","Fiction","History","Musical","Fantasy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pho.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "JCVC", for: indexPath)as! JCVC
        col.lbl.text = nm[indexPath.row]
        col.img.image = UIImage(named: pho[indexPath.row])
        
        return col
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 3 , height: collectionView.frame.size.width / 3)
    }
    @IBAction func backbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
        
    }
    
}
