FROM alpine
LABEL MAINTAINER="Neil Kuan"
LABEL NAME="k8s-hlab"
LABEL Version="v1.0.0"
ENV BUILD_DEPS="python3-dev build-base linux-headers py3-pip"
ENV TZ=Asia/Taipei
ENV URL='0.0.0.0'
WORKDIR /app
COPY . .
RUN  apk add --no-cache $BUILD_DEPS python3 \
    && python3 -m ensurepip \
    && pip3 install -r requirements.txt --no-cache-dir \
    && apk del $BUILD_DEPS

EXPOSE 8080
CMD ["python3", "app-k8s.py"]