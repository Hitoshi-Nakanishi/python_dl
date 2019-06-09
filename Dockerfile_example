FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt update && apt install -y python3-pip
RUN pip3 install tensorflow-gpu keras

RUN apt install -y wget
RUN wget https://raw.githubusercontent.com/fchollet/keras/master/examples/mnist_cnn.py

CMD ["python3", "/mnist_cnn.py"]