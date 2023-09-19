
# AIFFEL Campus Online 5th Code Peer Review Templete
- 코더 : 조필선
- 리뷰어 : 이혁희


# PRT(PeerReviewTemplate) 
각 항목을 스스로 확인하고 토의하여 작성한 코드에 적용합니다.

- [X] 코드가 정상적으로 동작하고 주어진 문제를 해결했나요?
    - 예. 정상적으로 동작하고 주어진 문제를 해결하였습니다.
        1. 화일을 읽는다.
        2. 2gram의 리스트를 작성한다.
        3. 2gram의 빈도를 값으로 하는 딕셔너리를 생성한다.
        4. 빈도수가 가장 높은 item을 출력한다.
        5. 딕셔너리를 출력한다.
    
- [X] 주석을 보고 작성자의 코드가 이해되었나요?
    - 예. 아래와 같이 주석이 잘 작성되어 있고, 코드를 잘 설명합니다.
    ```
    data = f.read() # 파일 전체의 내용을 하나의 문자열로 읽어서 data라는 변수에 저장한다.
    data = data.lower() # 대문자로 되어있는 것을 lower() 함수를 써서 소문자로 바꾼다.
    data = re.sub(r'[^a-zA-Z0-9]+', ' ', data)  # 정규표현식을 사용해서 특수문자를 공백으로 바꾼다.
    data = data.split() # data를 공백으로 쪼갠다.
    data = list(zip(*[data[i:] for i in range(2)])) # 2-gram 형태로 만든다.
    data = Counter(data)    # Counter 함수를 이용해 각 요소가 몇 번씩 나오는지 센다.
    data1 = data.most_common(1) # data1이라는 새로운 변수에 제일 많이 나온 요소 한 가지를 most_common() 함수를 사용해 대입한다.
    print("max2gram:", data1)   # 제일 많이 나온 요소 출력
    print("dic:", data) # data 딕셔너리 출력
    ```
    
- [X] 코드가 에러를 유발할 가능성이 없나요?
    - 에러를 유발할 가능성이 없습니다.
    - 아래 코드에서 zip 함수에 전달되는 두 리스트의 길이가 달라서 에러가 날 수 있다고 생각했으나, zip함수는 두 개의 list 중 length가 짧은 것을 기준으로 zip하므로 에러가 발생하지 않습니다.
    ```
    data = list(zip(*[data[i:] for i in range(2)])) # 2-gram 형태로 만든다.
    ```
- [X] 코드 작성자가 코드를 제대로 이해하고 작성했나요?
    - 예. 코드와 주석이 잘 매치되고 로직의 흐름도 깔끔합니다.
    
- [X] 코드가 간결한가요?
    - 예. 간결합니다.
    - 다음 코드는 컴프리헨션, unpacking, zip 함수의 삼단콤보을 이용하여 2-gram의 리스트를 깔끔하게 생성했습니다. 좋은 코드의 예를 보여 주셔서 감사합니다. 
    ```
    data = list(zip(*[data[i:] for i in range(2)])) # 2-gram 형태로 만든다.
    ```

# 예시

   - 2gram의 빈도를 Counter함수를 이용해서 간단하게 잘 작성했습니다.
    
   ```python
   data = Counter(data)    # Counter 함수를 이용해 각 요소가 몇 번씩 나오는지 센다.
   ```
   - 다음은 위의 코드를 지난 시간에 배운 setdefault, update 함수를 이용해서 작성한 예입니다.
    
   ```python
   # None이면 1, 아니면 value + 1을 return
   def increment(value):
       return 1 if value is None else value + 1

   # ngram별 빈도 계산
   ngram_freq = {}
   for ngram in ngrams:
       # ngram을 빈도를 읽어서 1증가. 없으면 1
       new_freq = increment(ngram_freq.setdefault(ngram)) 
       # ngram의 빈도 업데이트
       ngram_freq.update({ngram: new_freq})
   ```

# 참고 링크 및 코드 개선
