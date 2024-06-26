//
//  main.swift
//  FactorySimulationCLI
//
//  Created by Samir on 25.06.2024.
//

import Foundation

class Passport {
    var series: String
    var number: String
    var issueDate: Date
    weak var person: Person?

    init(series: String, number: String, issueDate: Date) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        print("Паспорт \(series) \(number) создан.")
    }

    deinit {
        print("Паспорт \(series) \(number) удален из памяти.")
    }
}

class Person {
    var fullName: String
    var age: Int
    var passport: Passport

    init(fullName: String, age: Int, passport: Passport) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        self.passport.person = self
        print("Человек \(fullName) создан.")
    }

    deinit {
        print("Человек \(fullName) удален из памяти.")
    }
}

// Пример использования
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let issueDate = dateFormatter.date(from: "2020-01-01")!

let passport = Passport(series: "1234", number: "567890", issueDate: issueDate)
let person = Person(fullName: "Иванов Иван Иванович", age: 30, passport: passport)

// Здесь можно добавить дополнительный код для демонстрации работы классов в CLI проекте

// Принудительный сбор мусора
autoreleasepool {
    // Код для демонстрации деинициализации
}

