#!/bin/bash  

cd ../lib

git clone https://github.com/opencv/opencv
git clone https://github.com/opencv/opencv_contrib

sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev
sudo apt-get install -y libv4l-dev v4l-utils
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libqt4-dev
sudo apt-get install -y mesa-utils libgl1-mesa-dri libqt4-opengl-dev
sudo apt-get install -y libatlas-base-dev gfortran libeigen3-dev
sudo apt-get install -y libgtk2.0-dev

cd opencv

mkdir .cache
mkdir .cache/xfeatures2d
mkdir .cache/xfeatures2d/boostdesc
mkdir .cache/xfeatures2d/vgg

# boostdesc
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_lbgm.i > .cache/xfeatures2d/boostdesc/0ae0675534aa318d9668f2a179c2a052-boostdesc_lbgm.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm.i > .cache/xfeatures2d/boostdesc/0ea90e7a8f3f7876d450e4149c97c74f-boostdesc_bgm.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_064.i > .cache/xfeatures2d/boostdesc/202e1b3e9fec871b04da31f7f016679f-boostdesc_binboost_064.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm_bi.i > .cache/xfeatures2d/boostdesc/232c966b13651bd0e46a1497b0852191-boostdesc_bgm_bi.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_bgm_hd.i > .cache/xfeatures2d/boostdesc/324426a24fa56ad9c5b8e3e0b3e5303e-boostdesc_bgm_hd.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_128.i > .cache/xfeatures2d/boostdesc/98ea99d399965c03d555cef3ea502a0b-boostdesc_binboost_128.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/34e4206aef44d50e6bbcd0ab06354b52e7466d26/boostdesc_binboost_256.i >  .cache/xfeatures2d/boostdesc/e6dcfa9f647779eb1ce446a8d759b6ea-boostdesc_binboost_256.i
 
#vgg
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_120.i > .cache/xfeatures2d/vgg/151805e03568c9f490a5e3a872777b75-vgg_generated_120.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_64.i >  .cache/xfeatures2d/vgg/7126a5d9a8884ebca5aea5d63d677225-vgg_generated_64.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_80.i >  .cache/xfeatures2d/vgg/7cd47228edec52b6d82f46511af325c5-vgg_generated_80.i
wget https://raw.githubusercontent.com/opencv/opencv_3rdparty/fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d/vgg_generated_48.i >  .cache/xfeatures2d/vgg/e8d0dcd54d1bcfdc29203d011a797179-vgg_generated_48.i

mkdir build
cd build
cmake .. -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules

make -j
sudo make install

sudo sh -c 'echo '/usr/local/lib' > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
