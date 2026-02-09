/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import eventEmitter from '@ohos.events.emitter';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import Common from './Common';

export default function avRecorderTest() {
  describe('avRecorderTest', () => {
    let avRecorder: media.AVRecorder;
    const RECORDER_TIME = 3000;
    const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
    const FORMAT_MP3 = media.ContainerFormatType.CFT_MP3;
    const FORMAT_WAV = media.ContainerFormatType.CFT_WAV;
    const FORMAT_AMR = media.ContainerFormatType.CFT_AMR;
    const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
    const ENCORDER_MP3 = media.CodecMimeType.AUDIO_MP3;
    const ENCORDER_WAV = media.CodecMimeType.AUDIO_G711MU;
    const ENCODER_AMR_NB = media.CodecMimeType.AUDIO_AMR_NB;
    const ENCODER_AMR_WB = media.CodecMimeType.AUDIO_AMR_WB;
    let fdObject: ESObject;
    let fdPath: string;
    let commonFun = new Common();

    const SETONCALLBACK_EVENT = 'setAvRecorderCallback'
    const CREATE_EVENT = 'create';
    const PREPARE_EVENT = 'prepare';
    const STARTRECORDER_EVENT = 'start';
    const STOPRECORDER_EVENT = 'stop';
    const PAUSERECORDER_EVENT = 'pause';
    const RESUMERECORDER_EVENT = 'resume';
    const RELEASECORDER_EVENT = 'release';
    const RELEASECORDER_TIMETEST_EVENT = 'release_time_test';
    const START_TIMETEST_EVENT = 'start_time_test';
    const END_TIMETEST_EVENT = 'end_time_test';
    const END_EVENT = 'end';
    const FAIL_EVENT = 'fail';

    let TAG = "[AvRecorderLocalTest] ";
    let avProfile: media.AVRecorderProfile = {
      audioBitrate: 48000,
      audioChannels: 2,
      audioSampleRate: 48000,
      audioCodec: ENCORDER_AAC,
      fileFormat: FORMAT_M4A,
    }
    let avConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: avProfile,
      url: 'fd://',
      rotation: 0,
      location: {
        latitude: 30, longitude: 130
      }
    }

    let avProfile2: media.AVRecorderProfile = {
      audioBitrate: -1,
      audioChannels: 2,
      audioSampleRate: 48000,
      audioCodec: ENCORDER_AAC,
      fileFormat: FORMAT_M4A,
    }
    let avConfig2: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: avProfile2,
      url: 'fd://',
      rotation: 0,
      location: {
        latitude: 30, longitude: 130
      }
    }

    let aacAvProfile: media.AVRecorderProfile = {
      audioBitrate: 64000, // set audioBitrate according to device ability
      audioChannels: 1, // set audioChannels, valid value 1-8
      audioCodec: media.CodecMimeType.AUDIO_AAC, // set audioCodec, AUDIO_AAC is the only choice
      aacProfile: media.AacProfile.AAC_LC,
      audioSampleRate: 8000, // set audioSampleRate according to device ability
      fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // set fileFormat, for video is m4a
    }
    let aacAudioConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: aacAvProfile,
      url: 'fd://'
    }

    let execTimes: Array<number>;

    beforeAll(async () => {
      console.info('beforeAll in1');
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA','ohos.permission.CAMERA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(2000);
      await commonFun.driveFn(3)
      console.info('beforeAll out');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await commonFun.sleep(3000);
      fdObject = null;
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (avRecorder != null) {
        avRecorder.release().then(() => {
          console.info(TAG + 'this testCase execution completed')
        }, commonFun.failureCallback).catch(commonFun.catchCallback);
      }
      commonFun.closeFd(fdObject?.fdNumber);
      await commonFun.sleep(1000);
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('avRecorderTest=== afterAll case');
      offFmitterEvent();
      console.info('avRecorderTest=== afterAll off all eventEmitter 111111');
    })

    //用例跑完取消消息订阅
    let offFmitterEvent = ()=>{
      eventEmitter.off(SETONCALLBACK_EVENT);
      eventEmitter.off(CREATE_EVENT);
      eventEmitter.off(PREPARE_EVENT);
      eventEmitter.off(STARTRECORDER_EVENT);
      eventEmitter.off(STOPRECORDER_EVENT);
      eventEmitter.off(PAUSERECORDER_EVENT);
      eventEmitter.off(RESUMERECORDER_EVENT);
      eventEmitter.off(RELEASECORDER_EVENT);
      eventEmitter.off(RELEASECORDER_TIMETEST_EVENT);
      eventEmitter.off(START_TIMETEST_EVENT);
      eventEmitter.off(END_TIMETEST_EVENT);
      eventEmitter.off(END_EVENT);
      eventEmitter.off(FAIL_EVENT);
      console.info('avRecorderTest=== afterAll off all eventEmitter 000000');
    }

    let toNextStep =
      (avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, recorderTime: number, steps: Array<string>,
        done: Function) => {
        console.info('toNextStep 00 steps = ', steps);
        try{
          if (steps[0] == END_EVENT) {
            console.info('toNextStep case success!!');
            done();
          } else if (steps[0] == FAIL_EVENT) {
            console.error('toNextStep case failed!!');
            done();
          } else {
            console.info('toNextStep 11');
            commonFun.sleep(1000)
            console.info('next step: ' + steps[0])
            eventEmitterFun(avRecorder, avConfig, recorderTime, steps, done);
          }
        } catch (error) {
          console.info('toNextStep error is: ' + error)
        }
      }

    let setAVRecorderCallback = (avRecorder: media.AVRecorder, done: Function) => {
      // 状态机变化回调函数
      avRecorder.on('stateChange', (state, reason) => {
        console.info(TAG + 'current state is: ' + state);
      })
      // 录制监听回调函数
      avRecorder.on('audioCapturerChange', (AudioCapturerChangeInfo) => {
        console.info(TAG + 'audioCapturerChange');
      });
      // 错误上报回调函数
      avRecorder.on('error', async (err) => {
        try {
          console.error(TAG + 'error ocConstantSourceNode, error message is ' + err);
          // await releaseRecorderPromise(avRecorder, done);
        } catch (error) {
          // 处理错误
          console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
        }
      });
    }

    let eventEmitterFun =
      (avRecorder: media.AVRecorder | null, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: Function) => {
        let eventData: eventEmitter.EventData = {
          data: {
            avRecorder,
            avConfig,
            recorderTime,
            steps,
          }
        }
        console.log('eventEmitterFun eventData ', JSON.stringify(eventData))
        eventEmitter.emit(steps[0], eventData);
      }

    eventEmitter.on(SETONCALLBACK_EVENT, (eventData) => {
      console.log('SETONCALLBACK_EVENT 11 eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      try {
        setAVRecorderCallback(data?.avRecorder, data?.done)
        toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
      } catch (error) {
        console.info('setAVRecorderCallback failed and catch error is ' + error.message);
      }
    });

    eventEmitter.on(CREATE_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      media.createAVRecorder((error, recorder) => {
        console.info('CREATE_EVENT case createAVRecorder called');
        if (recorder != null) {
          let avRecorder = recorder;
          expect(avRecorder.state).assertEqual('idle');
          console.info('CREATE_EVENT createAVRecorder idleCallback success');
          toNextStep(avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info(`CREATE_EVENT createAVRecorder idleCallback fail, error:${error}`);
        }
      });
    });

    eventEmitter.on(PREPARE_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      try {
        let data = eventData.data;
        data?.steps.shift();
        data?.avRecorder.prepare(data?.avConfig, (err: BusinessError) => {
          console.info('case prepare called');
          if (err == null) {
            console.error(`case prepare success, state is ${data?.avRecorder.state}`);
            expect(data?.avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PREPARED);
            console.info('prepare success');
            toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
          } else {
            console.error(`case prepare error, errMessage is ${err.message}`);
          }
        })
      } catch (err) {
        console.info(`PREPARE_EVENT fail, error:${err}`);
      }
    });

    eventEmitter.on(STARTRECORDER_EVENT, (eventData) => {
      console.log('STARTRECORDER_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      data?.avRecorder.start((err:BusinessError) => {
        console.info('case start called');
        if (err == null) {
          expect(data?.avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STARTED);
          console.info('start AVRecorder success');
          if (data?.recorderTime != undefined) {
            commonFun.sleep(data?.recorderTime);
            toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
          }
        } else {
          console.error('start AVRecorder failed and error is ' + err.message);

          let failedSteps = new Array(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        }
      })
    });

    eventEmitter.on(STOPRECORDER_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      data?.avRecorder.stop((err:BusinessError) => {
        console.info('case stop called');
        if (err == null) {
          expect(data?.avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STOPPED);
          console.info('stop AVRecorder success');
          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info('stop AVRecorder failed and error is ' + err.message);

          let failedSteps = new Array(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        }
      })
    });

    eventEmitter.on(PAUSERECORDER_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      data?.avRecorder.pause((err: BusinessError) => {
        console.info('case pause called');
        if (err == null) {
          expect(data?.avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PAUSED);
          console.info('pause AVRecorder success');
          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info('pause AVRecorder failed and error is ' + err.message);

          let failedSteps = new Array(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        }
      })
    });

    eventEmitter.on(RESUMERECORDER_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      data?.avRecorder.resume((err: BusinessError) => {
        console.info('case resume called');
        if (err == null) {
          console.info('resume AVRecorder success');
          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info('resume AVRecorder failed and error is ' + err.message);
          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);

          let failedSteps = new Array(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        }
      })
    });

    eventEmitter.on(RELEASECORDER_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      data?.avRecorder.release((err: BusinessError) => {
        console.info('case release called');
        if (err == null) {
          expect(data?.avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
          console.info('release AVRecorder success');
          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info('release AVRecorder failed and error is ' + err.message);
        }
      })
    });

    eventEmitter.on(START_TIMETEST_EVENT, (eventData) => {
      console.log('START_TIMETEST_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      execTimes = new Array();
      toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
    });

    eventEmitter.on(END_TIMETEST_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      let length = execTimes.length;
      let sum = execTimes.reduce((prev, curr) => {
        return prev + curr;
      }, 0);
      let avg = sum / length;
      console.info("releaseTimeTestCallback avg time  is :" + avg)
      toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
    });

    eventEmitter.on(RELEASECORDER_TIMETEST_EVENT, (eventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data;
      data?.steps.shift();
      let end: number;
      let start: number = Date.now();
      console.info(`releaseTimeTestCallback start time is : ${start}`)
      data?.avRecorder.release((err: BusinessError) => {
        if (err == null) {
          console.info(`releaseTimeTestCallback current state is : ${data?.avRecorder.state}`)
          console.info('release releaseTimeTestCallback success');
          end = Date.now()
          console.info(`releaseTimeTestCallback end time is : ${end}`)
          let numStr: string = (end - start) +'';
          let execution = parseInt(numStr)
          console.info("releaseTimeTestCallback execution time  is :" + execution)

          execTimes.push(execution)

          toNextStep(data?.avRecorder, data?.avConfig, data?.recorderTime, data?.steps, data?.done);
        } else {
          console.info('resume releaseTimeTestCallback failed and error is ' + err.message);
        }
      });
    });



    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100
     * @tc.desc   Recorder audio 001.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderWithCallBack(avConfig, avRecorder, RECORDER_TIME, done);
      done();
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200
     * @tc.desc   Recorder audio pause->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack2(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0200 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300
     * @tc.desc   Local Video recording 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0300 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400
     * @tc.desc   Local Video pause->resume->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack4(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0400 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500
     * @tc.desc   Local Video pause->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack5(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600
     * @tc.desc   Local Video pause->resume->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack6(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0600 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700
     * @tc.desc   Local Video stop->reset->pause->resume->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack7(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0700 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800
     * @tc.desc   Local Video stop->reset->pause->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack8(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0800 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900
     * @tc.desc   Local Video start->pause->start(error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack9(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0900 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000
     * @tc.desc   Local Video start->stop->pause(error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack10(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1000 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100
     * @tc.desc   Local Video audioEncoderMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      commonFun.avRecorderWithCallBack11(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_1100 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: -30, longitude: 60
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 90, longitude: 180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 60, longitude: -90
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 0, longitude: 0
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: 0, longitude: 180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
        rotation: 0,
        location: {
          latitude: -90, longitude: -180
        }
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100
     * @tc.desc   Recorder pause->prepare 1000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest01(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101
     * @tc.desc   Recorder audio 001.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest001(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest02(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400
     * @tc.desc   Recorder audio resume->prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest04(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest05(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600
     * @tc.desc   Recorder audio pause->start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest06(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700
     * @tc.desc   Recorder audio resume->start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest07(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800
     * @tc.desc   Recorder audio creatAVRecorder->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800', Level.LEVEL0, async (done: Function) => {
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest08(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900
     * @tc.desc   Recorder audio prepare->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest09(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000
     * @tc.desc   Recorder audio start->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest10(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100
     * @tc.desc   Recorder audio resume->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest11(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200
     * @tc.desc   Recorder audio stop->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest12(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300
     * @tc.desc   Recorder audio reset->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest13(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400
     * @tc.desc   Recorder audio all step->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest14(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500
     * @tc.desc   Recorder audio pause three times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest15(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600
     * @tc.desc   Recorder audio creatAVRecorder->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest16(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700
     * @tc.desc   Recorder audio prepare->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest17(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800
     * @tc.desc   Recorder audio start->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest18(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900
     * @tc.desc   Recorder audio pause->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest19(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000
     * @tc.desc   Recorder audio stop->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest20(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100
     * @tc.desc   Recorder audio reset->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest21(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200
     * @tc.desc   Recorder audio all->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest22(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300
     * @tc.desc   Recorder audio resume threee times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest23(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400
     * @tc.desc   Recorder audio pause->stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest24(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500
     * @tc.desc   Recorder audio resume->stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest25(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600
     * @tc.desc   Recorder audio pause->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest26(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700
     * @tc.desc   Recorder audio resume->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest27(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800
     * @tc.desc   Recorder audio pause->release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest28(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900
     * @tc.desc   Recorder audio resume->release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest29(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000
     * @tc.desc   Recorder audio release 3 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest30(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100
     * @tc.desc   Recorder audio create->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest31(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200
     * @tc.desc   Recorder audio  prepare->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest32(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300
     * @tc.desc   Recorder audio  start->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest33(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400
     * @tc.desc   Recorder audio pause->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest34(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500
     * @tc.desc   Recorder audio resume->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest35(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600
     * @tc.desc   Recorder audio stop->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700
     * @tc.desc   Recorder audio reset->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest37(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800
     * @tc.desc   Recorder audio getInputSurface 3 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest38(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100
     * @tc.desc   Recorder audio createAVRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.createTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200
     * @tc.desc   Recorder audio AvRecorder.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.prepareTimeCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300
     * @tc.desc   AvRecorder.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.getInputSurfaceTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400
     * @tc.desc   AvRecorder.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.startTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500
     * @tc.desc   AvRecorder.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.pauseTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600
     * @tc.desc   AvRecorder.resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resumeTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700
     * @tc.desc   AvRecorder.stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.stopTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800
     * @tc.desc   AvRecorder.reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resetTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900
     * @tc.desc   AvRecorder.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;

      let mySteps = new Array(START_TIMETEST_EVENT);

      for (let i = 0; i < 10; i++) {
        mySteps.push(
          // create
          CREATE_EVENT,
          // prepare
          PREPARE_EVENT,
          // start recorder
          STARTRECORDER_EVENT,
          // release time test
          RELEASECORDER_TIMETEST_EVENT,
        )
      }

      mySteps.push(
        END_TIMETEST_EVENT,
        END_EVENT
      );

      eventEmitterFun(avRecorder, avConfig, 3000, mySteps, done);

      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100
     * @tc.desc   AvRecorder.createAVRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.createTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0100 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200
     * @tc.desc   AvRecorder.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.prepareTimePromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0200 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300
     * @tc.desc   AvRecorder.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.getInputSurfaceTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0300 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400
     * @tc.desc   AvRecorder.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.startTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0400 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500
     * @tc.desc   AvRecorder.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.pauseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0500 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600
     * @tc.desc   AvRecorder.resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resumeTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0600 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700
     * @tc.desc   AvRecorder.stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.stopTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800
     * @tc.desc   AvRecorder.reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.resetTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0800 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900
     * @tc.desc   AvRecorder.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.releaseTimeTestPromise(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_0900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001
     * @tc.desc   Recorder audio create->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest39(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_001 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002
     * @tc.desc   Recorder audio  prepare->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest40(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_002 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003
     * @tc.desc   Recorder audio  start->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest41(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_003 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004
     * @tc.desc   Recorder audio pause->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest42(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_004 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005
     * @tc.desc   Recorder audio resume->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest43(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_005 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006
     * @tc.desc   Recorder audio stop->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_006 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007
     * @tc.desc   Recorder audio reset->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest45(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_007 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001
     * @tc.desc   Recorder audio reset->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;

      let mySteps = new Array(
        // create
        CREATE_EVENT,
        // prepare
        PREPARE_EVENT,
        // start recorder
        STARTRECORDER_EVENT,
        // pause recorder
        PAUSERECORDER_EVENT,
        // resume recorder
        RESUMERECORDER_EVENT,
        // stop recorder
        STOPRECORDER_EVENT,
        // release recorder
        RELEASECORDER_EVENT,
        // end
        END_EVENT
      );

      eventEmitterFun( avRecorder, avConfig, 3000, mySteps, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100
     * @tc.desc   Local Video recording mp3 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.mp3`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      avConfig.profile.fileFormat = FORMAT_MP3;
      avConfig.profile.audioCodec = ENCORDER_MP3;
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_0100 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100
     * @tc.desc   Local Video recording WAV 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.wav`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      avConfig.profile.fileFormat = FORMAT_WAV;
      avConfig.profile.audioCodec = ENCORDER_WAV;
      avConfig.profile.audioBitrate = 64000;
      avConfig.profile.audioChannels = 1;
      avConfig.profile.audioSampleRate = 8000;
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_0100 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0100
     * @tc.desc   Local Video recording AMR 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0100 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.wav`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      avConfig.profile.fileFormat = FORMAT_AMR;
      avConfig.profile.audioCodec = ENCODER_AMR_NB;
      avConfig.profile.audioBitrate = 4750;
      avConfig.profile.audioChannels = 1;
      avConfig.profile.audioSampleRate = 8000;
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0100 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0200
     * @tc.desc   Local Video recording AMR 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0200 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.wav`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      avConfig.url = fdPath;
      console.info('avConfig.url ' + avConfig.url);
      avConfig.profile.fileFormat = FORMAT_AMR;
      avConfig.profile.audioCodec = ENCODER_AMR_WB;
      avConfig.profile.audioBitrate = 6600;
      avConfig.profile.audioChannels = 1;
      avConfig.profile.audioSampleRate = 16000;
      commonFun.avRecorderWithCallBack3(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_AMR_0200 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0460
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0460
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0460', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0460 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest46(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0460 end')
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_008
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_008
     * @tc.desc   Recorder audio create->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_008', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_008 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest47(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_008 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0100
     * @tc.desc   Recorder audio setmetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest01(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0100 end')
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0200
     * @tc.desc   Recorder audio setmetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0200', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest02(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0200 end')
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0300
     * @tc.desc   Recorder audio setmetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0300', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderSetMetadataTest03(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_SETMETADATA_0300 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001
     * @tc.desc   Local Video recording mp3 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.mp3`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      aacAudioConfig.url = fdPath;
      console.info('avConfig.profile ' + JSON.stringify(avConfig.profile));
      try{
        commonFun.avRecorderWithCallBack3(aacAudioConfig, avRecorder, RECORDER_TIME, done);
      } catch (error) {
        console.error(`test aacProfile erro, error message: ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0001 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0002
     * @tc.desc   Local Video recording mp3 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0002', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0002 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.mp3`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      aacAudioConfig.url = fdPath;
      aacAudioConfig.profile.aacProfile = media.AacProfile.AAC_HE;
      console.info('avConfig.profile ' + JSON.stringify(avConfig.profile));
      try{
        commonFun.avRecorderWithCallBack3(aacAudioConfig, avRecorder, RECORDER_TIME, done);
      } catch (error) {
        console.error(`test aacProfile erro, error message: ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0002 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0003
     * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0003
     * @tc.desc   Local Video recording mp3 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0003', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0003 start')
      let timestamp = Date.now();
      let filename = `avRecorder_${timestamp}.mp3`;
      fdObject = await commonFun.getFd(filename);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      aacAudioConfig.url = fdPath;
      aacAudioConfig.profile.aacProfile = media.AacProfile.AAC_HE_V2;
      console.info('avConfig.profile ' + JSON.stringify(avConfig.profile));
      try{
        commonFun.avRecorderWithCallBack3(aacAudioConfig, avRecorder, RECORDER_TIME, done);
      } catch (error) {
        console.error(`test aacProfile erro, error message: ${error.message}`);
        expect().assertFail();
      }
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AUDIO_AACPROFILE_SET_API_0003 end');
      done();
    })
  })
}

