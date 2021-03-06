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

var counter2 = incrementerAnonymous()
for i in 0..<10 {
    print("\(i)回目のcounter2: \(counter2())")
}


// ------ クラス ------
class MyApp {
    // Shapeクラスの定義
    class Shape {
        var name: String
        // イニシャライザ（コンストラクタ）
        init(name: String) {
            self.name = name
        }
    }
    
    class Rectangle: Shape {
        var width: Double
        var height: Double
        
        init (name: String, width: Double, height: Double) {
            self.width = width
            self.height = height
            
            // スーパクラスのイニシャライザ呼び出し
            super.init(name: name)
        }
        
        func area() -> Double {
            return width * height
        }
    }
    class Triangle: Shape {
        var bottom: Double
        var height: Double
        
        init (name: String, bottom: Double, height: Double) {
            self.bottom = bottom
            self.height = height
            
            // スーパクラスのイニシャライザ呼び出し
            super.init(name: name)
        }
        
        func area() -> Double {
            return bottom * height / 2.0
        }
    }
}

// 四角形の作成
var square = MyApp.Rectangle(name: "私の四角形", width: 7.5, height: 7.5)
print(square.name)
print(square.area())

// 三角形の作成
var triangle = MyApp.Triangle(name: "私の三角形", bottom: 10, height: 8)
print(triangle.name)
print(triangle.area())


// ------ Optional型 ------
// nilを許容する変数は、Optional型として定義する必要がある
// に非Optional型のIntやStringには、nilは代入できない
// ちなみに、「Int」と「Int?」は全く異なる型になる。
// KotlinでいうNullableみたいな感じ

// Optional Int
var optionalInt: Int? = 5
// 通常のInt
var int: Int = 5

// Optional String
var optionalString: String? = "hello"
// 通常のString
var string: String = "hello"

// Optional にnilを代入
optionalString = nil
optionalInt = nil

// Optional型のシンタックスシュガー（使いやすくしたやつ）
var optionalIntSuger: Optional<Int> = 5
var optionalStringSuger: Optional<String> = "hello"


// ------ Optional型をアンラップする ------
// SwiftではOptional型を「ラップされている」と表現する。
// nilを許容する→包む→ラップ
// 逆に、値を使うためにはアンラップする必要がある。
// アンラップ処理には4種類ある。

// ① Optional Binding
// ifやguardを使って、nilの判定をする。
// ※guardは関数内でしか使えない
func hello() -> String {
    let optionalStr: String? = "hello"
    if let unwrappedStr = optionalStr {
        return unwrappedStr.uppercased()
    }
    return ""
}
func helloWithGuard() -> String {
    let optionalStr: String? = "hello"
    guard let unwrappedStr = optionalStr else { return "" }
    return unwrappedStr.uppercased()
}

print(helloWithGuard())

// ② Optional Chaining



// ③ Forced Unwrapping



// ④ Implicitly Unwrapped Optional
