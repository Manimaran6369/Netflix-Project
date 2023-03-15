//
//  FavVC.swift
//  Netflix Project
//
//  Created by Manimaran on 2/10/23.
//

import UIKit
import Kingfisher

class FavVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var tbl: UITableView!
    private var TVshowdata: Modeltvshow?
   
    
    var imgdata = [UIImage]()
    var like = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
mydata()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TVshowdata?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "FTVC", for: indexPath)as! FTVC
        cell.img.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(TVshowdata?.results[indexPath.row].backdropPath ?? "")"))
        
        
//        let img = coredata.fetchdata[indexPath.row].images as? NSData
//        imgdata.append(UIImage(data: img as! Data)!)
//        cell.img.image = imgdata[indexPath.row]
        
        cell.likebtn.tag = indexPath.row
        if !like.contains(indexPath.row){
            cell.likeimage.image = UIImage(named: "heart" )
        }else{
            cell.likeimage.image = UIImage(named: "heartfill" )
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    @IBAction func likebttn(_ sender: UIButton) {
        
        if !like.contains(sender.tag){
            like.append(sender.tag)
        }else{
            let count = like.lastIndex(of: sender.tag)
            like.remove(at: count ?? 0)
        }
        tbl.reloadData()
        print(like)
    }
    
    @IBAction func serchbtn(_ sender: Any) {
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SerBVC")as! SerBVC
        
        
        self.navigationController?.present(nav, animated: true)
    }
    
}
extension FavVC{
    
    
    func mydata(){
        
        let url = URLCollection.shareurl.baseurl + URLCollection.shareurl.Tailtvshowurl + URLCollection.shareurl.Endapi
        
        Networking.Sharednetwork.callapi(url: url, method: .get) { [self] data, issuss, Message in
            if issuss == true{
                if let datas = data{
                    
                    do{
                        let valu = try JSONDecoder().decode(Modeltvshow.self, from: datas)
                        print(valu)
                        TVshowdata = valu
                        tbl.reloadData()
                    }catch{
                        
                        print("err")
                    }
                }
            }
        }
        
        
    }
    
}
