# RTMP Live Streaming Server on Raspberry Pi 4 with USB Camera

This guide walks you through setting up an RTSP server using Nginx on a Raspberry Pi 4 and streaming live video from a USB camera.
## Prerequisites

### Hardware
- Raspberry Pi 4 with Raspberry Pi OS installed.
- USB webcam 

### Software
- `nginx` with RTMP module.
- `ffmpeg` for video encoding and streaming.

## Installation Steps

### Step 1: Update and Install Required Software

1. Update the system:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
2. Install NGINX with the RTSP module:
   ``` sudo apt install nginx libnginx-mod-rtmp ```
3. Install FFmpeg:
  ``` sudo apt install ffmpeg ```

### Step 2: Configure NGINX for RTMP: 
1. Open NGINX Configuration File:
``` sudo nano /etc/nginx/nginx.conf ```
2. Edit the NGINX Config File:
```
rtmp {
    server {
        listen 1935;
        chunk_size 4096;

        application live {
            live on;
            record off;
        }
    }
}
```
Save and Exit (CTRL X)

3. Restart NGINX after the applied changes:
``` sudo systemctl restart nginx ```

4. Verify USB Camera Connection: 
``` ls /dev/video0* ```

### Step 4 Video from USB Camera to NGINX: 

1. Start streaming using the FFmpeg Module:
``` ffmpeg -f v4l2 -i /dev/video0 -vcodec h264_omx -b:v 1500k -f flv rtmp://localhost/live/stream ```

2. Play the stream using VLC or some video player
``` vlc rtmp://<RaspberryPi_IP>/live/stream ```

3. Find Raspberry Pi IP:
``` hostnme -I ```
