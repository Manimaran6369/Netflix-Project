//
//  TVC2.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher

class TVC2: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var col: UICollectionView!

    var k : protoTVC2?
    
    private var Topratemodel: Modeltoprate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        getdata()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Topratemodel?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC2", for: indexPath)as! CVC2
      
        col.imgb.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Topratemodel?.results[indexPath.row].backdropPath ?? "" )"))
        return col
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 134)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        p.tato(tass: Topratemodel?.results[indexPath.row].id)
//        p.datapass(pass: Topratemodel?.results[indexPath.row].id )
        self.k?.datapas(pass: Topratemodel?.results[indexPath.row].id)
    
        
    }
}


extension TVC2{
    
    func getdata(){
        
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtoprateurl + URLCollection.shareurl.Endapi
        
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] data, issucess, message in
            
            if issucess == true{
                
                if let datas = data{
                    
                    do{
                        
                        let value = try JSONDecoder().decode(Modeltoprate.self, from: datas)
                        print(value)
                        
                        Topratemodel = value
                        col.reloadData()
                        
                        
                    }catch{
                        print("err")
                    }
                    
                }
                
            }
        }
        
        
    }
    
}

protocol protoTVC2{
    func datapas(pass:Int?)
}
