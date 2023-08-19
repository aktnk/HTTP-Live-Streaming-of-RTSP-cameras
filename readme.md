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

Access `http://localhost/index.html` with a browser.
![new_index_html](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/839869b8-834b-4892-b0fe-42ba32e00389)

### Viewing recorded vidoes

Access `http://localhost/replay.php` with a browser.
![replay and delete_video](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/218b5484-37f1-4bb4-a2f5-92687270f865)

### Terminate HTTP Live Streaming.

```
$ docker compose stop
```
## Explanation of Recording Functions

* Pressing the Start Recording button starts recording.  
   ![record_start](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/1a23e9f7-938e-41c1-936c-72e29e07e0c0)
* Once recording has started, recording cannot begin until recording is stopped.
  Recording files are saved in flv format under `data/hls` directory.
* Pressing the Stop Recording button stops recording. Note that recording cannot be stopped if it has not been started.  
   ![record_stop](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/735d2425-a810-4bdb-b2d9-f213d80dbb3f)
* Recording will automatically stop 30 seconds after it starts or file size over limit 3MB. When the browser's back button is pressed, recording will stop if recording is in progress.
* Pressing the Delete File button to delete the recording.  
  ![delete_button](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/b4e452bb-b7b2-4dcc-8eac-c2b1b3162379)

### Attension

* If you try to navigate away from the recording page, the following message will appear.  
  ![goto_link](https://github.com/aktnk/HTTP-Live-Streaming-of-RTSP-cameras/assets/13390370/172f42a7-d0b9-4d0d-a9ec-8d17fd60d79f)

* If you move between pages while recording, recording is not guaranteed.

## Reference

* [ネットワークWiFiカメラ Tapo で遊ぶ](https://aktnk.github.io/2023/06/18/rtsp_camera/)
* [Tapoを使用したRTSPライブストリーミングの利用方法](https://www.tp-link.com/jp/support/faq/2680/)
