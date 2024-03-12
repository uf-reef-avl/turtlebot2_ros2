cwd=$(pwd)
git submodule update --init --recursive
cd ~/
wget https://raw.githubusercontent.com/kobuki-base/kobuki_ftdi/devel/60-kobuki.rules
sudo cp 60-kobuki.rules /etc/udev/rules.d
sudo service udev reload
sudo service udev restart
sudo apt update
sudo apt install ros-humble-kobuki-velocity-smoother ros-humble-teleop-twist-keyboard ros-humble-joy-teleop ros-humble-teleop-twist-joy
cd cwd
cd ../..
rosdep install -i --from-path src --rosdistro humble -y
colcon build --symlink-install --executor sequential --cmake-args -Wno-dev
