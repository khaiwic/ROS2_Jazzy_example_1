# Sử dụng base image của ROS 2 Jazzy (dựa trên Ubuntu 24.04 LTS)
FROM osrf/ros:jazzy-desktop-full

# Cập nhật và cài đặt một số công cụ cần thiết (nếu có)
RUN apt-get update && apt-get install -y \
    nano \
    git \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc mặc định trong container
WORKDIR /ros2_ws

# Tự động source môi trường ROS 2
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
# Nếu có workspace src, thêm lệnh source của workspace sau khi build
# RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc 

# Mặc định mở bash shell
CMD ["bash"]