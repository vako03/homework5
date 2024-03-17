 import Foundation

//დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “”)

func isPalindrome(text: String) -> Bool {

    let characters = Array(text)
    var initialIndex = 0
    var finalIndex = characters.count - 1
    while initialIndex < finalIndex {
        if characters[initialIndex] != characters[finalIndex] {
            return false
        }
        initialIndex += 1
        finalIndex -= 1
    }
    return true
}

print(isPalindrome(text: "ტექსტი"))
print(isPalindrome(text: "ანა"))
print(isPalindrome(text: "აირევი ივერია"))
print(isPalindrome(text: "იმის სიმი"))
print(isPalindrome(text: "ელვა მანამ ავლე"))


//ან

func isPalindrom(text:String) -> Bool {

    text == String(text.reversed())

}

print(isPalindrom(text: "ტექსტი"))
print(isPalindrom(text: "ანა"))
print(isPalindrom(text: "აირევი ივერია"))
print(isPalindrome(text: "იმის სიმი"))
print(isPalindrome(text: "ელვა მანამ ავლე"))



//2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func squareArray(numbers: [Int]) -> [Int] {
//func squareArr(_ numbers: [Int]) -> [Int] { რომელი მეთოდით ჩაწერა ჯობს ვერ დავუმუღამე

    var squaredArray = [Int]()

    for number in numbers {
        let square = number * number
        squaredArray.append(square)
    }

    return squaredArray
}

let numbers = [-1, 5, 9, 4]
var squaredNumbers = squareArray(numbers: numbers)
print(squaredNumbers)

//3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.


let evenSquaredNumbers = squaredNumbers.filter { $0 % 2 == 0 }
print(evenSquaredNumbers)

let evenSquaredNumberss = squaredNumbers.filter { number in
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}
print(evenSquaredNumberss)


//4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.


func printSumOfArray(_ array: [Int], closure: @escaping () -> Void) {
    var sum = 0
    
    for num in array {
        sum += num
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        print("მასივის ჯამი 5 წამის შემდეგ: \(sum)")
        closure()
    }
}

let nums = [1, 4, 5]
printSumOfArray(nums) {}


//5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var contacts: [String: Int] = ["ვაკო": 504944, "ნინი": 34343434,
                               "ალეკო": 23232323, "ვანო":34545]
print(contacts)

contacts["სოფო"] = 1234567890
print(contacts)

contacts.removeValue(forKey: "ნინი")
print(contacts)

if let phoneNumber = contacts["ვაკო"] {
    print("იხილეთ ნომერი \(phoneNumber)")
} else {
    print("კონტაქტი არ მოიძებნა")
}
    

//6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.


func sortedDictionary(from dictionary: [String: Int]) -> [String] {
    
    let keys = Array(dictionary.keys)
    let sortedKeys = keys.sorted()
    return sortedKeys
}
let sortedContactKeys = sortedDictionary(from: contacts)
print(sortedContactKeys)

  
//7 შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

let doublesArray: [Double] = [1.5, 2.1, 9.6, 5.2]

var largestNumber = doublesArray[0]

for myNum in doublesArray {
    if myNum > largestNumber {
        largestNumber = myNum
    }
}

print(largestNumber)


//Optional

//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:


let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

//1.დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func printTotalDuration(songDurations: [String: Int]) {
    
    let totalSeconds = songDurations.reduce(0) { $0 + $1.value }
    
    let minutes = totalSeconds / 60
    let seconds = totalSeconds % 60
    
    print("ჯამურ ხანგრძლივობა: \(minutes) წუთი და \(seconds) წამი")
}

printTotalDuration(songDurations: lelaWhatMovementIsThis)

//2.დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func findLongestSongName(songDurations: [String: Int]) {
    
    let sortedSongs = songDurations.sorted { $0.value > $1.value }
    
    if let longestSong = sortedSongs.first,
       let shortestSong = sortedSongs.last {
        print("ყველაზე ხანგრძლივი: \(longestSong.key)")
        print("ყველაზე მოკლე: \(shortestSong.key)")
    } else {
        print("")
    }
}

findLongestSongName(songDurations: lelaWhatMovementIsThis)

//3.დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას

func calculateAverageDuration(songDurations: [String: Int]) -> Double? {
    
    let totalDuration = songDurations.values.reduce(0, +)

    let numberOfSongs = Double(songDurations.count)
    let averageDuration = Double(totalDuration) / numberOfSongs
    
    return averageDuration
}
    
print(calculateAverageDuration(songDurations: lelaWhatMovementIsThis) ?? <#default value#>)


//4.დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს

//let randomIndex = Int.random(in: Range<Int>)
