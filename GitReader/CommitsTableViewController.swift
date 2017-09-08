//
//  CommitsTableViewController.swift
//  GitReader
//
//  Created by Emma Khoroshko on 07.09.17.
//  Copyright © 2017 Emma Khoroshko. All rights reserved.
//

import UIKit

class CommitTableView_Cell: UITableViewCell{
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var hashCommit: UILabel!
    @IBOutlet weak var author: UILabel!
    
    
}


class CommitsTableViewController: UITableViewController {
    var commits =  [[String: AnyObject]]()
    var commitString = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog (String(format: "bjh %@", commitString))
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config)
        
        let url = URL(string: commitString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    self.commits = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:AnyObject]]
                        self.tableView.reloadData()
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
        
        
        
    }
        

        
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return commits.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCell", for: indexPath) as! CommitTableView_Cell

        var dict = self.commits[indexPath.row];
        
        var com =  [String: AnyObject]()
        
         com = dict .removeValue(forKey:"commit") as! [String : AnyObject]
         let author = com["author"]
        
         let auth = author?["name"] as AnyObject
        
        let message = com["message"]
        let date = author?["date"] as AnyObject
        let hash = dict .removeValue(forKey:"sha") //не совсем поняла, что такое hash
      
     //   let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"
//        let dateF = dateFormatter.date(from: date as! String) as AnyObject
        cell.author.text = auth as? String
        cell.hashCommit.text = hash as? String
        cell.message.text = message as? String
        cell.date.text = date as? String
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
