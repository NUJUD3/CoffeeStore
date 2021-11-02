//
//  SuppliesCellTableViewController.swift
//  Coffee Store
//
//  Created by Nojoud Mohaimmed on 25/03/1443 AH.
//

import UIKit
struct suppliesCell {
    var Title : String
    var desc : String!
    var cost : Double
    var images : UIImage!
    var qunt : String!
}

class SuppliesCellTableViewController: UITableViewController, CartDelegate {
   
    var curIndex = 0
    var cartItemsIndex: [Int] = []
    
    func AddToCart(title: String) {
        cartItemsIndex.append(curIndex)
        UserDefaults.standard.set(cartItemsIndex, forKey: "Cart")
    }
    
    var items : [suppliesCell] = [suppliesCell(Title: "Bottomless Portalter",
                                               cost: 111.55,
                                               images: UIImage(named: "porta")),
                                  suppliesCell(Title: "Wooden Distributor",
                                               cost: 276.00,
                                               images: UIImage(named: "distributor")),
                                  suppliesCell(Title: "Black Sharp Pitcher",
                                               cost: 253.00,
                                               images: UIImage(named: "pithcer Small")),
                                  suppliesCell(Title: "Wooden Tamper",
                                               cost: 213.00,
                                               images: UIImage(named: "tamper Small")),
                                  suppliesCell(Title: "V60 filter",
                                               cost: 59.00,
                                               images: UIImage(named: "filter Small")),
                                  suppliesCell(Title: "Tamping Mat",
                                               cost: 100.00,
                                               images: UIImage(named: "tamping"))]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SuppliesTableViewCell", bundle: nil), forCellReuseIdentifier: "SuppliesCell")
        tableView.rowHeight = 150
        

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
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let suppliescell = tableView.dequeueReusableCell(withIdentifier: "SuppliesCell", for: indexPath) as! SuppliesTableViewCell
        suppliescell.Title.text = items [indexPath.row].Title
        suppliescell.desc.text = items [indexPath.row].desc
        suppliescell.cost.text = String ("\(items[indexPath.row].cost) SR")
        suppliescell.images.image = items[indexPath.row].images
        suppliescell.delegate = self
        curIndex = indexPath.row
        return suppliescell
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
