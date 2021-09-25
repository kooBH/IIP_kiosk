# get_audio_n_STFT    
1. Get audio input from input device    
2. Convert WAV into STFT    
3. Convert StFT into WAV    
4. Save WAV  


## Usage    
```bash  
cd build  
cmake ..  
<make > or <run Visual Stduio>   
```  

+ linux  
1. run AudioProbe 
2. Check device number, channels, samplerate of input device
3. modify paramters in ```test.cpp```
4. build & run ```get_audio_n_STFT```

+ Windows (VS)
1. Set ```AudioProbe``` as Start Project
2. build & run AudioProbe 
3. Check device number, channels, samplerate of input device
4. modify paramters in ```test.cpp```
5. build & run ```get_audio_n_STFT```  

