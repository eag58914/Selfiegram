//
//  SelfieStore.swift
//  Selfiegram
//
//  Created by Elco Garcia on 2/5/20.
//  Copyright © 2020 Elco Garcia. All rights reserved.
//

import Foundation
import UIKit.UIImage



class Selfie : Codable
{
    //when it was created
    let created : Date
    //A unique UD, used to link this selfie to its image on disk
    let id : UUID
    
    var title = "New Selfie!"
    
    var image : UIImage?
    {
        get
        {
            return SelfieStore.shared.getImage(id: self.id)
        }
        set
        {
            try? SelfieStore.shared.setImage(id: self.id, image: newValue)
        }
    }
   init(title: String)
   {
       self.title = title
       self.created = Date()
       self.id = UUID()
   }
}
//we can now throw error when needed
enum SelfieStoreError : Error
{
    case cannotSaveImage(UIImage?)
}

//singleton design for the selfie store

final class SelfieStore
{
    //makin a static property to use for other parts of the app to access functionality
    static let shared = SelfieStore()
    //gets image by ID, will be cached in memory for future lookups
    func getImage(id:UUID) -> UIImage?
    {
        return nil
    }
    func setImage(id:UUID, image: UIImage?)throws
    {
        throw  SelfieStoreError.cannotSaveImage(image)
    }
    //returns a list of selfie obejcts in a array
    func listSelfies()throws -> [Selfie]
    {
        return []
    }
    
    func delete(selfie: Selfie) throws
    {
        throw SelfieStoreError.cannotSaveImage(nil)
    }
    func delete(id:UUID)throws
    {
        throw SelfieStoreError.cannotSaveImage(nil)
    }
    //this is to load in the selfie from disk
    //paramter is the id  you want to load in from  the disk
    func load(id:  UUID) -> Selfie?
    {
        return nil
    }
    
    func save(selfie: Selfie) throws
    {
        throw SelfieStoreError.cannotSaveImage(nil)
    }
    
}




