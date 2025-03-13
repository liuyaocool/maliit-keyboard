# Introduce

modify support Tab Ctrl Meta Alt

# Install

```bash
git clone https://github.com/liuyaocool/maliit-keyboard.git --depth=1
cd maliit-keyboard
mkdir build
cd build
cmake ..
make
sudo make install

# replace
sudo mv /usr/bin/maliit-keyboard /usr/bin/maliit-keyboard.bak
sudo ln -s /usr/local/bin/maliit-keyboard /usr/bin/maliit-keyboard
```

# Keyboard Demo

[Keyboard_en.qml](Keyboard_en.qml)