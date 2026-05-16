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

const VIDEO_SOURCE = 'H264_AAC.mp4';
const PLAY_TIME = 1000;
const SEEK_TIME = 5000;
const WIDTH_VALUE = 720;
const HEIGHT_VALUE = 480;
const DURATION_TIME = 10034;
const CREATE_EVENT = 'create';
const SETURL_EVENT = 'setUrl';
const SETFDSRC_EVENT = 'setfdSrc';
const SETSURFACE_EVENT = 'setDisplaySurface';
const GETDESCRIPTION = 'getTrackDescription';
const PREPARE_EVENT = 'prepare';
const PLAY_EVENT = 'play';
const PAUSE_EVENT = 'pause';
const STOP_EVENT = 'stop';
const RESET_EVENT = 'reset';
const RELEASE_EVENT = 'release';
const SEEK_EVENT = 'seek';
const SEEK_MODE_EVENT = 'seekMode';
const SETVOLUME_EVENT = 'volume';
const SETSPEED_EVENT = 'speed';
const FINISH_EVENT = 'finish';
const ERROR_EVENT = 'errorEvent';
const END_EVENT = 'end';
const VOLUME_VALUE = 1;
const SPEED_VALUE = 1;
const NEXT_FRAME_TIME = 8333;
const PREV_FRAME_TIME = 4166;
const DELTA_TIME = 300;
const pagePath1 = 'testability/pages/Surface';
let pageId = 0;
let surfaceID = '';
let fileDescriptor: media.AVFileDescriptor | undefined | null = undefined;
let fdHead = 'fd://';
let fdPath = '';
let fdNumber = 0;
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

function setOnCallback(videoPlayer: media.VideoPlayer, steps: Array<string>, done: Function) {
  videoPlayer.on('playbackCompleted', () => {
    console.info('case playbackCompleted success');
    toNextStep(videoPlayer, steps, done);
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
    console.info(`case error called, errMessage is ${error.message}`);
    if (steps[0] == ERROR_EVENT) {
      done();
    }
  });
}

function checkSeekTime(videoPlayer: media.VideoPlayer, seekMode: media.SeekMode, seekTime: number,
  seekDoneTime: number) {
  switch (seekMode) {
    case media.SeekMode.SEEK_NEXT_SYNC:
      if (seekTime == 0) {
        expect(seekDoneTime).assertLess(DELTA_TIME);
      } else if (seekTime == DURATION_TIME) {
        expect(Math.abs(videoPlayer.currentTime - DURATION_TIME)).assertLess(DELTA_TIME);
      } else {
        expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_TIME);
      }
      break;
    case media.SeekMode.SEEK_PREV_SYNC:
      if (seekTime == 0) {
        expect(seekDoneTime).assertLess(DELTA_TIME);
      } else if (seekTime == DURATION_TIME) {
        expect(Math.abs(videoPlayer.currentTime - NEXT_FRAME_TIME)).assertLess(DELTA_TIME);
      } else {
        expect(Math.abs(videoPlayer.currentTime - PREV_FRAME_TIME)).assertLess(DELTA_TIME);
      }
      break;
    default:
      break;
  }
}

function toNextStep(videoPlayer: media.VideoPlayer | null, steps: Array<string>, done: Function) {
  if (steps[0] == END_EVENT) {
    done();
    console.info('case to done');
    return;
  }
  let tmpSeekTime = 0
  switch (steps[0]) {
    case CREATE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      media.createVideoPlayer((err, video) => {
        if (video != null) {
          videoPlayer = video;
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
    case SETFDSRC_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (fileDescriptor && videoPlayer) {
        videoPlayer.fdSrc = fileDescriptor;
      } else {
        console.log('fileDescriptor is null')
      }
      toNextStep(videoPlayer, steps, done);
      break;
    case SETURL_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (videoPlayer) {
        videoPlayer.url = fdPath;
        toNextStep(videoPlayer, steps, done);
      }
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
      });
      break;
    case PREPARE_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      if (videoPlayer) {
        setOnCallback(videoPlayer, steps, done);
      } else {
        console.info('videoPlayer is null');
        expect().assertFail()
      }
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
      videoPlayer?.getTrackDescription((err, arrlist) => {
        if (err == null) {
          for (let i = 0; i < arrlist.length; i++) {
            mediaTestBase.printDescription(arrlist[i]);
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
      videoPlayer?.play(async (err) => {
        if (err == null && videoPlayer) {
          expect(videoPlayer.state).assertEqual('playing');
          console.info('case play success!!');
          await mediaTestBase.msleepAsync(PLAY_TIME);
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
      steps.shift();
      steps.shift();
      videoPlayer?.seek(tmpSeekTime, media.SeekMode.SEEK_NEXT_SYNC, (err, seekDoneTime) => {
        if (err == null && videoPlayer) {
          checkSeekTime(videoPlayer, media.SeekMode.SEEK_NEXT_SYNC, tmpSeekTime, seekDoneTime);
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
        if (err == null) {
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
      let tmpVolumeValue = Number(steps[1]);
      steps.shift();
      steps.shift();
      videoPlayer?.setVolume(tmpVolumeValue, (err) => {
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
      let tmpSpeedValue = Number(steps[1]);
      steps.shift();
      steps.shift();
      videoPlayer?.setSpeed(tmpSpeedValue, (err, speedMode) => {
        if (err == null) {
          expect(tmpSpeedValue).assertEqual(speedMode);
          console.info('case setSpeed success and speedMode is ' + speedMode);
          toNextStep(videoPlayer, steps, done);
        } else if ((err != null) && (steps[0] == ERROR_EVENT)) {
          steps.shift();
          toNextStep(videoPlayer, steps, done);
        } else {
          mediaTestBase.printError(err, done);
        }
      });
      break;
    case FINISH_EVENT:
      console.log('case ' + steps[0] + ' event')
      steps.shift();
      console.info('case wait for playbackCompleted');
      break;
    case ERROR_EVENT:
      console.info('case wait for error');
      break;
    default:
      break;
  }
}

export default function VideoPlayerAPICallbackTest() {
  describe('VideoPlayerAPICallbackTest', () => {
    beforeAll(async () => {
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        fdNumber = testNumber;
        fdPath = fdHead + '' + fdNumber;
      });
      await mediaTestBase.toNewPage(pagePath1, pagePath1, pageId);
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      fileDescriptor = {
        fd: fdNumber
      }
      await mediaTestBase.msleepAsync(1000).then(() => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      if (fileDescriptor) {
        fileDescriptor.fd = -1;
      }
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETFDSRC_EVENT, SETSURFACE_EVENT, ERROR_EVENT, PREPARE_EVENT, ERROR_EVENT,
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      if (fileDescriptor) {
        fileDescriptor.offset = -1;
      }
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSRC_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      if (fileDescriptor) {
        fileDescriptor.length = -1;
      }
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETFDSRC_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_fdSrc_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      if (fileDescriptor) {
        fileDescriptor = null;
      }
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETFDSRC_EVENT, SETSURFACE_EVENT, ERROR_EVENT, PREPARE_EVENT, ERROR_EVENT,
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PREPARE_EVENT, ERROR_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, PREPARE_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, PREPARE_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, SETURL_EVENT,
          PREPARE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, PREPARE_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PREPARE_EVENT, ERROR_EVENT,
        PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PREPARE_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, PREPARE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, PLAY_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, PLAY_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, PLAY_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, PLAY_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PLAY_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, PLAY_EVENT,
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PLAY_EVENT, ERROR_EVENT,
          PLAY_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PLAY_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, PAUSE_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, PAUSE_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          PAUSE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, PAUSE_EVENT, ERROR_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, PAUSE_EVENT,
          ERROR_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_PAUSE_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, PAUSE_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, STOP_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, STOP_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, STOP_EVENT,
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, STOP_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, STOP_EVENT,
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, STOP_EVENT,
          ERROR_EVENT, STOP_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_STOP_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, STOP_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, RESET_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, RESET_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, RESET_EVENT,
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RESET_EVENT, RESET_EVENT, ERROR_EVENT,
          RESET_EVENT, ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RESET_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, RESET_EVENT, SETURL_EVENT, PREPARE_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_MODE_EVENT,
          SEEK_TIME.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, GETDESCRIPTION, RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, RESET_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_RELEASE_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SEEK_EVENT, SEEK_TIME.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, SEEK_EVENT, SEEK_TIME.toString(),
          RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), SEEK_EVENT, SEEK_TIME.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          SEEK_EVENT, SEEK_TIME.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, SEEK_EVENT, SEEK_TIME.toString(), ERROR_EVENT,
          RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, GETDESCRIPTION, SEEK_EVENT,
          SEEK_TIME.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          SEEK_EVENT, SEEK_TIME.toString(), SEEK_EVENT, SEEK_TIME.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT, '-1',
          ERROR_EVENT,
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
        (DURATION_TIME + 1000).toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_1500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, SEEK_EVENT, '0', ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETVOLUME_EVENT, VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, SETVOLUME_EVENT, VOLUME_VALUE.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, SETVOLUME_EVENT,
          VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, SETVOLUME_EVENT,
          VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, SETVOLUME_EVENT,
          VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          SETVOLUME_EVENT, VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          SETVOLUME_EVENT, VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, SETVOLUME_EVENT, VOLUME_VALUE.toString(), END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, GETDESCRIPTION,
        SETVOLUME_EVENT, VOLUME_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), SETVOLUME_EVENT, VOLUME_VALUE.toString(), SETVOLUME_EVENT, VOLUME_VALUE.toString(),
        RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT, '-1',
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT, '2',
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETVOLUME_CALLBACK_1500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, SETVOLUME_EVENT, '1', RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETSPEED_EVENT, SPEED_VALUE.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0200
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, SETSPEED_EVENT, SPEED_VALUE.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, PAUSE_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, STOP_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0600
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, RESET_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(), ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0700
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0700', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          SEEK_TIME.toString(),
          SETSPEED_EVENT, SPEED_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0800
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0800', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETVOLUME_EVENT,
        VOLUME_VALUE.toString(), SETSPEED_EVENT, SPEED_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0900
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_0900', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, SETSPEED_EVENT, SPEED_VALUE.toString(), ERROR_EVENT,
          RELEASE_EVENT,
          END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1000
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1000', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps = new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, GETDESCRIPTION,
        SETSPEED_EVENT, SPEED_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1100
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT,
          SPEED_VALUE.toString(),
          SETSPEED_EVENT, SPEED_VALUE.toString(), SETSPEED_EVENT, SPEED_VALUE.toString(), RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1300
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1300', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT, '-1',
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1400
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1400', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SETSPEED_EVENT, '5',
          ERROR_EVENT, RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1500
     * @tc.desc   Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_SETSPEED_CALLBACK_1500', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let videoPlayer = null;
      let mySteps =
        new Array(CREATE_EVENT, SETURL_EVENT, SETSURFACE_EVENT, PREPARE_EVENT, PLAY_EVENT, SEEK_EVENT,
          DURATION_TIME.toString(),
          FINISH_EVENT, SETSPEED_EVENT, '4', RELEASE_EVENT, END_EVENT);
      toNextStep(videoPlayer, mySteps, done)
    });
  })
}
