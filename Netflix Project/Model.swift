//
//  Model.swift
//  Netflix Project
//
//  Created by Manimaran on 2/18/23.
//

import Foundation
import UIKit
import CoreData


class Modle{
    
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    
    var fetchdata = [Entity]()
    func save(Name:String,Password:String,Emailid:String){
        let user = Entity(context: context)
        user.password = Password
        user.username = Name
        user.emailid = Emailid
        
            
        do{
            try context.save()
            print("ok")
        }catch{
            print("erro")
        }
    }
    func fetch(){
        do{
            let result = try context.fetch(Entity.fetchRequest())
            fetchdata = result
        }catch{
            print("error")
        }
        
    }
    
}

    
    


