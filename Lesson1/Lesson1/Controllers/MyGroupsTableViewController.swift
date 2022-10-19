//
//  MyGroupsTableViewController.swift
//  Lesson1
//
//  Created by Егор  Хлямов on 17.10.2022.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var groups = [
        Group(image: UIImage.init(named: "group2"), name: "Group1"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group1"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group1"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group1"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
        Group(image: UIImage.init(named: "group2"), name: "Group2"),
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
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupCell", for: indexPath) as? MyGroupCell else{
            preconditionFailure("MyGroupCell cannot")
        }
        
        cell.myGroupLabel.text = groups[indexPath.row].name
        cell.myGroupImage.image = groups[indexPath.row].image

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    // Если была нажата кнопка «Удалить»
        if editingStyle == .delete { // Удаляем город из массива
        groups.remove(at: indexPath.row) // И удаляем строку из таблицы
        tableView.deleteRows(at: [indexPath], with: .fade) }
    }
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue){
        
        if let sourceVC = segue.source as? GlobalGroupsViewController,
           let indexPath = sourceVC.tableView.indexPathForSelectedRow{
            
            let group = sourceVC.groups[indexPath.row]
            if !groups.contains(where: {$0.name == group.name}){
                groups.append(group)
                tableView.reloadData()
            }
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
