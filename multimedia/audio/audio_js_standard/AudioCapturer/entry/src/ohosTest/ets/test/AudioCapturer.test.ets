/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size  } from '@ohos/hypium';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import fs from '@ohos.file.fs'

let testContext: common.UIAbilityContext;

interface renderInfoType {
  MUSIC: renderInfoChild,
  VOICE_CALL: renderInfoChild,
  RINGTONE: renderInfoChild,
  VOICE_ASSISTANT: renderInfoChild,
  ALARM: renderInfoChild,
  ACCESSIBILITY: renderInfoChild,
  SPEECH: renderInfoChild,
  MOVIE: renderInfoChild,
  UNKNOW: renderInfoChild,
  VOICE_MESSAGE: renderInfoChild,
  GAME: renderInfoChild,
  NAVIGATION: renderInfoChild,
  NOTIFICATION: renderInfoChild,
}

interface renderInfoChild {
  content: number,
  usage: number,
  rendererFlags: number
}

class Options {
  offset?: number;
  length?: number;
}

export default function audioCapturer() {

  describe('audioCapturer', () => {
    let Tag: string = 'AudioCpaturer';
    let dirPath: string;
    let bufferSize: ESObject;
    let LE24: number = -1;
    let LE32: number = -1;
    let markReachState: string = 'unknow';
    let periodReachState: string = 'unknow';
    const CREATE_EVENT: string = 'create';
    const START_EVENT: string = 'start';
    const GET_BUFFERSIZE_EVENT: string = 'get_buffersize';
    const READ_EVENT: string = 'read';
    const STOP_EVENT: string = 'stop';
    const RELEASE_EVENT: string = 'release';
    const STATE_CHANGE_EVENT: string = 'on_state_change';
    const MARK_REACH_EVENT: string = 'on_mark_reach';
    const OFF_MARK_REACH_EVENT: string = 'off_mark_reach'
    const PERIODR_REACH_EVENT: string = 'on_period_reach';
    const OFF_PERIODR_REACH_EVENT: string = 'off_period_reach';
    const END_EVENT: string = 'end';
    const GET_AUDIOTIME_EVENT: string = 'getAudioTime';
    const GET_CAPTURERINFO_EVENT: string = 'getCapturerInfo';
    const GET_STREAMINFO_EVENT: string = 'getStreamInfo';
    const GET_AUDIOSCENE_EVENT: string = 'getAudioScene';
    const ERROR_EVENT: string = 'error';
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const AUDIOMANAGERREC = audio.getAudioManager()
    let sleep = (ms: number): Promise<ESObject> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    let renderInfo: renderInfoType = {
      MUSIC: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0,
      },
      VOICE_CALL: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      },
      RINGTONE: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0,
      },
      VOICE_ASSISTANT: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      },
      ALARM: {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      },
      ACCESSIBILITY: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      },
      SPEECH: {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      MOVIE: {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      },
      UNKNOW: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      },
      VOICE_MESSAGE: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      },

      GAME: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      },
      NAVIGATION: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      },
      NOTIFICATION: {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
    }
    let toNextStep = async (audioCap: ESObject, steps: ESObject) => {
      if (steps[0] === END_EVENT) {
        await sleep(1000);
        if (markReachState === 'success' || markReachState === 'invalid_failure') {
          console.log(`${Tag} markReachState: ${JSON.stringify(markReachState)}`);
          expect(true).assertTrue();
        } else if (markReachState === 'failure') {
          expect(false).assertTrue();
        }
        markReachState = 'unknow'; //recover state

        if (periodReachState === 'success' || periodReachState === 'invalid_failure') {
          console.log(`${Tag} periodReachState: ${JSON.stringify(periodReachState)}`);
          expect(true).assertTrue();
        } else if (periodReachState === 'failure') {
          expect(false).assertTrue();
        }
        periodReachState = 'unknow';

        console.info(`${Tag} case done!!`);
      } else {
        let eventData: emitter.EventData = {
          data: {
            audioCap: audioCap,
            mySteps: steps,
          }
        }
        emitter.emit(steps[0], eventData);
      }
    }
    emitter.on(CREATE_EVENT, (data) => {
      console.log(`${Tag} emitstarts: ${JSON.stringify(data)}`);
      let steps: ESObject = data.data?.mySteps

      let audioCap: ESObject = data.data?.audioCap
      steps.shift();
      console.log('stepsstepssteps',JSON.stringify(steps[0]))
      audio.createAudioCapturer(steps[0], (err, data) => {
        console.log(`${Tag} enter createAudioCapturer`);
        steps.shift();
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} CREATE_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} create err55555 : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          steps = [END_EVENT];
          toNextStep(audioCap, steps);
        } else {
          console.log(`${Tag} create success`);
          audioCap = data;
          expect(audioCap.state).assertEqual(audio.AudioState.STATE_PREPARED);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(START_EVENT,async  (data) => {
      console.log(`${Tag}ccccccc emit: ${JSON.stringify(data)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.info('audioCapaudioCap',JSON.stringify(audioCap))
      steps.shift();
      await sleep(1000)
      audioCap.start((err: BusinessError) => {
        console.log(`${Tag} enter startfffffff`);
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} START_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} start err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          releaseFun(audioCap);
        } else {
          console.log(`${Tag} start success`);
          expect(audioCap.state).assertEqual(audio.AudioState.STATE_RUNNING);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(GET_BUFFERSIZE_EVENT, (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(GET_BUFFERSIZE_EVENT)}`);
      steps.shift();
      audioCap.getBufferSize(async (err: BusinessError, size: number) => {
        console.log(`${Tag} enter getBufferSize`);
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} GET_BUFFERSIZE_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} start err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
        } else {
          console.log(`${Tag} getBufferSize success`);
          bufferSize = size;
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)}`);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(READ_EVENT, async (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(READ_EVENT)}`);
      steps.shift();
      let fd = fileio.openSync(dirPath, 0o102, 0o777);
      if (fd !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
        expect(false).assertTrue();
        // done();
        return;
      }

      fd = fileio.openSync(dirPath, 0o2002, 0o666);
      if (fd !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode : PASS`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
        expect(false).assertTrue();
        return;
      }
      let numBuffersToCapture = 45;
      while (numBuffersToCapture) {
        try {
          return new Promise((resolve, reject) => {
            audioCap.read(bufferSize, true, (err: BusinessError, buffer: ESObject) => {
              if (err) {
                console.info(`${Tag} AudioFrameworkRecLog: Capturer release :ERROR :  ${JSON.stringify(err.message)}`);
                reject(err);
              } else {
                let number = fileio.writeSync(fd, buffer);
                console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                resolve();
              }
            });
          })
        } catch (err) {
          console.info(`${Tag} read err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        numBuffersToCapture--;
      }
      console.log(`${Tag} read success`);
      toNextStep(audioCap, steps);
    });
    //
    emitter.on(STOP_EVENT, (data) => {
      console.log(`${Tag} emit: ${JSON.stringify(STOP_EVENT)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      steps.shift();
      audioCap.stop(async (err: BusinessError) => {
        console.log(`${Tag} enter stop`);
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} STOP_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} stop err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
        } else {
          console.log(`${Tag} stop success`);
          expect(audioCap.state).assertEqual(audio.AudioState.STATE_STOPPED);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(RELEASE_EVENT,async (data) => {
      console.log(`${Tag} emit: ${JSON.stringify(RELEASE_EVENT)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log('audioCapaudioCap', JSON.stringify(audioCap))
      steps.shift();
      await sleep(1000)
      audioCap.release(async (err: BusinessError) => {
        console.log(`${Tag} enter release`);
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} RELEASE_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} release err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
          return;
        } else {
          console.log(`${Tag} release success`);
          expect(audioCap.state).assertEqual(audio.AudioState.STATE_RELEASED);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(GET_AUDIOTIME_EVENT, (data) => {
      console.log(`${Tag} emit: ${JSON.stringify(GET_AUDIOTIME_EVENT)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      steps.shift();
      audioCap.getAudioTime(async (err: BusinessError, audioTime: ESObject) => {
        console.log(`${Tag} enter getAudioTime`);
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} GET_AUDIOTIME_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} getAudioTime err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
          return;
        } else {
          console.log(`${Tag} getAudioTime success`);
          expect(audioTime).assertLarger(0);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(GET_CAPTURERINFO_EVENT, (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(GET_CAPTURERINFO_EVENT)}`);
      steps.shift();
      audioCap.getCapturerInfo(async (err: BusinessError, audioParamsGet: ESObject) => {
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} GET_CAPTURERINFO_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} getCapturerInfo err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
          return;
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo:`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer SourceType: ${JSON.stringify(audioParamsGet.source)}`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer capturerFlags: ${JSON.stringify(audioParamsGet.capturerFlags)}`);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(GET_STREAMINFO_EVENT,async (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(GET_STREAMINFO_EVENT)}`);
      steps.shift();
      await sleep(1000)
      audioCap.getStreamInfo(async (err: BusinessError, audioParamsGet:ESObject) => {
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} GET_STREAMINFO_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} getStreamInfo err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
          return;
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer sampleFormat: ${JSON.stringify(audioParamsGet.sampleFormat)}`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer samplingRate: ${JSON.stringify(audioParamsGet.samplingRate)}`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer channels: ${JSON.stringify(audioParamsGet.channels)}`);
          console.info(`${Tag} AudioFrameworkRecLog: Capturer encodingType: ${JSON.stringify(audioParamsGet.encodingType)}`);
          toNextStep(audioCap, steps);
        }
      });
    });
    //
    emitter.on(GET_AUDIOSCENE_EVENT, (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(GET_AUDIOSCENE_EVENT)}`);
      steps.shift();
      AUDIOMANAGERREC.getAudioScene(async (err, getValue) => {
        if (err && steps[0] === ERROR_EVENT) {
          console.log(`${Tag} GET_AUDIOSCENE_EVENT error success`);
          steps.shift();
          toNextStep(audioCap, steps);
        } else if (err) {
          console.log(`${Tag} getStreamInfo err : ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          await releaseFun(audioCap);
          return;
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: getAudioScene : Value :  ${JSON.stringify(getValue)}`);
          toNextStep(audioCap, steps);
        }
      });
    });
    emitter.on(STATE_CHANGE_EVENT,async (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: audio.AudioCapturer = data.data?.audioCap
      console.log(`${Tag} emit4444: ${JSON.stringify(STATE_CHANGE_EVENT)}`);
      steps.shift();
      console.log(`${Tag} STATE_CHANGE_EVENT register success`);
      await sleep(1000)
      audioCap.on('stateChange', (AudioState) => {
        console.info(`${Tag} AudioCapturerLog: Changed State to :  ${JSON.stringify(AudioState)}`);
        switch (AudioState) {
          case audio.AudioState.STATE_NEW:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------NEW--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : New`);
            break;
          case audio.AudioState.STATE_PREPARED:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------PREPARED--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : Prepared`);
            break;
          case audio.AudioState.STATE_RUNNING:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------RUNNING--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : Running`);
            break;
          case audio.AudioState.STATE_STOPPED:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------STOPPED--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : stopped`);
            break;
          case audio.AudioState.STATE_RELEASED:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------RELEASED--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : released`);
            break;
          default:
            console.info(`${Tag} AudioFrameworkTest:--------CHANGE IN AUDIO STATE----------INVALID--------------`);
            console.info(`${Tag} AudioFrameworkTest: Audio State is : invalid`);
            break;
        }
      });
      toNextStep(audioCap, steps);
    });
    //
    emitter.on(MARK_REACH_EVENT, (data) => {
      console.log(`${Tag} emit: ${JSON.stringify(MARK_REACH_EVENT)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      steps.shift();
      let markReachParam: string = steps[0];
      steps.shift();
      try {
        audioCap.on('markReach', markReachParam, (position: ESObject) => {
          console.log(`${Tag} position: ${JSON.stringify(position)}`);
          console.log(`${Tag} markReachParam: ${JSON.stringify(markReachParam)}`);
          if (position === markReachParam) {
            markReachState = 'success'
            console.info(`${Tag} AudioRenderLog: mark reached:  ${JSON.stringify(position)}`);
          }
        });
        toNextStep(audioCap, steps);
      } catch (error) {
        if (error.code === 401) {
          markReachState = 'invalid_failure';
          toNextStep(audioCap, steps);
        } else {
          console.info("err" + error.code);
          toNextStep(audioCap, steps);
        }
      }
    });
    //
    emitter.on(OFF_MARK_REACH_EVENT, (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(OFF_MARK_REACH_EVENT)}`);
      steps.shift();
      audioCap.off('markReach');
      toNextStep(audioCap, steps);
    });
    emitter.on(PERIODR_REACH_EVENT, (data) => {
      console.log(`${Tag} emit: ${JSON.stringify(PERIODR_REACH_EVENT)}`);
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      steps.shift();
      let periodReachParam: string = steps[0];
      steps.shift();
      try {
        audioCap.on('periodReach', periodReachParam, (position: ESObject) => {
          console.log(`${Tag} position: ${JSON.stringify(position)}`);
          console.log(`${Tag} periodReachParam: ${JSON.stringify(periodReachParam)}`);
          if (position === periodReachParam) {
            periodReachState = 'success'
            console.info(`${Tag} AudioRenderLog: mark reached:  ${JSON.stringify(position)}`);
          }
        });
        toNextStep(audioCap, steps);
      } catch (error) {
        if (error.code === 401) {
          markReachState = 'invalid_failure';
          toNextStep(audioCap, steps);
        } else {
          console.info("err" + error.code);
          toNextStep(audioCap, steps);
        }
      }
    });
    emitter.on(OFF_PERIODR_REACH_EVENT, (data) => {
      let steps: ESObject = data.data?.mySteps
      let audioCap: ESObject = data.data?.audioCap
      console.log(`${Tag} emit: ${JSON.stringify(OFF_PERIODR_REACH_EVENT)}`);
      steps.shift();
      audioCap.off('periodReach');
      toNextStep(audioCap, steps);
    });
    let releaseFun = async (audioCap: audio.AudioCapturer, done?: Function) => {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }
    let getFd = async (fileName: string) => {
      dirPath = testContext.filesDir + '/' + fileName;
      console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
    }

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      console.info('beforeAll called')
    })
    afterAll(() => {
      console.info('afterAll called')
    })

    beforeEach(() => {
      console.info('beforeEach called')
    })

    afterEach(() => {
      console.info('afterEach called')
    })
    let recPromise =
      async (AudioCapturerOptions: audio.AudioCapturerOptions, AudioRendererOptions: audio.AudioRendererOptions,
        done: Function) => {
        let audioCap: audio.AudioCapturer;
        ;
        try {
          audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        } catch (err) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
          LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
          LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
          let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
          if ((sampleFormat === LE24 || sampleFormat === LE32) && err.code === 202) {
            done();
            return;
          }
          expect(false).assertTrue();
          done();
          return;
        }
        try {
          let audioParamsGet = await audioCap.getStreamInfo();
          if (audioParamsGet != undefined && audioParamsGet != null) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }

        try {
          let audioParamsGet = await audioCap.getCapturerInfo();
          if (audioParamsGet != undefined) {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
            expect(false).assertTrue();
          }
        } catch (err) {
          console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.start();
          console.log(`${Tag} start ok`);
          let bufferSize = await audioCap.getBufferSize();
          console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
          let fd = fileio.openSync(dirPath, 0o102, 0o777);
          console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
            expect(false).assertTrue();
          }

          fd = fileio.openSync(dirPath, 0o2002, 0o666);
          console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
          if (fd !== null) {
            console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
          } else {
            console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
            expect(false).assertTrue();
          }

          let numBuffersToCapture = 45;
          while (numBuffersToCapture) {
            console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
            let buffer = await audioCap.read(bufferSize, true);
            console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
            let number = fileio.writeSync(fd, buffer);
            console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
            numBuffersToCapture--;
          }
          console.log(`${Tag} read ok`);
          await audioCap.stop();
          console.log(`${Tag} stop ok`);
        } catch (err) {
          console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        try {
          await audioCap.release();
          console.log(`${Tag} release ok`);
        } catch (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        done();
      }

    let recCapturerPromise4 = async (AudioCapturerOptions: ESObject, fileName: string, done: Function) => {
      let audioCap: audio.AudioCapturer;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag} recCapturerPromise4 Created : Success`);
      } catch (err) {
        console.info(`${Tag} recCapturerPromise4 Created : ERROR :  ${JSON.stringify(err.message)}`);
        let S16LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE;
        let S24LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
        let S32LE = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
        let F32LE = audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE;
        let sampleFormat: ESObject = AudioCapturerOptions.streamInfo.sampleFormat;
        if ((sampleFormat === S16LE || sampleFormat == S24LE || sampleFormat == S32LE || sampleFormat == F32LE)
          && err.code === 202) {
          console.info(`${Tag} recCapturerPromise4 err.code === 202`);
          done();
          return;
        }
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let capturerDirPath = testContext.filesDir + '/' + fileName;
        console.info(`${Tag} recCapturerPromise4 capturerDirPath is  ${JSON.stringify(capturerDirPath)}`);
        let capturerFile = fs.openSync(capturerDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

        let fd = capturerFile.fd;
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} recCapturerPromise4: file fd created`);
          expect(true).assertTrue();
        } else {
          console.info(`${Tag} recCapturerPromise4: Capturer start : ERROR `);
          expect(false).assertTrue();
          fs.close(capturerFile);
          done();
          return;
        }

        let bufferSize: number = 0;
        let readDataCallback = (buffer: ArrayBuffer) => {
          let options: Options = {
            offset: bufferSize,
            length: buffer.byteLength
          }
          fs.writeSync(fd, buffer, options);
          bufferSize += buffer.byteLength;
        };
        audioCap.on('readData', readDataCallback);

        if (audioCap === undefined) {
          console.info(`${Tag} recCapturerPromise4: audioCap is undefined`);
          expect(false).assertTrue();
          fs.close(capturerFile);
          done();
          return;
        }

        try {
          await audioCap.start();
          console.log(`${Tag} recCapturerPromise4 start ok`);

          await sleep(2000);
          console.log(`${Tag} recCapturerPromise4 sleep end`);

          await audioCap.stop();
          console.log(`${Tag} recCapturerPromise4 stop ok`);

          await audioCap.release();
          console.log(`${Tag} recCapturerPromise4 release ok`);
        } catch (err) {
          console.log(`${Tag} recCapturerPromise4 release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          fs.close(capturerFile);
          done();
          return;
        }
      } catch (err) {
        console.log(`${Tag} recCapturerPromise4 on err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }
    }

    let resRendererPromise5 = async (AudioRendererOptions: ESObject, fileName: string) => {
      let audioRen: ESObject;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag}: resRendererPromise5 Created : Success`);

        let rendererDirPath = testContext.filesDir + '/' + fileName;
        console.info(`${Tag} resRendererPromise5 rendererDirPath: `+ rendererDirPath);
        let musicFile = fs.openSync(rendererDirPath, fs.OpenMode.READ_ONLY);

        let bufferSize: number = 0;
        let writeDataCallback = (buffer: ArrayBuffer) => {
          let options: Options = {
            offset: bufferSize,
            length: buffer.byteLength
          };

          try {
            fs.readSync(musicFile.fd, buffer, options);
            bufferSize += buffer.byteLength;
            // 系统会判定buffer有效，正常播放。
            return audio.AudioDataCallbackResult.VALID;
          } catch (error) {
            console.error('resRendererPromise5 Error reading file:', error);
            // 系统会判定buffer无效，不播放。
            return audio.AudioDataCallbackResult.INVALID;
          }
        };

        await audioRen.on('writeData', writeDataCallback);
        console.info(`${Tag}: resRendererPromise5 on function : SUCCESS`);

        try {
          await audioRen.start();
          console.log(`${Tag} resRendererPromise5 start ok`);

          await sleep(2000);
          console.log(`${Tag} resRendererPromise5 sleep end`);

          await audioRen.stop();
          console.log(`${Tag} resRendererPromise5 stop ok`);

          await audioRen.release();
          console.log(`${Tag} resRendererPromise5 release ok`);
        } catch (err) {
          console.log(`${Tag} resRendererPromise5 err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          fs.close(musicFile);
          return;
        }
      } catch (err) {
        console.info(`${Tag}: resRendererPromise5 : ERROR : ${err.message}`);
        expect(false).assertTrue();
        return;
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_0200
     * @tc.name      : AudioCapturer - getOverflowCountSync
     * @tc.desc      : AudioCapturer - getOverflowCountSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          let OverflowCOuntSync: ESObject = audioCapPromise.getOverflowCountSync();
          console.info(`${Tag}: overflowCOuntSync : Converted: ${OverflowCOuntSync}`);
          expect(OverflowCOuntSync).assertLargerOrEqual(0);
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          expect(false).assertTrue();
        });

      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_PREPARED_STATE_0100
     * @tc.name      :
     * @tc.desc      : createAudioCapturer callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_PREPARED_STATE_0100', 1, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      console.log(`${Tag} AudioCapturerOptions= ${JSON.stringify(AudioCapturerOptions)}`);
      let audioCap = null;
      let mySteps: ESObject[] = [CREATE_EVENT, AudioCapturerOptions, RELEASE_EVENT, END_EVENT];
      console.log(`${Tag} mySteps= ${JSON.stringify(mySteps)}`);
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_RUNNING_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-RUNNING
     * @tc.desc      : AudioCapturer with state running
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_RUNNING_STATE_0100', 1, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_STOPPED_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_STOPPED_STATE_0100', 1, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject = [CREATE_EVENT, AudioCapturerOptions, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_BUFFER_SIZE_0100
     * @tc.name      : AudioCapturer-get_buffer_size
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_BUFFER_SIZE_0100', 1, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_BUFFERSIZE_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_0100
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_0100', 1, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-PREPARED
     * @tc.desc      : AudioCapturer with state prepared
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMOISE_PREPARED_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCapPromise = data;
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(audioCapPromise.state).assertEqual(1);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-RUNNING
     * @tc.desc      : AudioCapturer with state running
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RUNNING_STATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise.start();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(audioCapPromise.state).assertEqual(2);
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOPPED_STATE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise.start();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await audioCapPromise.stop();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(audioCapPromise.state).assertEqual(3);
        await audioCapPromise.release()
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_0100
     * @tc.name      : AudioCapturer-Check-STATE-RELEASED
     * @tc.desc      : AudioCapturer with state released
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASED_STATE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise.start();
        await audioCapPromise.stop();
        await audioCapPromise.release();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
        expect(audioCapPromise.state).assertEqual(4);
      } catch (err) {
        console.log(`${Tag} err : ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_SYNC_0100
     * @tc.name      : AudioCapturer-get_buffer_size_sync
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_SYNC_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioCapPromise.start();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
        let bufferSize: ESObject = audioCapPromise.getBufferSizeSync();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSizeSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.release();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_0100
     * @tc.name      : AudioCapturer-get_buffer_size
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_BUFFER_SIZE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioCapPromise.start();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
        let bufferSize: ESObject = await audioCapPromise.getBufferSize();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.release();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_0100
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_READ_BUFFER_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkpromisereadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err : ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioCapPromise.start();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RUNNING);
        bufferSize = await audioCapPromise.getBufferSize();
        console.info(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
      } catch (err) {
        console.log(`${Tag} start-getBufferSize err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      let fd = fileio.openSync(dirPath, 0o102, 0o777);
      if (fd !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
        expect(false).assertTrue();
        done();
        return;
      }
      fd = fileio.openSync(dirPath, 0o2002, 0o666);
      if (fd !== null) {
        console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
      } else {
        console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
        expect(false).assertTrue();
        done();
        return;
      }

      try {
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          let buffer: ESObject = await audioCapPromise.read(bufferSize, true);
          console.info(`${Tag} AudioFrameworkRecLog: ---------AFTER PROMISE READ ---------`);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
          numBuffersToCapture--;
        }
      } catch (err) {
        console.info(`${Tag} AudioFrameworkRecLog: read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapPromise.release();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      await getFd("capture_CB_js-44100-2C-16B.pcm");
      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, GET_AUDIOSCENE_EVENT, GET_STREAMINFO_EVENT, GET_CAPTURERINFO_EVENT,
          START_EVENT, GET_BUFFERSIZE_EVENT, READ_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_ENUM_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_CB_ENUM_0100', 2, async (done: Function) => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: 3,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      await getFd("capture_CB_js-44100-2C-16B.pcm");
      let audioCap = null;
      let mySteps: ESObject = [CREATE_EVENT, AudioCapturerOptions, ERROR_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 7
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0100
     * @tc.name      : AudioCapturer-Set1-Media
     * @tc.desc      : AudioCapturer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0200
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0200', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0200
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0200', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0300
     * @tc.name      : AudioRec-Set2
     * @tc.desc      : record audio with parameter set 2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0300', 2, async (done: Function) => {
      let audioStreamInfo96000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo96000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioCapturerOptions96000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo96000,
        capturerInfo: audioCapturerInfo96000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo96000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-96000-1C-S24LE.pcm");
      await recPromise(audioCapturerOptions96000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0300
     * @tc.name      : AudioRec-Set2
     * @tc.desc      : record audio with parameter set 2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0300', 2, async (done: Function) => {
      let audioStreamInfo96000: audio.AudioStreamInfo = {
        samplingRate: 96000,
        channels: 1,
        sampleFormat: 2,
        encodingType: 0,
      };
      let audioCapturerInfo96000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions96000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo96000,
        capturerInfo: audioCapturerInfo96000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo96000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-96000-1C-S24LE.pcm");
      await recPromise(audioCapturerOptions96000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0400
     * @tc.name      : AudioRec-Set3
     * @tc.desc      : record audio with parameter set 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0400', 2, async (done: Function) => {
      let audioStreamInfo48000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo48000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions48000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo48000,
        capturerInfo: audioCapturerInfo48000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo48000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions48000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0400
     * @tc.name      : AudioRec-Set3
     * @tc.desc      : record audio with parameter set 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0400', 2, async (done: Function) => {
      let audioStreamInfo48000: audio.AudioStreamInfo = {
        samplingRate: 48000,
        channels: 2,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo48000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions48000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo48000,
        capturerInfo: audioCapturerInfo48000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo48000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-48000-2C-1S32LE.pcm");
      await recPromise(audioCapturerOptions48000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0500
     * @tc.name      : AudioRec-Set4
     * @tc.desc      : record audio with parameter set 4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0500', 2, async (done: Function) => {
      let audioStreamInfo8000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo8000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions8000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo8000,
        capturerInfo: audioCapturerInfo8000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo8000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-8000-1C-8B.pcm");
      await recPromise(audioCapturerOptions8000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0500
     * @tc.name      : AudioRec-Set4
     * @tc.desc      : record audio with parameter set 4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0500', 2, async (done: Function) => {
      let audioStreamInfo8000: audio.AudioStreamInfo = {
        samplingRate: 8000,
        channels: 1,
        sampleFormat: 0,
        encodingType: 0,
      };
      let audioCapturerInfo8000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions8000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo8000,
        capturerInfo: audioCapturerInfo8000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo8000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-8000-1C-8B.pcm");
      await recPromise(audioCapturerOptions8000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0600
     * @tc.name      : AudioRec-Set5
     * @tc.desc      : record audio with parameter set 5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0600', 2, async (done: Function) => {
      let audioStreamInfo11025: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo11025: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions11025: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo11025,
        capturerInfo: audioCapturerInfo11025,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo11025,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-11025-2C-16B.pcm");
      await recPromise(audioCapturerOptions11025, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0600
     * @tc.name      : AudioRec-Set5
     * @tc.desc      : record audio with parameter set 5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0600', 2, async (done: Function) => {
      let audioStreamInfo11025: audio.AudioStreamInfo = {
        samplingRate: 11025,
        channels: 2,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo11025: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions11025: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo11025,
        capturerInfo: audioCapturerInfo11025,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo11025,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-11025-2C-16B.pcm");
      await recPromise(audioCapturerOptions11025, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0700
     * @tc.name      : AudioRec-Set6
     * @tc.desc      : record audio with parameter set 6
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0700', 2, async (done: Function) => {
      let audioStreamInfo12000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo12000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions12000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo12000,
        capturerInfo: audioCapturerInfo12000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo12000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-12000-1C-24B.pcm");
      await recPromise(audioCapturerOptions12000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0800
     * @tc.name      : AudioRec-Set7
     * @tc.desc      : record audio with parameter set 7
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0800', 2, async (done: Function) => {
      let audioStreamInfo16000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo16000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions16000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo16000,
        capturerInfo: audioCapturerInfo16000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo16000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-16000-2C-32B.pcm");
      await recPromise(audioCapturerOptions16000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0800
     * @tc.name      : AudioRec-Set7
     * @tc.desc      : record audio with parameter set 7
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0800', 2, async (done: Function) => {
      let audioStreamInfo16000: audio.AudioStreamInfo = {
        samplingRate: 16000,
        channels: 2,
        sampleFormat: 3,
        encodingType: 0,
      };
      let audioCapturerInfo16000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions16000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo16000,
        capturerInfo: audioCapturerInfo16000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo16000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-16000-2C-32B.pcm");
      await recPromise(audioCapturerOptions16000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0900
     * @tc.name      : AudioRec-Set8
     * @tc.desc      : record audio with parameter set 8
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     //  */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_0900', 2, async (done: Function) => {
      let audioStreamInfo22050: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo22050: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions22050: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo22050,
        capturerInfo: audioCapturerInfo22050,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo22050,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-22050-1C-8B.pcm");
      await recPromise(audioCapturerOptions22050, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0900
     * @tc.name      : AudioRec-Set8
     * @tc.desc      : record audio with parameter set 8
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_0900', 2, async (done: Function) => {
      let audioStreamInfo22050: audio.AudioStreamInfo = {
        samplingRate: 22050,
        channels: 1,
        sampleFormat: 0,
        encodingType: 0,
      };
      let audioCapturerInfo22050: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions22050: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo22050,
        capturerInfo: audioCapturerInfo22050,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo22050,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-22050-1C-8B.pcm");
      await recPromise(audioCapturerOptions22050, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1000
     * @tc.name      : AudioRec-Set9
     * @tc.desc      : record audio with parameter set 9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1000', 2, async (done: Function) => {
      let audioStreamInfo24000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo24000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions24000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo24000,
        capturerInfo: audioCapturerInfo24000,
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo24000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-24000-2C-16B.pcm");
      await recPromise(audioCapturerOptions24000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1000
     * @tc.name      : AudioRec-Set9
     * @tc.desc      : record audio with parameter set 9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1000', 2, async (done: Function) => {
      let audioStreamInfo24000: audio.AudioStreamInfo = {
        samplingRate: 24000,
        channels: 2,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo24000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions24000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo24000,
        capturerInfo: audioCapturerInfo24000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo24000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-24000-2C-16B.pcm");
      await recPromise(audioCapturerOptions24000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1100
     * @tc.name      : AudioRec-Set10
     * @tc.desc      : record audio with parameter set 010
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1100', 2, async (done: Function) => {
      let audioStreamInfo32000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo32000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions32000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo32000,
        capturerInfo: audioCapturerInfo32000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo32000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-32000-1C-24B.pcm");
      await recPromise(audioCapturerOptions32000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1100
     * @tc.name      : AudioRec-Set10
     * @tc.desc      : record audio with parameter set 010
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1100', 2, async (done: Function) => {
      let audioStreamInfo32000: audio.AudioStreamInfo = {
        samplingRate: 32000,
        channels: 1,
        sampleFormat: 2,
        encodingType: 0,
      };
      let audioCapturerInfo32000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions32000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo32000,
        capturerInfo: audioCapturerInfo32000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo32000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-32000-1C-24B.pcm");
      await recPromise(audioCapturerOptions32000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1200
     * @tc.name      : AudioRec-Set11
     * @tc.desc      : record audio with parameter set 011
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1200', 2, async (done: Function) => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1200
     * @tc.name      : AudioRec-Set11
     * @tc.desc      : record audio with parameter set 011
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_ENUM_1200', 2, async (done: Function) => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: 64000,
        channels: 2,
        sampleFormat: 3,
        encodingType: 0,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1300
     * @tc.name      : AudioRec-Set11 , SourceType set SOURCE_TYPE_VOICE_RECOGNITION
     * @tc.desc      : record audio with parameter set 011
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_REC_VOICE_CHAT_PROMISE_1300', 2, async (done: Function) => {
      let audioStreamInfo64000: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo64000: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let audioCapturerOptions64000: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo64000,
        capturerInfo: audioCapturerInfo64000,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo64000,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-64000-2C-32B.pcm");
      await recPromise(audioCapturerOptions64000, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RECORD_PROMISE_AUDIO_SCENE_DEFAULT_ENUM_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let audioCapturerOptions44100: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo44100,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-1C-16LE.pcm");
      await recPromise(audioCapturerOptions44100, AudioRendererOptions, done);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_START_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_START_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, START_EVENT, GET_AUDIOTIME_EVENT, GET_AUDIOTIME_EVENT, RELEASE_EVENT,
          END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_READ_WRITE_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise.start();
        console.log(`${Tag} start ok`);
        let audioTime: ESObject = await audioCapPromise.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
        expect(audioTime).assertLarger(0);

        let bufferSize: ESObject = await audioCapPromise.getBufferSize();
        console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
        let fd = fileio.openSync(dirPath, 0o102, 0o777);
        console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
          expect(false).assertTrue();
          done();
          return;
        }
        fd = fileio.openSync(dirPath, 0o2002, 0o666);
        console.log(`${Tag} fd1: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
          done();
          return;
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          let buffer: ESObject = await audioCapPromise.read(bufferSize, true);
          let audioTime1: ESObject = await audioCapPromise.getAudioTime();
          console.log(`${Tag} audioTime1: ${JSON.stringify(audioTime1)}`);
          expect(audioTime1).assertLarger(0);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
          numBuffersToCapture--;
        }

        let audioTime2: ESObject = await audioCapPromise.getAudioTime();
        console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
        expect(audioTime2).assertLarger(0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_GET_AUDIO_TIME_AFTER_STOP_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise.start();
        console.log(`${Tag} start ok`);
        let audioTime: ESObject = await audioCapPromise.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`);
        expect(audioTime).assertLarger(0);

        let bufferSize: ESObject = await audioCapPromise.getBufferSize();
        console.log(`${Tag} AudioFrameworkRecLog: buffer size:  ${JSON.stringify(bufferSize)}`);
        let fd = fileio.openSync(dirPath, 0o102, 0o777);
        console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd created`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: Capturer start :ERROR :`);
          expect(false).assertTrue();
          done();
          return;
        }
        fd = fileio.openSync(dirPath, 0o2002, 0o666);
        console.log(`${Tag} fd1: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.log(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
        } else {
          console.log(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
          done();
          return;
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          let buffer: ESObject = await audioCapPromise.read(bufferSize, true);
          let audioTime1: ESObject = await audioCapPromise.getAudioTime();
          console.log(`${Tag} audioTime1: ${JSON.stringify(audioTime1)}`);
          expect(audioTime1).assertLarger(0);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
          numBuffersToCapture--;
        }
      } catch (err) {
        console.log(`${Tag} start-getAudioTime-getBufferSize-read-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.stop();
        let audioTime2: ESObject = await audioCapPromise.getAudioTime();
        console.log(`${Tag} audioTime2: ${JSON.stringify(audioTime2)}`);
        expect(audioTime2).assertLarger(0);
      } catch (err) {
        console.log(`${Tag} stop-getAudioTimein- err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }

      try {
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCapPromise.start();
        let audioTime: ESObject = await audioCapPromise.getAudioTime();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`)
        expect(audioTime).assertLarger(0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTime err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_SYNC_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME_SYNC
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME_SYNC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_GET_AUDIO_TIME_SYNC_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCapPromise.start();
        let audioTime: ESObject = audioCapPromise.getAudioTimeSync();
        console.log(`${Tag} audioTime: ${JSON.stringify(audioTime)}`)
        expect(audioTime).assertLarger(0);
      } catch (err) {
        console.log(`${Tag} start-getAudioTimeSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer createAudioCapturer->stop->release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_STOP_BEFORE_START_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        console.log(`${Tag} createAudioCapturer ok`);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise.start();
        console.log(`${Tag} start ok`);
      } catch (err) {
        console.log(`${Tag} start err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.stop();
        console.log(`${Tag} stop ok`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${Tag} stop err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_0100
     * @tc.name      : AudioCapturer-GET_AUDIO_TIME
     * @tc.desc      : AudioCapturer GET_AUDIO_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_PROMISE_RELEASE_BEFORE_START_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCapPromise.release();
        expect(audioCapPromise.state).assertEqual(audio.AudioState.STATE_RELEASED);
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} re-release err: ${JSON.stringify(err)}`);
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_SYNC_0100
     * @tc.name      : getStreamInfoSync
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_SYNC_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = audioCap.getStreamInfoSync();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfoSync:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfoSync err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = await audioCap.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_STREAM_INFO_ENUM_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = await audioCap.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        console.log(`${Tag} audioCap.state: ${JSON.stringify(audioCap.state)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_0200
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_CB_VOICE_CHAT_GET_STREAM_INFO_0200', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = await audioCap.getStreamInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      audioCap.release((err: BusinessError) => {
        if (err) {
          console.log(`${Tag} release err: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done();
          return;
        }
        expect(audioCap.state).assertEqual(audio.AudioState.STATE_RELEASED);
        done();
      })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_0300
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_0300', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = await audioCap.getCapturerInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_0300
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO_ENUM_0300', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = await audioCap.getCapturerInfo();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO__SYNC_0400
     * @tc.name      : getCapturerInfoSync
     * @tc.desc      : getCapturerInfoSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_PR_VOICE_CHAT_GET_CAPTURER_INFO__SYNC_0400', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      let audioCap: ESObject;
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log(`${Tag} createAudioCapturer err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let audioParamsGet: ESObject = audioCap.getCapturerInfoSync();
        console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${Tag} getStreamInfo err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }

      try {
        await audioCap.release();
      } catch (err) {
        console.log(`${Tag} release err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_STREAM_INFO_INVALID_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_STREAM_INFO_INVALID_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: 0,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: 0,
        capturerFlags: 0
      }
      let AudioCapturerOptionsInvalid: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }
      await audio.createAudioCapturer(AudioCapturerOptionsInvalid).then((data) => {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success: ${JSON.stringify(data)}`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_CAPTURER_INFO_INVALID_0100
     * @tc.name      : AudioRec-Set1
     * @tc.desc      : record audio with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_REC_VOICE_CHAT_PR_ENUM_AUDIO_CAPTURER_INFO_INVALID_0100', 2, async (done: Function) => {
      let audioStreamInfo44100: audio.AudioStreamInfo = {
        samplingRate: 44100,
        channels: 1,
        sampleFormat: 1,
        encodingType: 0,
      };
      let audioCapturerInfo44100: audio.AudioCapturerInfo = {
        source: 1000,
        capturerFlags: 0
      }
      let AudioCapturerOptionsInvalid: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo44100,
        capturerInfo: audioCapturerInfo44100,
      }

      await audio.createAudioCapturer(AudioCapturerOptionsInvalid).then((data) => {
        if (data == undefined) {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Unsuccess : ${JSON.stringify(data)}`);
          expect(true).assertTrue();
        } else {
          console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
        }

      }).catch((err: BusinessError) => {
        console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0100
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0100', 2, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0200
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0200', 2, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject = [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0300
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0300', 2, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0400
     * @tc.name      : AudioCapturer-Check-STATE-STOPPED
     * @tc.desc      : AudioCapturer with state stopped
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_ON_0400', 2, (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, STATE_CHANGE_EVENT, START_EVENT, STOP_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0100
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 5000;
      markReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0200
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0200', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 1000;
      markReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0300
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0300', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 10000;
      markReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0400
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0400', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 100;
      markReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0500
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0500', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 1;
      markReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0600
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0600', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 0;
      markReachState = 'fail';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0700
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0700', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = 1234567890;
      markReachState = 'invalid_failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0800
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_MARK_REACH_0800', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let markReachParam = -2;
      markReachState = 'fail';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, MARK_REACH_EVENT, markReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_MARK_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0100
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0100', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let periodReachParam = 1000;
      periodReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0200
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0200', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let periodReachParam = 1;
      periodReachState = 'failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0300
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0300', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let periodReachParam = -2;
      periodReachState = 'fail';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0400
     * @tc.name      : AudioCapturer-Check-READ_BUFFER
     * @tc.desc      : AudioCapturer with read buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOIP_CAP_CB_READ_BUFFER_PERIOD_REACH_0400', 2, async (done: Function) => {
      await getFd("capture_CB_js-44100-2C-S16LE-checkcbreadbuffer.pcm");
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap = null;
      let periodReachParam = 223750;
      periodReachState = 'invalid_failure';
      let mySteps: ESObject =
        [CREATE_EVENT, AudioCapturerOptions, PERIODR_REACH_EVENT, periodReachParam, START_EVENT, GET_BUFFERSIZE_EVENT,
          READ_EVENT, OFF_PERIODR_REACH_EVENT, RELEASE_EVENT, END_EVENT];
      let eventData: emitter.EventData = {
        data: {
          audioCap: audioCap,
          mySteps: mySteps,
        }
      }
      emitter.emit(mySteps[0], eventData);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0100
     * @tc.name      : AudioCapturer - getAudioStreamId
     * @tc.desc      : AudioCapturer - getAudioStreamId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject;
      try {
        audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        audioCapPromise.getAudioStreamId((err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${Tag}: getAudioStreamId : ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
            console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
          }
          audioCapPromise.release();
        });
      } catch (err) {
        console.log(`${Tag} err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0200
     * @tc.name      : AudioCapturer - getAudioStreamId
     * @tc.desc      : AudioCapturer - getAudioStreamId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        let audioCapPromise: ESObject = await audio.createAudioCapturer(AudioCapturerOptions);
        audioCapPromise.getAudioStreamId().then((data: ESObject) => {
          expect(true).assertTrue();
          audioCapPromise.release();
          console.info(`${Tag}: getAudioStreamId : Converted: ${data}`);
        }).catch((err: BusinessError) => {
          expect(true).assertTrue();
          audioCapPromise.release();
          console.error(`${Tag}: getAudioStreamId : ERROR : ${err}`);
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_SYNC_0300
     * @tc.name      : AudioCapturer - getAudioStreamIdSync
     * @tc.desc      : AudioCapturer - getAudioStreamIdSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_STREAM_ID_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapPromise: ESObject = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCapPromise = data;
          console.info('AudioCapturer Created : Success : Stream Type: SUCCESS');
          let StreamIdSync: ESObject = audioCapPromise.getAudioStreamIdSync();
          console.info(`${Tag}: getAudioStreamId : Converted: ${StreamIdSync}`);
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`AudioCapturer Created : ERROR : ${err}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      await audioCapPromise.release();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_0100
     * @tc.name      : AudioCapturer - getOverflowCount
     * @tc.desc      : AudioCapturer - getOverflowCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GET_AUDIO_OVERFLOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        let audioCapPromise = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCapPromise.getOverflowCount().then((data) => {
          expect(data).assertLargerOrEqual(0);
          console.info(`${Tag}: getOverflowCount : Converted: ${data}`);
        }).catch((err: BusinessError) => {
          expect(true).assertTrue();
          console.error(`${Tag}: getOverflowCount : ERROR : ${err}`);
        });

        await audioCapPromise.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })
        /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100
     * @tc.name      : test[AudioCapturer function with voice message sourcetype]
     * @tc.desc      : AudioCapturer with parameter set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioPrivacyType: ESObject = {
        privacyType: audio.AudioPrivacyType.PRIVACY_TYPE_PUBLIC
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
        privacyType: AudioPrivacyType
      }
      await getFd("capture_js-44100-2C-16B_voice_message.pcm");
      await recPromise(AudioCapturerOptions, AudioRendererOptions, done);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0100
     * @tc.name      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0100
     * @tc.desc      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0100
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0100";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);
        
        await sleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0200
     * @tc.name      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0200
     * @tc.desc      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0200
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0200";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);
        
        await sleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0300
     * @tc.name      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0300
     * @tc.desc      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0300
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0300', Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0300";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);
        
        await sleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0400
     * @tc.name      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0400
     * @tc.desc      : CAPTURER_RENDERER_FORMAT_F32LE_Test_0400
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0400', Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      }
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      }

      let audioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }

      let caseTag: string = "SUB_MULTIMEDIA_AUDIO_CAPTURER_RENDERER_FORMAT_F32_0400";
      try {
        let fileName = "capture_js-48000-F32LE.pcm";
        await recCapturerPromise4(audioCapturerOptions, fileName, done);
        console.log(`${caseTag} audio recording success`);
        
        await sleep(200);

        await resRendererPromise5(AudioRendererOptions, fileName);
        console.log(`${caseTag} audio playback success`);
        expect(true).assertTrue();
      } catch (err) {
        console.log(`${caseTag} fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
      } finally {
        done();
      }
    })
         /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_0100
     * @tc.name      : AudioCapturer ON MARKREACH
     * @tc.desc      : AudioCapturer ON MARKREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      let flag : boolean =false;
      try {
        let para1: ESObject = 0;
        audioCapturer.on('markReach', para1, cb1);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_0200
     * @tc.name      : AudioCapturer ON MARKREACH
     * @tc.desc      : AudioCapturer ON MARKREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_MARKREACH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      let flag : boolean =false;
      try {
        let para1: ESObject = '1';
        audioCapturer.on('markReach', para1, cb1);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_MARKREACH_0100
     * @tc.name      : AudioCapturer OFF MARKREACH
     * @tc.desc      : AudioCapturer OFF MARKREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_MARKREACH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('periodReach', 1000, cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = 1;
        let para2: ESObject = () => {return 1;};
        audioCapturer.off(para1, para2);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_MARKREACH_0200
     * @tc.name      : AudioCapturer OFF MARKREACH
     * @tc.desc      : AudioCapturer OFF MARKREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_MARKREACH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('periodReach', 1000, cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = '1';
        let para2: ESObject = () => {return 1;};
        audioCapturer.off(para1, para2);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_0100
     * @tc.name      : AudioCapturer ON PERIODREACH
     * @tc.desc      : AudioCapturer ON PERIODREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      let flag : boolean =false;
      try {
        let para1: ESObject = 0;
        audioCapturer.on('periodReach', para1, cb1);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_0200
     * @tc.name      : AudioCapturer ON PERIODREACH
     * @tc.desc      : AudioCapturer ON PERIODREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_ON_PERIODREACH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      let flag : boolean =false;
      try {
        let para1: ESObject = '1';
        audioCapturer.on('periodReach', para1, cb1);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_PERIODREACH_0100
     * @tc.name      : AudioCapturer OFF PERIODREACH
     * @tc.desc      : AudioCapturer OFF PERIODREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_PERIODREACH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('periodReach', 1000, cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = 1;
        let para2: ESObject = () => {return 1;};
        audioCapturer.off(para1, para2);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_PERIODREACH_0200
     * @tc.name      : AudioCapturer OFF PERIODREACH
     * @tc.desc      : AudioCapturer OFF PERIODREACH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_PERIODREACH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<number> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('periodReach', 1000, cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = '1';
        let para2: ESObject = () => {return 1;};
        audioCapturer.off(para1, para2);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_STATECHANGE_0100
     * @tc.name      : AudioCapturer OFF STATECHANGE
     * @tc.desc      : AudioCapturer OFF STATECHANGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_STATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<audio.AudioState> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('stateChange', cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = '1';
        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio renderer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio renderer state is: STATE_RUNNING');
          }
        };
        audioCapturer.off(para1, stateChangeCallback);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURE_OFF_STATECHANGE_0200
     * @tc.name      : AudioCapturer OFF STATECHANGE
     * @tc.desc      : AudioCapturer OFF STATECHANGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURE_OFF_STATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(AudioCapturerOptions);
      let cb1: Callback<audio.AudioState> =() =>{
        console.info('Current callback is cb1');
      }
      audioCapturer.on('stateChange', cb1);
      let flag : boolean =false;
      try {
        let para1: ESObject = 1;
        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio renderer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio renderer state is: STATE_RUNNING');
          }
        };
        audioCapturer.off(para1, stateChangeCallback);
      }catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_ON_AUDIOINTERRUPT_0100
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_AUDIO_AUDIOCAPTURER_ON_AUDIOINTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
        channels: audio.AudioChannel.CHANNEL_2, // 通道。
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
        capturerFlags: 0 // 音频采集器标志。
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };
      let flag : boolean =false;
      audio.createAudioCapturer(audioCapturerOptions, (err, data) => {
        if (err) {
          console.error(`AudioCapturer Created : Error: ${err}`);
        } else {
          console.info('AudioCapturer Created : Success : SUCCESS');
          let audioCapturer = data;
          try {
            let para1: ESObject = '1';
            let para2: ESObject = () => {return 1;};
            audioCapturer.on('audioInterrupt', para1);
            done();
          }catch (err) {
            console.log(`err : ${err.message},Code:${err.code}`);
            expect(Number(err.code)).assertEqual(401);
            flag = true;
          }
          expect(flag).assertTrue();
          done();
        }
        done();
      });
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_OFF_AUDIOINTERRUPT_0100
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_AUDIOCAPTURER_OFF_AUDIOINTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
        channels: audio.AudioChannel.CHANNEL_2, // 通道。
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
        capturerFlags: 0 // 音频采集器标志。
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };
      let flag : boolean =false;
      audio.createAudioCapturer(audioCapturerOptions, (err, data) => {
        if (err) {
          console.error(`AudioCapturer Created : Error: ${err}`);
        } else {
          console.info('AudioCapturer Created : Success : SUCCESS');
          let audioCapturer = data;
          let cb1: Callback<audio.InterruptEvent> =() =>{
            console.info('Current callback is cb1');
          }
          audioCapturer.on('audioInterrupt', cb1);
          let flag : boolean =false;
          try {
            let para1: ESObject = '1';
            let para2: ESObject = () => {return 1;};
            audioCapturer.off(para1, para2);
            done();
          }catch (err) {
            console.log(`err : ${err.message},Code:${err.code}`);
            expect(Number(err.code)).assertEqual(6800101);
            flag = true;
          }
          expect(flag).assertTrue();
          done();
        }
        done();
      });
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_OFF_AUDIOINTERRUPT_0200
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_AUDIO_AUDIOCAPTURER_OFF_AUDIOINTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
        channels: audio.AudioChannel.CHANNEL_2, // 通道。
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
        capturerFlags: 0 // 音频采集器标志。
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };
      let flag : boolean =false;
      audio.createAudioCapturer(audioCapturerOptions, (err, data) => {
        if (err) {
          console.error(`AudioCapturer Created : Error: ${err}`);
        } else {
          console.info('AudioCapturer Created : Success : SUCCESS');
          let audioCapturer = data;
          let cb1: Callback<audio.InterruptEvent> =() =>{
            console.info('Current callback is cb1');
          }
          audioCapturer.on('audioInterrupt', cb1);
          let flag : boolean =false;
          try {
            let para1: ESObject = '1';
            let para2: ESObject = () => {return 1;};
            audioCapturer.off(para1, para2);
            done();
          }catch (err) {
            console.log(`err : ${err.message},Code:${err.code}`);
            expect(Number(err.code)).assertEqual(6800101);
            flag = true;
          }
          expect(flag).assertTrue();
          done();
        }
        done();
      });
    })
    /**
     * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_ON_INPUTDEVICECHANGE_0100
     * @tc.name      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.desc      : OnVolumeChange - getVolumeManager - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_AUDIO_AUDIOCAPTURER_ON_INPUTDEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
        channels: audio.AudioChannel.CHANNEL_2, // 通道。
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
        capturerFlags: 0 // 音频采集器标志。
      };

      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };
      let flag : boolean =false;
      audio.createAudioCapturer(audioCapturerOptions, (err, data) => {
        if (err) {
          console.error(`AudioCapturer Created : Error: ${err}`);
        } else {
          console.info('AudioCapturer Created : Success : SUCCESS');
          let audioCapturer = data;
          try {
            let para1: ESObject = '1';
            audioCapturer.on('inputDeviceChange', para1);
            done();
          }catch (err) {
            console.log(`err : ${err.message},Code:${err.code}`);
            expect(Number(err.code)).assertEqual(401);
            flag = true;
          }
          expect(flag).assertTrue();
          done();
        }
        done();
      });
    })
  })
}