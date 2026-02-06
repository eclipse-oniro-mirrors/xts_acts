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
import VideoRecorderBase, { RecorderConfigFile } from './VideoRecorderTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Permissions } from '@kit.AbilityKit';

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
const CHECK_STATE = 9;
const RECORDER_TIME = 3000;
const CHANNEL_ONE = 1;
const CHANNEL_TWO = 2;
const FORMAT_MP4 = media.AudioOutputFormat.MPEG_4;
const FORMAT_M4A = media.AudioOutputFormat.AAC_ADTS;
const ENCORDER_AACLC = media.AudioEncoder.AAC_LC;
const ONLYAUDIO_TYPE = 'only_audio';
let mediaTestBase: MediaTestBase = new MediaTestBase()
let videoRecorderBase: VideoRecorderBase = new VideoRecorderBase()
let trackArray: number | Array<Array<string>>;
let recorderTime: number | Array<Array<string>>;
let fdPath: string;
let fdObject: FdObject | undefined;
let audioConfig: RecorderConfigFile = {
  audioEncoder: ENCORDER_AACLC,
  audioEncodeBitRate: 48000,
  audioSampleRate: 48000,
  numberOfChannels: CHANNEL_TWO,
  format: FORMAT_M4A,
  uri: 'fd://',
  location: { latitude: 30, longitude: 30 },
  fileFormat: media.ContainerFormatType.CFT_MPEG_4
}

function initAudioRecorder() {
  if (audioRecorder != null) {
    console.info('case to initAudioRecorder:::');
    console.info('case to initAudioRecorder:::release');
    audioRecorder.release();
    audioRecorder = null;
  }
  audioRecorder = media.createAudioRecorder();
}

async function nextStep(mySteps: Array<number | Array<Array<string>>>, done: Function) {
  if (mySteps[0] == END_STATE) {
    console.info('case to done');
    done();
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
    case CHECK_STATE:
      mySteps.shift();
      trackArray = mySteps[0];
      recorderTime = mySteps[1];
      mySteps.shift();
      mySteps.shift();
      await videoRecorderBase.checkVideos(fdPath, ((recorderTime as ESObject) as number), ((trackArray as ESObject ) as Array<Array<string>>), null);
      nextStep(mySteps, done);
      break;
    case ERROR_STATE:
      console.info('case to wait error callback');
      break;
    default:
      break;
  }
}

async function setCallback(mySteps: Array<number | Array<Array<string>>>, done: Function) {
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

  audioRecorder?.on('resume',async () => {
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

export default function RecorderLocalTestAudioFUNC() {
  describe('RecorderLocalTestAudioFUNC', () => {
    beforeAll(async () => {
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA'];
      await mediaTestBase.getPermission(permissionNames);
      await mediaTestBase.msleepAsync(2000);
      await mediaTestBase.driveFn(3);
      //await mediaTestBase.msleepAsync(2000);
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
      fdObject = undefined;
    })

    afterEach(async () => {
      if (fdObject != undefined) {
        await mediaTestBase.closeFd(fdObject?.fdNumber);
        console.info('afterEach case');
      }
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_01.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0200
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0200', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_02.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.numberOfChannels = CHANNEL_ONE;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0300
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0300', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_03.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.numberOfChannels = CHANNEL_TWO;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps =  new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0400
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0400', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_04.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 8000; // samplerate 8000
      audioConfig.numberOfChannels = CHANNEL_TWO;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0500
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0500', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_05.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 32000; // samplerate 32000
      audioConfig.numberOfChannels = CHANNEL_ONE;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0600
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0600', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_06.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 44100; // samplerate 44100
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0700
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0700', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_07.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 64000; // samplerate 64000
      audioConfig.numberOfChannels = CHANNEL_ONE;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0800
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0800', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_08.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 96000; // samplerate 96000
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0900
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_0900', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_09.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 22050; // samplerate 22050
      audioConfig.audioEncodeBitRate = 8000; // encodeBitrate 8000
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1000
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1000', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_10.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 44100; // samplerate 44100
      audioConfig.audioEncodeBitRate = 16000; // encodeBitrate 16000
      audioConfig.numberOfChannels = CHANNEL_ONE;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_11.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 44100; // samplerate 44100
      audioConfig.audioEncodeBitRate = 32000; // encodeBitrate 32000
      audioConfig.numberOfChannels = CHANNEL_ONE;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1200
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1200', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_12.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 44100; // samplerate 44100
      audioConfig.audioEncodeBitRate = 64000; // encodeBitrate 64000
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1300
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_CODEC_AAC_1300', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_13.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioSampleRate = 44100; // samplerate 44100
      audioConfig.audioEncodeBitRate = 112000; // encodeBitrate 112000
      audioConfig.numberOfChannels = CHANNEL_TWO;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_MP4_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_MP4_0100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_MP4_0100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_14.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioEncodeBitRate = 22050; // samplerate 22050
      audioConfig.audioSampleRate = 22050; // encodeBitrate 22050
      audioConfig.format = FORMAT_MP4;
      audioConfig.numberOfChannels = CHANNEL_TWO;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_M4A_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_M4A_0100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FORMAT_M4A_0100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_15.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.audioEncodeBitRate = 22050; // samplerate 22050
      audioConfig.audioSampleRate = 22050; // encodeBitrate 22050
      audioConfig.format = FORMAT_M4A;
      audioConfig.numberOfChannels = CHANNEL_TWO;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_16.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0200
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0200', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_17.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE,
        RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0300
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0300', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_18.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE,
        STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0400
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0400', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_19.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, RESET_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0500
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0500', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_20.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, PAUSE_STATE,
        STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0600
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0600', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_21.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, STOP_STATE,
        RESET_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0700
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0700', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_22.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = new Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, RESUME_STATE, STOP_STATE,
        RESET_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0800
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0800', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_23.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE,
        PAUSE_STATE, RESUME_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME * 2, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0900
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_0900', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_24.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_M4A;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE, START_STATE,
        PAUSE_STATE, STOP_STATE, RESET_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1000
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1000', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_25.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, RESET_STATE, PRE_STATE,
        START_STATE, STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1100
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1100', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_26.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, PAUSE_STATE, START_STATE, ERROR_STATE,
        STOP_STATE, RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1200
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1200', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_27.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      audioConfig.uri = fdPath;
      audioConfig.format = FORMAT_MP4;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, audioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, PAUSE_STATE, ERROR_STATE,
        RELEASE_STATE, CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(audioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1300
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1300', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_28.mp4');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      let newAudioConfig: RecorderConfigFile = {
        audioEncodeBitRate: 22050,
        audioSampleRate: 22050,
        numberOfChannels: CHANNEL_TWO,
        uri: 'fd://',
        location: {
          latitude: 1, longitude: 1
        },
        audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4,
      }
      newAudioConfig.uri = fdPath;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, newAudioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(newAudioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1400
     * @tc.desc   Audio recordr control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_RECORDER_FUNCTION_1400', Level.LEVEL2, async (done: Function) => {
      fdObject = await mediaTestBase.getFd('audio_29.m4a');
      fdPath = "fd://" + fdObject.fdNumber?.toString();
      let newAudioConfig: RecorderConfigFile = {
        audioEncodeBitRate: 22050,
        audioSampleRate: 22050,
        numberOfChannels: CHANNEL_TWO,
        uri: 'fd://',
        location: {
          latitude: 1, longitude: 1
        },
        audioEncoderMime: media.CodecMimeType.AUDIO_AAC,
        fileFormat: media.ContainerFormatType.CFT_MPEG_4A,
      }
      newAudioConfig.uri = fdPath;
      trackArray = videoRecorderBase.getTrackArray(ONLYAUDIO_TYPE, newAudioConfig, undefined);
      initAudioRecorder();
      let mySteps = Array<number | Array<Array<string>>>(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE,
        CHECK_STATE, trackArray, RECORDER_TIME, END_STATE);
      setCallback(mySteps, done);
      try {
        audioRecorder?.prepare(newAudioConfig);
      } catch (error) {
        expect().assertFail();
        done();
        console.info(`test error end: `+ error);
      }
    })
  })

}

