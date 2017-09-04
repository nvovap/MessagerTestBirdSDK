//
//  TableViewController.swift
//  MassangerTest
//
//  Created by Vladimir Nevinniy on 8/31/17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit
import SendBirdSDK


class TableViewController: UITableViewController {
    
    var groups: [SBDGroupChannel] = [SBDGroupChannel]()
    
    var groupCurrent: SBDGroupChannel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let USER_ID = "+12345678901"
        
        SBDMain.connect(withUserId: USER_ID, completionHandler: { (user, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            
            let query = SBDGroupChannel.createMyGroupChannelListQuery()!
            query.includeEmptyChannel = true
            query.loadNextPage(completionHandler: { (channels, error) in
                if let error = error {
                    NSLog("Error: %@", error);
                    return;
                }
                
                if let channels = channels {
                    for channel in channels {
                        self.groups.append(channel)
                        print(channel.channelUrl)
                    }
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            })
            
        })
        
        
        
        
        
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
        return groups.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let group = groups[indexPath.row]
        
        cell.textLabel?.text = group.name

        return cell
    }
    
    
  
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        groupCurrent = groups[indexPath.row]
        
        //performSegue(withIdentifier: "segueShowMessages", sender: self)
        
        
        if let channel = groupCurrent {
            let vc = GroupChannelChattingViewController(nibName: "GroupChannelChattingViewController", bundle: Bundle.main)
            vc.groupChannel = channel
            
            self.present(vc, animated: false, completion: nil)
        }

        
       
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueShowMessages" {
            if let channel = groupCurrent {
                let previousMessageQuery = channel.createPreviousMessageListQuery()
                previousMessageQuery?.loadPreviousMessages(withLimit: 30, reverse: true, completionHandler: { (messages, error) in
                    if error != nil {
                        NSLog("Error: %@", error!)
                        return
                    }
                    
                    if let vc = segue.destination as? MessageTableViewController, let messages = messages  {
                        vc.messages = messages
                    }
                    
                    
                })
            }
        }
    }
 

}
