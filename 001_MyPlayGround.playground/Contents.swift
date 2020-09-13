import UIKit

// イミュータブル（定数）
let immutableStr = "Hello "

// ミュータブル（変数）
var str = "World"

str = "playground"

print(immutableStr + str)

// ------------------------------------

// 型推論はするが、暗黙的キャストはできないため、明示的に行う
let label = "This year is "
let year = 2020
let thisYear = label + String(year)

print(thisYear)

// ------ 配列の定義 ------
var itemArray = ["foo", "bar", "baz"]
var itemArray_2: [String] = ["foo", "bar", "baz"]

// ------ Dictionary型 ------
// キーバリュー。JavaのMapみたいなもの
var itemsDictionary = [
    "foo": "FOO",
    "bar": "BAR",
    "baz": "BAZ"
]

var itemsDictionary_2: [String: String] = [
    "foo": "FOO",
    "bar": "BAR",
    "baz": "BAZ"
]

// ------ 制御構文 ------
let list = [3, 7, 9, 12, 8, 5]
for number in list {
    if number % 2 == 0 {
        print("number \(number) is even")
    } else {
        print("number \(number) is odd")
    }
}

var number = 1
while number < 10 {
    print(number)
    number += 1
}

let age = 17
switch age {
case 0...6:
    print("kindergarden kid")
case 7...12:
    print("primary school student")
case 13...15:
    print("junior high school student")
case 16...18:
    print("high school student")
case 19...22:
    print("college student")
default:
    print("business person")
}

// ------ 関数（メソッド） ------
// Swiftは関数のシグネチャ（引数とかのこと）の書き方が多種多様なので、プロジェクトによって異なる。
func greet(expression: String, person: String) -> String {
    return "\(expression) \(person)"
}

func greet2(_ expression: String, to person: String) -> String {
    return "\(expression) \(person)"
}

print(greet(expression: "Hello", person: "Mike"))
print(greet2("Hello", to: "Mike"))

// ------ クロージャ（関数閉包） ------
// 自分を囲むスコープにある変数を参照する関数（なので、厳密にはincrement()がクロージャになる。
// グローバル変数を減らしたいときや、関数の実行結果をそのまま使い回したい時に使える
func incrementer() -> ( ()-> Int ) {
    var count = 0
    func increment() -> Int {
        count += 1
        return count
    }
    return increment
}

var counter = incrementer()
for i in 0..<20 {
    print(" \(i)回目counter: \(counter())")
}

// 無名関数も可能
func incrementerAnonymous() -> (() -> Int) {
    var count = 0
    return {
        () -> Int in
        count += 1
        return count
    }
}
