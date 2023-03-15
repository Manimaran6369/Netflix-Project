//
//  HomeVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher
import Alamofire

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource,protoTVC1, protoTVC2,protoTVC3{
    
    var tiruimg = 0
    
    func datapa(pass: Int?) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC")as! MovieVC

        nav.vc = pass!
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func datapas(pass: Int?) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC")as! MovieVC

        nav.vc = pass!
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
  
    
    func datapass(pass: Int?) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC")as! MovieVC

        nav.vc = pass!
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    @IBOutlet weak var Dimage: UIImageView!
    
    
    private var Trendmovivedata: Modeldata?

    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(animicount), userInfo: nil, repeats: true)
        
    }
    
    
   @objc func animicount(){
    
       if tiruimg <= 19{
           tiruimg += 1
           if tiruimg == 20{
               tiruimg = 0
           }
       }
        
      getdata()
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC1", for: indexPath)as! TVC1
            cell.p = self
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC2", for: indexPath)as! TVC2
            
            cell.k = self
            return cell
        }else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC3", for: indexPath)as! TVC3
            cell.m = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVC1", for: indexPath)as! TVC1
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 200
        }else if indexPath.section == 1{
            return 184
        }else if indexPath.section == 2{
            return 200
        }else{
            return 200
        }
        
        
    }
    
    

    @IBAction func watchbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC")as! MovieVC
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
 
    @IBAction func Trendingmoviemorebtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComingsoonVC")as!  ComingsoonVC
        
        nav.mydata =  "/trending/all/day"
        
        self.navigationController?.pushViewController(nav, animated: true)
        
    }
    @IBAction func Topratebtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComingsoonVC")as!  ComingsoonVC
        
        nav.mydata = "/movie/top_rated"
        
        self.navigationController?.pushViewController(nav, animated: true)
        
    }
    @IBAction func Tvshow(_ sender: Any) {

        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComingsoonVC")as!  ComingsoonVC
        
        nav.mydata = "/tv/popular"
        
        self.navigationController?.pushViewController(nav, animated: true)
        
        
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
        
    }
}

extension HomeVC{
    
    
     func getdata(){
         
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtrendingmovie + URLCollection.shareurl.Endapi
        
         Networking.Sharednetwork.callapi(url: url, method: .get) { [self] dataresponce, issucss, message in
           
            if issucss == true{
                
                if let datas = dataresponce{
                    
                    do{
                        let value = try JSONDecoder().decode(Modeldata.self, from: datas)
                        
                        print(value)
                        
                        Trendmovivedata = value
                        Dimage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(value.results[tiruimg].backdropPath )"))

                       
                        
                    }catch{
                        print("err")
                    }
                }
            }
        }
    }
    
}
