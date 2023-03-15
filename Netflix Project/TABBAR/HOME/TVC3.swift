//
//  TVC3.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher

class TVC3: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var col: UICollectionView!

    
    private var TVshowdata: Modeltvshow?
    var m: protoTVC3?
    override func awakeFromNib() {
        super.awakeFromNib()
        getdata()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TVshowdata?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC3", for: indexPath)as! CVC3
        
        col.imgc.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(TVshowdata?.results[indexPath.row].posterPath ?? "" )"))
        
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 134)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.m!.datapa(pass: TVshowdata?.results[indexPath.row].id)
    }
}

extension TVC3{
    
    func getdata(){
        
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtvshowurl + URLCollection.shareurl.Endapi
        
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] data, issucss, message in
            
            if issucss == true{
                
                if let datas = data{
                    
                    do{
                        
                     let value = try JSONDecoder().decode(Modeltvshow.self, from: datas)
                            print(value)
                        
                        TVshowdata = value
                        
                        col.reloadData()
                        
                    }catch{
                        print("err")
                    }
                }
                
                
            }
        }
        
        
    }
    
}

protocol protoTVC3{
    func datapa(pass:Int?)
}
