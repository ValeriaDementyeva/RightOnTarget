//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Валерия Дементьева on 09.08.2023.
//

import UIKit

class ViewController: UIViewController {
    // Сущность "Игра"
    var game: Game!

    // Элементы на сцене
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    // MARK: - Жизненный цикл
    /* Метод loadView (сцена загружается)  выполняется первым в жизненном цикле. Как и viewDidLoad, он вызывается лишь один раз за все время жизни сцены. Если сцена создана с помощью Interface Builder (другим вариантом является создание элементов сцены с помощью программного кода), в данном методе производится загрузка всех размещенных на сцене графических элементов.
     Примечание В первой книге мы смотрели с вами на структуру storyboard-файла. В данном случае Xcode загружает сцену из этого файла, анализирует ее и самостоятельно создает все необходимые объекты.
     Если вы переопределите любой метод жизненного цикла в дочернем к UIViewController классе (в нашем случае это ViewController), то обязатель- но должны будете вызвать родительскую реализацию метода с помощью ключевого слова super. Дело в том, что эта родительская реализация содержит множество скрытых от разработчика действий, необходимых для выполнения жизненного цикла View Controller. */
    override func loadView() {
        super.loadView()
        print("loadView")
        // Создаем метку для вывода номера версии
        let versionalLabel = UILabel(frame: CGRect(x: 30, y: 15, width: 120, height: 20))
        // изменяем текст метки
        versionalLabel.text = "Версия 1.2"
        //добавляем кастомный цвет #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        versionalLabel.textColor = #colorLiteral(red: 0.07058823529, green: 0.5019607843, blue: 0.1058823529, alpha: 1)
        //добавляем метку в родительский view
        view.addSubview(versionalLabel)
    }

    /* Метод viewDidLoad вызывается сразу после загрузки всех отображений (всех графических элементов) и прекрасно подходит для того, чтобы внести финальные правки перед выводом сцены на экран (или другими словами, перед добавлением графических элементов в иерархию вьюшек).*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем экземпляр сущности "Игра"
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }

    /* Метод viewWillAppear вызывается перед тем, как графические элементы сцены будут добавлены в иерархию графических элементов. Но в отличии от viewDidLoad он вызывается не один раз, а каждый раз, когда сцена добавляется в иерархию.*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    /* Метод viewDidAppear вызывается после того, как графические элементы сцены добавлены в иерархию view. В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию на сцене или синхронизировать данные с сервером).*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
/* Методы viewWillDisappear и viewDidDisappear похожи на viewWillAppear и viewDidAppear c той лишь разницей, что они вызываются до и после удаления элементов сцены из иерархии view.*/
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    // MARK: - Взаимодействие View - Model
    
    @IBAction func checkNumber() {
        // Высчитываем очки за раунд
        game.calculateScore(with: Int(slider.value))
        // Проверяем, окончена ли игра
        if game.isGameEnded {
        showAlertWith(score: game.score)
            // Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
    }

    // MARK: - Обновление View
    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }

    // Отображение всплывающего окна со счетом
    private func showAlertWith(score: Int) {
    let alert = UIAlertController(
    title: "Игра окончена",
    message: "Вы заработали \(score) очков",
    preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
}

