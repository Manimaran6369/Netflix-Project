//
//  LangVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit

class LangVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    

    var movi = ["22","23","24","25","26","27","28","29","30","31","32","33","34","35"]
    var nam = ["Malayalam","Hindi","English","Tamil","Kannada","Telugu","Punjabi","Bengali","Marathi","Sanskrit","Sindhi","Konkani","Gujarati","Kashmiri"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "ACVC", for: indexPath)as! ACVC
        col.movielbl.text = nam[indexPath.row]
        col.img.image = UIImage(named: movi[indexPath.row])
        
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 2 , height: collectionView.frame.size.width / 2)
    }

    @IBAction func backbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.popViewController(animated: true)
    }
}
