import 'dart:async';

void main() {
  // 작업 시간과 휴식 시간의 길이를 초 단위로 지정합니다.
  const int workTime = 25 * 60;
  const int breakTime2 = 5 * 60;

  // 타이머를 시작합니다.
  startTimer(workTime);
}

import 'dart:async';

void main() {
  const int workTime = 25 * 60;
  const int breakTime = 5 * 60;

  startTimer(workTime);
}


void startTimer(int time) {
  // 타이머 생성
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  // 타이머가 종료되었는지 확인
    if (timer == 0) {
  // 타이머를 중지한다.
      timer.cancel();
  // 작업 시간이 종료되었음을 알린다.
      print("작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.");

  // 휴싯 시간을 시작합니다.
      startTimer(breakTime);

    }


  }



}