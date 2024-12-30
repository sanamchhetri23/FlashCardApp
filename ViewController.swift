//
//  ViewController.swift
//  FlashCardApp
//
//  Created by Peek A Boo on 2024-12-27.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    private var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        
        let isCorrect = quizModel.checkAnswer(userAnswer)
        answerLabel.text = isCorrect ? "You are right!" : "You are wrong!"
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        
        if quizModel.moveToNextQuestion() {
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            endQuiz()
        }
    }
    
    @objc private func updateUI() {
        questionLabel.text = quizModel.currentQuestion.text
        scoreLabel.text = "Score: \(quizModel.currentScore)"
        progressBar.progress = quizModel.progress
        trueButton.backgroundColor = UIColor.systemBlue
        falseButton.backgroundColor = UIColor.systemBlue
    }
    
    private func endQuiz() {
        answerLabel.text = "You have completed the quiz!"
        progressBar.progress = 1.0
        scoreLabel.text = "Final Score: \(quizModel.currentScore)"
        
        // Reset after a delay
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(resetQuiz), userInfo: nil, repeats: false)
    }
    
    @objc private func resetQuiz() {
        quizModel.resetQuiz()
        updateUI()
    }
}
