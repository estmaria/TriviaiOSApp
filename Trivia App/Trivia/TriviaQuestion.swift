//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

extension String {
    func htmlDecoded() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let decodedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil).string
        return decodedString ?? self
    }
}

struct TriviaAPIResponse: Decodable {
  let results: [TriviaQuestion]

}
struct TriviaQuestion : Decodable{
  let category: String
  let question: String
  let correctAnswer: String
  let incorrectAnswers: [String]


    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case question = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    var decodedQuestion: String {
        return question.htmlDecoded()
    }
        
    var decodedCategory: String {
        return category.htmlDecoded()
    }
        
    var decodedCorrectAnswer: String {
        return correctAnswer.htmlDecoded()
    }
        
    var decodedIncorrectAnswers: [String] {
        return incorrectAnswers.map { $0.htmlDecoded() }
    }
}


