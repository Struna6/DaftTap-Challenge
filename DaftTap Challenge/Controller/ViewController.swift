//
//  ViewController.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 06/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var results = [GameResult]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadScores()
    }

    func reloadScores(){
        if let resultsUD = UserDefaults.standard.array(forKey: "results") as? [GameResult]{
            if resultsUD.count > 0{
                results = resultsUD
                collectionView.delegate = self
                collectionView.dataSource = self
            }else{
                collectionView.delegate = nil
                collectionView.dataSource = nil
            }
            collectionView.reloadData()
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell
        cell.dateLabel.text = "\(results[indexPath.row].date)"
        cell.scoreLabel.text = "\(results[indexPath.row].score)"
        return cell
    }


}

//extension ViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return results.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")!
//        cell.textLabel?.text = "\(results[indexPath.row])"
//        return cell
//    }
//}

