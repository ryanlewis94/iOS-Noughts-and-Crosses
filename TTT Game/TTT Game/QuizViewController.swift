//
//  QuizViewController.swift
//  TTT Game
//
//  Created by Ryan Lewis on 05/03/2018.
//  Copyright © 2018 Ryan Lewis. All rights reserved.
//

import UIKit
import AVFoundation

var currentQuestions = [0]
var xQuestions = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
var oQuestions = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
class QuizViewController: UIViewController {
    
    //questions of each category are saved in arrays
    let sportQs = ["What is the national sport of Japan?", "What is the most popular spectator sport in Australia?", "Who was the first golfer to win the Masters Tournament two years in a row?", "Who is the longest reigning heavyweight boxing champion with 25 successful defenses?", "What is professional wrestler John Cena's famous catchphrase?", "Which tennis player has won the most men's Grand Slam titles?", "Which country won the 2012 UEFA European Championship?", "In sports, what does the acronym MVP stand for?", "Who won the Ballon d'Or consecutively in 2016 and 2017?", "Who won the 2006 World Cup held in Germany?", "What team won the Premier League Title in the 2015-2016 Season?", "Which player was the top scorer during the European qualification for the 2018 World Cup in Russia?", "What player did they name the Puskás award after?", "Who is the top goal scorer of all time?", "What football team is going to win the 2017/2018 Premier League season?"]
    let TVQs = ["Torchwood is a spin-off of what popular British sci-fi series?", "Star Trek: The Next Generation originally aired in what year?", "What is the longest running U.S. primetime television show of all time?", "Who played the title character in the teen sitcom musical comedy Hannah Montana?", "In what city does SpongeBob SquarePants live?", "Which Teenage Mutant Ninja Turtle always wears red bandanas?", "Who was the first actor to play Doctor Who in the television series?", "How many fingers do the Simpsons cartoon characters have?", "What 2004 film did Will Ferrel star in?", "How many films has Adam Sandler been in?", "In the hit TV series the Walking Dead what is Daryl's weapon of choice?", "How many seasons is the Walking Dead currently at?", "In what year did Breaking Bad begin?", "Who played Fred Flinstone in the 1994 film The Flintstones?", "Who is the longest serving James Bond?"]
    let GeoQs = ["How many continents are there?", "What is the official language of Greenland?", "If you were in the city of Turin, what country would you be in?", "Chile shares the majority of its border with which other South American country?", "Which Scandinavian nation lies between Norway and Finland?", "The Amazon River runs through Brazil, Peru and which other country?", "How many states are there in the United States of America?", "Wellington is the capital city of which island nation?", "What city in Australia has the highest population?", "Which country has the highest population?", "How many counties border Wales?", "Which is the wettest city in the UK?", "Which is the UK's longest river?", "What percentage of the UK is used for agriculture according to 2012 government figures?", "Which is Britain's most easterly town?"]
    let AnimalQs = ["What is the only bird known to fly backwards?", "What is largest living bird by wingspan?", "What is the name for the offspring of a male donkey and a female horse?", "A panda's daily diet consists almost entirely of what plant?", "What was the name of the gorilla that was shot and killed at the Cincinnati zoo in 2016 after a three-year old boy fell into the enclosure?", "Cynophobia is the fear of what kind of animal?", "A flamboyance is a group of what animal?", "What is the national animal of Scotland?", "What is the most popular breed of dog in the United States?", "How many stomachs does a cow have?", "Border, Leicester and Corrie dale are all breeds of what?", "Which bird is the international symbol of happiness?", "Rock hopper, jackass and emperor are all type of what?", "Which bird is often described as being a thief and is thought by some people to bring bad luck?", "What is the largest known fish?"]
    
    //answers of each category are saved in arrays
    let sportAs = [["Sumo", "Aikido", "Judo"], ["Australian Rules Football", "Cricket", "Rugby"], ["Jack Nicklaus", "Tiger Woods", "Rory Mcilroy"],["Joe Louis", "Mike Tyson", "Muhammad Ali"], ["You can't see me!", "If you want some, come get some!", "It's John Cena!"], ["Roger Federer", "Andre Agassi", "Novak Djokovic"], ["Spain", "Germany", "France"], ["Most Valuable Player", "Most Valuable Person", "Most valuable Professional"], ["Christiano Ronaldo", "Lionel Messi", "Ronaldinho"], ["Italy", "Germany", "Brazil"], ["Leicester City", "Manchester United", "Chelsea"], ["Robert Lewandowski", "Christiano Ronaldo", "Romelu Lukaku"], ["Ferenc Puskás", "Frank Puskás", "Christien Puskás"], ["Josef Bican", "Pelé", "Romário"], ["Manchester City", "Manchester United", "Liverpool"]]
    let TVAs = [["Doctor Who", "Red Dwarf", "Misfits"], ["1987", "1990", "1985"], ["The Simpsons", "Family Guy", "Breaking Bad"],["Miley Cyrus", "Justin Bieber", "Lindsay Lohan"], ["Bikini Bottom", "Shell City", "Rock Bottom"], ["Raphael", "Leonardo", "Donatello"], ["William Hartnell", "David Tennant", "Christopher Eccleston"], ["4", "3", "5"], ["Anchorman", "Step Brothers", "Daddy's Home"], ["53", "69", "102"], ["Crossbow", "Shotgun", "Machete"], ["8", "6", "9"], ["2008", "2006", "2005"], ["John Goodman", "Dennis Hopper", "Roger Moore"], ["Roger Moore", "Daniel Craig", "Pierce Brosnan"]]
    let GeoAs = [["7", "6", "8"], ["Greenlandic", "Greenish", "Green"], ["Italy", "France", "Spain"],["Argentina", "Brazil", "Panama"], ["Sweden", "Denmark", "Netherlands"], ["Colombia", "Argentina", "Uruguay"], ["50", "52", "49"], ["New Zealand", "South Africa", "Canada"], ["Sydney", "Melbourne", "Perth"], ["China", "Russia", "India"], ["4", "1", "6"], ["Glasgow", "Cardiff", "Manchester"], ["River Severn", "River Thames", "River Avon"], ["70%", "90%", "55%"], ["Lowestoft", "Margate", "Whitby"]]
    let AnimalAs = [["Hummingbird", "Eagle", "Robin"], ["Wandering Albatross", "Bald Eagle", "Condor"], ["Mule", "Kid", "Calf"],["Bamboo", "Grass", "Tulips"], ["Harambe", "King Kong", "Silverback"], ["Dogs", "Frogs", "Toads"], ["Flamingos", "Chimps", "Pigs"], ["Unicorn", "Horse", "Goat"], ["Labrador Retriever", "German Shephard", "American Bulldog"], ["4", "2", "3"], ["Sheep", "Cow", "Dog"], ["Bluebird", "Dove", "Robin"], ["Penguins", "Birds", "Frogs"], ["Magpie", "Crow", "Seagull"], ["Whale Shark", "Blue Whale", "Killer Whale"]]
    
    //arrays are filled with questions and answers of the categories chosen by the players
    var questions = ["?"]
    var answers = [["?"]]
    
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var questLbl: UILabel!
    @IBOutlet weak var answerBtn: UIButton!
    @IBOutlet weak var ansResult: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    var totalTime = 10
    var xtimer = Timer()
    var otimer = Timer()
    var player: AVAudioPlayer?
    
    //when one of the answer buttons are pressed
    @IBAction func answer(_ sender: AnyObject) {
        //if the correct answer has been pressed
        if (sender.tag == Int(rightAnswerPlacement))
        {
            //loops through the buttons and hides them
            for i in [1,2,3]
            {
                let answerBtn = view.viewWithTag(i) as! UIButton
                answerBtn.isHidden = true
            }
            ansResult.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4) //rotates the lable
            ansResult.text = "CORRECT!" //sets the lables text to "CORRECT!"
            ansResult.textColor = UIColor.green //changes the lables text colour to green
            ansResult.isHidden = false //makes the lable visible
            if activePlayer == 1 {
                xtimer.invalidate() //stop the timer
            }
            else {
                otimer.invalidate() //stop the timer
            }
            //after one second perform the TicTacToe function (segues to the noughts and crosses game)
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TicTacToe), userInfo: nil, repeats: false)
        }
        else
        {
            //loops through the buttons and hides them
            for i in [1,2,3]
            {
                let answerBtn = view.viewWithTag(i) as! UIButton
                answerBtn.isHidden = true
            }
            ansResult.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4) //rotates the lable
            ansResult.text = "INCORRECT!" //sets the lables text to "INCORRECT!"
            ansResult.textColor = UIColor.red //changes the lables text colour to red
            ansResult.isHidden = false //makes the lable visible
            if activePlayer == 1 {
                xtimer.invalidate() //stop the timer
            }
            else {
                otimer.invalidate() //stop the timer
            }
            //after 2 seconds perform the playernamechange function (changes the player name to display whos turn it is to answer the question)
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(playernamechange), userInfo: nil, repeats: false)
            //after 2 seconds perform the newQuestion function (creates and displays a new question)
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(newQuestion), userInfo: nil, repeats: false)
        }
    }
    
    //when this controller appears
    override func viewDidAppear(_ animated: Bool) {
        //checks who the active player is
        if activePlayer == 1 {
            //if 1 chanhge the lable to player x's name
            playerName.text = "Player: " + playerxName
        }
        else {
            //if 2 change the lable to player o's name
            playerName.text = "Player: " + playeroName
        }
        
        //perform newQuestion function (creates and displays a new question)
        newQuestion()
        
        if activePlayer == 1 {
            startxTimer()
        }
        else {
            startoTimer()
        }
    }
    
    //this function is performed when an answer is correct and so it segues to the noughts and crosses game
    @objc func TicTacToe() {
        performSegue(withIdentifier: "startGame", sender: self)
    }
    
    //this function is performed when an answer is incorrect
    @objc func playernamechange() {
        
        if activePlayer == 1 {
            //when active player is 1 change active player to 2 and display player o's name
            activePlayer = 2
            playerName.text = "Player: " + playeroName
            startoTimer()
        }
        else {
            //when active player is 2 change active player to 1 and display player x's name
            activePlayer = 1
            playerName.text = "Player: " + playerxName
            startxTimer()
        }
    }
    
    //this function is performed when a new question is needed
    @objc func newQuestion() {
        
        //call the checkQuestion function
        checkQuestion()
        
        //checks that there is still questions left
        if currentQuestions.count > 0 {
            
            //generates random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(currentQuestions.count)))
            
            //chooses the question from array with the random number
            currentQuestion = currentQuestions[arrayKey]
            
            //make sure the question isnt repeated by deleting the array key
            currentQuestions.remove(at: arrayKey)
            //call the checkCurrentQuestions function
            checkCurrentQuestions()
        }
        
        //displays the question
        questLbl.text = questions[currentQuestion]
        
        //generates a random number so the answers are displayed in a different position to that in the array
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        var button:UIButton = UIButton()
        var x = 1
        //loops through the answer buttons by tag number
        for i in [1,2,3]
        {
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                //correct answer is always held in the first slot of the array
                //displays the correct answer in the button with tag of the random number
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                //displays the other two answers in the other two answer buttons
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        //loops through the answer buttons by tag number
        for i in [1,2,3]
        {
            let answerBtn = view.viewWithTag(i) as! UIButton
            //makes the buttons visible
            answerBtn.isHidden = false
        }
        //hides the lable that displays the result of the last question
        ansResult.isHidden = true
    }
    
    //when the checkQuestion function is called
    func checkQuestion() {
        if activePlayer == 1 {
            //if the active player is 1 set the current questions to the questions that player 1 has left
            currentQuestions = xQuestions
            //check which category has been chosen and store the questions and answers from that category to be displayed
            switch playerxCat {
                case 1 :
                    questions = sportQs
                    answers = sportAs
                case 2 :
                    questions = TVQs
                    answers = TVAs
                case 3 :
                    questions = GeoQs
                    answers = GeoAs
                case 4 :
                    questions = AnimalQs
                    answers = AnimalAs
                default:
                    print("eror")
            }
        }
        else {
            //if the active player is 2 set the current questions to the questions that player 2 has left
            currentQuestions = oQuestions
            //check which category has been chosen and store the questions and answers from that category to be displayed
            switch playeroCat {
            case 1 :
                questions = sportQs
                answers = sportAs
            case 2 :
                questions = TVQs
                answers = TVAs
            case 3 :
                questions = GeoQs
                answers = GeoAs
            case 4 :
                questions = AnimalQs
                answers = AnimalAs
            default:
                print("eror")
            }
        }
    }
    
    //when checkCurrentQuestions has been called
    func checkCurrentQuestions() {
        if activePlayer == 1 { //if active player is 1
            xQuestions = currentQuestions //store the number of questions left for player 1
        }
        else { //if active player is 2
            oQuestions = currentQuestions //store the number of questions left for player 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startxTimer() {
        totalTime = 10 //resets the timer back to 10 seconds
        //timer that after 1 second calls the updstexTime function and also repeats every second
        xtimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatexTime), userInfo: nil, repeats: true)
    }
    
    @objc func updatexTime() {
        //updates the label with the total time left
        timer.text = "\(xtimeFormatted(totalTime))"
        //shows the timer
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
            playernamechange()
            newQuestion()
        }
    }
    
    func endxTimer() {
        xtimer.invalidate() //stop the timer
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
        timer.text = "\(otimeFormatted(totalTime))"
        //displays the timer label
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
            playernamechange()
            newQuestion()
        }
    }
    
    func endoTimer() {
        otimer.invalidate() //stop the timer
    }
    
    func otimeFormatted(_ totalSeconds: Int) -> String {
        //this function formats the time ready to be displayed
        let seconds: Int = totalSeconds % 11
        return String(seconds)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
