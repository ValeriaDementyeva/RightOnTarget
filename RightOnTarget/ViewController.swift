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

    // ленивое свойство для хранения View Controller
    lazy var secondViewController: SecondViewController = getSecondViewController()
    // приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
    return viewController as! SecondViewController }


    /* Метод loadView (сцена загружается)  выполняется первым в жизненном цикле. Как и viewDidLoad, он вызывается лишь один раз за все время жизни сцены. Если сцена создана с помощью Interface Builder (другим вариантом является создание элементов сцены с помощью программного кода), в данном методе производится загрузка всех размещенных на сцене графических элементов.
     Примечание В первой книге мы смотрели с вами на структуру storyboard-файла. В данном случае Xcode загружает сцену из этого файла, анализирует ее и самостоятельно создает все необходимые объекты.
     Если вы переопределите любой метод жизненного цикла в дочернем к UIViewController классе (в нашем случае это ViewController), то обязатель- но должны будете вызвать родительскую реализацию метода с помощью ключевого слова super. Дело в том, что эта родительская реализация содержит множество скрытых от разработчика действий, необходимых для выполнения жизненного цикла View Controller. */
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

    /* Метод viewDidLoad вызывается сразу после загрузки всех отображений (всех графических элементов) и прекрасно подходит для того, чтобы внести финальные правки перед выводом сцены на экран (или другими словами, перед добавлением графических элементов в иерархию вьюшек).*/
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
        number = Int.random(in: 1...50)
        // устанавливаем загаданное число в метку
        label.text = String(number)
        // Do any additional setup after loading the view.
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
}

