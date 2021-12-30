//
//  myTableViewController.swift
//  homework2
//
//  Created by Alex Epstein on 2/11/20.
//  Copyright © 2020 Alex Epstein. All rights reserved.
//

import UIKit


class myTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    
    @IBOutlet weak var changePicture: UIImageView!
    
    var cryptoName:String!
    var cryptoPrice:String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class myTableViewController: UITableViewController {
    
    
    struct all: Codable {
        var cryptocurrenciesList: [crypto]
    }
    
    struct crypto: Codable {
        var name:String
        var ticker:String
        var price:Double
        var changes:Double
    }
    
    var allCrypto: all?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 80

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        getAllData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getAllData() {
                let mySession = URLSession(configuration: URLSessionConfiguration.default)
        
                let url = URL(string: "https://financialmodelingprep.com/api/v3/cryptocurrencies")!
               // 2
               // 3. MAKE THE HTTPS REQUEST task
               //
                let task = mySession.dataTask(with: url) { data, response, error in

                           // ensure there is no error for this HTTP response
                           guard error == nil else {
                               print ("error: \(error!)")
                            DispatchQueue.main.async {
                                               let alert = UIAlertController(title: "Error", message: "Could not connect to the internet.", preferredStyle: .alert)
                                               
                                               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                                               self.present(alert, animated: true)
                                           }
                               return
                           }

                           // ensure there is data returned from this HTTP response
                           guard let jsonData = data else {
                               print("No data")
                               return
                           }
                           
                           print("Got the data from network")
               // 4. DECODE THE RESULTING JSON
               //
                           let decoder = JSONDecoder()

                           do {
                               // decode the JSON into our array of todoItem's
                               self.allCrypto = try decoder.decode(all.self, from: jsonData)
                                       
                               DispatchQueue.main.async {
                                   self.tableView.reloadData()
                               }
                               
                           } catch {
                               print("JSON Decode error")
                           }
                       }

                   // actually make the http task run.
                   task.resume()
               
           }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCrypto?.cryptocurrenciesList.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Today's Crypto Values"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! myTableViewCell
        
        if let crypto = allCrypto {
            cell.tickerLabel.text = crypto.cryptocurrenciesList[indexPath.row].ticker
            cell.changeLabel.text = "$" + String(crypto.cryptocurrenciesList[indexPath.row].changes)
            
            cell.nameLabel.text = crypto.cryptocurrenciesList[indexPath.row].name
            cell.cryptoName = crypto.cryptocurrenciesList[indexPath.row].name
            cell.cryptoPrice = "$" + String(crypto.cryptocurrenciesList[indexPath.row].price)
            
        
            if crypto.cryptocurrenciesList[indexPath.row].changes > 0{
                
                cell.changePicture.image=UIImage(named: "increase")
                cell.backgroundColor = .green
            } else{
                cell.changePicture
                    .image=UIImage(named: "decrease")
                cell.backgroundColor = .red
                
            }
            
        }
        
      
        
        return cell
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! focusViewController
        let myRow = tableView!.indexPathForSelectedRow
        let myCurrCell = tableView!.cellForRow(at: myRow!) as! myTableViewCell
       
        destVC.nameText = myCurrCell.cryptoName!
        destVC.tickerText = (myCurrCell.tickerLabel!.text)!
        destVC.priceText = String(myCurrCell.cryptoPrice!)
        destVC.changeText = (myCurrCell.changeLabel!.text)!
        destVC.changeImage = (myCurrCell.changePicture!.image)!
        
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
            // Delete the row from the data source
            //allCrypto.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
   // override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

   // }
    

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
