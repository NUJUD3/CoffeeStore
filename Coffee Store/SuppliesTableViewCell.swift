//
//  SuppliesTableViewCell.swift
//  Coffee Store
//
//  Created by Nojoud Mohaimmed on 25/03/1443 AH.
//

import UIKit

protocol CartDelegate {
    func AddToCart(desc:String!, cost:String,images:UIImage,qunt:String ,Title: String, index: Int)
}

class SuppliesTableViewCell: UITableViewCell {
    
    var delegate: CartDelegate!
    var cellIndex = 0
    
    var counter = 0
    
    
    @IBOutlet weak var buttonadd: UIButton!
    @IBOutlet weak var Title: UILabel!
  
    @IBAction func increase(_ sender: Any) {
        counter += 1
        qunt.text = String (counter)
    }
    @IBAction func decrease(_ sender: Any) {
        if (counter == 0){
            return qunt.text = String (counter)
        }else{
        counter -= 1
      return qunt.text = String (counter)
        }}
    @IBOutlet weak var qunt: UILabel!
     
    @IBAction func onPress(_ sender: Any) {
    
//        UserDefaults.standard.set(Title.text, forKey: "title")
        
        if let delegate = delegate {
            
            delegate.AddToCart(desc: desc.text!, cost: cost.text! , images: images.image!, qunt: qunt.text!, Title: Title.text!, index: cellIndex)
        }
    }
    
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var images: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
        
//        UserDefaults.standard.object(forKey: "save")
//       let save = UserDefaults.standard.object(forKey: "save")
//           qunt.text = save as? String

        // Configure the view for the selected state
//    }
    
}
