//
//  GameViewController.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 06/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var counterTimeBefore: UILabel!
    @IBOutlet weak var counterInGame: UILabel!
    @IBOutlet weak var score: UILabel!
    var scoreInGame = 0
    var timeGameStarted : Date?
    var delegate : ReloadingCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countBeforeGame()
    }

    func countBeforeGame(){
        let timer = CountDownTimer(interval: 1.0, time: 3.0, finalWord: "START", label: counterTimeBefore)
        timer.delegate = self
        timer.play()
    }
    
}

extension GameViewController : TriggeringGame{

    func triggerGame() {
        self.counterInGame.isHidden = false
        self.score.isHidden = false
        self.view.backgroundColor = .red
        self.timeGameStarted = .init()

        let timer = CountDownInGame(interval: 0.1, time: 5.0, label: counterInGame)
        timer.delegate = self
        timer.play()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.screenTapped(_:)))
        self.view.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
    }

    @objc func screenTapped(_ tap : UIGestureRecognizer){
        scoreInGame = scoreInGame + 1
        score.text = "\(scoreInGame)"
    }
}

extension GameViewController : TriggeringEndGame{
    func triggerEndGame() {
        let tap = (self.view.gestureRecognizers?.filter(){$0 is UITapGestureRecognizer}.first!)!
        self.view.removeGestureRecognizer(tap)

//        let time = Calendar.current.dateComponents([.hour, .minute, .second], from: timeGameStarted!)
//        let stringTime = "\(time.hour!)" + ":" + "\(time.minute!)" + ":" + "\(time.second!)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let stringTime = dateFormatter.string(from: timeGameStarted!).capitalized
        ScoreProvider.addAndUpdate(newScore: (stringTime, scoreInGame))

        delegate?.reload()
        
        self.dismiss(animated: true, completion: nil)
    }
}

protocol ReloadingCollectionView {
    func reload()
}
