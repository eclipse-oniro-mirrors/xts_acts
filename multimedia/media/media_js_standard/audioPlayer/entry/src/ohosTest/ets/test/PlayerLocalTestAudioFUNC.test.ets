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

import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio'
import { playAudioSource } from './AudioPlayerTestBase';
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { resourceManager } from '@kit.LocalizationKit';

let audioPlayer: media.AudioPlayer | null = media.createAudioPlayer();
const AUDIO_SOURCE = '01.mp3';
const PLAY_TIME = 3000;
const DURATION_TIME = 219600;
const DELTA_TIME = 1000;
const END_STATE = 0;
const SRC_STATE = 1;
const PLAY_STATE = 2;
const PAUSE_STATE = 3;
const STOP_STATE = 4;
const RESET_STATE = 5;
const SEEK_STATE = 6;
const VOLUME_STATE = 7;
const RELEASE_STATE = 8;
const ERROR_STATE = 9;
const FINISH_STATE = 10;
const LOOP_STATE = 11;
const FDSRC_STATE = 12;
const GETDESCRIPTION_PROMISE = 13;
const GETDESCRIPTION_CALLBACK = 14;
const SECOND_INDEX = 1;
const MAX_VOLUME = 1;
let fdHead = 'fd://';
let fileDescriptor: media.AVFileDescriptor | undefined = undefined;
let fdPath = '';
let fdNumber: number | undefined = 0;
let audioTrackKey = new Array('channel_count', 'codec_mime', 'sample_rate', 'track_index',
  'track_type');
let audioTrackValue = new Array('1', 'audio/mpeg', '48000', '0', '0');
let descriptionKey = new Array(audioTrackKey);
let descriptionValue = new Array(audioTrackValue);
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

function initAudioPlayer() {
  if (audioPlayer != null) {
    audioPlayer.release();
    audioPlayer = null;
  }
  audioPlayer = media.createAudioPlayer();
  if (audioPlayer == null) {
    console.info('case create player is faild');
    expect().assertFail();
  }
}

function nextStep(mySteps: Array<number>, done: Function) {
  if (mySteps[0] == END_STATE) {
    done();
    console.info('case to done');
    return;
  }

  switch (mySteps[0]) {
    case SRC_STATE:
      console.info(`case to prepare`);
      if (audioPlayer != null) {
        audioPlayer.src = fdPath;
      }
      break;
    case FDSRC_STATE:
      console.info(`case to prepare`);
      if (audioPlayer != null && fileDescriptor != undefined) {
        audioPlayer.fdSrc = fileDescriptor;
      }
      break;
    case PLAY_STATE:
      console.info(`case to play`);
      audioPlayer?.play();
      break;
    case PAUSE_STATE:
      console.info(`case to pause`);
      audioPlayer?.pause();
      break;
    case STOP_STATE:
      console.info(`case to stop`);
      audioPlayer?.stop();
      break;
    case RESET_STATE:
      console.info(`case to reset`);
      audioPlayer?.reset();
      break;
    case SEEK_STATE:
      console.info('case seek to time is ' + mySteps[SECOND_INDEX]);
      audioPlayer?.seek(mySteps[SECOND_INDEX]);
      mySteps.shift();
      mySteps.shift();
      nextStep(mySteps, done);
      break;
    case VOLUME_STATE:
      console.info(`case to setVolume`);
      audioPlayer?.setVolume(mySteps[SECOND_INDEX]);
      break;
    case RELEASE_STATE:
      console.info(`case to release`);
      mySteps.shift();
      audioPlayer?.release();
      audioPlayer = null;
      nextStep(mySteps, done);
      break;
    case LOOP_STATE:
      if (audioPlayer != null) {
        audioPlayer.loop = mySteps[SECOND_INDEX] == 0 ? false : true;
      }
      mySteps.shift();
      mySteps.shift();
      nextStep(mySteps, done);
      break;
    case GETDESCRIPTION_PROMISE:
      mySteps.shift();
      audioPlayer?.getTrackDescription().then((arrayList) => {
        console.info('case getTrackDescription called!!');
        if (typeof (arrayList) != 'undefined') {
          for (let i = 0; i < arrayList.length; i++) {
            mediaTestBase.checkOldDescription(arrayList[i], descriptionKey[i], descriptionValue[i]);
          }
        } else {
          console.info('case getTrackDescription is failed');
          expect().assertFail();
        }
        nextStep(mySteps, done);
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case GETDESCRIPTION_CALLBACK:
      mySteps.shift();
      audioPlayer?.getTrackDescription((err, arrayList) => {
        if (typeof (err) == 'undefined') {
          for (let i = 0; i < arrayList.length; i++) {
            mediaTestBase.checkOldDescription(arrayList[i], descriptionKey[i], descriptionValue[i]);
          }
          nextStep(mySteps, done);
        } else {
          expect().assertFail();
          mediaTestBase.printError(err, done);
        }
      });
      break;
    default:
      break;
  }
}

function setCallback(mySteps: Array<number>, done: Function) {
  console.info(`case setCallback`);
  audioPlayer?.on('bufferingUpdate', (infoType, value) => {
    console.info('case bufferingUpdate success infoType is ' + infoType);
    console.info('case bufferingUpdate success value is ' + value);
  });
  audioPlayer?.on('dataLoad', () => {
    mySteps.shift();
    console.info(`case dataLoad called`);
    if (audioPlayer != null) {
      expect(audioPlayer.currentTime).assertEqual(0);
      expect(audioPlayer.duration).assertEqual(DURATION_TIME);
      expect(audioPlayer.state).assertEqual('idle');
    }
    nextStep(mySteps, done);
  });
  audioPlayer?.on('play', () => {
    mySteps.shift();
    mediaTestBase.msleep(PLAY_TIME);
    if (audioPlayer != null) {
      console.info('case play currentTime is ' + audioPlayer.currentTime);
      expect(audioPlayer.duration).assertEqual(DURATION_TIME);
    }
    if (mySteps[0] == FINISH_STATE) {
      console.info('case wait for finish');
      return;
    }
    if (audioPlayer != null) {
      expect(audioPlayer.state).assertEqual('playing');
    }
    nextStep(mySteps, done);
  });
  audioPlayer?.on('pause', () => {
    mySteps.shift();
    if (audioPlayer != null) {
      console.info('case pause currentTime is ' + audioPlayer.currentTime);
      expect(audioPlayer.duration).assertEqual(DURATION_TIME);
      expect(audioPlayer.state).assertEqual('paused');
    }
    nextStep(mySteps, done);
  });
  audioPlayer?.on('reset', () => {
    mySteps.shift();
    console.info(`case reset called`);
    if (audioPlayer != null) {
      expect(audioPlayer.state).assertEqual('idle');
    }
    nextStep(mySteps, done);
  });
  audioPlayer?.on('stop', () => {
    if (mySteps[0] == RESET_STATE) {
      console.info(`case reset stop called`);
      return;
    }
    mySteps.shift();
    console.info(`case stop called`);
    if (audioPlayer != null) {
      expect(audioPlayer.currentTime).assertEqual(0);
      expect(audioPlayer.duration).assertEqual(DURATION_TIME);
      expect(audioPlayer.state).assertEqual('stopped');
    }
    nextStep(mySteps, done);
  });
  audioPlayer?.on('timeUpdate', (seekDoneTime) => {
    console.info('case timeUpdate seekDoneTime is' + seekDoneTime);
  });
  audioPlayer?.on('volumeChange', () => {
    if (mySteps[0] != VOLUME_STATE) {
      console.info(`case setvolume called by system`);
    } else {
      console.info(`case setvolume called`);
      mySteps.shift();
      mySteps.shift();
      if (audioPlayer != null && audioPlayer.state == 'playing') {
        mediaTestBase.msleep(PLAY_TIME);
      }
      nextStep(mySteps, done);
    }
  });
  audioPlayer?.on('finish', () => {
    mySteps.shift();
    if (audioPlayer != null) {
      expect(audioPlayer.state).assertEqual('stopped');
      expect(Math.abs(audioPlayer.currentTime - audioPlayer.duration)).assertLess(DELTA_TIME);
    }
    console.info(`case finish called`);
    nextStep(mySteps, done);
  });
  audioPlayer?.on('error', (err) => {
    console.info(`case error called,errName is ${err.name}`);
    console.info(`case error called,errCode is ${err.code}`);
    console.info(`case error called,errMessage is ${err.message}`);
    if ((mySteps[0] == SEEK_STATE) || (mySteps[0] == VOLUME_STATE)) {
      mySteps.shift();
      mySteps.shift();
    } else {
      mySteps.shift();
    }
    expect(mySteps[0]).assertEqual(ERROR_STATE);
    mySteps.shift();
    nextStep(mySteps, done);
  });
}

function waitForDone() {
  console.info('case wait for next player');
}

export default function PlayerLocalTestAudioFUNC() {

  describe('PlayerLocalTestAudioFUNC', () => {
    beforeAll(async () => {
      await mediaTestBase.getFdRead(AUDIO_SOURCE, openFileFailed).then((testNumber) => {
        fdNumber = testNumber;
        fdPath = fdHead + '' + fdNumber;
        fileDescriptor = {
          fd: testNumber
        }
      });
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
      if (fdNumber != undefined) {
        await mediaTestBase.closeFdNumber(fdNumber);
      }
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETSOURCE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETSOURCE_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETSOURCE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let mySteps = new Array(SRC_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      initAudioPlayer();
      setCallback(mySteps, done);
      if (audioPlayer != null) {
        audioPlayer.src = "";
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETVOLUME_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SETVOLUME_0100', Level.LEVEL0,async (done: Function) => {
      let mySteps =
        new Array(SRC_STATE, PLAY_STATE, VOLUME_STATE, 0, VOLUME_STATE, 0.5, VOLUME_STATE, MAX_VOLUME, RESET_STATE,
          RELEASE_STATE, END_STATE);
      initAudioPlayer();
      setCallback(mySteps, done);
      if (audioPlayer != null) {
        audioPlayer.src = fdPath;
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SEEK_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SEEK_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_SEEK_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let mySteps =
        new Array(SRC_STATE, PLAY_STATE, SEEK_STATE, 0, SEEK_STATE, DURATION_TIME / 2, SEEK_STATE, DURATION_TIME,
          FINISH_STATE, RELEASE_STATE, END_STATE);
      initAudioPlayer();
      setCallback(mySteps, done);
      if (audioPlayer != null) {
        audioPlayer.src = fdPath;
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_GETTRECKDESCRIPTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_GETTRECKDESCRIPTION_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_GETTRECKDESCRIPTION_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let mySteps = new Array(SRC_STATE, GETDESCRIPTION_PROMISE, GETDESCRIPTION_CALLBACK, RELEASE_STATE, END_STATE);
      initAudioPlayer();
      setCallback(mySteps, done);
      if (audioPlayer != null) {
        audioPlayer.src = fdPath;
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_LOOP_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_LOOP_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_LOOP_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      let playCount = 0;
      let seekCount = 0;
      let testAudioPlayer: media.AudioPlayer | null = media.createAudioPlayer();
      testAudioPlayer.on('bufferingUpdate', (infoType, value) => {
        console.info('case bufferingUpdate success infoType is ' + infoType);
        console.info('case bufferingUpdate success value is ' + value);
      });
      testAudioPlayer.on('dataLoad', () => {
        if (testAudioPlayer != null) {
          expect(testAudioPlayer.duration).assertEqual(DURATION_TIME);
          expect(testAudioPlayer.state).assertEqual('idle');
        }
        testAudioPlayer?.play();
      });
      testAudioPlayer.on('play', () => {
        if (testAudioPlayer != null) {
          console.info('case play currentTime is ' + testAudioPlayer.currentTime);
          testAudioPlayer.loop = true;
          expect(testAudioPlayer.duration).assertEqual(DURATION_TIME);
          expect(testAudioPlayer.state).assertEqual('playing');
        }
        mediaTestBase.msleep(PLAY_TIME);
        if (playCount > 0) {
          return;
        }
        playCount++;
        console.info('case play to seek');
        testAudioPlayer?.seek(DURATION_TIME);
      });
      testAudioPlayer.on('timeUpdate', (seekDoneTime) => {
        if (typeof (seekDoneTime) == 'undefined') {
          expect().assertFail();
          console.info('case seek failed');
          return;
        }
        console.info('case timeUpdate, seekDoneTime is ' + seekDoneTime);
        if (testAudioPlayer != null) {
          console.info('case timeUpdate, testAudioPlayer.state is ' + testAudioPlayer.state);
        }
        if (seekDoneTime == DURATION_TIME && seekCount == 0) {
          console.info('case loop step 1');
          seekCount++;
          if (testAudioPlayer != null) {
            expect(testAudioPlayer.state).assertEqual('playing');
            mediaTestBase.msleep(2000);
            testAudioPlayer.seek(DURATION_TIME - 1000);
          }
        } else if ((seekDoneTime == (DURATION_TIME - 1000)) && seekCount == 1) {
          console.info('case loop step 2');
          seekCount++;
          if (testAudioPlayer != null) {
            testAudioPlayer.loop = false;
          }
        }
      });
      testAudioPlayer.on('finish', () => {
        console.info('case finish success seekCount is ' + seekCount);
        expect(seekCount).assertEqual(2);
        testAudioPlayer?.reset();
      });
      testAudioPlayer.on('reset', () => {
        if (testAudioPlayer != null) {
          expect(testAudioPlayer.state).assertEqual('idle');
        }
        testAudioPlayer?.release();
        testAudioPlayer = null;
        done();
      });
      testAudioPlayer.src = fdPath;
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      playAudioSource(fdPath, DURATION_TIME, PLAY_TIME, true, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0200
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_BASE_0200', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);
      playAudioSource(fileDescriptor, DURATION_TIME, PLAY_TIME, true, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_MULTIPLE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_MULTIPLE_0100
     * @tc.desc   Audio playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FUNCTION_MULTIPLE_0100', Level.LEVEL0,async (done: Function) => {
      mediaTestBase.isFileOpen(fileDescriptor, done);

      playAudioSource(fdPath, DURATION_TIME, PLAY_TIME, true, waitForDone);
      await mediaTestBase.msleepAsync(1500).then(() => {
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      playAudioSource(fileDescriptor, DURATION_TIME, PLAY_TIME, true, done);
    });
  })
}
