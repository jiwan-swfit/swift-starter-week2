//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

let myLottoNumbers: [Int] = [1, 2, 3, 4, 5, 6]

var numbersPool: Array<Int> = Array<Int>(1...45)
var winningNumbers: Array<Int> = Array<Int>()
var matchingNumbers: Array<Int> = Array<Int>()
var resultNumberString: String = ""
var resultHistory: Dictionary<String, Array<Int>> = [String:Array<Int>]()
var lottoRound: Int = 0

func pickWinningNumbers() {
    winningNumbers = Array<Int>()
    numbersPool.shuffle()
    for i in 0...5 {
        winningNumbers.append(numbersPool[i])
    }
    recordLottoHistory()
}

func recordLottoHistory() {
    lottoRound += 1
    resultHistory["\(lottoRound)회차"] = winningNumbers
}

func compareLottoNumbers() {
    matchingNumbers.append(contentsOf:myLottoNumbers.filter(winningNumbers.contains))
}

func printLottoResult() {
    if matchingNumbers.isEmpty != true {
        print("축하합니다! 겹치는 번호는 ", terminator: "")
        for number in matchingNumbers {
            if resultNumberString == "" {
                resultNumberString = String(number)
            } else {
                resultNumberString = resultNumberString + ", " + String(number)
            }
        }
        print(resultNumberString + " 입니다!")
    } else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
    resultNumberString = ""
    matchingNumbers = Array<Int>()
 }

func printLottoHistory(number: Int) {
    let selectedRoundNumber: Array<Int> = resultHistory["\(number)회차"]!
    var printRoundNumberString: String = ""
    print("\(number)회차의 로또 당첨 번호는 ", terminator: "")
    for number in selectedRoundNumber {
        if printRoundNumberString == "" {
            printRoundNumberString = String(number)
        } else {
            printRoundNumberString = printRoundNumberString + ", " + String(number)
        }
    }
    print(printRoundNumberString + " 입니다!")
}

for _ in 0...4 {
    pickWinningNumbers()
    compareLottoNumbers()
    printLottoResult()
}

func getLottoHistory() {
    print("[당첨 번호를 검색할 회차] :", terminator: " ")
    if let roundToCheckString = readLine() {
        if let rountToCheckInt = Int(roundToCheckString) {
            if 1 <= rountToCheckInt && rountToCheckInt <= 5 {
                printLottoHistory(number: rountToCheckInt)
            } else {
                print("1~5 중에 입력하세요!")
                getLottoHistory()
            }
        }
    }
}

getLottoHistory()
