//
//  Util.swift
//  cook_book
//
//  Created by Ankan Saha on 12/12/22.
//

import Foundation

class Util: NSObject{
    class func getPath(_ fileName: String) -> String
    {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        print("File URL : \(fileUrl.path)");
        return fileUrl.path
    }
    class func copyDatabase(_ filename: String)
    {
        let dbPath=getPath("recipe_app.db")
        let fileManager=FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file  = bundle?.appendingPathComponent(filename)
            var error:NSError?
            do {
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }
            catch let error1 as NSError{
                error=error1
            }
            if error == nil {
                print("Error In Db")
            }
            else
            {
                print("Probhu")
            }
        }
    }
}
