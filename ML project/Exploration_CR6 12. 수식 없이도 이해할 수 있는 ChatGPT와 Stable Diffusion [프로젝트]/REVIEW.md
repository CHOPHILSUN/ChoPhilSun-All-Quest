🔑 **PRT(Peer Review Template)**
- 코더 : 조필선
- 리뷰어 : 이혁희
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 윤곽선 검출을 이용한 멋진 이미지를 생성하였습니다.
    ```
    from diffusers import UniPCMultistepScheduler

    # UniPCMultistepScheduler에 대한 스케줄러 구성
    canny_pipe.scheduler = UniPCMultistepScheduler.from_config(canny_pipe.scheduler.config)
    # canny_pipe를 CUDA 장치로 이동하여 GPU 가속화
    canny_pipe = canny_pipe.to("cuda")

    # 동일한 이미지를 생성하기 위해 시드를 지정합니다.
    generator = torch.manual_seed(0)

    # 이미지를 생성하는데 사용할 프롬프트를 작성합니다.
    prompt = [
        "modern artist",
        "energetic style",
        "computer graphics",
        "high-quality rendering",
        "vibrant color scheme",
        "dynamic composition",
        "detailed rendering"
    ]

    # 이미지를 생성합니다.
    canny_image = canny_pipe(
        prompt=prompt,
        num_inference_steps=20,
        generator=generator,
        image=canny_image
    ).images[0]

    # 생성된 이미지를 저장합니다.
    canny_image.save("/content/drive/MyDrive/Colab Notebooks/canny_image.png")

    # 생성된 이미지를 출력합니다.
    canny_image
    ```
    
    - 인체 자세 검출기를 이용한 이미지 생성
        - CUDA out of memory 문제로 실행하지 못하였습니다.
        
    - 윤곽선 검출 + 인체 자세 감지
    다음 코드에서 오류가 발생합니다. controlnets를 파이프라인으로 전달하는 코드를 빼먹어서 그런 것 같습니다.
    그리고, scheduler정의가 두번 반복됩니다.
    ```
    # 리스트 controlnets를 파이프라인으로 전달합니다.
    pipe = controlnets

    controlnets = [canny_controlnet, openpose_controlnet]

    for net in controlnets:
        if hasattr(net, 'scheduler'):
            net.scheduler = UniPCMultistepScheduler.from_config(net.scheduler.config)
            net = net.to("cuda")
        else:
            print(f"{type(net).__name__} does not have a 'scheduler' attribute.")
     
     pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
     pipe = pipe.to("cuda")
    ```
     다음과 같이 수정하면 좋을 것 같습니다.
     ````
      # 리스트 controlnets를 파이프라인으로 전달합니다. 
      pipe = StableDiffusionControlNetPipeline.from_pretrained(
            "runwayml/stable-diffusion-v1-5", controlnet=controlnets, torch_dtype=torch.float16
      )
      pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
      pipe = pipe.to("cuda")

     ```
     
- [ ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 회고록에서 진행 과정을 잘 기술하였습니다.
    > <조필선 회고록>

    > 이미지 처리와 딥 러닝 기술을 활용하여 오픈포즈와 에지 디텍션을 사용해 사람의 자세를 감지하고 이미지를 조작했습니다.

    > 딥 러닝 모델과 전처리기를 통합하는 과정에서 모델 로딩, 스케줄러 설정, 그리고 프롬프트를 활용하여 이미지를 생성하는 다양한 단계를 경험했습니다.

    > 프로젝트를 진행하며 코드 수정, 패키지 설치, 그리고 이미지 저장 및 출력 등 다양한 기술적인 도전들을 겪으면서 머신 러닝과 이미지 처리에 대한 이해도를 향상시켰습니다.
    
- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 이미지 윤곽선을 이용하여 멋진 이미지를 생성하였습니다. 프롬프트를 잘 작성하였습니다.
    ```
     prompt = [
    "modern artist",
    "energetic style",
    "computer graphics",
    "high-quality rendering",
    "vibrant color scheme",
    "dynamic composition",
    "detailed rendering"
]
    ```
- [ ]  **4. 회고를 잘 작성했나요?**
    - 회고에서 어려웠던 점, 배운 점을 상세히 기록하고 향후 계획까지 기록하였습니다.

- [ ]  **5. 코드가 간결하고 효율적인가요?**
    - 학습하신 것을 바탕으로 잘 작성하였습니다.