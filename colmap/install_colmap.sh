git clone https://github.com/colmap/colmap.git 
cd colmap 
mkdir build 
cd build
cmake .. -GNinja  -DCMAKE_CUDA_ARCHITECTURES=all-major && \
ninja && \
sudo ninja install
