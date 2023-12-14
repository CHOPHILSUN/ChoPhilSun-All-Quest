🔑 **PRT(Peer Review Template)**
- 코더 : 조필선, 조세창
- 리뷰어 : 
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 주어진 문제의 스펙을 완벽하게 만족하는 코드가 제출되었습니다.
    ```
    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        debugShowCheckedModeBanner: false, // Disable the debug banner
        home: Scaffold(
            appBar: AppBar(
            leading: const Icon(Icons.star), // Icon in the upper left corner
            title: const Text('플러터 앱 만들기'), // AppBar 상단의 문구를 표시한다.
            centerTitle: true, // Center the title
            ),
            body: Column(
            children: [
                const Divider(
                    color: Colors.black,
                    thickness: 2), // Divider as a border between AppBar and body
                Expanded(
                child: Center(
                    child: OutlinedButton(
                    onPressed: () {
                        print('버튼이 눌렸습니다'); // Print to debug console
                    },
                    style: OutlinedButton.styleFrom(
                        side:
                        const BorderSide(color: Colors.black), // Outline color
                        shape: const RoundedRectangleBorder(
                        // Rectangular shape
                        borderRadius: BorderRadius.zero,
                        ),
                    ),
                    child: const Text('Text'),
                    ),
                ),
                ),
                Stack(                    // 반복문을 통해서 컨테이너를 겹치도록 표시한다.
                children: [
                    for (var i = 0; i < 5; i++)
                    Container(
                        width: 300.0 - 60 * i,
                        height: 300.0 - 60 * i,
                        decoration: BoxDecoration(
                        color: getRandomColor(),
                        border: Border.all(),
                        ),
                    ),
                ],
                ),
                const SizedBox(height: 20), // Spacing at the bottom
            ],
            ),
        ),
        );
    }
    ```

- [ ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 주석을 잘 사용하여 코드를 설명하였습니다.
    ```
    Stack(                    // 반복문을 통해서 컨테이너를 겹치도록 표시한다.
              children: [
                for (var i = 0; i < 5; i++)
                  Container(
                    width: 300.0 - 60 * i,
                    height: 300.0 - 60 * i,
                    decoration: BoxDecoration(
                      color: getRandomColor(),
                      border: Border.all(),
                    ),
                  ),
              ],
            ),
    ```


- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - Stack에 컨테이너를 쌓을 때 반복문을 이용하여 코드를 간결하게 작성하였습니다.(2번 리뷰 코드 참조)


- [ ]  **4. 회고를 잘 작성했나요?**
    - 회고에서 어려웠던 점, 배운 점을 상세히 기록하고 향후 계획까지 기록하였습니다.
    ```
    ##<조필선 회고록>

    Dart 코드와 플러터를 이용해서 화면에 위젯 앱화면을 구성을 해보았다.
    기본적으로 위젯을 구성하는 방법과 컨테이너를 활용해서 중첩시키는 학습을 해보았다.
    아직 익숙하지는 않지만 기본적으로 화면에 앱을 구성하는 경험을 해보아서 좋았다.```

- [ ]  **5. 코드가 간결하고 효율적인가요?**
    - 반복문을 이용하여 코드를 간결하게 작성했습니다.(2번 리뷰 코드 참조)

