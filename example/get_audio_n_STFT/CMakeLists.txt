# CMAKE version of Ubuntu 16.04 is 3.5.
cmake_minimum_required(VERSION 3.5)
project(get_audio_n_STFT)

set(SRC)
set(INCL)
set(LINKLIBS)
set(COMPILE_OPTION)

### RtAudioWrapper ###
include(../../lib/RtAudioWrapper/RtAudio.cmake)
include(../../lib/RtAudioWrapper/AudioProbe.cmake)

### WAV ###
include(../../lib/WAV/WAV.cmake)

### STFT ###
include(../../lib/STFT/cpp/STFT_cpp.cmake)
  
#############################

list(APPEND SRC
	test.cpp
	)

if(MSVC)
  list(APPEND COMPILE_OPTION
    )
else()
  list(APPEND COMPILE_OPTION
    )
	list(APPEND LINKLIBS
	m
  )
endif()

add_executable(${PROJECT_NAME} ${SRC})
target_include_directories(${PROJECT_NAME}    PRIVATE    ${INCL}  )
target_link_libraries(${PROJECT_NAME} ${LINKLIBS})
target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_OPTION} )
set_target_properties(${PROJECT_NAME} PROPERTIES  CXX_STANDARD 17 )