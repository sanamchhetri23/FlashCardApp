# FlashCardApp

FlashCardApp is a simple iOS quiz application that demonstrates the use of the **MVC (Model-View-Controller)** design pattern in Swift. Users answer true/false questions and receive immediate feedback, while their progress and score are tracked.

## Features
- Displays a series of true/false questions.
- Provides immediate feedback on whether the answer is correct or incorrect.
- Tracks the user's score.
- Displays progress with a progress bar.
- Automatically resets after completing the quiz.

## Project Structure
### Model
The **Model** encapsulates the quiz data and logic:
- Stores a list of questions.
- Manages the current question, score, and progress.
- Evaluates answers and determines correctness.

File: `QuizModel.swift`

### View
The **View** represents the user interface:
- Buttons (`True` and `False`).
- Labels for the question, feedback, and score.
- Progress bar to visualize quiz progress.

The view is managed in the storyboard and updated dynamically by the controller.

### Controller
The **Controller** handles user interaction:
- Processes button taps.
- Updates the view based on the current state of the model.
- Resets the quiz when all questions are answered.

File: `ViewController.swift`

## How It Works
1. The app starts by displaying the first question from the model.
2. The user selects either `True` or `False`.
3. The controller checks the answer using the model and updates the view with feedback (e.g., "You are right!").
4. The progress bar and score are updated dynamically.
5. When all questions are answered, the quiz resets, and the score is displayed.
