//
//  ViewController.swift
//  Counter
//
//  Created by Ilya Shcherbakov on 18.02.2025.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    @IBOutlet weak var counterHistoryLabel: UITextView!
    @IBOutlet weak var nullCounter: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "Значение счётчика: \(counter)" //  Устанавливаем базовое значение счётчика на 0
        counterHistoryLabel.text = "История изменений:\n"   //  Устанавливаем базовое значение TextView
    }
    
    private var counter: Int = 0  // Создаём переменную нашего счётчика

    //  Создаём экшен кнопки "+"
    @IBAction func plusButtonDidTouch(_ sender: Any) {
        counter += 1  // Увеличиваем счётчик(counter) на единицу
        counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение изменено на +1\n"  //  Добавляем значение к TextView с новой строки
        updateCounter()  // Вызываем обновление counterLabel
    }
    
    //  Создаём экшен кнопки "-"
    @IBAction func minusButtonDidTouch(_ sender: Any) {
        // Условие чтобы счётчик не становился меньше нуля
        if counter > 0 {
            counter -= 1    // Уменьшаем счётчик(counter) на единицу
            counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение изменено на -1\n"  //  Добавляем значение к TextView с новой строки
        } else {
            counterHistoryLabel.text += "[\(getCurrentDateTime())]: попытка уменьшить значение счётчика ниже 0\n"   //  Добавляем значение к TextView с новой строки
        }
        updateCounter()  // Вызываем обновление counterLabel
    }
    
    //  Создаём экшен обнуления счётчика
    @IBAction func nullCounter(_ sender: Any) {
        counter = 0 // Обнуляем счётчик
        counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение сброшено\n"    //  Устанавливаем значение TextView на требуемое в задании
        updateCounter()  // Вызываем обновление counterLabel
    }
    
    // Функция обновления лэйбла
    func updateCounter() {
        counterLabel.text = "Значение счётчика: \(counter)" //  Устанавливаем значение counterLabe на требуемое в задании
    }
    
    //  Функция форматирования даты и времени
    //  Данный форматтер нашёл в интернете, так как базовое форманирование метода Date() не соответствовало заданию. Но как я понял это общепринятый форматтер, который используется во многих приложениях
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: Date())
    }
    
}

