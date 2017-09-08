//
//  NetworkConnection.swift
//  GitReader
//
//  Created by Emma Khoroshko on 07.09.17.
//  Copyright © 2017 Emma Khoroshko. All rights reserved.
//

import UIKit


class NetworkConnection: NSObject {
    
    var list = [String:AnyObject]()

    
//    func reposeFromSearchString(str:NSString ) -> NSArray {
//        
//        let str = String(format: "https://api.github.com/search/repositories?q=%@",str)
//        
//        let url = NSURL( string:str)
//        let dataSearch = Data(contentsOf: url! as URL)
//        
//        let searshDic = [JSONSerialization .jsonObject(with: dataSearch, options: JSONSerialization.ReadingOptions)
//    }
//    
  
   
//    func reposeFromSearchString2(str: String) {
//        let config = URLSessionConfiguration.default // Session Configuration
//        let session = URLSession(configuration: config)
//        let str = String(format: "https://api.github.com/users/emmaDemash")// Load configuration into Session
//        let url = URL(string: str)!
//        
//        let task = session.dataTask(with: url, completionHandler: {
//            (data, response, error) in
//            
//            if error != nil {
//                
//                print(error!.localizedDescription)
//                
//            } else {
//                
//                do {
//                    
//                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
//                    {
//                        
//                        //Implement your logic
//                        print(json)
//                        
//                    }
//                    
//                } catch {
//                    
//                    print("error in JSONSerialization")
//                    
//                }
//                
//                
//            }
//            
//        })
//        task.resume()
//        
//        
//        
//        
 
//   URLSession.shared.dataTask(with: url!, completionHandler: {
//        (data, response, error) in
//        
//        if error != nil {
//            
//            print(error!.localizedDescription)
//            
//        } else {
//            
//            do {
//                
//                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
//                {
//                   self.list = json as [String : AnyObject]
//                    //var nestedMutableArray: NSMutableArray = []
//                   
//                    //Implement your logic
//                    print(self.list)
//                    
//                }
//                
//            } catch {
//                
//                print("error in JSONSerialization")
//                
//            }
//       }
//    
//    
//        
//    }).resume()
//    
//        
//        
//        
        
        
  //  }

}
