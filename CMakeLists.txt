# CMAKE version of Ubuntu 16.04 is 3.5.
cmake_minimum_required(VERSION 3.5)
project(program_name)

set(LINKLIBS)
set(COMPILE_OPTION)
set(SRC)
set(INCL)


##########################################
#               dlib                     #
#    http://dlib.net/compile.html        #
##########################################

add_subdirectory(lib/dlib/dlib dlib_build)

##########################################
#               OpenCV                   #
#        https://opencv.org/             #
##########################################

if(UNIX )  

## NOTE : Adjust version name of LINKLBIS with corresponding version name of 
##        installed openCV
list(APPEND LINKLIBS 
  /usr/local/lib/libopencv_core.so.4.5.3
  /usr/local/lib/libopencv_highgui.so.4.5.3
  /usr/local/lib/libopencv_imgproc.so.4.5.3
  /usr/local/lib/libopencv_objdetect.so.4.5.3
  /usr/local/lib/libopencv_videoio.so.4.5.3
  /usr/local/lib/libopencv_dnn.so.4.5.3
  /usr/local/lib/libopencv_face.so.4.5.3

  #opencv_core
  #opencv_highgui
  #opencv_imgproc
  #opencv_objdetect
  #opencv_videoio
  #opencv_dnn
  #opencv_face

  )
elseif(WIN32)
  list(APPEND LINKLIBS 
    ${PROJECT_SOURCE_DIR}/lib/opencv_world420.lib
    )
endif()


list(APPEND COMPILE_OPTION )
if(UNIX)
  list(APPEND INCL 
    /usr/local/include/opencv4
    ${PROJECT_SOURCE_DIR}/lib/opencv/include
    )
elseif(WIN32)
  list(APPEND INCL 
    ${PROJECT_SOURCE_DIR}/lib/opencv/include
    )
endif()

#################################################

add_executable(${PROJECT_NAME} ${SRC})

target_include_directories(${PROJECT_NAME}
	PRIVATE
	${INCL}
)

LINK_DIRECTORIES( /usr/local/lib/ )
target_link_libraries(${PROJECT_NAME} ${LINKLIBS} dlib::dlib)
target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_OPTION} )