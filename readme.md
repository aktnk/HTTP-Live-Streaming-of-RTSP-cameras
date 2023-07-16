# HTTP Live Streaming of RTSP cameras

Enables two RTSP cameras to be viewed via HTTP Live Streaming using  Docker containers.


## Tested Environment

* Host OS: Ubuntu 20.04 LTS
* Docker version 24.0.4
* Docker Compose version v2.19.1
* RTSP cameras
    * [Tapo C110](https://www.tp-link.com/jp/home-networking/cloud-camera/tapo-c110/)
    * [Tapo C200](https://www.tp-link.com/jp/home-networking/cloud-camera/tapo-c200/)

## Prerequisites

Tapo C110 and C200 cameras must be configured.
* Connection to the network has been completed.
* User name and password settings for RTSP distribution must have been completed.

## How to use

### Clone this repository

```
$ git clone https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras.git work
$ cd work
```
### Change the following files according to the camera to be used

When using RTSP cameras other than Tapo C110&C200, ffmpeg settings in `camera_c110/convert.sh` and `camera_c200/convert.sh` and service settings for `camera_c110` and `camera_c200` in compose.yml, should be changed according to the camera to be used.

### Build and run containers

```
$ docker compose up -d --build
```

### Viewing camera images

Access `http://localhost/index2.html` with a browser.


### Terminate HTTP Live Streaming.

```
$ docker compose stop
```
## Explanation of Recording Functions

* Pressing the Start Recording button starts recording.
* Once recording has started, recording cannot begin until recording is stopped.
* Pressing the Stop Recording button stops recording. Note that recording cannot be stopped if it has not been started.
* Recording will automatically stop 30 seconds after it starts. When the browser's back button is pressed, recording will stop if recording is in progress.
* Recording files are saved in flv format under data/hls.

## Reference

* [ネットワークWiFiカメラ Tapo で遊ぶ](https://aktnk.github.io/2023/06/18/rtsp_camera/)
* [Tapoを使用したRTSPライブストリーミングの利用方法](https://www.tp-link.com/jp/support/faq/2680/)
