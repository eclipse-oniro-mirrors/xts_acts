/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import eventEmitter from '@ohos.events.emitter';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { Permissions } from 'permissions';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Common from './Common.test';
import { FdObject } from './Common.test';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { globalThis } from './Util.test';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AbilityMonitor } from "application.AbilityMonitor";

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

console.info(`avRecorderTest in3`);
export default function avRecorderTest() {
  console.info(`avRecorderTest in1`);
  describe('avRecorderTest', () => {
    console.info(`avRecorderTest in2`);
    let avRecorder: media.AVRecorder;
    const RECORDER_TIME = 3000;
    const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
    const FORMAT_MP3 = media.ContainerFormatType.CFT_MP3;
    const FORMAT_WAV = media.ContainerFormatType.CFT_WAV;
    const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
    const ENCORDER_MP3 = media.CodecMimeType.AUDIO_MP3;
    const ENCORDER_WAV = media.CodecMimeType.AUDIO_G711MU;
    let fdObject: FdObject;
    let fdPath: string;
    let commonFun = new Common();
    const SETONCALLBACK_EVENT: string = 'setAvRecorderCallback'
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
    let lo: media.Location = {
      latitude: 30, longitude: 130
    }
    let avConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: avProfile,
      url: 'fd://',
    }

    let execTimes: Array<number>;
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

    beforeAll(async () => {
      await commonFun.msleepAsync(2000);
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MICROPHONE', 'ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA',
          'ohos.permission.WRITE_MEDIA','ohos.permission.CAMERA'];
      await commonFun.getPermission(permissionNames);
      await commonFun.msleepAsync(2000);
      await commonFun.driveFn(4);
      console.info('beforeAll out');
    })

    beforeEach(async () => {
      console.info('beforeEach case');
      await commonFun.sleep(3000);
      fdObject = {
        fileAsset:  null,
        fdNumber: null
      };
    })

    afterEach(async () => {
      if (avRecorder) {
        avRecorder.release().then(() => {
          console.info(TAG + 'this testCase execution completed')
        }).catch(commonFun.catchCallback);
      }
      commonFun.closeFd(fdObject?.fdNumber);
      await commonFun.sleep(1000);
      console.info('afterEach case end');
    })

    afterAll(() => {
      console.info('avRecorderTest=== afterAll case');
      offFmitterEvent();
      console.info('avRecorderTest=== afterAll off all eventEmitter 111111');
    })

    let eventEmitterFun =
      (avRecorder: media.AVRecorder | undefined, avConfig: media.AVRecorderConfig, recorderTime: number, steps: string[],
        done: () => void) => {
        let ed: Record<String, RecordData> = {
          'avConfig': avConfig,
          'recorderTime': recorderTime,
          'steps': steps,
          'done': done
        }
        if (avRecorder != undefined) {
          ed["avRecorder"] = avRecorder!
        }
        let eventData: eventEmitter.EventData = {
          data: ed
        }
        console.log('eventEmitterFun eventData ', JSON.stringify(eventData))
        eventEmitter.emit(steps[0], eventData);
      }
    let toNextStep =
      (avRecorder: media.AVRecorder, avConfig: media.AVRecorderConfig, recorderTime: number, steps: Array<string>,
        done: () => void) => {
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

    let setAVRecorderCallback = (avRecorder: media.AVRecorder, done: () => void) => {
      // 状态机变化回调函数
      avRecorder.onStateChange((state, reason) => {
        console.info(TAG + 'current state is: ' + state);
      })
      // 录制监听回调函数
      avRecorder.onAudioCapturerChange((AudioCapturerChangeInfo) => {
        console.info(TAG + 'audioCapturerChange');
      });
      // 错误上报回调函数
      avRecorder.onError((err: BusinessError|null) => {
        try {
          console.error(TAG + 'error ocConstantSourceNode, error message is ' + err!!);
          // await releaseRecorderPromise(avRecorder, done);
        } catch (error) {
          // 处理错误
          console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
        }
      });
    }

    let registerAvRecorderCallback = (eventData: eventEmitter.EventData) => {
      console.log('SETONCALLBACK_EVENT 11 eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      try {
        let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
        let done: () => void = data?.get("done") as (() => void)
        let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
        let recorderTime: number = data?.get("recorderTime") as number
        setAVRecorderCallback(avRecorder, done)
        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
      } catch (error) {
        console.info('setAVRecorderCallback failed and catch error is ' + error);
      }
    }
    eventEmitter.onEventData(SETONCALLBACK_EVENT, registerAvRecorderCallback);

    let registerCreateCallback = (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      media.createAVRecorder((error: BusinessError|null, recorder: undefined|media.AVRecorder) => {
        console.info('CREATE_EVENT case createAVRecorder called');
        if (recorder != null) {
          let avRecorder = recorder;
          expect(avRecorder.state).assertEqual('idle');
          console.info('CREATE_EVENT createAVRecorder idleCallback success');
          let done: () => void = data?.get("done") as (() => void)
          let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
          let recorderTime: number = data?.get("recorderTime") as number
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info(`CREATE_EVENT createAVRecorder idleCallback fail, error:${error}`);
        }
      });
    }
    eventEmitter.onEventData(CREATE_EVENT, registerCreateCallback);

    let registerPrepareCallback = (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      try {
        let data = eventData.data as Record<String, RecordData>;
        let steps: string[] = data?.get('steps') as string[];
        steps.shift();
        let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
        let done: () => void = data?.get("done") as (() => void)
        let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
        let recorderTime: number = data?.get("recorderTime") as number
        avRecorder.prepare(avConfig, (err: BusinessError|null) => {
          console.info('case prepare called');
          if (err == null) {
            console.error(`case prepare success, state is ${avRecorder.state}`);
            expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PREPARED);
            console.info('prepare success');
            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
          } else {
            console.error(`case prepare error, errMessage is ${err.message}`);
          }
        })
      } catch (err) {
        console.info(`PREPARE_EVENT fail, error:${err}`);
      }
    }
    eventEmitter.onEventData(PREPARE_EVENT, registerPrepareCallback);

    eventEmitter.onEventData(STARTRECORDER_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('STARTRECORDER_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime = data?.get("recorderTime")
      avRecorder.start((err: BusinessError|null) => {
        console.info('case start called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STARTED);
          console.info('start AVRecorder success');
          if (recorderTime != undefined) {
            commonFun.sleep(recorderTime as number);
            toNextStep(avRecorder, avConfig, recorderTime as number, steps, done);
          }
        } else {
          console.error('start AVRecorder failed and error is ' + err.message);
          let failedSteps = new Array<string>(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(avRecorder, avConfig, recorderTime as number, steps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(STOPRECORDER_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      avRecorder.stop((err: BusinessError|null) => {
        console.info('case stop called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.STOPPED);
          console.info('stop AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info('stop AVRecorder failed and error is ' + err.message);

          let failedSteps = new Array<string>(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(PAUSERECORDER_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      avRecorder.pause((err: BusinessError|null) => {
        console.info('case pause called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.PAUSED);
          console.info('pause AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info('pause AVRecorder failed and error is ' + err.message);

          let failedSteps = new Array<string>(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RESUMERECORDER_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      avRecorder.resume((err: BusinessError|null) => {
        console.info('case resume called');
        if (err == null) {
          console.info('resume AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info('resume AVRecorder failed and error is ' + err.message);
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);

          let failedSteps = new Array<string>(
            // release avRecorder
            RELEASECORDER_EVENT,
            // failed
            FAIL_EVENT
          )

          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RELEASECORDER_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      avRecorder.release((err: BusinessError|null) => {
        console.info('case release called');
        if (err == null) {
          expect(avRecorder.state).assertEqual(commonFun.AV_RECORDER_STATE.RELEASED);
          console.info('release AVRecorder success');
          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info('release AVRecorder failed and error is ' + err.message);
        }
      })
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(START_TIMETEST_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('START_TIMETEST_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      execTimes = new Array<number>();
      toNextStep(avRecorder, avConfig, recorderTime, steps, done);
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(END_TIMETEST_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      let length = execTimes.length;
      let sum = execTimes.reduce((prev: number, curr: number, index: int, array: Array<number>) => {
        return prev + curr;
      }, 0);
      let avg = sum / length;
      console.info("releaseTimeTestCallback avg time  is :" + avg)
      toNextStep(avRecorder, avConfig, recorderTime, steps, done);
    } as Callback<eventEmitter.EventData>);

    eventEmitter.onEventData(RELEASECORDER_TIMETEST_EVENT, (eventData: eventEmitter.EventData) => {
      console.log('CREATE_EVENT eventData = ', JSON.stringify(eventData))
      let data = eventData.data as Record<String, RecordData>;
      let steps: string[] = data?.get('steps') as string[];
      steps.shift();
      let avRecorder: media.AVRecorder = data?.get("avRecorder") as media.AVRecorder
      let done: () => void = data?.get("done") as (() => void)
      let avConfig: media.AVRecorderConfig = data?.get("avConfig") as media.AVRecorderConfig
      let recorderTime: number = data?.get("recorderTime") as number
      let end: number;
      let start: number = Date.now();
      console.info(`releaseTimeTestCallback start time is : ${start}`)
      avRecorder.release((err: BusinessError|null) => {
        if (err == null) {
          console.info(`releaseTimeTestCallback current state is : ${avRecorder.state}`)
          console.info('release releaseTimeTestCallback success');
          end = Date.now()
          console.info(`releaseTimeTestCallback end time is : ${end}`)
          let numStr: string = (end - start) +'';
          let execution = parseInt(numStr)
          console.info("releaseTimeTestCallback execution time  is :" + execution)

          execTimes.push(execution)

          toNextStep(avRecorder, avConfig, recorderTime, steps, done);
        } else {
          console.info('resume releaseTimeTestCallback failed and error is ' + err.message);
        }
      });
    } as Callback<eventEmitter.EventData>);


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0100
     * @tc.desc   Recorder audio 001.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0200
     * @tc.desc   Recorder audio pause->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0300
     * @tc.desc   Local Video recording 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0400
     * @tc.desc   Local Video pause->resume->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0500
     * @tc.desc   Local Video pause->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0600
     * @tc.desc   Local Video pause->resume->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0700
     * @tc.desc   Local Video stop->reset->pause->resume->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0800
     * @tc.desc   Local Video stop->reset->pause->stop->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0900
     * @tc.desc   Local Video start->pause->start(error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1000
     * @tc.desc   Local Video start->stop->pause(error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1100
     * @tc.desc   Local Video audioEncoderMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0100
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: -30, longitude: 60
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0100 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0200
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: 90, longitude: 180
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0200 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0300
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: 60, longitude: -90
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0300 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0400
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: 0, longitude: 0
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0400 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0500
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: 0, longitude: 180
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0500 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0600
     * @tc.desc   Local Video recorder with designated latitude and longitude
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      console.info('case fdPath is: ' + fdPath);
      let lo: media.Location = {
        latitude: -90, longitude: -180
      }
      let newAvConfig: media.AVRecorderConfig = {
        audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        profile: avProfile,
        url: 'fd://',
      }
      newAvConfig.url = fdPath;
      console.info('avConfig.url ' + newAvConfig.url);
      commonFun.avRecorderWithCallBack13(newAvConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_FORMAT_API_0600 end')
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0100
     * @tc.desc   Recorder pause->prepare 1000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0101
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0101
     * @tc.desc   Recorder audio 001.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0200
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0300
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0400
     * @tc.desc   Recorder audio resume->prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0500
     * @tc.desc   Recorder audio channel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0600
     * @tc.desc   Recorder audio pause->start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0700
     * @tc.desc   Recorder audio resume->start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      await commonFun.avRecorderReliabilitTest07(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_0800
     * @tc.desc   Recorder audio creatAVRecorder->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest08(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0900
     * @tc.desc   Recorder audio prepare->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1000
     * @tc.desc   Recorder audio start->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1100
     * @tc.desc   Recorder audio resume->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      await commonFun.avRecorderReliabilitTest11(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 end')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1200
     * @tc.desc   Recorder audio stop->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1300
     * @tc.desc   Recorder audio reset->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1400
     * @tc.desc   Recorder audio all step->pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1500
     * @tc.desc   Recorder audio pause three times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1600
     * @tc.desc   Recorder audio creatAVRecorder->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1700
     * @tc.desc   Recorder audio prepare->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1800
     * @tc.desc   Recorder audio start->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1900
     * @tc.desc   Recorder audio pause->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2000
     * @tc.desc   Recorder audio stop->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2100
     * @tc.desc   Recorder audio reset->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2200
     * @tc.desc   Recorder audio all->resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2300
     * @tc.desc   Recorder audio resume threee times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_static_2400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_static_2400
     * @tc.desc   Recorder audio pause->stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2600
     * @tc.desc   Recorder audio pause->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      commonFun.avRecorderReliabilitTest26(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 end')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2700
     * @tc.desc   Recorder audio resume->reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      await commonFun.avRecorderReliabilitTest27(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2800
     * @tc.desc   Recorder audio pause->release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2900
     * @tc.desc   Recorder audio resume->release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      await commonFun.avRecorderReliabilitTest29(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 end');
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_3000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_3000
     * @tc.desc   Recorder audio release 3 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3100
     * @tc.desc   Recorder audio create->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3200
     * @tc.desc   Recorder audio  prepare->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3300
     * @tc.desc   Recorder audio  start->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3400
     * @tc.desc   Recorder audio pause->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3500
     * @tc.desc   Recorder audio resume->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3600
     * @tc.desc   Recorder audio stop->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3700
     * @tc.desc   Recorder audio reset->getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3800
     * @tc.desc   Recorder audio getInputSurface 3 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0100
     * @tc.desc   Recorder audio createAVRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0200
     * @tc.desc   Recorder audio AvRecorder.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0300
     * @tc.desc   AvRecorder.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0400
     * @tc.desc   AvRecorder.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0500
     * @tc.desc   AvRecorder.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0600
     * @tc.desc   AvRecorder.resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0700
     * @tc.desc   AvRecorder.stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0800
     * @tc.desc   AvRecorder.reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0900
     * @tc.desc   AvRecorder.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;

      let mySteps = new Array<string>(START_TIMETEST_EVENT);

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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0100
     * @tc.desc   AvRecorder.createAVRecorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0200
     * @tc.desc   AvRecorder.prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0300
     * @tc.desc   AvRecorder.getInputSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0400
     * @tc.desc   AvRecorder.start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0500
     * @tc.desc   AvRecorder.pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0600
     * @tc.desc   AvRecorder.resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0700
     * @tc.desc   AvRecorder.stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0800
     * @tc.desc   AvRecorder.reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0900
     * @tc.desc   AvRecorder.release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_PROMISE_01_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_001
     * @tc.desc   Recorder audio create->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_CALLBACK_API_static_001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_CALLBACK_API_static_001
     * @tc.desc   Recorder audio create->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_CALLBACK_API_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_CALLBACK_API_static_001 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;
      expect(fdObject != undefined).assertTrue();
      commonFun.avRecorderReliabilitTestCallback39(avConfig, avRecorder, RECORDER_TIME, done);
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_CALLBACK_API_static_001 end');
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_002
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_002
     * @tc.desc   Recorder audio  prepare->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_003
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_003
     * @tc.desc   Recorder audio  start->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_004
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_004
     * @tc.desc   Recorder audio pause->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_005
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_005
     * @tc.desc   Recorder audio resume->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_006
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_006
     * @tc.desc   Recorder audio stop->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_007
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_007
     * @tc.desc   Recorder audio reset->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETAVRECORDERCONFIG_API_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_static_001
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_static_001
     * @tc.desc   Recorder audio reset->getAVRecorderConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_ONAUDIOCAPTURERCHANGECALLBACK_API_001 start')
      let fileName: string = commonFun.resourceName();
      fdObject = await commonFun.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      avConfig.url = fdPath;

      let mySteps = new Array<string>(
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_static_0100
     * @tc.desc   Local Video recording mp3 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_MP3_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_static_0100
     * @tc.desc   Local Video recording WAV 3 seconds to stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_RECORDER_WAV_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
  })
}

