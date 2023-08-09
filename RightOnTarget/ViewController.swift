//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Валерия Дементьева on 09.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    //загаданное число
    var number: Int = 0
    //раунд
    var round: Int = 1
    //сумма очков за раунд
    var points: Int = 0

    @IBAction func checkNumber() {
            // получаем значение на слайдере
            let numSlider = Int(slider.value.rounded())
            // сравниваем значение с загаданным и подсчитываем очки
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }

            if round == 5 {
                // выводим информационное окно с результатами игры
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(points) очков",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
        // генерируем случайное число
        number = Int.random(in: 1...50)
        // передаем значение случайного числа в label
        label.text = String(number)

        }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
        number = Int.random(in: 1...50)
        // устанавливаем загаданное число в метку
        label.text = String(number)
        // Do any additional setup after loading the view.
    }


}

