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
    
    var results = [GameScore]()

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadScores()
    }

    func reloadScores(){
        let resultsUD = ScoreProvider.getScores()

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! GameViewController
        target.delegate = self
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell
        cell.dateLabel.text = results[indexPath.row].date
        cell.scoreLabel.text = "\(results[indexPath.row].score)"
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController : ReloadingCollectionView{
    func reload() {
        reloadScores()
    }
}

