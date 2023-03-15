//
//  KidsVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/12/23.
//

import UIKit

class KidsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    
    var toy = ["56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "KCVC", for: indexPath)as! KCVC
        
        col.img.image = UIImage(named: toy[indexPath.row])
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height / 3, height: collectionView.frame.size.width)
    }

    @IBAction func backbtn(_ sender: Any) {
        let cell1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
        
    }
    
}
