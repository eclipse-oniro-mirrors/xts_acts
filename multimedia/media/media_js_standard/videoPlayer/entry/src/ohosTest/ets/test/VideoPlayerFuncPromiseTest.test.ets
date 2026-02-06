/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio'
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const AUDIO_SOURCE = '01.mp3';
const PLAY_TIME = 2000;
const PLAY_TIME_1S = 1000;
const SEEK_TIME = 5000;
const WIDTH_VALUE = 720;
const HEIGHT_VALUE = 480;
const DURATION_TIME = 10034;
const DELTA_TIME = 1500;
const NEXT_FRAME_TIME = 8333;
const PREV_FRAME_TIME = 4166;
const DELTA_SEEK_TIME = 300;
let surfaceID = '';
let fdHead = 'fd://';
let fileDescriptor: media.AVFileDescriptor | undefined | null = null;
const pagePath1 = 'testability/pages/Surface';
let pageId = 0;
let fdPath = '';
let fdNumber = 0;
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

function checkTime(actualTime: number, expectTIme: number, delteTime: number) {
  console.info('checkTime case actualTime is :' + actualTime + ', expectTIme is :' + expectTIme);
  let valueTime = Math.abs(expectTIme - actualTime);
  console.info('checkTime case time is :' + valueTime + ', delteTime is :' + delteTime);
  expect(valueTime < delteTime).assertEqual(true);
}

function checkSpeedTime(videoPlayer: media.VideoPlayer, speedValue: media.PlaybackSpeed, startTime: number) {
  let newTime = videoPlayer.currentTime;
  if (videoPlayer.state == 'playing') {
    switch (speedValue) {
      case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (0.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 0.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (PLAY_TIME_1S))).assertLess(DELTA_TIME);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (1.25 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.25);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (1.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
        console.error('checkSpeedTime time is :' + (newTime - startTime));
        expect(Math.abs(newTime - startTime - (2 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 2);
        break;
    }
  } else {
    console.info('case speed not in play');
  }
}

export default function VideoPlayerFuncPromiseTest() {
  describe('VideoPlayerFuncPromiseTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        fdNumber = testNumber;
        fdPath = fdHead + '' + fdNumber;
        fileDescriptor = {
          fd: fdNumber
        }
      });
      await mediaTestBase.toNewPage(pagePath1, pagePath1, pageId);
      pageId = (pageId + 1) % 2;
    });
    beforeEach(async () => {
      await mediaTestBase.msleepAsync(PLAY_TIME_1S).then(() => {
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      surfaceID = globalThis.value;
      console.info('case new surfaceID is ' + surfaceID);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      await mediaTestBase.clearRouter();
      await mediaTestBase.closeFdNumber(fdNumber);
      console.info('afterAll case');
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSOURCE_0100
        * @tc.name      : 001.setSorce "" (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSOURCE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer?.on('error', async (error) => {
          console.info(`case error called,errMessage is ${error.message}`);
          await videoPlayer?.release().then(() => {
            console.info('case release called!!');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          done();
        });
        videoPlayer.url = "";
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETVOLUME_0100
        * @tc.name      : 001.SetVolume 0/0.5/1 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETVOLUME_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
        console.info('case setDisplaySurface success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0
      if (videoPlayer) {
        videoPlayer.audioInterruptMode = audio.InterruptMode.INDEPENDENT_MODE; // 1
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      for (let i = 0; i < 3; i++) {
        await videoPlayer?.setVolume(i * 0.5).then(() => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
          }
          console.info('case setVolume called');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSPEED_0100
        * @tc.name      : 001.SetSpeed 0.75/1/1.25/1.75/2 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SETSPEED_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        console.info('case play called!!');
        mediaTestBase.msleepAsync(PLAY_TIME_1S);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME_1S)).assertLess(DELTA_TIME);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_0_75_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_00_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_25_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_75_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_2_00_X, startTime);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SEEKMODE_0100
        * @tc.name      : 001.seek mode SEEK_PREV_SYNC/SEEK_NEXT_SYNC (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SEEKMODE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(SEEK_TIME);
          expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(SEEK_TIME);
          expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(PREV_FRAME_TIME - 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(PREV_FRAME_TIME - 100);
          expect(Math.abs(videoPlayer.currentTime)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(PREV_FRAME_TIME + 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(PREV_FRAME_TIME + 100);
          expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(NEXT_FRAME_TIME - 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(seekDoneTime).assertEqual(NEXT_FRAME_TIME - 100);
          expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_CALLBACK_0100
        * @tc.name      : 001.test callback bufferingUpdate/videoSizeChanged/startRenderFrame/playbackCompleted
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      let frameCount = false;
      let completedCount = 0;
      let widthValue = -1;
      let heightValue = -1;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        completedCount++;
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        expect(widthValue).assertEqual(WIDTH_VALUE);
        expect(heightValue).assertEqual(HEIGHT_VALUE);
        expect(frameCount).assertEqual(true);
        expect(completedCount).assertEqual(1);
        done();
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      videoPlayer?.on('startRenderFrame', () => {
        console.info('case startRenderFrame success');
        frameCount = true;
      });
      videoPlayer?.on('videoSizeChanged', (width, height) => {
        console.info('case videoSizeChanged success');
        widthValue = width;
        heightValue = height;
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.play().then(async () => {
        if (videoPlayer) {
          console.info('case play called!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GETTRECKDESCRIPTION_0100
        * @tc.name      : 001.getTrackDescription (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GETTRECKDESCRIPTION_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      let arrayDescription: Array<media.MediaDescription> = [];
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let audioTrackKey =
        new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let videoTrackValue = new Array('1366541', 'video/avc', '6000', '480', '0', '1', '720');
      let audioTrackValue = new Array('129207', '2', 'audio/mp4a-latm', '44100', '1', '0');
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }

      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
          arrayDescription = arrayList;
        } else {
          console.info('case getTrackDescription is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      for (let i = 0; i < arrayDescription.length; i++) {
        mediaTestBase.checkOldDescription(arrayDescription[i], descriptionKey[i], descriptionValue[i]);
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_LOOP_0100
        * @tc.name      : 001.Loop true (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_LOOP_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.play().then(async () => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            console.info('case play called!!');
            await mediaTestBase.msleepAsync(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      if (videoPlayer && fileDescriptor) {
        videoPlayer.fdSrc = fileDescriptor;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      for (let i = 0; i < 4; i++) {
        await videoPlayer?.seek(DURATION_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
          }
          expect(Math.abs(seekDoneTime - DURATION_TIME)).assertLess(DELTA_SEEK_TIME);
          console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        mediaTestBase.msleepAsync(3000);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE_0100
        * @tc.name      : 001.test video playe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        console.info('case setDisplaySurface success');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      await videoPlayer?.pause().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('paused');
          console.info('case pause called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.stop().then(() => {
        console.info('case stop called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('stopped');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.reset().then(() => {
        console.info('case reset called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      await videoPlayer?.seek(videoPlayer.duration / 2).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        await mediaTestBase.msleepAsync(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(0).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        await mediaTestBase.msleepAsync(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(videoPlayer.duration).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
        await mediaTestBase.msleepAsync(PLAY_TIME);
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0100
        * @tc.name      : 001.test video player videoScaleTpe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          console.info('case createVideoPlayer success');
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('error', (error) => {
        expect().assertFail();
        console.info('case error happened :' + error.message);
      });
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        console.info('case setDisplaySurface success');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
      }
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      console.info('case set  videoScaleType : 0');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.pause().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('paused');
          console.info('case pause called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.stop().then(() => {
        console.info('case stop called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('stopped');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.reset().then(() => {
        if (videoPlayer) {
          console.info('case reset called!!');
          expect(videoPlayer.state).assertEqual('idle');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
        console.info('case set  videoScaleType : 1');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare called!!');
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        console.info('case play called!!');
        await mediaTestBase.msleepAsync(PLAY_TIME);
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
        expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
        console.info('case set  videoScaleType : 0');
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.seek(videoPlayer.duration / 2).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
          await mediaTestBase.msleepAsync(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      console.info('case set  videoScaleType : 1');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
      }
      await videoPlayer?.seek(0).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP);
          await mediaTestBase.msleepAsync(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      console.info('case set  videoScaleType : 0');
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
      }
      await videoPlayer?.seek(videoPlayer.duration).then(async (seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(videoPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_FIT);
          await mediaTestBase.msleepAsync(PLAY_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0200
        * @tc.name      : 002.set videoScaleTpe 100 times in playing (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      let count = 0;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        await videoPlayer?.play().then(async () => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            console.info('case play called!!');
            await mediaTestBase.msleepAsync(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      videoPlayer?.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
        console.info('case setDisplaySurface success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(async () => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      expect(Math.abs(endTime - startTime - PLAY_TIME)).assertLess(DELTA_TIME);
      for (let i = 0; i < 20; i++) {
        if (count == 0) {
          console.info('case set  videoScaleType : 1');
          if (videoPlayer) {
            videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
          }
          count = 1;
        } else {
          console.info('case set  videoScaleType : 0');
          if (videoPlayer) {
            videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
          }
          count = 0;
        }
        mediaTestBase.msleepAsync(500);
      }
      if (videoPlayer) {
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0300
        * @tc.name      : 003.set error value to videoScaleTpe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_VIDEOSCALETYPE_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      let errorCount = 0;
      await media.createVideoPlayer().then((video) => {
        if (video != null) {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('error', async (error) => {
        errorCount++;
        console.info('case error happened :' + error.message);
        if (errorCount == 3) {
          await videoPlayer?.release().then(() => {
            console.info('case release called!!');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          done();
        }
      });
      if (videoPlayer) {
        videoPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
        videoPlayer.url = fdPath;
        videoPlayer.videoScaleType = 2;
        videoPlayer.videoScaleType = -1;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0100
        * @tc.name      : 001.parameter value after create/reset/release (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('idle');
        expect(videoPlayer.url).assertEqual('');
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(-1);
        expect(videoPlayer.duration).assertEqual(-1);
        expect(videoPlayer.width).assertEqual(0);
        expect(videoPlayer.height).assertEqual(0);
        expect(videoPlayer.loop).assertEqual(false);
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        console.info('case prepare success');
        if (videoPlayer) {
          videoPlayer.loop = true;
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('prepared');
        expect(videoPlayer.url).assertEqual(fdPath);
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(0);
        expect(videoPlayer.duration).assertEqual(DURATION_TIME);
        expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
        expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        expect(videoPlayer.loop).assertEqual(true);
      }
      await videoPlayer?.reset().then(() => {
        console.info('case reset success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        expect(videoPlayer.state).assertEqual('idle');
        expect(videoPlayer.fdSrc.fd).assertEqual(0);
        expect(videoPlayer.fdSrc.offset).assertEqual(0);
        expect(videoPlayer.fdSrc.length).assertEqual(-1);
        expect(videoPlayer.currentTime).assertEqual(-1);
        expect(videoPlayer.duration).assertEqual(-1);
        expect(videoPlayer.loop).assertEqual(false);
      }
      await videoPlayer?.release().then(() => {
        console.info('case release called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0200
        * @tc.name      : 002.speed and loop value after finish (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          expect(videoPlayer.url).assertEqual(fdPath);
          expect(videoPlayer.currentTime).assertEqual(DURATION_TIME);
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        await videoPlayer?.play().then(async () => {
          if (videoPlayer) {
            expect(videoPlayer.loop).assertEqual(false);
            startTime = videoPlayer.currentTime;
            console.info('case play called!!');
            await mediaTestBase.msleepAsync(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        if (videoPlayer) {
          endTime = videoPlayer.currentTime;
          checkTime(PLAY_TIME * 2, (endTime - startTime), DELTA_TIME);
          startTime = videoPlayer.currentTime;
        }
        await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then(async (speedMode) => {
          if (videoPlayer) {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
            await mediaTestBase.msleepAsync(PLAY_TIME);
            endTime = videoPlayer.currentTime;
          }
          console.info('case setSpeed endTime is ' + endTime);
          checkTime(PLAY_TIME * 0.75, (endTime - startTime), DELTA_TIME);
          console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare called!!');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      checkTime(PLAY_TIME_1S, (endTime - startTime), DELTA_TIME);
      if (videoPlayer) {
        expect(videoPlayer.loop).assertEqual(true);
        startTime = videoPlayer.currentTime;
      }
      console.info('case startTime is :' + startTime);
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then(async (speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          await mediaTestBase.msleepAsync(PLAY_TIME);
          endTime = videoPlayer.currentTime;
        }
        checkTime(PLAY_TIME * 2, (endTime - startTime), DELTA_TIME);
        console.info('case setSpeed called and speedMode is ' + speedMode);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
        }
        console.info('case seek called and seekDoneTime is' + seekDoneTime);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
        await mediaTestBase.msleepAsync(PLAY_TIME);
        endTime = videoPlayer.currentTime;
        checkTime(PLAY_TIME * 2, (endTime - startTime), DELTA_TIME);
        expect(videoPlayer.loop).assertEqual(true);
        mediaTestBase.msleepAsync(DURATION_TIME);
        expect(videoPlayer.loop).assertEqual(true);
        videoPlayer.loop = false;
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0300
        * @tc.name      : 003.speed and loop value after reset (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_PARAMETER_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer: media.VideoPlayer | undefined;
      await media.createVideoPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
          videoPlayer = video;
          expect(videoPlayer.state).assertEqual('idle');
        } else {
          console.info('case createVideoPlayer is failed');
          expect().assertFail();
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      videoPlayer?.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
        }
        await videoPlayer?.release().then(() => {
          console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
      });
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.setDisplaySurface(surfaceID).then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
        }
        console.info('case setDisplaySurface success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          videoPlayer.loop = true;
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        console.info('case prepare called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let startTime = 0;
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      await videoPlayer?.play().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(true);
          console.info('case play called!!');
          mediaTestBase.msleepAsync(PLAY_TIME_1S);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      let endTime = 0;
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      checkTime(PLAY_TIME_1S, (endTime - startTime), DELTA_TIME);
      if (videoPlayer) {
        expect(videoPlayer.loop).assertEqual(true);
        startTime = videoPlayer.currentTime;
      }
      console.info('case startTime is :' + startTime);
      await videoPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then(async (speedMode) => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
          await mediaTestBase.msleepAsync(PLAY_TIME);
          endTime = videoPlayer.currentTime;
          checkTime(PLAY_TIME * 2, (endTime - startTime), DELTA_TIME);
        }
        console.info('case setSpeed called and speedMode is ' + speedMode);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      await videoPlayer?.reset().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          expect(videoPlayer.state).assertEqual('idle');
          expect(videoPlayer.duration).assertEqual(-1);
        }
        console.info('case reset called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        videoPlayer.url = fdPath;
      }
      await videoPlayer?.prepare().then(() => {
        if (videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }
        console.info('case prepare called!!');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }

      await videoPlayer?.play().then(async () => {
        if (videoPlayer) {
          expect(videoPlayer.loop).assertEqual(false);
          console.info('case play called!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
          expect(videoPlayer.state).assertEqual('playing');
        }
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      if (videoPlayer) {
        endTime = videoPlayer.currentTime;
      }
      checkTime(PLAY_TIME * 2, (endTime - startTime), DELTA_TIME * 2);
    });
  })
}