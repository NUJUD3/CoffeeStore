//
//  coffeeTableViewController.swift
//  Coffee Store
//
//  Created by Nojoud Mohaimmed on 25/03/1443 AH.
//

import UIKit

struct coffee {
    var Title : String
    var desc : String!
    var cost : Double
    var images : UIImage!
    var qunt : String!
}

class coffeeTableViewController: UITableViewController, CartDelegate {
  
    var curtIndex = 0
    var cartItem = [coffee]()
    
    func AddToCart(desc: String!, cost: String, images: UIImage, qunt: String, Title: String, index: Int) {
        spcialtyCoffee[index].qunt = qunt
        cartItem.append(spcialtyCoffee[index])
    }
    
    var spcialtyCoffee = [coffee(Title: "شارع القدية",
                                 desc: "500g محمصة الرياض",
                                 cost: 120.00,
                                 images: UIImage(named: "ged Small")),
                         coffee(Title: "خلطة جبل طويق",
                                desc: "500g محمصة الرياض",
                                cost: 120.00,
                                images: UIImage(named: "Tuwiq Small")),
                          coffee(Title: "شارع الشميسي",
                                 desc: "250g محمصة الرياض",
                                 cost: 72.00,
                                 images: UIImage(named: "shumisi Small")),
                          coffee(Title: " اثيوبيا شالا ",
                                 desc: "250g محمصة أكتوبر",
                                 cost: 57.00,
                                 images: UIImage(named: "chal Small")),
                          coffee(Title: "هامبيلا",
                                 desc: "250g محمصة أكتوبر",
                                 cost: 63.00,
                                 images: UIImage(named: "Hamp Small")),
                          coffee(Title: "شيربيسا",
                                 desc: "250g محمصة أكتوبر",
                                 cost: 60.00,
                                 images: UIImage(named: "cher Small")),
                          coffee(Title: "سيلفادور",
                                 desc: "250g محمصة كفّه",
                                 cost: 46.00,
                                 images: UIImage(named: "selfador Small")),
                          coffee(Title: "كيانزا",
                                 desc: "250g محمصة كفّه",
                                 cost: 54.00,
                                 images: UIImage(named: "kyanza Small")),
                          coffee(Title: "واكو",
                                 desc: "250g محمصة كفّه",
                                 cost: 59.00,
                                 images: UIImage(named: "wako Small"))
    ]
    
    
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
        return spcialtyCoffee.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coffeeCell = tableView.dequeueReusableCell(withIdentifier: "SuppliesCell", for: indexPath)as! SuppliesTableViewCell
        coffeeCell.Title.text = spcialtyCoffee[indexPath.row].Title
        coffeeCell.desc.text = spcialtyCoffee [indexPath.row].desc
        coffeeCell.cost.text = String ("\(spcialtyCoffee[indexPath.row].cost) SR")
        coffeeCell.images.image = spcialtyCoffee[indexPath.row].images
        coffeeCell.delegate = self
        coffeeCell.cellIndex = indexPath.row
        return coffeeCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        curtIndex = indexPath.row
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "coffeeID") {
                let secCartVC = segue.destination as! SecCartTableViewController
                secCartVC.cart = cartItem
            }
    }
}
