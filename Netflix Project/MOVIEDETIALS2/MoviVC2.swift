//
//  MoviVC2.swift
//  Netflix Project
//
//  Created by Manimaran on 2/12/23.
//

import UIKit

class MoviVC2: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
   
    @IBOutlet weak var Nsvw: NSLayoutConstraint!
    
   
    
//    var ac = ["A"]
//    var op = ["MSD"]
    var ac = ["A","B","C","D","E","F"]
    var op = ["MSD","CR7","BEST","ROMAN","RKO","VIRAT"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ac.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "MCVC2", for: indexPath)as! MCVC2
        col.imgc.image = UIImage(named: ac[indexPath.row])
        col.lblx.text = op[indexPath.row]
    
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 3, height: collectionView.frame.size.width / 3)
    }
    
    @IBAction func downbtn(_ sender: Any) {
        
        if Nsvw.constant == 270{
            Nsvw.constant = 0

        }else{
            Nsvw.constant = 270
        }
    }
    @IBAction func serchbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
    }
    
}
