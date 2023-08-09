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
    
    override func loadView() {
        super.loadView()
        print("loadView")
        // Создаем метку для вывода номера версии
        let versionalLabel = UILabel(frame: CGRect(x: 30, y: 15, width: 120, height: 20))
        // изменяем текст метки
        versionalLabel.text = "Версия 1.1"
        //добавляем кастомный цвет #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        versionalLabel.textColor = #colorLiteral(red: 0.07058823529, green: 0.5019607843, blue: 0.1058823529, alpha: 1)
        //добавляем метку в родительский view
        view.addSubview(versionalLabel)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

