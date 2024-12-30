//
//  QuestionModel.swift
//  FlashCardApp
//
//  Created by Peek A Boo on 2024-12-30.
//
import Foundation

struct Question {
    let text: String
    let answer: String
}

class QuizModel {
    private var questions: [Question] = [
        Question(text: "The Earth revolves around the Sun.", answer: "True"),
        Question(text: "Mount Everest is the tallest mountain on Earth.", answer: "True"),
        Question(text: "Water boils at 90°C at sea level.", answer: "False"),
        Question(text: "The Great Wall of China is visible from space.", answer: "False"),
        Question(text: "The human body has 206 bones.", answer: "True"),
        Question(text: "Sharks are mammals.", answer: "False"),
        Question(text: "The speed of light is approximately 300,000 km per second.", answer: "True"),
        Question(text: "Venus is the closest planet to the Sun.", answer: "False"),
        Question(text: "Honey never spoils.", answer: "True"),
        Question(text: "The Eiffel Tower is located in London.", answer: "False")
    ]
    
    private var currentIndex = 0
    private var score = 0
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    var progress: Float {
        return Float(currentIndex) / Float(questions.count)
    }
    
    var totalQuestions: Int {
        return questions.count
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        let isCorrect = userAnswer == currentQuestion.answer
        if isCorrect { score += 1 }
        return isCorrect
    }
    
    func moveToNextQuestion() -> Bool {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            return true
        } else {
            return false
        }
    }
    
    func resetQuiz() {
        currentIndex = 0
        score = 0
    }
    
    var currentScore: Int {
        return score
    }
}
