//
//  ViewController.swift
//  TTT Game
//
//  Created by Ryan Lewis on 01/03/2018.
//  Copyright © 2018 Ryan Lewis. All rights reserved.
//

import UIKit
import AVFoundation

var activePlayer = 1 // game starts with x as the first player
var gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] //creates a clear 4x4 grid
//the players score counts
var xcount = 0
var ocount = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var resetbtn: UIButton!
    
    @IBOutlet weak var gameWinner: UILabel!
    @IBOutlet weak var xwins: UILabel!
    @IBOutlet weak var owins: UILabel!
    @IBOutlet weak var playerNamex: UILabel!
    @IBOutlet weak var playerNameo: UILabel!
    
    @IBOutlet weak var xCountdown: UILabel!
    @IBOutlet weak var oCountdown: UILabel!
    
    var totalTime = 10
    var xtimer = Timer()
    var otimer = Timer()
    var player: AVAudioPlayer?
    
    //array of all the possible winning combinations
    let winningCombinations = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],[0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],[0,5,10,15],[3,6,9,12]]
    var gameActive = true
    
    //when any of the buttons in the grid is pressed
    @IBAction func ButtonPress(_ sender: UIButton)
    {
        if (gameState[sender.tag-1] == 0 && gameActive == true) {
            //if there is a space on the grid, place the current players nought or cross in that space
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1){
                sender.setImage(UIImage(named:"Cross.jpg"), for: UIControlState())
                activePlayer = 2
            }
            else{
                sender.setImage(UIImage(named:"Nought.jpg"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        //loop through to find if the the game state matches any of the winning combinations
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[3]]
            {
                //if there is a winning combination set the game to stop
                gameActive = false
                
                //if player x wins
                if gameState[combination[0]] == 1{
                    gameOver() //call gameOver function which stops the timers and hides them
                    gameWinner.text = playerxName + " Wins!" //displays that player x has won the game
                    //displays the lable and the buttons
                    gameWinner.isHidden = false
                    btnPlay.isHidden = false
                    resetbtn.isHidden = false
                    xcount = xcount + 1 //adds 1 to the score of Player x
                    xwins.text = ("Score " + String(xcount)) //updates the score in the lable
                    //loops through the buttons by tag number
                    for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
                    {
                        let button = view.viewWithTag(i) as! UIButton
                        //disables interaction with the buttons
                        button.isUserInteractionEnabled = false
                    }
                //if player o wins
                }else if gameState[combination[0]] == 2{
                    gameOver() //call gameOver function which stops the timers and hides them
                    gameWinner.text = playeroName + " Wins!" //displays that player o has won the game
                    //displays the lable and the buttons
                    gameWinner.isHidden = false
                    btnPlay.isHidden = false
                    resetbtn.isHidden = false
                    ocount = ocount + 1 //adds one to the score of Player o
                    owins.text = (String(ocount) + " Score") //updates the score in the lable
                    //loops through the buttons by tag number
                    for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
                    {
                        let button = view.viewWithTag(i) as! UIButton
                        //disables interaction with the buttons
                        button.isUserInteractionEnabled = false
                    }
                    
                }
            }
        }
        if gameActive == false {
            //if there has been a winning result call the checkStatus function
            checkStatus()
        }
        else {
            //loop through the game state
            for i in gameState
            {
                if i == 0
                {
                    //if there is still 0's in game state then the game is still active
                    gameActive = true
                    break
                }
                else {
                    gameActive = false
                }
            }
            if gameActive == false
            {
                //if game is finished call the gameOver function
                gameOver()
                gameWinner.text = "Game is a draw" //change the lable to let the players know that the game ended as a draw
                //makes the lable and button visible
                gameWinner.isHidden = false
                btnPlay.isHidden = false
                if (xcount == 0 && ocount == 0) {
                    //if the scores are at 0 hide the reset score button
                    resetbtn.isHidden = true
                } else {
                    //if not make the reset button visible
                    resetbtn.isHidden = false
                }
                //loops through the buttons by tag number
                for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
                {
                    let button = view.viewWithTag(i) as! UIButton
                    //disables interaction with the buttons
                    button.isUserInteractionEnabled = false
                }
            }
            checkStatus() //call the checkStatus function
        }
    }
    
    //when the play again button is pressed
    @IBAction func playAgain(_ sender: Any) {
        //resets the game state to make the grid clear ready for a new game
        gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        //loops through the buttons by tag number
        for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
        {
            let button = view.viewWithTag(i) as! UIButton
            //clears the images from the buttons
            button.setImage(nil, for: UIControlState())
            //enables user interaction with the buttons
            button.isUserInteractionEnabled = true
        }
        //hide the button and label
        btnPlay.isHidden = true
        gameWinner.isHidden = true
        //makes the game active
        gameActive = true
        //sets the active player to 1
        activePlayer = 1
        //goes back to the start screen
        performSegue(withIdentifier: "playAgain", sender: self)
    }
    
    //when the reset button is pressed
    @IBAction func reset(_ sender: UIButton) {
        //sets the scores back to 0
        xcount = 0
        ocount = 0
        //updates the lables with the scores
        xwins.text = ("Score " + String(xcount))
        owins.text = (String(ocount) + " Score")
        //hides the reset button
        resetbtn.isHidden = true
    }
    
    func startxTimer() {
        totalTime = 10 //resets the timer back to 10 seconds
        //timer that after 1 second calls the updstexTime function and also repeats every second
        xtimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatexTime), userInfo: nil, repeats: true)
    }
    
    @objc func updatexTime() {
        //updates the label with the total time left
        xCountdown.text = "\(xtimeFormatted(totalTime))"
        //shows the timer
        xCountdown.isHidden = false
        if totalTime != 0 {
            //if the total time is not yet at 0 take away 1 from the total time
            totalTime -= 1
            if (totalTime == 2 || totalTime == 1 || totalTime == 0) {
                //when the timer is down to the last 3 seconds play the beep sound
                playSound()
            }
        } else {
            //when the timer gets to 0 end the timer and change the active player
            endxTimer()
            activePlayer = 2
        }
    }
    
    func endxTimer() {
        xtimer.invalidate() //stop the timer
        xCountdown.isHidden = true //hide the timer lable
        performSegue(withIdentifier: "backtoquiz", sender: self) //segue back to the quiz controller
    }
    
    func xtimeFormatted(_ totalSeconds: Int) -> String {
        //this function formats the time ready to be displayed
        let seconds: Int = totalSeconds % 11
        return String(seconds)
    }
    
    func startoTimer() {
        //sets the total time to 10 seconds
        totalTime = 10
        //timer that after 1 second calls the updstexTime function and also repeats every second
        otimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateoTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateoTime() {
        //updates the lable with the total time
        oCountdown.text = "\(otimeFormatted(totalTime))"
        //displays the timer label
        oCountdown.isHidden = false
        if totalTime != 0 {
            //if the total time is not yet at 0 take away 1 from the total time
            totalTime -= 1
            if (totalTime == 2 || totalTime == 1 || totalTime == 0) {
                //when the timer is down to the last 3 seconds play the beep sound
                playSound()
            }
        } else {
            //when the timer gets to 0 end the timer and change the active player
            endoTimer()
            activePlayer = 1
        }
    }
    
    func endoTimer() {
        otimer.invalidate() //stop the timer
        oCountdown.isHidden = true //hide the timer label
        performSegue(withIdentifier: "backtoquiz", sender: self) //segue back to the quiz controller
    }
    
    func otimeFormatted(_ totalSeconds: Int) -> String {
        //this function formats the time ready to be displayed
        let seconds: Int = totalSeconds % 11
        return String(seconds)
    }
    
    func checkStatus () {
        if gameActive == false {
            //when game is inactive call the game over function
            gameOver()
        }
        else {
            //check the current player and end their timer
            if activePlayer == 1 {
                endoTimer()
            }
            else {
                endxTimer()
            }
        }
    }
    
    func gameOver() {
        //stop and hide all the timers and timer labels
        xtimer.invalidate()
        xCountdown.isHidden = true
        otimer.invalidate()
        oCountdown.isHidden = true
    }
    
    func playSound() {
        //create the reference to the sound file
        guard let url = Bundle.main.url(forResource: "beep", withExtension: "mp3") else { return }
        
        //create the audio clip and play it
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }
            
            player.play()
            
        } catch let error { //catch any errors that occur
            print(error.localizedDescription)
        }
    }
    
    //when this controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        var gameButton = 0 //gameState array key
        //loop through the buttons by the tag
        for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
        {
            let button = view.viewWithTag(i) as! UIButton
            //check the gamestate
            if gameState[gameButton] == 1 {
                //if an x has been placed previously then present an x on that button
                button.setImage(UIImage(named:"Cross.jpg"), for: UIControlState())
                button.isUserInteractionEnabled = false
            }
            else if gameState[gameButton] == 2 {
                //if an o has been placed previously then present an o on that button
                button.setImage(UIImage(named:"Nought.jpg"), for: UIControlState())
                button.isUserInteractionEnabled = false
            }
            else {
                //if anything else make that button blank
                button.setImage(nil, for: UIControlState())
            }
            //add one to check the next item in the array gameState
            gameButton += 1
        }
        //update the player scores
        xwins.text = ("Score " + String(xcount))
        owins.text = (String(ocount) + " Score")
        
        //checks wo the current player is and starts the countdown for their turn
        if activePlayer == 1 {
            startxTimer()
        }
        else {
            startoTimer()
        }
        
    }
    
    //when this controller appears
    override func viewDidAppear(_ animated: Bool) {
        if (xcount == 0) && (ocount == 0) {
            resetbtn.isHidden = true
        }
        else {
            resetbtn.isHidden = false
        }
        //display the player names
        playerNamex.text = playerxName
        playerNameo.text = playeroName
    }
    
    //hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

