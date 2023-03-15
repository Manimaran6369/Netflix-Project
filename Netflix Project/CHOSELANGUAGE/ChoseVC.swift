//
//  ChoseVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/12/23.
//

import UIKit

class ChoseVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    

    var mov = ["22","23","24","25","26","27","28","29","30","31","32","33","34","35"]
    var lag = ["Malayalam","Hindi","English","Tamil","Kannada","Telugu","Punjabi","Bengali","Marathi","Sanskrit","Sindhi","Konkani","Gujarati","Kashmiri"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mov.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "CLCVC", for: indexPath)as! CLCVC
        col.img.image = UIImage(named: mov[indexPath.row])
        col.lbl.text = lag[indexPath.row]
        return  col
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 3, height: collectionView.frame.size.width / 3)
    }
    
    @IBAction func nextbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntrestVC")as! IntrestVC
        
        self.navigationController?.pushViewController(nav, animated: true)
        
        
    }
    
    @IBAction func skipbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
