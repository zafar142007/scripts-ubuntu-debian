# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
#sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
#sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen

sudo apt install libgstreamer-plugins-base1.0-dev

# INSTALL THE LIBRARY (YOU CAN CHANGE '3.1.0' FOR THE LAST STABLE VERSION)

sudo apt install git
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout d1bbc0b6e6c0c5115e54aa6d9f32a1d332a9538c

cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout b7dcf141507edbe544e75820c76769a7769223ac
cd ..

#sudo apt-get install -y unzip wget
#wget https://github.com/opencv/opencv/archive/3.1.0.zip
#unzip 3.1.0.zip
#rm 3.1.0.zip
#mv opencv-3.1.0 OpenCV

#wget https://github.com/opencv/opencv_contrib/archive/3.1.0.zip
#unzip 3.1.0.zip
#mv opencv_contrib-3.1.0/ OpenCV_contrib
#rm -rf 3.1.0.zip 

cd opencv

#hdf5 file not found bugfix
#echo "find_package(HDF5)" >> modules/python/common.cmake
#echo "include_directories(${HDF5_INCLUDE_DIRS})" >> modules/python/common.cmake
sudo apt-get install libhdf5-serial-dev hdf5-tools

mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DWITH_OPENGL=ON -DWITH_QT=ON -DBUILD_EXAMPLES=ON -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
make -j8 > /opt/logs/make.log &
sudo make install
sudo ldconfig


# EXECUTE SOME OPENCV EXAMPLES AND COMPILE A DEMONSTRATION

# To complete this step, please visit 'http://milq.github.io/install-opencv-ubuntu-debian'.
