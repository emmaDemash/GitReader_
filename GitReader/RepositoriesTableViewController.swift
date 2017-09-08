//
//  RepositoriesTableViewController.swift
//  GitReader
//
//  Created by Emma Khoroshko on 07.09.17.
//  Copyright © 2017 Emma Khoroshko. All rights reserved.
//

import UIKit

class ReposTableView_Cell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var repositorie: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var author: UILabel!
    
}

class RepositoriesTableViewController: UITableViewController {
   
    @IBOutlet var reposTAbleView: UITableView!
    var repos = [[String:AnyObject]]()
    var str = String()
    
    var commits = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.str == "") {
            self.str = "emmaDemash"
        }
//        let networkClass = NetworkConnection()
//        let str = "emmaDemash"
//       networkClass.reposeFromSearchString2(str: str)
//        repos = [networkClass.list]
         // Load configuration into Session
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config)
        var str = String(format: "https://api.github.com/users/%@",self.str)// Load configuration into Session
         str = String(format: "%@%@",str,"/repos")
        let url = URL(string: str)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                     self.repos = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                    self.tableView.reloadData()
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()


        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
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
        return repos.count
    
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reposTAbleView.dequeueReusableCell(withIdentifier:"TableView_Cell", for: indexPath)as! ReposTableView_Cell
        
        var dict = self.repos[indexPath.row];
        let name = dict .removeValue(forKey:"name")
        let descript = dict .removeValue(forKey:"description")
        let auth = dict .removeValue(forKey:"owner")
        let author = auth?["login"]
        let date = dict .removeValue(forKey:"updated_at")
        commits = dict .removeValue(forKey: "url") as! String
        commits = String(format: "%@%@",commits,"/commits")

         NSLog (String(format: "bjh %@", commits))
        cell.title.text = name as? String
        cell.author.text = author as? String
        cell.date.text = date as? String
        cell.repositorie.text = descript as? String
      
        //название, описание, автор, дата последнего изменения
        //cell.title.text = (name as! String)
        
        //https://api.github.com/repos/:owner/:repo/git/refs/heads/:branch

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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //  let dict = self.repos[indexPath.row];
        performSegue(withIdentifier: "Details", sender: indexPath)
        
           }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let commitVC = segue.destination as! CommitsTableViewController
                var dict = self.repos[selectedRow];
                commits = dict .removeValue(forKey: "url") as! String
                commits = String(format: "%@%@",commits,"/commits")
               commitVC.commitString = commits
            
            }
                
        }
    }
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
