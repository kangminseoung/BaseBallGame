# Create a Number Baseball Game 
숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다.

각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다.

예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.
***
# [개인과제] 숫자 야구 게임 만들기 
### 1. 필수 구현 기능
  - LV 1
    + [x] 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
    + [x] 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
  - LV 2
    + [x] 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
      - 힌트는 야구용어인 볼과 스트라이크입니다.
      - 같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼입니다.
    + [x] 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
    + [x] 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
