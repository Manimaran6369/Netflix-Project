//
//  TVC1.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher

class TVC1: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var col: UICollectionView!
    private var Trendmovivedata: Modeldata?
    
 
    var p:protoTVC1?
    
    var fruit = ["1","2","3"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        getdata()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Trendmovivedata?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC1", for: indexPath)as! CVC1
        
        col.imga.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Trendmovivedata?.results[indexPath.row].posterPath ?? "")"))
        return col
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 134)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.p!.datapass(pass: Trendmovivedata?.results[indexPath.row].id )
        col.reloadData()
        
    }
}

extension TVC1{
    
    
     func getdata(){
         
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtrendingmovie + URLCollection.shareurl.Endapi
        
         Networking.Sharednetwork.callapi(url: url, method: .get) { [self] dataresponce, issucss, message in
           
            if issucss == true{
                
                if let datas = dataresponce{
                    
                    do{
                        let value = try JSONDecoder().decode(Modeldata.self, from: datas)
                        
                        print(value)
                        
                        Trendmovivedata = value
                        col.reloadData()
                        
                    }catch{
                        print("err")
                    }
                }
            }
        }
    }
    
}


protocol protoTVC1{
    func datapass(pass:Int?)
}
