

# PyDS prerequisites
sudo apt-get install python3-dev python-gi-dev -y
export GST_LIBS="-lgstreamer-1.0 -lgobject-2.0 -lglib-2.0"
export GST_CFLAGS="-pthread -I/usr/include/gstreamer-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include"
git clone https://github.com/GStreamer/gst-python.git /tmp/gst-python
cd /tmp/gst-python
git checkout 1a8f48a
./autogen.sh PYTHON=python3
./configure PYTHON=python3
make -j$(nproc)
sudo make install

# build pyds bindings
cd /opt/nvidia/deepstream/deepstream/lib 
sudo python3 setup.py install

