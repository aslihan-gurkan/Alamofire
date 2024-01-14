//
//  ViewController.swift
//  AlamofireGetData
//
//  Created by Aslıhan Gürkan on 8.01.2024.
//

import UIKit

class ViewController: UIViewController {

    var apiResult = [Model]()
    
    @IBOutlet weak var tableVlew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIHandler.sharedInstance.getData { apiData in
            //Data assigning
            self.apiResult = apiData
            
            DispatchQueue.main.async {
                self.tableVlew.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = apiResult[indexPath.row].title
        return cell
    }
    
}
