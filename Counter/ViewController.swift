//
//  ViewController.swift
//  Counter
//
//  Created by Ilya Shcherbakov on 18.02.2025.
//

import UIKit
import Foundation

final class ViewController: UIViewController {
    
    @IBOutlet weak private var counterHistoryLabel: UITextView!
    @IBOutlet weak private var nullButtonDidTouch: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    
    private var counter: Int = .zero  // Создаём переменную нашего счётчика
    
    //  Устанавливаем базовые настройки стартового крана
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(counter)" //  Устанавливаем базовое значение счётчика на 0
        counterHistoryLabel.text = "История изменений:\n"   //  Устанавливаем базовое значение TextView
    }
    
    //  Функция для скролла TextView
    private func scroll() {
        let range = NSRange(location: counterHistoryLabel.text.count - 1, length: 0)
        counterHistoryLabel.scrollRangeToVisible(range)
    }
    
    // Функция обновления лэйбла
    private func updateCounter() {
        counterLabel.text = "Значение счётчика: \(counter)" //  Устанавливаем значение counterLabel на требуемое в задании
        scroll()
    }
    
    //  Функция форматирования даты и времени
    private func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: Date())
    }
    
    //  Создаём экшен кнопки "+"
    @IBAction private func plusButtonDidTouch(_ sender: Any) {
        counter += 1  // Увеличиваем счётчик(counter) на единицу
        counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение изменено на +1\n"  //  Добавляем значение к TextView с новой строки
        scroll()
        updateCounter()  // Вызываем обновление counterLabel
    }
    
    //  Создаём экшен кнопки "-"
    @IBAction private func minusButtonDidTouch(_ sender: Any) {
        // Условие чтобы счётчик не становился меньше нуля
        if counter > 0 {
            counter -= 1    // Уменьшаем счётчик(counter) на единицу
            counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение изменено на -1\n"  //  Добавляем значение к TextView с новой строки
            scroll()
        } else {
            counterHistoryLabel.text += "[\(getCurrentDateTime())]: попытка уменьшить значение счётчика ниже 0\n"   //  Добавляем значение к TextView с новой строки
            scroll()
        }
        updateCounter()  // Вызываем обновление counterLabel
    }
    
    //  Создаём экшен обнуления счётчика
    @IBAction private func nullButtonDidTouch(_ sender: Any) {
        counter = 0 // Обнуляем счётчик
        counterHistoryLabel.text += "[\(getCurrentDateTime())]: значение сброшено\n"    //  Устанавливаем значение TextView на требуемое в задании
        scroll()
        updateCounter()  // Вызываем обновление counterLabel
    }
}

