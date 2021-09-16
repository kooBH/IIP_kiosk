# IIP_kiosk     


## clone

```
git clone --recursive https://github.com/kooBH/IIP_Demo.git
```

--recursive 을 해야 서브 모듈로 들어가있는 의존성 라이브러리를 가져올 수 있습니다.  
몇몇 라이브러리는 private 입니다.    

이미 clone 한 상태에서 서브 모듈을 받으려면
```
git submoudle init
git submodule update
```
를 하십시오.  

## build  
해당 프로젝트와 각각의 모듈, 예제들은 각각의 ```CMakeLists.txt``` 를 통해 테스트 프로그램을 빌드할 수 있어야합니다.    
```
<CMakeLists.txt 가 있는 위치에서> 
< mkdir 또는 cd > < build 또는 bin >
cmake ..
make -j
```   

## Libraries   

name|usage|link
---|---|---
MLDR(private)|Preprocess|https://github.com/kooBH/MLDR
STFT|Preprocess|https://github.com/kooBH/STFT
opencv|Face Detection|https://github.com/opencv/opencv
opencv_contrib|Face Detection|https://github.com/opencv/opencv_contrib
dlib|Face Detection|https://github.com/davisking/dlib
serial|Sonar Sensor|https://github.com/wjwwood/serial
MB1414|Sonar Sensor|https://github.com/kooBH/MB1414
WAV|Audio I/O|https://github.com/kooBH/WAV
RtAudioWrapper|Audio I/O|https://github.com/kooBH/RtAudioWrapper


