//
//  Coffee Store
//
//  Created by Nojoud Mohaimmed on 25/03/1443 AH.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    @IBAction func deletAll(_ sender: Any) {
        cartItems.removeAll()
        tableView.reloadData()
    }
    @IBOutlet var cart: UITableView!
    
    var cartItems = [coffee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SuppliesTableViewCell", bundle: nil), forCellReuseIdentifier: "SuppliesCell")
        tableView.rowHeight = 150
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return cartItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let suppliescell = tableView.dequeueReusableCell(withIdentifier: "SuppliesCell", for: indexPath) as! SuppliesTableViewCell
        suppliescell.Title.text = cartItems[indexPath.row].Title
        suppliescell.desc.text = cartItems[indexPath.row].desc
        suppliescell.cost.text = String ("\(cartItems[indexPath.row].cost) SR")
        suppliescell.images.image = cartItems[indexPath.row].images
        suppliescell.qunt.text = String (cartItems[indexPath.row].qunt)
        suppliescell.buttonadd.isHidden = true
        return suppliescell
    
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
            
            cartItems.remove(at: indexPath.row)
            tableView.reloadData()
           
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
}
