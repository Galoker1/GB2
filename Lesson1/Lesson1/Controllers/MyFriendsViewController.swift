//
//  MyFriendsViewController.swift
//  Lesson1
//
//  Created by Егор  Хлямов on 18.10.2022.
//

import UIKit

class MyFriendsViewController: UITableViewController {
    
    let friends = [
        Friend(image: UIImage.init(named: "group1"), name: "Friend1"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend2"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend3"),
        Friend(image: UIImage.init(named: "group1"), name: "Friend4"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend5"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend6"),
        Friend(image: UIImage.init(named: "group1"), name: "Friend7"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend8"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend9"),
        Friend(image: UIImage.init(named: "group1"), name: "Friend10"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend111"),
        Friend(image: UIImage.init(named: "group2"), name: "Friend1"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCell", for: indexPath) as? MyFriendsCell else{
            preconditionFailure("MyGroupCell cannot")
        }
        
        cell.friendLabel.text = friends[indexPath.row].name
        cell.friendImage.image = friends[indexPath.row].image

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendInfo",
           let destinationVC = segue.destination as? FriendViewController,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let name = friends[indexPath.row].name
            destinationVC.index = indexPath.row
            destinationVC.friends = friends
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
