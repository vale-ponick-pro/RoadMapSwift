//
//  main.swift
//  RoadMapSwift
//
//  Created by Валерия Пономарева on 04.12.2025.
//

import Foundation

print("Задача 1. 'Описание ноутбука': объяви 5 let / var разных типов, характеризующих мой ноутбук. Для каждого свойства укажи тип данных, используя type annotation. Подумайте, какие характеристики д.б. let, а какие - var.")

func displayName() {
    let name = "Vale.ponick-pro! 🚀"
    print(name)
}

print(displayName())

/* Задача 1. 'Описание ноутбука': объяви 5 let / var разных типов, характеризующих мой ноутбук. Для каждого свойства укажи тип данных, используя type annotation. Подумайте, какие характеристики д.б. let, а какие - var." */

let name: String = "Macbook Pro"
let date: Int = 2019
let processor: String = "2,3 GHz 8‑ядерный процессор Intel Core i9"
var macOS: String = "Tahoe 26.1"
let memory: Int = 16
let graphics: String = "Intel UHD Graphics 630 1536 МБ"

print("Vale notebook - \(name), date of manufacture \(date) with operating system \(macOS) and processor - \(processor), memory - \(memory), graphics - \(graphics)")
