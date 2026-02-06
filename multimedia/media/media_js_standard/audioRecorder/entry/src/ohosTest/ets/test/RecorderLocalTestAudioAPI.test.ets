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
import MediaTestBase, { FdObject } from './MediaTestBase';
import { Permissions } from '@kit.AbilityKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

let audioRecorder: media.AudioRecorder | null = null;
const END_STATE = 0;
const PRE_STATE = 1;
const START_STATE = 2;
const PAUSE_STATE = 3;
const RESUME_STATE = 4;
const STOP_STATE = 5;
const RESET_STATE = 6;
const RELEASE_STATE = 7;
const ERROR_STATE = 8;
const CHANNEL_TWO = 2;
const RECORDER_TIME = 1000;
let fdPath: string = '';
let fdObject: FdObject;
let mediaTestBase: MediaTestBase = new MediaTestBase();

interface GeneratedObjectLiteralInterface_1 {
  latitude: number;
  longitude: number;
}

let audioConfig: media.AudioRecorderConfig = {
  audioEncodeBitRate: 48000,
  audioSampleRate: 48000,
  numberOfChannels: CHANNEL_TWO,
  uri: 'fd://',
  location: ({ latitude: 30, longitude: 30 } as GeneratedObjectLiteralInterface_1),
  audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4A,
}

let avProfile: media.AVRecorderProfile = {
  audioBitrate: 64000, // set audioBitrate according to device ability
  audioChannels: 1, // set audioChannels, valid value 1-8
  audioCodec: media.CodecMimeType.AUDIO_AAC, // set audioCodec, AUDIO_AAC is the only choice
  aacProfile: media.AacProfile.AAC_LC,
  audioSampleRate: 8000, // set audioSampleRate according to device ability
  fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // set fileFormat, for video is m4a
}
let avConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  profile: avProfile,
  url: 'fd://'
}

function initAudioRecorder() {
  if (audioRecorder != null) {
    audioRecorder.release();
    audioRecorder = null;
  }
  audioRecorder = media.createAudioRecorder();
}

async function nextStep(mySteps: Array<number>, done: Function) {
  if (mySteps[0] == END_STATE) {
    done();
    console.info('case to done');
    return;
  }
  console.info('case to EVENT:::'+mySteps[0]);
  switch (mySteps[0]) {
    case PRE_STATE:
      console.info('case to prepare');
      audioRecorder?.prepare(audioConfig);
      break;
    case START_STATE:
      console.info('case to start');
      audioRecorder?.start();
      break;
    case PAUSE_STATE:
      console.info('case to pause');
      audioRecorder?.pause();
      break;
    case RESUME_STATE:
      console.info('case to resume');
      audioRecorder?.resume();
      break;
    case STOP_STATE:
      console.info('case to stop');
      audioRecorder?.stop();
      break;
    case RESET_STATE:
      console.info('case to reset');
      audioRecorder?.reset();
      break;
    case RELEASE_STATE:
      console.info('case to release');
      audioRecorder?.release();
      audioRecorder = null;
      break;
    case ERROR_STATE:
      console.info('case to wait error callback');
      break;
    default:
      break;
  }
}

async function setCallback(mySteps: Array<number>, done: Function) {
  audioRecorder?.on('prepare', () => {
    console.info('setCallback prepare() case callback is called');
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('start', async () => {
    console.info('setCallback start() case callback is called');
    await mediaTestBase.msleep(RECORDER_TIME);
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('pause', () => {
    console.info('setCallback pause() case callback is called');
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('resume', async () => {
    console.info('setCallback resume() case callback is called');
    await mediaTestBase.msleep(RECORDER_TIME);
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('stop', () => {
    console.info('setCallback stop() case callback is called');
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('reset', () => {
    console.info('setCallback reset() case callback is called');
    mySteps.shift();
    nextStep(mySteps, done);
  });

  audioRecorder?.on('release', () => {
    console.info('setCallback release() case callback is called');
    mySteps.shift();
    nextStep(mySteps, done);
  });
  audioRecorder?.on('error', (err) => {
    console.info(`case error called,errCode is ${err.code}`);
    mySteps.shift();
    expect(mySteps[0]).assertEqual(ERROR_STATE);
    mySteps.shift();
    nextStep(mySteps, done);
  });
}

export default function RecorderLocalTestAudioAPI() {
  describe('RecorderLocalTestAudioAPI', () => {
    beforeAll(async () => {
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA'];
      await mediaTestBase.getPermission(permissionNames);
      await mediaTestBase.msleepAsync(2000);
      await mediaTestBase.driveFn(3);
      fdObject = await mediaTestBase.getFd('audio_api.mp4');
      if (fdObject.fdNumber != null) {
        fdPath = "fd://" + fdObject.fdNumber.toString();
      }
      audioConfig.uri = fdPath;
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      await mediaTestBase.closeFd(fdObject?.fdNumber);
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(START_STATE, ERROR_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.start();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESET_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);

      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, PRE_STATE, ERROR_STATE, STOP_STATE, PRE_STATE, RESET_STATE, PRE_STATE,
          RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, PRE_STATE, ERROR_STATE, PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1000
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1000', Level.LEVEL2, async (done: Function) => {
      audioConfig.numberOfChannels = -1;
      audioConfig.audioSampleRate = 22050;
      audioConfig.audioEncodeBitRate = 22050;
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1100', Level.LEVEL2, async (done: Function) => {
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.audioSampleRate = -1;
      audioConfig.audioEncodeBitRate = 22050;
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PREPARE_API_1200', Level.LEVEL2, async (done: Function) => {
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.audioSampleRate = 22050;
      audioConfig.audioEncodeBitRate = -1;
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0100', Level.LEVEL2, async (done: Function) => {
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.audioSampleRate = 22050;
      audioConfig.audioEncodeBitRate = 22050;
      initAudioRecorder();
      let mySteps = new Array(START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.start();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, START_STATE, ERROR_STATE, RELEASE_STATE,
          END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, STOP_STATE, START_STATE, ERROR_STATE, PRE_STATE, START_STATE, RESET_STATE,
          START_STATE, ERROR_STATE, PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_START_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, START_STATE, ERROR_STATE, START_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0100', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.pause();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE,
          RESET_STATE, PAUSE_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_PAUSE_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, PAUSE_STATE, ERROR_STATE, PAUSE_STATE, ERROR_STATE,
        RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0100', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.resume();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESUME_STATE, ERROR_STATE, PAUSE_STATE, RESUME_STATE, STOP_STATE,
        RESUME_STATE, ERROR_STATE, RESET_STATE, RESUME_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESUME_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RESUME_STATE, ERROR_STATE, RESUME_STATE,
          ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0100', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.stop();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, STOP_STATE, ERROR_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, STOP_STATE, ERROR_STATE, RESET_STATE, PRE_STATE, START_STATE, STOP_STATE, RESET_STATE,
          PRE_STATE, RESET_STATE, STOP_STATE, ERROR_STATE, PRE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_STOP_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, START_STATE, STOP_STATE, STOP_STATE, ERROR_STATE, STOP_STATE, ERROR_STATE, RELEASE_STATE,
          END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0100', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.reset();
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0800
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0800', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps =
        new Array(PRE_STATE, RESET_STATE, PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE, STOP_STATE,
          RESET_STATE, PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0900
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RESET_API_0900', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RESET_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0100
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0100', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.release();
        audioRecorder = null;
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0200
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0200', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0300
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0300', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0400
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0400', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0500
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0500', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0600
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0600', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0700
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_RELEASE_API_0700', Level.LEVEL2, async (done: Function) => {
      initAudioRecorder();
      let mySteps = new Array(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001
     * @tc.desc   Reliability Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001', Level.LEVEL2, async (done: Function) => {
      let AVRecorder = await media.createAVRecorder();
      if(AVRecorder) {
        AVRecorder?.prepare(avConfig);
        AVRecorder?.start();
        AVRecorder?.stop();
        expect(media.AacProfile.AAC_HE).assertEqual(1);
        expect(media.AacProfile.AAC_HE_V2).assertEqual(2);
        done();
      }
    });
  })
}
