//
//  DownVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher

class DownVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var tbl: UITableView!
    private var Trendmovivedata: Modeldata?
//    var movie = ["10","11","12","13","14"]
    override func viewDidLoad() {
        super.viewDidLoad()
mydata()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Trendmovivedata?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath)as! TVC
        
        cell.img.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(Trendmovivedata?.results[indexPath.row].backdropPath ?? "")"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }

    @IBAction func serchbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
    }
}

extension DownVC{
    
    
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
