//
//  VC3.swift
//  TabBarDemo
//
//  Created by Rachana Pandit on 29/11/22.
//

import UIKit

class VC3: UIViewController {

    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet weak var lblFirstName:UILabel!
    @IBOutlet weak var lblLastName:UILabel!
    @IBOutlet weak var imgAvatar:UIImageView!
    
    // var tag = Int()
     var id = Int()
     var email = String()
     var firstName = String()
     var lastName = String()
     var imgUrl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblId.text = String(id)
        lblEmail.text = email
        lblFirstName.text = firstName
        lblLastName.text = lastName

        let urlFetched = URL(string: imgUrl)
        let dataImg = try? Data(contentsOf: urlFetched!)
        imgAvatar.image = UIImage(data: dataImg!)
    }
    

}
