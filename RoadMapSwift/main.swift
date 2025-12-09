//
//  main.swift
//  RoadMapSwift
//
//  Created by Валерия Пономарева on 04.12.2025.
//

import Foundation

/* Задача 1. 'Описание ноутбука': объяви 5 let / var разных типов, характеризующих мой ноутбук. Для каждого свойства укажи ТИП данных, используя type annotation. Подумайте, какие характеристики д.б. let, а какие - var." */

let name: String = "Macbook Pro"
let date: Int = 2019
let processor: String = "2,3 GHz 8‑ядерный процессор Intel Core i9"
var macOS: String = "Tahoe 26.1"
let memory: Int = 16
let graphics: String = "Intel UHD Graphics 630 1536 МБ"

print("Vale notebook - \(name), date of manufacture \(date) with operating system \(macOS) and processor - \(processor), memory - \(memory), graphics - \(graphics)")

/* Задача 2. Создай список товаров - tuples - с различными хар-ми (кол-во, название). Используй typealias */

// вар. 1 БЕЗ typealias

let productInfo: (String, Int, Double) = ("Apple", 2, 256.50)

func calcProduct(details: (String, Int, Double)) {
    print("Name: \(details.0), Count: \(details.1), Price: \(details.2)")
}

calcProduct(details: productInfo) // Name: Apple, Count: 2, Price: 256.5

// вар. 2 tuple + typealeas

typealias Product = (name: String, count: Int, price: Double)
let mango: Product = (name: "Mango", count: 1, price: 362.99)
let orange: Product = (name: "Orange", count: 3, price: 225.55)

func printProduct(_ product: Product) {
    print("Name: \(product.name), Count: \(product.count), Price: \(product.price)")
}

printProduct(mango) // Name: Mango, Count: 1, Price: 362.99
printProduct(orange) // Name: Orange, Count: 3, Price: 225.55

/* Задача 3 от Perp'a. Журнал заказов: Есть интернет‑магазин, нужно хранить и обрабатывать список заказов. Сделай: Кортеж для одного заказа с полями: номер заказа, имя клиента, сумма, флаг «оплачен / нет». Массив таких заказов. Функцию, которая: принимает массив заказов, возвращает новый массив только с оплаченными заказами. Сделай в двух вариантах: без  typealias  (прямо с кортежами в типах функций и массива); с  typealias , где ты даёшь короткое понятное имя типу заказа и используешь его везде. */

// var. 1 БЕЗ typealias

let order: (Int, String, Double, Bool) = (1, "Vale", 21.12, true) // кортеж одного заказа
let arrayOrders: [(Int, String, Double, Bool)] = [ // массив заказов
    (2, "Ann", 12.21, false),
    (3, "Nick", 12.21, true),
    (4, "Pitt", 25.50, true),
    (5, "Andy", 777.77, true)
]
func isPaidOrders(_ orders: [(Int, String, Double, Bool)]) -> [(Int, String, Double, Bool)] {
    return orders.filter { $0.3 == true }
}
print(isPaidOrders(arrayOrders)) // [(3, "Nick", 12.21, true), (4, "Pitt", 25.5, true), (5, "Andy", 777.77, true)]

// var. 2 with typealias

typealias Order = (number: Int, name: String, summa: Double, isPaid: Bool)
let listOfOrders: [Order] = [
    (number: 1, name: "Tim", summa: 121.121, isPaid: true),
    (number: 2, name: "Sam", summa: 212.555, isPaid: true),
    (number: 3, name: "Joe", summa: 512.25, isPaid: true),
    (number: 4, name: "Kat", summa: 321.99, isPaid: false)
]
func isPaidOrders(_ orders: [Order]) -> [Order] {
    return orders.filter { $0.isPaid }
}

print(isPaidOrders(listOfOrders)) // [(number: 1, name: "Tim", summa: 121.121, isPaid: true), (number: 2, name: "Sam", summa: 212.555, isPaid: true), (number: 3, name: "Joe", summa: 512.25, isPaid: true)]

/* Задача 4 от Perp'a. Магазин скидок: Создай:
     •    Массив товаров с ценой:  let electronics = ("iPhone", 999.99), ("MacBook", 1999.99), ...
     •    Массив товаров с другой ценой:  let clothes = ("Jeans", 89.99), ("Shirt", 29.99), ...
     •    Функцию  applyDiscount(items: (String, Double), discount: Double) -> (String, Double)
     •    Принимает массив товаров и процент скидки
     •    Возвращает массив с скидочными ценами
 ВАЖНО: функция должна работать с ЛЮБЫМ массивом товаров, который ей передали!*/

typealias Good = (name: String, summa: Double)
let electronics: [Good] = [
    ("iPhone 17 max pro", 179.990),
    ("Macbook Pro", 212.550),
    ("iPad Pro", 121.250),
    ("iPhone 17 Air", 112.888)
    ]
let clothes: [Good] = [
    ("Jeans", 155.99),
    ("Shirt", 65.56),
    ("Skirt", 78.89),
    ("Dress", 99.99),
    ("Jacket", 156.78)
]

func applyDiscount(_ items: [Good], discount: Double) -> [Good] {
    return items.map { ($0.name, $0.summa * (1 - discount)) }
}

print(applyDiscount(electronics, discount: 0.1)) // [(name: "iPhone 17 max pro", summa: 161.991), (name: "Macbook Pro", summa: 191.29500000000002), (name: "iPad Pro", summa: 109.125), (name: "iPhone 17 Air", summa: 101.59920000000001)]
print(applyDiscount(clothes, discount: 0.12)) // [(name: "Jeans", summa: 137.27120000000002), (name: "Shirt", summa: 57.692800000000005), (name: "Skirt", summa: 69.4232), (name: "Dress", summa: 87.99119999999999), (name: "Jacket", summa: 137.9664)]

/* 🚀 Уровень 2: Middle Junior — Магазин скидок (структуры + валидация)
 Требования к переработке твоего кода:
 1. Замени  typealias  на  struct 2. Два массива товаров (как раньше, но теперь с  Product ) 3. Функция  applyDiscount  с валидацией Обязательно проверь внутри функции:
 •     discount < 0  → верни исходный массив (нельзя отрицательная скидка)
 •     discount > 1  → примени максимум 1.0 (100% скидка)
 •    Иначе:  price * (1 - discount)
4. Тесты для проверки валидации
 Цель: код стал типобезопасным (структуры), устойчивым к ошибкам (валидация), читаемым ( .price  вместо  .summa ). */
