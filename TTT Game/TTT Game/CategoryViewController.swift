//
//  CategoryViewController.swift
//  TTT Game
//
//  Created by Ryan Lewis on 17/03/2018.
//  Copyright © 2018 Ryan Lewis. All rights reserved.
//

import UIKit

//varaiables that hold the category chosen by each player
var playerxCat = 0
var playeroCat = 0

class CategoryViewController: UIViewController {

    @IBOutlet weak var categorylbl: UILabel!
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but4: UIButton!
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var begin: UIButton!
    @IBOutlet weak var changeCat: UIButton!
    
    //keeps track of which player is selecting their category
    var activeCat = 0
    //stores the name of the category chosen
    var Cat1 = "?"
    var Cat2 = "?"
    
    //when this view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        if activePlayer == 1 {
            //if active player is 1 change the active category chooser to 1
            activeCat = 1
            //tells player 1 to select a category
            categorylbl.text = playerxName + " please select a category"
        }
        else {
            //if active player is 2 change the active category chooser to 2
            activeCat = 2
            //tells player 2 to select a category
            categorylbl.text = playeroName + " please select a category"
        }
    }
    
    //when the sport category is pressed
    @IBAction func Sport(_ sender: Any) {
        if activeCat == 1 { //if active player is 1
            if playeroCat == 0 { //if player 2 has not chosen a category
                playerxCat = 1 //set chosen category to 1
                Cat1 = but1.titleLabel!.text! //store the name of the category from the button title
                activeCat = 2 //change the active player to 2
                but1.isEnabled = false //disable the sport button
                categorylbl.text = playeroName + " please select a category" //tells player 2 to select a category
            }
            else { //if player 2 has chosen a category
                playerxCat = 1 //set chosen category to 1
                Cat1 = but1.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
        else { //if active player is 2
            if playerxCat == 0 { //if player 1 has not chosen a category
                playeroCat = 1 //set chosen category to 1
                Cat2 = but1.titleLabel!.text! //store the name of the category from the button title
                activeCat = 1 //change the active player to 1
                but1.isEnabled = false //disable the sport button
                categorylbl.text = playerxName + " please select a category" //tells player 1 to select a category
            }
            else { //if player 1 has chosen a category
                playeroCat = 1 //set chosen category to 1
                Cat2 = but1.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
    }
    
    //when the TV & Films button is pressed
    @IBAction func TV(_ sender: Any) {
        if activeCat == 1 { //if active player is 1
            if playeroCat == 0 { //if player 2 has not chosen a category
                playerxCat = 2 //set the chosen category to 2
                Cat1 = but2.titleLabel!.text! //store the name of the category from the button title
                activeCat = 2 //change the active player to 2
                but2.isEnabled = false //disable the TV & Films button
                categorylbl.text = playeroName + " please select a category" //tells player 2 to select a category
            }
            else { //if player 2 has chosen a category
                playerxCat = 2 //set the chosen category to 2
                Cat1 = but2.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
        else { //if active player is 2
            if playerxCat == 0 { //if player 1 has not chosen a category
                playeroCat = 2 //set the chosen category to 2
                Cat2 = but2.titleLabel!.text! //store the name of the category from the button title
                activeCat = 1 //change the active player to 1
                but2.isEnabled = false //disable the TV button
                categorylbl.text = playerxName + " please select a category" //tells player 1 to select a category
            }
            else { //if player 1 has chosen a category
                playeroCat = 2 //set the chosen category to 2
                Cat2 = but2.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
    }
    
    //when the Geography button is pressed
    @IBAction func Geo(_ sender: Any) {
        if activeCat == 1 { //if active player is 1
            if playeroCat == 0 { //if player 2 has not chosen a category
                playerxCat = 3 //set the chosen category to 3
                Cat1 = but3.titleLabel!.text! //store the name of the category from the button title
                activeCat = 2 //change the active player to 2
                but3.isEnabled = false //disable the Geography button
                categorylbl.text = playeroName + " please select a category" //tells player 2 to select a category
            }
            else { //if player 2 has chosen a category
                playerxCat = 3 //set the chosen category to 3
                Cat1 = but3.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
        else { //if active player is 2
            if playerxCat == 0 { //if player 1 has not chosen a category
                playeroCat = 3 //set the chosen category to 3
                Cat2 = but3.titleLabel!.text! //store the name of the category from the button title
                activeCat = 1 //change the active player to 1
                but3.isEnabled = false //disable the geography button
                categorylbl.text = playerxName + " please select a category" //tells player 1 to select a category
            }
            else { //if player 1 has chosen a category
                playeroCat = 3 //set the chosen category to 3
                Cat2 = but3.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
    }
    
    //when the Animals button is pressed
    @IBAction func Animals(_ sender: Any) {
        if activeCat == 1 { //if active player is 1
            if playeroCat == 0 { //if player 2 has not chosen a category
                playerxCat = 4 //set the chosen category to 4
                Cat1 = but4.titleLabel!.text! //store the name of the category from the button title
                activeCat = 2 //change the active player to 2
                but4.isEnabled = false //disable the Animals button
                categorylbl.text = playeroName + " please select a category" //tells player 2 to select a category
            }
            else { //if player 2 has chosen a category
                playerxCat = 4 //set the chosen category to 4
                Cat1 = but4.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
        else { //if active player is 2
            if playerxCat == 0 { //if player 1 has not chosen a category
                playeroCat = 4 //set chosen category to 4
                Cat2 = but4.titleLabel!.text! //store the name of the category from the button title
                activeCat = 1 //change the active player to 1
                but4.isEnabled = false //disable the animals button
                categorylbl.text = playerxName + " please select a category" //tells player 1 to select a category
            }
            else { //if player 1 has chosen a category
                playeroCat = 4 //set chosen category to 4
                Cat2 = but4.titleLabel!.text! //store the name of the category from the button title
                hide() //call the hide function
            }
        }
    }
    
    //when the hide function is called
    func hide() {
        //hide all of these buttons
        but1.isHidden = true
        but2.isHidden = true
        but3.isHidden = true
        but4.isHidden = true
        back.isHidden = true
        //change the position of the label
        categorylbl.frame.origin = CGPoint(x: 0, y: 60)
        //change the text of the label to alert the players on what categories they have chosen
        categorylbl.text = playerxName + ": " + Cat1 + "\n\n" + playeroName + ": " + Cat2 + "\n\nPress Begin to start the game"
        
        //display these buttons
        begin.isHidden = false
        changeCat.isHidden = false
    }
    
    //when the back button is pressed
    @IBAction func Back(_ sender: Any) {
        //segue back to the player select screen
        performSegue(withIdentifier: "back", sender: self)
    }
    
    //when the begin button is pressed
    @IBAction func Begin(_ sender: Any) {
        //segue to the quiz screen
        performSegue(withIdentifier: "startQuiz", sender: self)
    }
    
    //when the change button is pressed
    @IBAction func Change(_ sender: Any) {
        //displays all of these buttons
        but1.isHidden = false
        but2.isHidden = false
        but3.isHidden = false
        but4.isHidden = false
        back.isHidden = false
        //enables all of these buttons
        but1.isEnabled = true
        but2.isEnabled = true
        but3.isEnabled = true
        but4.isEnabled = true
        //resets the labels position
        categorylbl.frame.origin = CGPoint(x: 0, y: 0)
        //sets the active player back to 1
        
        if activePlayer == 1 {
            //if active player is 1 change the active category chooser to 1
            activeCat = 1
            //tells player 1 to select a category
            categorylbl.text = playerxName + " please select a category"
        }
        else {
            //if active player is 2 change the active category chooser to 2
            activeCat = 2
            //tells player 2 to select a category
            categorylbl.text = playeroName + " please select a category"
        }
        
        //hides these buttons
        begin.isHidden = true
        changeCat.isHidden = true
        //resets the players chosen categories to 0
        playerxCat = 0
        playeroCat = 0
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
