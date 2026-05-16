/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect } from '@ohos/hypium'
import camera from '@ohos.multimedia.camera'
import media from '@ohos.multimedia.media'
import MediaTestBase from './MediaTestBase';
import cameraObj from '@ohos.multimedia.camera';

const VIDEO_TRACK = 'video_track';
const AUDIO_TRACK = 'audio_track';
const AUDIO_VIDEO_TYPE = 'audio_video';
const ONLYVIDEO_TYPE = 'only_video';
const DELTA_TIME = 1500;
const BITRATE_DELTA_TIME = 20000;
const PLAY_TIME = 1000;
let mediaTestBase = new MediaTestBase()

export interface RecorderConfigFile {
  audioBitrate?: number;
  audioChannels?: number;
  audioCodec?: media.CodecMimeType;
  audioSampleRate?: number;
  fileFormat: media.ContainerFormatType;
  videoBitrate?: number;
  videoCodec?: media.CodecMimeType;
  videoFrameWidth?: number;
  videoFrameHeight?: number;
  videoFrameRate?: number;
  isHdr?: boolean;
  enableTemporalScale?: boolean;
  audioEncoder?: media.AudioEncoder;
  audioEncodeBitRate?: number;
  numberOfChannels?: number;
  format?: media.AudioOutputFormat;
  uri: string;
  location?: media.Location;
  audioEncoderMime?: media.CodecMimeType;
}

export default class VideoRecorderTestBase {
  async asyncinitCaptureSession(videoOutPut: cameraObj.CameraOutput, cameraManager: cameraObj.CameraManager,
    cameraDevice: cameraObj.CameraDevice, previewOutput: cameraObj.CameraOutput) {
    let cameraInput = await cameraManager.createCameraInput(cameraDevice);
    if (cameraInput != null) {
      console.info('[camera] case createCameraInput success');
    } else {
      console.info('[camera] case createCameraInput failed');
      return;
    }
    await cameraInput.open().then(() => {
      console.info('[camera] cameraInput open success');
    })
    let captureSession = await cameraManager.createCaptureSession();
    await captureSession.beginConfig();
    await captureSession.addInput(cameraInput);
    await captureSession.addOutput(previewOutput);
    await captureSession.addOutput(videoOutPut);
    await captureSession.commitConfig();
    await captureSession.start();
    return captureSession;
  }

  async asyncstopCaptureSession(captureSession: cameraObj.CaptureSession) {
    await captureSession.stop().then(() => {
      console.info('[camera] case captureSession stop success');
    });
    await captureSession.release().then(() => {
      console.info('[camera] case captureSession release success');
    });
  }

  getTrackArray(videoType: string, recorderConfigFile: RecorderConfigFile,
    sourceType: media.VideoSourceType | undefined) {
    if (videoType == AUDIO_VIDEO_TYPE) {
      let audioTrack: Array<string> =
        new Array(recorderConfigFile.audioBitrate == undefined ? '0' : recorderConfigFile.audioBitrate.toString(),
          recorderConfigFile.audioChannels == undefined ? '0' : recorderConfigFile.audioChannels.toString(),
          'audio/mp4a-latm',
          recorderConfigFile.audioSampleRate == undefined ? '0' : recorderConfigFile.audioSampleRate.toString());
      let videoTrack: Array<string> | null = null;
      if (sourceType == media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES) {
        videoTrack = new Array('video/avc',
          recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
          recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
      } else {
        if (recorderConfigFile.videoCodec == 'video/avc') {
          videoTrack = new Array('video/avc',
            recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
            recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
        } else {
          videoTrack = new Array('video/mp4v-es',
            recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
            recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
        }
      }
      let trackArray = new Array(videoTrack, audioTrack);
      return trackArray;
    } else if (videoType == ONLYVIDEO_TYPE) {
      let videoTrack: Array<string> | null = null;
      if (sourceType == media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES) {
        videoTrack = new Array('video/avc',
          recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
          recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
      } else {
        if (recorderConfigFile.videoCodec == 'video/avc') {
          videoTrack = new Array('video/avc',
            recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
            recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
        } else {
          videoTrack = new Array('video/mp4v-es',
            recorderConfigFile.videoFrameHeight == undefined ? '0' : recorderConfigFile.videoFrameHeight.toString(),
            recorderConfigFile.videoFrameWidth == undefined ? '0' : recorderConfigFile.videoFrameWidth.toString());
        }
      }
      let trackArray = new Array(videoTrack);
      return trackArray;
    } else {
      let audioTrack: Array<string> =
        new Array(recorderConfigFile.audioEncodeBitRate == undefined ? '0' :
        recorderConfigFile.audioEncodeBitRate.toString(),
          recorderConfigFile.numberOfChannels == undefined ? '0' : recorderConfigFile.numberOfChannels.toString(),
          'audio/mp4a-latm',
          recorderConfigFile.audioSampleRate == undefined ? '0' : recorderConfigFile.audioSampleRate.toString());
      let trackArray = new Array(audioTrack);
      return trackArray;
    }
  }

  checkDescription(obj: media.MediaDescription, trackType: string,
    descriptionValue: Array<string>) {
    let index = 0;
    if (trackType == VIDEO_TRACK) {
      console.info('case video codec_mime is  ' + obj['codec_mime']);
      expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
      console.info('case video height is  ' + obj['height']);
      expect(obj['height']).assertEqual(Number(descriptionValue[index++]));
      console.info('case video width is  ' + obj['width']);
      expect(obj['width']).assertEqual(Number(descriptionValue[index++]));
    } else {
      console.info('case audio bitrate is  ' + obj['bitrate']);
      let tmpDescriptionValue: number = Number(descriptionValue[index++]);
      expect(Number(obj['bitrate'])/3).assertLess(tmpDescriptionValue);
      console.info('case audio channel_count is  ' + obj['channel_count']);
      expect(obj['channel_count']).assertEqual(Number(descriptionValue[index++]));
      console.info('case audio codec_mime is  ' + obj['codec_mime']);
      expect(obj['codec_mime']).assertEqual(descriptionValue[index++]);
      console.info('case audio sample_rate is  ' + obj['sample_rate']);
      if (Number(descriptionValue[index]) > 48000 && obj['sample_rate'] == 48000) {
        index++;
      } else {
        expect(obj['sample_rate']).assertEqual(Number(descriptionValue[index++]));
      }
    }
  }
  async checkVideos(playFdPath: string, duration: number, trackArray: Array<Array<string>>,
    playerSurfaceId: string | null) {
    let videoPlayer: media.VideoPlayer = await media.createVideoPlayer();
    console.info('[checkVideos] case checkVideos fdPath is :' + playFdPath);

    videoPlayer.on('error', (error) => {
      console.info(`case error called,errMessage is ${error.message}`);
      expect().assertFail();
    });
    videoPlayer.url = playFdPath;
    let tarckType: Array<string> | undefined = undefined;
    if (playerSurfaceId != null) {
      tarckType = new Array(VIDEO_TRACK, AUDIO_TRACK);
      await videoPlayer.setDisplaySurface(playerSurfaceId).then(() => {
        console.info('case setDisplaySurface success');
        expect(videoPlayer.state).assertEqual('idle');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    } else {
      tarckType = new Array(AUDIO_TRACK);
    }
    await videoPlayer.prepare().then(() => {
      expect(videoPlayer.state).assertEqual('prepared');
      expect(Math.abs(videoPlayer.duration - duration)).assertLess(DELTA_TIME);
      console.info('case prepare called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    let arrayDescription: Array<media.MediaDescription> = await videoPlayer.getTrackDescription();

    await videoPlayer.release().then(() => {
      console.info('case release called!!');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

    if (arrayDescription != undefined) {
      expect(arrayDescription.length).assertEqual(trackArray.length);
    } else {
      console.info('case getTrackDescription is failed');
      expect().assertFail();
    }
    console.info(`case arrayDescription is ${JSON.stringify(arrayDescription)}`)
    console.info(`case trackArray is ${JSON.stringify(trackArray)}`)
    for (let i = 0; i < arrayDescription.length; i++) {
      this.checkDescription(arrayDescription[i], tarckType[i], trackArray[i]);
    }
  }
}