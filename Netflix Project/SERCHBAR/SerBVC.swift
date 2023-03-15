//
//  SerBVC.swift
//  Netflix Project
//
//  Created by Manimaran on 3/3/23.
//

import UIKit

class SerBVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let countryNameArr = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]
    
    var serchcountyry = [String]()
    var serching = false
    var dismiss  = true
    @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var serchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if serching{
            return serchcountyry.count
            
        }else{
            return countryNameArr .count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SerTVC", for: indexPath)as! SerTVC
        if serching{
            cell.textLabel?.text = serchcountyry[indexPath.row]
        }else{
            cell.textLabel?.text = countryNameArr[indexPath.row]
        }
        
        return cell
    }
    
    
    
    @IBAction func dismissbtn(_ sender: Any) {
        
        dismiss(animated: true)
        //
        //        if dismiss{
        //
        //                    let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JonVC")as! JonVC
        //
        //                    dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComingsoonVC")as! ComingsoonVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KidsVC")as! KidsVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviVC2")as! MoviVC2
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as! HomeVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC")as! MovieVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShortVC")as! ShortVC
        //
        //            dismiss(animated: true)
        //        }else if dismiss{
        //
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DownVC")as! DownVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavVC")as! FavVC
        //
        //            dismiss(animated: true)
        //
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaterVC")as! LaterVC
        //
        //            dismiss(animated: true)
        //        }else if dismiss{
        //            let cell = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PoplurVC")as! PoplurVC
        //
        //            dismiss(animated: true)
        //        }
        //
        //    }
    }
}


extension SerBVC:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        serchcountyry = countryNameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        serching = true
        tbl.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        serching = false
        searchBar.text = ""
        tbl.reloadData()
    }
}
