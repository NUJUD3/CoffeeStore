//
//  SecCartTableViewController.swift
//  Coffee Store
//
//  Created by Nojoud Mohaimmed on 27/03/1443 AH.
//

import UIKit

class SecCartTableViewController: UITableViewController {
    
    @IBAction func deleteAll(_ sender: Any) {
        cart.removeAll()
        tableView.reloadData()
    }
    @IBOutlet var secCart: UITableView!
    
    var cart = [coffee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SuppliesTableViewCell", bundle: nil), forCellReuseIdentifier: "SuppliesCell")
        tableView.rowHeight = 150

        print (cart.count)
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cart.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coffeeCell = tableView.dequeueReusableCell(withIdentifier: "SuppliesCell", for: indexPath)as! SuppliesTableViewCell
        coffeeCell.Title.text = cart[indexPath.row].Title
        coffeeCell.desc.text = cart [indexPath.row].desc
        coffeeCell.cost.text = String ("\(cart[indexPath.row].cost) SR")
        coffeeCell.images.image = cart[indexPath.row].images
        coffeeCell.qunt.text = String (cart[indexPath.row].qunt)
        return coffeeCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cart.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    

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

}
