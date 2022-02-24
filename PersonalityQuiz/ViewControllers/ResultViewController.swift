//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var whatYourAnimal: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

    }
    private func updateResult(){
        var mostFrequentAnimal: [Animal: Int] = [:]
        let animals = answers.map {$0.animal}
        
        for animal in animals {
            if let typeOfAnimalCount = mostFrequentAnimal[animal] {
                mostFrequentAnimal.updateValue(typeOfAnimalCount, forKey: animal)
            } else {
                mostFrequentAnimal[animal] = 1
            }
        }
         func updateUI(with animal: Animal?) {
            whatYourAnimal.text = "Вы - \(animal?.rawValue ?? "🐶")!"
            descriptionLabel.text = animal?.definition ?? ""
            
        }
        
    }
}
