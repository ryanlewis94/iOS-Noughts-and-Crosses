//
//  StartViewController.swift
//  TTT Game
//
//  Created by Ryan Lewis on 05/03/2018.
//  Copyright © 2018 Ryan Lewis. All rights reserved.
//

import UIKit

var playerxName = "Player 1"
var playeroName = "Player 2"

class StartViewController: UIViewController {
    
    @IBOutlet weak var Player1Name: UITextField!
    @IBOutlet weak var Player2Name: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var playerxFirst: UIButton!
    @IBOutlet weak var playeroFirst: UIButton!
    @IBOutlet weak var FirstPlayerX: UIButton!
    @IBOutlet weak var FirstPlayerO: UIButton!
    
    //if player 1 name gets changed the score resets to 0-0
    @IBAction func name1Change(_ sender: Any) {
        xcount = 0
        ocount = 0
    }
    
    //if player 2 name gets changed the score resets to 0-0
    @IBAction func name2Change(_ sender: Any) {
        xcount = 0
        ocount = 0
    }
    
    //when player 1 wants to go first
    @IBAction func xFirst(_ sender: Any) {
        activePlayer = 1 //set active player to 1
        playerxFirst.isHidden = true //hide the button
        playeroFirst.isHidden = false //display the button for player 2
        //Display that active player is 1 with green border around name
        FirstPlayerX.isHidden = false
        FirstPlayerO.isHidden = true
    }
    
    //when player 2 wants to go first
    @IBAction func oFirst(_ sender: Any) {
        activePlayer = 2 //set the active player to 2
        playerxFirst.isHidden = false //hide the button
        playeroFirst.isHidden = true //display the button for player 1
        //Display that active player is 2 with green border around name
        FirstPlayerX.isHidden = true
        FirstPlayerO.isHidden = false
    }
    
    //start game button is pressed
    @IBAction func start(_ sender: AnyObject)
    {
        //check if the player name fields have been entered
        if (Player1Name.text != "") && (Player2Name.text != "")
        {
            //names entered are saved globally in the variables
            playerxName = Player1Name.text!
            playeroName = Player2Name.text!
            //go to the next view controller where the quiz begins
            performSegue(withIdentifier: "startsegue", sender: self)
        }
        else
        {
            //if nothing has been entered user is alerted by an error message
            error.isHidden = false
        }

    }
    
    //when this controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        //load all the questions for use again
        xQuestions = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
        oQuestions = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
        //load the player names into the text field
        Player1Name.text = playerxName
        Player2Name.text = playeroName
        playerxCat = 0
        playeroCat = 0
        
        view.bringSubview(toFront: Player1Name)
        view.bringSubview(toFront: Player2Name)
        if activePlayer == 1 {
            //if active player is 1 give the chance for player 2 to choose tp go first
            playeroFirst.isHidden = false
            playerxFirst.isHidden = true
            //Display that active player is 1 with green border around name
            FirstPlayerX.isHidden = false
            FirstPlayerO.isHidden = true
        }
        else {
            //if active player is 2 give the chance for player 1 to choose tp go first
            playeroFirst.isHidden = true
            playerxFirst.isHidden = false
            //Display that active player is 2 with green border around name
            FirstPlayerX.isHidden = true
            FirstPlayerO.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
