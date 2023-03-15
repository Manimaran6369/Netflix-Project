//
//  ComingsoonVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/12/23.
//

import UIKit
import Kingfisher

class ComingsoonVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var movi = ["22","23","24","25"]
    
    var morbtn = [Int]()
    
    @IBOutlet weak var tbl: UITableView!
    
    
    var mydata = String()
   
    private var Trendmovivedata: Modeldata?
    private var Topratemodel: Modeltoprate?
    private var TVshowdata: Modeltvshow?
    

    override func viewDidLoad() {
        super.viewDidLoad()
              getdata()
        tbl.rowHeight = 576
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if mydata ==  "/trending/all/day"{
            return Trendmovivedata?.results.count ?? 0
        }else if  mydata == "/movie/top_rated"{
            return Topratemodel?.results.count ?? 0
        }else if mydata == "/tv/popular" {
            return TVshowdata?.results.count ?? 0
        }else{
            return Trendmovivedata?.results.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComTVC1", for: indexPath)as! ComTVC1
        
        if mydata ==  "/trending/all/day"{
            cell.imgT.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Trendmovivedata?.results[indexPath.row].posterPath ?? "")"))
            
           
            
        }else if mydata == "/movie/top_rated"{
            cell.imgT.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Topratemodel?.results[indexPath.row].backdropPath ?? "")"))
            
        
            
        }else if mydata == "/tv/popular" {
            cell.imgT.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(TVshowdata?.results[indexPath.row].posterPath ?? "")"))
            
           
        }else{
            cell.imgT.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Trendmovivedata?.results[indexPath.row].posterPath ?? "")"))
            
        }
        if morbtn.contains(indexPath.row){
            cell.MorVW.isHidden = false
        }else{
            cell.MorVW.isHidden = true
        }
        cell .Morebtn.tag = indexPath.row
       return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if morbtn.contains(indexPath.row){
            return 530
        }else{
            return 220
        }
    }

    
    @IBAction func backbtn(_ sender: Any) {
        
        let cell00 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Morbtn(_ sender: UIButton) {
        if morbtn.contains(sender.tag){
            let num = morbtn.lastIndex(of: sender.tag)
            print(num!)
            morbtn.remove(at: num ?? 0)
            print(morbtn)
           
        }else{
            morbtn.append(sender.tag)
            print(morbtn)
        }
        tbl.reloadData()
        
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        
        let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        self.navigationController?.present(cell, animated: true)
    }
}
    

extension ComingsoonVC{


     func getdata(){

        let url = URLCollection.shareurl.baseurl + "\(mydata)" + URLCollection.shareurl.Endapi

         Networking.Sharednetwork.callapi(url: url, method: .get) { [self] dataresponce, issucss, Message in

            if issucss == true{

                if let datas = dataresponce{

                    do{
                        if mydata ==  "/trending/all/day"{
                            let value = try JSONDecoder().decode(Modeldata.self, from: datas)

                            print(value)

                            Trendmovivedata = value
                            
                        }else if mydata == "/movie/top_rated"{
                            let value = try JSONDecoder().decode(Modeltoprate.self, from: datas)
                            
                            Topratemodel = value
                            
                        }else if mydata == "/tv/popular"{
                            let value = try JSONDecoder().decode(Modeltvshow.self, from: datas)
                            
                          TVshowdata = value
                        }else{
                            let value = try JSONDecoder().decode(Modeldata.self, from: datas)

                            print(value)

                            Trendmovivedata = value
                        }
                        tbl.reloadData()
                        
                    }catch{
                        print("err")
                    }
                }
            }
        }
    }

}


extension ComingsoonVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "ComCVC", for: indexPath)as! ComCVC
        col.imgc.image = UIImage(named: movi[indexPath.row])
        return col
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height / 3, height: collectionView.frame.size.width / 3)
    }
}
