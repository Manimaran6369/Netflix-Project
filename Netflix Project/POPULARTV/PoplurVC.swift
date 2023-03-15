//
//  PoplurVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/18/23.
//

import UIKit
import Kingfisher

class PoplurVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
//    var flim = ["14","15","16","17"]
    @IBOutlet weak var tbl: UITableView!
    private var Trendmovivedata: Modeldata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
mydata()
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Trendmovivedata?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "PoTVC", for: indexPath)as! PoTVC
        
        cell.img.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Trendmovivedata?.results[indexPath.row].posterPath ?? "")"))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    @IBAction func backbtn(_ sender: Any) {
        let cellui = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
        
    }
    
    
}


extension PoplurVC{
    
    
    func mydata(){
        
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtrendingmovie + URLCollection.shareurl.Endapi
        
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] data, issuss, Message in
            if issuss == true{
                if let datas = data{
                    
                    do{
                        let valu = try JSONDecoder().decode(Modeldata.self, from: datas)
                        print(valu)
                        Trendmovivedata = valu
                        tbl.reloadData()
                    }catch{
                        
                        print("err")
                    }
                }
            }
        }
        
        
    }
    
}
