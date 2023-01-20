//
//  TabBarControllerVC2.swift
//  TabBarDemo
//
//  Created by Rachana Pandit on 29/11/22.
//

import UIKit

class TabBarControllerVC2: UIViewController {
    
@IBOutlet weak var tblUserData:UITableView!
var arrayUserData  = [dataOfUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingDataFromAPI()
        tableViewDataSourceAndDelegate()
        registerXib()
    }

    func registerXib()
    {
        let nibName = UINib(nibName: "CellData", bundle: nil)
        tblUserData.register(nibName, forCellReuseIdentifier: "CellData")
    }
    
    func tableViewDataSourceAndDelegate()
    {
        tblUserData.delegate = self
        tblUserData.dataSource = self
    }
    
    func fetchingDataFromAPI()
    {
       let urlString = "https://reqres.in/api/users?page=2"
       let url =  URL(string: urlString)
       var request = URLRequest(url: url!)
       request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        var dataTask = session.dataTask(with: request) { data, response, error in
            
               print(response)
            
               let getJsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
       
        var dataArrayFromJson = NSArray()
            
        dataArrayFromJson = getJsonObject["data"] as! NSArray
        print(dataArrayFromJson)
                
        for dictionary in dataArrayFromJson
        {
            let eachDictionary = dictionary as! [String:Any]
            print(eachDictionary)
            let userId = eachDictionary["id"] as! Int
            let userEmail = eachDictionary["email"] as! String
            let userFirstName = eachDictionary["first_name"] as! String
            let userLastName = eachDictionary["last_name"] as! String
            
            let userAvatar = eachDictionary["avatar"] as! String
            
            self.arrayUserData.append(dataOfUser(id: userId, email: userEmail, FirstName: userFirstName, lastName: userLastName, avatar: userAvatar))
        }
            DispatchQueue.main.async {
            self.tblUserData.reloadData()
            }
      }
        dataTask.resume()
   }
}

extension TabBarControllerVC2:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayUserData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblUserData.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as! CellData
        
        cell.lblId.text = String(self.arrayUserData[indexPath.row].id)
        cell.lblFirstName.text = self.arrayUserData[indexPath.row].FirstName
        
        let image = self.arrayUserData[indexPath.row].avatar
        print(image)
        
        let url = URL(string: image)
        let dataImg = try? Data(contentsOf:url!)
        cell.imgAvatar.image = UIImage(data: dataImg!)
        
        return cell
    }
}
extension TabBarControllerVC2:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "VC3") as! VC3
        nextVC.id = arrayUserData[indexPath.row].id
        nextVC.email =  arrayUserData[indexPath.row].email
        nextVC.firstName = arrayUserData[indexPath.row].FirstName
        nextVC.lastName = arrayUserData[indexPath.row].lastName
        
        nextVC.imgUrl = arrayUserData[indexPath.row].avatar
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        <#code#>
    }
}
