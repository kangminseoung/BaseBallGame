//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 강민성 on 11/6/24.
//

import Foundation



struct BaseballGame {
    
    
        func start() {
            let answer = makeAnswer()
    
            print("< 게임을 시작합니다 > ")
            print("숫자 야구 게임의 규칙은 다음과 같습니다:")
            print("- 3자리 숫자를 맞추세요.")
            print("- 각 숫자는 중복되지 않습니다.")
            print("- 입력한 숫자에 따라 힌트를 받습니다.")
            print("-------------------------------")
            let input = userInput()
    
            print(input)
            
            while true {
                print("숫자를 입력하세요:")
                
                let input = userInput()
                
                if input.isEmpty {
                    continue
                }
                
                let hint = calculateHint(answer: answer, guess: input)
                print("힌트: \(hint.strike) 스트라이크, \(hint.ball) 볼")
                
                if hint.strike == 3 {
                    print("정답입니다.")
                    break
                }
            }
        }
    
    // 3자리의 랜덤 숫자를 생성하는 함수
    
    func makeAnswer() -> [Int] {
        
        var array: [Int] = [] // 1. 배열을 만든다. array 변수의 타입은 Int 배열 이고 할당값은 빈배열 할당
        let answerMake1 = Int.random(in: 1...9) // 2. 랜덤함수를 찾아서 사용한다음에 배열 첫번째에 넣어본다. (1~9 랜덤함수)
        
        array.append(answerMake1) // 3. 배열 1번째에 값을 넣는다.
        
        var answerMake2 = Int.random(in: 0...9) // 4. 랜덤함수를 사용해서 배열 두번째에 넣을 값을 변수에 저장한다. (0 ~ 9 랜덤함수)
        
        while answerMake1 == answerMake2 { // 5. 중복되는지 확인한다. (첫번째 배열값이 방금 넣은 두번째 배열값과 같은지 확인한다.)
            answerMake2 = Int.random(in: 0...9) // 6. 만약 중복이 되면 배열에 2번째에 넣지 않고 다른 변수를 넣는다.(3번,4번을 한번더 실행한다)
        }
        array.append(answerMake2) // 7. 중복이 되지 않는다면 배열 2번째에 값을 넣는다.
        
        var answerMake3 = Int.random(in: 0...9) // 8. 랜덤함수를 사용해서 배열 세번째에 넣을 값을 변수에 저장한다. (0 ~ 9랜덤함수)
        
        while answerMake1 == answerMake3 || answerMake2 == answerMake3 { // 9. 중복되는지 확인한다. (첫번째배열값, 두번째배열값이 있는지 확인한다.)
            answerMake3 = Int.random(in: 0...9) // 10. 만약 중복이 되면 다른변수를 넣는다.(7번, 8번을 한번더 실행한다.)
        }
        array.append(answerMake3) // 11. 만약 중복이 되지 않는다면 값을 세번째에 넣는다.
        
        return array // 12. 정수타입으로 만든 배열을 리턴한다.
        
        
    }
    
    
    
    // 사용자로 부터 3자리 입력을 받는 함수
    
    func userInput() -> [Int] { // userInput이라는 함수에 배열 Int 타입을 반환
        
        let input = readLine()!
        
        // 사용자 입력 옵셔널 처리
        if let inputAnswer = Int(input) {
            
            // 입력값을 숫자로 변환
            let inputAns = input.compactMap {Int(String($0))} // compactMap을 사용해서 입력 문자열의 각 문자를 정수로 변환 합니다.
            
            // 숫자 결과 검증
            if inputAns.count == input.count && inputAns.count == 3 { // 변환된 배열의(inputAns.count)와 입력 문자열 (input.count)를 비교
                print("입력된 숫자 배열: \(inputAns)") // 두 값이 같으면 print 실행
                return inputAns
            } else {
                print("유효하지 않은 입력입니다. 3자리 숫자만 입력하세요") // 두 값이 다르다면 오류 메세지를 출력하고 빈 배열을 반환 한다.
                return []
            }
        } else {
            print("입력이 없습니다. 숫자를 입력하세요") // 입력값이 비어 있는 경우 빈 배열을 반환
            return []
        }
    }
    
    // strike와 ball을 계산하는 함수
    
    func calculateHint(answer: [Int], guess: [Int]) -> (strike: Int, ball: Int) { // 1. answer의 값과 guess 값을 비교해서 strike와 ball의 값을 반환시킨다.
        var strike = 0 // 2. strike라는 변수에 값을 할당
        var ball = 0 // 3. ball이라는 변수에 값을 할당
        
        for i in 0...2 {  // 4. for 반복문을 이용하여 배열 첫번째 두번째 세번째를 넣는다.
            
            if  answer[i] == guess[i] {
                strike += 1 // 5. answer[i]와 guess[i]가 같다면 strike 기본값에 더함
                
            } else if answer.contains(guess[i]) { // 6. guess[i]를 answer에 포함 시킨다.
                ball += 1
                
            }
        }
        
        return(strike, ball) // 6. strike, ball을 반환
    }
}
