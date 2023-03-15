//
//  MovieVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/11/23.
//

import UIKit
import Kingfisher
import Alamofire

class MovieVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var Nsvw: NSLayoutConstraint!
    @IBOutlet weak var lbl: UILabel!
    var pic = ["51","52","53","54","43","47","48","49","50","46","45","44"]
    
    @IBOutlet weak var imgtiru: UIImageView!
    
    private var model1:Modeldata1?
    private var model2:Modeldata2?
   
    var vc = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("--->>",vc)
        getdata()

    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let col = collectionView.dequeueReusableCell(withReuseIdentifier: "MCVC", for: indexPath)as!  MCVC
        col.imgc.image = UIImage(named: pic[indexPath.row])
        return col
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height / 3 , height: collectionView.frame.size.width / 3)
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        let cell01 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
      
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func morebtn(_ sender: Any) {
        
        if Nsvw.constant == 210{
            Nsvw.constant = 0

        }else{
            Nsvw.constant = 210
        }
    }
    @IBAction func serchbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
    }
    
}


extension MovieVC{
    
    func getdata(){
        
        let url = URLCollection.shareurl.baseurl + "/movie/" + "\(vc)" + URLCollection.shareurl.Endapi
        print(url)
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] datass, issucess, Message in
            
            if issucess == true{
                
                if let datas = datass{
                    
                    do{
                        
                        let value = try JSONDecoder().decode(Modeldata1.self, from: datas)
                        print(value)
//                        
                        model1 = value
//
                        imgtiru.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(model1?.backdropPath ?? "")"))

                        
                    }catch{
                        
                       
                            
                            AF.request(url,method: .get).responseJSON { resp in
                                switch resp.result{
                                    
                                case .success(let sucss):
                                    print(sucss)
                                    
                                    if let value = sucss as? [String:Any] {
                                        imgtiru.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value["backdrop_path"] as? String ?? "")"))
                                    }
                                case .failure(let err):
                                    print(err)
                                }
                            }
                            
                        


                        print("err")
                    }
                    
                }
                
            }
        }
        
        
    }
    
}


