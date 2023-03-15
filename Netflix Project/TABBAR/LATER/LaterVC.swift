//
//  LaterVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher
class LaterVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tbl: UITableView!
    
    
//    var pic = ["18","19","20","21"]
    private var Topratemodel: Modeltoprate?
    override func viewDidLoad() {
        super.viewDidLoad()
        mydata()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Topratemodel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LTVC", for: indexPath)as! LTVC
        cell.img.kf.setImage(with:URL(string: "https://image.tmdb.org/t/p/w500\(Topratemodel?.results[indexPath.row].backdropPath ?? "")"))
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


extension LaterVC{
    
    
    func mydata(){
        
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtoprateurl + URLCollection.shareurl.Endapi
        
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] data, issuss, Message in
            if issuss == true{
                if let datas = data{
                    
                    do{
                        let valu = try JSONDecoder().decode(Modeltoprate.self, from: datas)
                        print(valu)
                        Topratemodel = valu
                        tbl.reloadData()
                    }catch{
                        
                        print("err")
                    }
                }
            }
        }
        
        
    }
    
}
