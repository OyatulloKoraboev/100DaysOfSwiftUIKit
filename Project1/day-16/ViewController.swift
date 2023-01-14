//
//  ViewController.swift
//  day-16
//
//  Created by Oyatullo Koraboev on 15/01/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures:[String] = []
    var selectedPictureNumber = 0
    var totalPictures = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                
            }
        }
       title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        totalPictures = pictures.count
        selectedPictureNumber = indexPath.row
        cell.textLabel?.text = " Picture  \(selectedPictureNumber) of \(totalPictures)"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

