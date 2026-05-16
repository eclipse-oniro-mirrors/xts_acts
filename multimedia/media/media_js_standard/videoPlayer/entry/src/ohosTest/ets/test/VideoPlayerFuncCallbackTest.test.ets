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
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const PLAY_TIME = 3000;
const PLAY_TIME_1S = 1000;
const SEEK_TIME = 5000;
const WIDTH_VALUE = 720;
const HEIGHT_VALUE = 480;
const DURATION_TIME = 10034;
const CREATE_EVENT = 'create';
const SETSURFACE_EVENT = 'setDisplaySurface';
const GETDESCRIPTION = 'getTrackDescription';
const SETSOURCE_EVENT = 'setSource';
const SETFDSOURCE_EVENT = 'setFdSource';
const PREPARE_EVENT = 'prepare';
const SRC_PREPARE_EVENT = 'src2prepare';
const PLAY_EVENT = 'play';
const PAUSE_EVENT = 'pause';
const STOP_EVENT = 'stop';
const RESET_EVENT = 'reset';
const RELEASE_EVENT = 'release';
const SEEK_EVENT = 'seek';
const SEEK_MODE_EVENT = 'seekMode';
const SETVOLUME_EVENT = 'volume';
const SETSPEED_EVENT = 'speed';
const SETLOOP_EVENT = 'loop';
const WAIT_EVENT = 'wait';
const ERROR_EVENT = 'errorEvent';
const END_EVENT = 'end';
const DELTA_TIME = 1000;
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

function setOnCallback(videoPlayer: media.VideoPlayer, steps: Array<string>, done: Function) {
  videoPlayer.on('playbackCompleted', () => {
    console.info('case playbackCompleted success');
  });

  videoPlayer.on('bufferingUpdate', (infoType, value) => {
    console.info('case bufferingUpdate success infoType is ' + infoType);
    console.info('case bufferingUpdate success value is ' + value);
  });

  videoPlayer.on('startRenderFrame', () => {
    console.info('case startRenderFrame success');
  });

  videoPlayer.on('videoSizeChanged', (width, height) => {
    console.info('case videoSizeChanged success');
  });

  videoPlayer.on('error', (error) => {
    console.info(`case error called,errMessage is ${error.message}`);
    if (steps[0] == ERROR_EVENT) {
      steps.shift();
      toNextStep(videoPlayer, steps, done);
    }
  });
}

function checkSeekTime(videoPlayer: media.VideoPlayer, seekMode: media.SeekMode, seekTime: number,
  seekDoneTime: number) {
  switch (seekMode) {
    case media.SeekMode.SEEK_NEXT_SYNC:
      if (seekTime == 0) {
        expect(seekDoneTime).assertLess(DELTA_SEEK_TIME);
      } else if (seekTime == DURATION_TIME) {
        expect(Math.abs(videoPlayer.currentTime - DURATION_TIME)).assertLess(DELTA_SEEK_TIME);
      } else {
        expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
      }
      break;
    case media.SeekMode.SEEK_PREV_SYNC:
      if (seekTime == 0) {
        expect(seekDoneTime).assertLess(DELTA_SEEK_TIME);
      } else if (seekTime == DURATION_TIME) {
        expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
      } else {
        expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_SEEK_TIME);
      }
      break;
    default:
      break;
  }
}

function checkSpeedTime(videoPlayer: media.VideoPlayer, speedValue: media.PlaybackSpeed, startTime: number) {
  let endTime = videoPlayer.currentTime;
  if (videoPlayer.state == 'playing') {
    switch (speedValue) {
      case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
        expect(Math.abs(endTime - startTime - (0.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 0.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
        expect(Math.abs(endTime - startTime - (PLAY_TIME_1S))).assertLess(DELTA_TIME);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
        expect(Math.abs(endTime - startTime - (1.25 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.25);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
        expect(Math.abs(endTime - startTime - (1.75 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 1.75);
        break;
      case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
        expect(Math.abs(endTime - startTime - (2 * PLAY_TIME_1S))).assertLess(DELTA_TIME * 2);
        break;
    }
  } else {
    console.info('case speed not in play');
  }
}

async function toNextStep(videoPlayer: media.VideoPlayer | null, steps: Array<string>, done: Function) {
  if (steps[0] == END_EVENT) {
    done();
    console.info('case to done');
    return;
  }
  let tmpSeekTime = 0
  switch (steps[0]) {
    case CREATE_EVENT:
      steps.shift();
      media.createVideoPlayer((err, video) => {
        if (video != null) {
          videoPlayer = video;
          setOnCallback(videoPlayer, steps, done);
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case createVideoPlayer success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case SETSURFACE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.setDisplaySurface(surfaceID, (err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      })
      break;
    case PREPARE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.prepare((err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case GETDESCRIPTION:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      let videoTrackKey = new Array('bitrate', 'codec_mime', 'frame_rate', 'height',
        'track_index', 'track_type', 'width');
      let audioTrackKey = new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate',
        'track_index', 'track_type');
      let videoTrackValue = new Array('1366541', 'video/avc', '6000', '480', '0', '1', '720');
      let audioTrackValue = new Array('129207', '2', 'audio/mp4a-latm', '44100', '1', '0');
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      videoPlayer?.getTrackDescription((err, arrlist) => {
        if (err == null) {
          for (let i = 0; i < arrlist.length; i++) {
            mediaTestBase.checkOldDescription(arrlist[i], descriptionKey[i], descriptionValue[i]);
          }
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case PLAY_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      let tmpStartTime = 0
      if (videoPlayer) {
        tmpStartTime = videoPlayer.currentTime;
      }
      videoPlayer?.play(async (err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          console.info('case play success!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
          let endTime = videoPlayer.currentTime;
          expect(Math.abs(endTime - tmpStartTime - PLAY_TIME)).assertLess(DELTA_TIME);
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case PAUSE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.pause((err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('paused');
          console.info('case pause success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case STOP_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.stop((err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('stopped');
          console.info('case stop success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case RESET_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.reset((err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case reset success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case RELEASE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.release((err) => {
        if (err == null) {
          console.info('case release success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case SEEK_MODE_EVENT:
      console.log('case ' + steps[0] + ' event')
      tmpSeekTime = Number(steps[1]);
      let tmpSeekMode = Number(steps[2]);
      steps.shift();
      steps.shift();
      steps.shift();
      videoPlayer?.seek(tmpSeekTime, tmpSeekMode, (err, seekDoneTime) => {
        if (err == null && videoPlayer) {
          if (tmpSeekTime > DURATION_TIME) {
            tmpSeekTime = DURATION_TIME;
          }
          checkSeekTime(videoPlayer, tmpSeekMode, tmpSeekTime, seekDoneTime);
          console.info('case seek success and seekDoneTime is ' + seekDoneTime);
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case SEEK_EVENT:
      console.log('case ' + steps[0] + ' event')
      tmpSeekTime = Number(steps[1]);
      steps.shift();
      steps.shift();
      videoPlayer?.seek(tmpSeekTime, (err, seekDoneTime) => {
        if (err == null && videoPlayer) {
          if (tmpSeekTime > DURATION_TIME) {
            tmpSeekTime = DURATION_TIME;
          }
          checkSeekTime(videoPlayer, media.SeekMode.SEEK_PREV_SYNC, tmpSeekTime, seekDoneTime);
          console.info('case seek success and seekDoneTime is ' + seekDoneTime);
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case SETVOLUME_EVENT:
      console.log('case ' + steps[0] + ' event')
      let volumeValue = Number(steps[1]);
      steps.shift();
      steps.shift();
      videoPlayer?.setVolume(volumeValue, (err) => {
        if (err == null) {
          console.info('case setVolume success');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case SETSPEED_EVENT:
      console.log('case ' + steps[0] + ' event')
      let speedValue = Number(steps[1]);
      steps.shift();
      steps.shift();
      let startTime = 0
      if (videoPlayer) {
        startTime = videoPlayer.currentTime;
      }
      videoPlayer?.setSpeed(speedValue, async (err, speedMode) => {
        if (err == null && videoPlayer) {
          await mediaTestBase.msleepAsync(PLAY_TIME_1S);
          expect(speedValue).assertEqual(speedMode);
          console.info('case setSpeed success and speedMode is ' + speedMode);
          checkSpeedTime(videoPlayer, speedValue, startTime);
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case ERROR_EVENT:
      console.info('case wait for error');
      break;
    case SETFDSOURCE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (videoPlayer && fileDescriptor) {
        videoPlayer.fdSrc = fileDescriptor;
      } else {
        console.log('videoPlayer or fileDescriptor is null')
      }
      toNextStep(videoPlayer, steps, done);
      break;
    case SETSOURCE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (videoPlayer) {
        videoPlayer.url = steps[0];
      } else {
        console.log('videoPlayer is null')
      }
      steps.shift();
      toNextStep(videoPlayer, steps, done);
      break;
    case SETLOOP_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (videoPlayer) {
        videoPlayer.loop = Boolean(steps[0]);
      } else {
        console.log('videoPlayer is null')
      }

      steps.shift();
      toNextStep(videoPlayer, steps, done);
      break;
    case WAIT_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      await mediaTestBase.msleepAsync(PLAY_TIME);
      toNextStep(videoPlayer, steps, done);
      break;
    case SRC_PREPARE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      videoPlayer?.prepare((err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare success!!');
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    default:
      break;
  }
}


export default function VideoPlayerFuncCallbackTest() {
  describe('VideoPlayerFuncCallbackTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        fdNumber = testNumber;
        fdPath = fdHead + '' + fdNumber;
      });
      await mediaTestBase.toNewPage(pagePath1, pagePath1, pageId);
      pageId = (pageId + 1) % 2;
    });
    beforeEach(async () => {

      fileDescriptor = {
        fd: fdNumber
      }
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
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSOURCE_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSOURCE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETSOURCE_EVENT, '', ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETVOLUME_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETVOLUME_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETSOURCE_EVENT, fdPath, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
          '0', SETVOLUME_EVENT, '0.5', SETVOLUME_EVENT, '1', RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSPEED_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSPEED_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SETSPEED_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSOURCE_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT,
          SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_0_75_X.toString(), SETSPEED_EVENT,
          media.PlaybackSpeed.SPEED_FORWARD_1_00_X.toString(), SETSPEED_EVENT,
          media.PlaybackSpeed.SPEED_FORWARD_1_25_X.toString(),
          SETSPEED_EVENT, media.PlaybackSpeed.SPEED_FORWARD_1_75_X.toString(), SETSPEED_EVENT,
          media.PlaybackSpeed.SPEED_FORWARD_2_00_X.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SEEKMODE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SEEKMODE_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_SEEKMODE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSOURCE_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT,
          SEEK_MODE_EVENT, SEEK_TIME.toString(), media.SeekMode.SEEK_NEXT_SYNC.toString(), SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          media.SeekMode.SEEK_PREV_SYNC.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      const sleepTime = 200;
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let frameCount = false;
      let completedCount = 0;
      let widthValue = -1;
      let heightValue = -1;
      let videoPlayer: media.VideoPlayer = await media.createVideoPlayer();
      await mediaTestBase.msleepAsync(sleepTime);
      expect(videoPlayer.state).assertEqual('idle');
      console.info('case createVideoPlayer success!!');

      videoPlayer.on('playbackCompleted', async () => {
        console.info('case playbackCompleted success');
        completedCount++;
        expect(widthValue).assertEqual(WIDTH_VALUE);
        expect(heightValue).assertEqual(HEIGHT_VALUE);
        expect(completedCount).assertEqual(1);
        expect(frameCount).assertEqual(true);
        videoPlayer?.release((err) => {
          if (err == null) {
            console.info('case release success!!');
            done();
          } else {
            mediaTestBase.printError(err, done);
          }
        });
      });
      videoPlayer.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      videoPlayer.on('startRenderFrame', () => {
        console.info('case startRenderFrame success');
        frameCount = true;
      });
      videoPlayer.on('videoSizeChanged', (width, height) => {
        console.info('case videoSizeChanged success');
        widthValue = width;
        heightValue = height;
      });
      await mediaTestBase.msleepAsync(sleepTime)

      videoPlayer.url = fdPath;
      videoPlayer.setDisplaySurface(surfaceID, (err) => {
        if (err == null) {
          expect(videoPlayer.state).assertEqual('idle');
          console.info('case setDisplaySurface success!!');
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      await mediaTestBase.msleepAsync(sleepTime);
      videoPlayer.prepare((err) => {
        if (err == null) {
          expect(videoPlayer.state).assertEqual('prepared');
          expect(videoPlayer.duration).assertEqual(DURATION_TIME);
          expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
          expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
          console.info('case prepare success!!');
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      await mediaTestBase.msleepAsync(sleepTime);
      videoPlayer.play((err) => {
        if (err == null) {
          expect(videoPlayer.state).assertEqual('playing');
          console.info('case play success!!');
          videoPlayer.release()
          done()
        } else {
          mediaTestBase.printError(err, done);
        }
      });
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_GETTRECKDESCRIPTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_GETTRECKDESCRIPTION_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_GETTRECKDESCRIPTION_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSOURCE_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_LOOP_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_LOOP_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_LOOP_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSOURCE_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, SETLOOP_EVENT, 'true',
          PLAY_EVENT, SEEK_EVENT, DURATION_TIME.toString(), WAIT_EVENT, SEEK_EVENT, DURATION_TIME.toString(),
          WAIT_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(), WAIT_EVENT, SEEK_EVENT, DURATION_TIME.toString(), WAIT_EVENT, SETLOOP_EVENT,
          'false', RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_BASE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_BASE_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FUNCTION_CALLBACK_BASE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSOURCE_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT,
          PAUSE_EVENT, PLAY_EVENT, STOP_EVENT, RESET_EVENT, SETSOURCE_EVENT, fdPath, PREPARE_EVENT, SETLOOP_EVENT,
          'true',
          PLAY_EVENT, SEEK_EVENT, (DURATION_TIME / 2).toString(), SEEK_EVENT, '0', SEEK_EVENT, DURATION_TIME.toString(),
          WAIT_EVENT,
          SETLOOP_EVENT, 'false', RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
  })
}
