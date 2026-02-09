/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import {vibrator} from '@kit.SensorServiceKit';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import vibrator from '@ohos.vibrator';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function VibratorJsTest_misc_9() {
  describe("VibratorJsTest_misc_9", ():void => {
    hilog.info(domain, tag, '%{public}s', 'discribe start');
    const OPERATION_FAIL_CODE = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;
    const OPERATION_FAIL_MSG = 'Device operation failed.';
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let isAvailable = false;
    const EFFECT_IDSUCCESS = "haptic.notice.success"
    const EFFECT_IDFAIL = "haptic.notice.fail"
    const EFFECT_IDWARNING = "haptic.notice.warning"

    let TAG = '';
    let INVALID_EFFECT_ID = "haptic.xxx.yyy";
    let effectit = vibrator.EffectId.EFFECT_CLOCK_TIMER

    beforeAll((done: () => void): Promise<void> =>{
      hilog.info(domain, tag, 'beforeAll called');
      hilog.info(domain, tag, 'VibratorJsTest_misc_9 Device type ' + deviceInfo.deviceType);
      hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
      try {
        const vibratorsList = vibrator.getVibratorInfoSync();
        if (vibratorsList.length === 0 || (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
          isAvailable = false;
          hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
          done();
        }else {
          isAvailable = true;
          hilog.info(domain, tag, 'VibratorJsTest_misc_9 isAvailable ' + isAvailable);
          done();
        }
      } catch(error) {
        hilog.info(domain, tag, 'VibratorJsTest_misc_9 exception :' + JSON.stringify(error));
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterEach called');
      try{
        await vibrator.stopVibration();
        hilog.info(domain, tag, 'afterEach: Success in stopping vibration. ');
        done();
      } catch(error){
        hilog.info(domain, tag, 'afterEach error: ' + JSON.stringify(error));
        done();
      }
      console.info('afterEach end');
    })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic001
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0100
     * @tc.desc   VibratorEventType CONTINUOUS is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("VibratorProgramticHapticTestStatic001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic001';
        hilog.info(domain, tag, TAG + ' Device type ' + deviceInfo.deviceType);
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          let eventType = vibrator.VibratorEventType.CONTINUOUS;
          try {
            expect(eventType).assertEqual(0);
            hilog.info(domain, tag, TAG + ' eventType: ' + eventType);
            setTimeout(() => {
              done();
            }, 500);
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect((error as BusinessError).code == 401).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic002
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0200
     * @tc.desc   VibratorEventType TRANSIENT is 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic002';
        if (isAvailable) {
          let eventType = vibrator.VibratorEventType.TRANSIENT;
          try {
            expect(eventType).assertEqual(1);
            hilog.info(domain, tag, TAG + ' eventType: ' + eventType);
            setTimeout(() => {
              done();
            }, 500);
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect((error as BusinessError).code == 401).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic003
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0300
     * @tc.desc   VibratorCurvePoint Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic003';
        if (isAvailable) {
          try {
            let data1: vibrator.VibratorCurvePoint = { time: 0, intensity: 0, frequency: -7};
            let data2: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data3: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data4: vibrator.VibratorCurvePoint = { time: 128, intensity: 0.94, frequency: -4};
            let data5: vibrator.VibratorCurvePoint = { time: 217, intensity: 0.63, frequency: -14};
            let data6: vibrator.VibratorCurvePoint = { time: 763, intensity: 0.48, frequency: -14};
            let data7: vibrator.VibratorCurvePoint = { time: 1125, intensity: 0.53, frequency: -10};
            let data8: vibrator.VibratorCurvePoint = { time: 1503, intensity: 0.42, frequency: -14};
            let data9: vibrator.VibratorCurvePoint = { time: 1858, intensity: 0.39, frequency: -14};
            let data10: vibrator.VibratorCurvePoint = { time: 2295, intensity: 0.34, frequency: -17};
            let data11: vibrator.VibratorCurvePoint = { time: 2448, intensity: 0.21, frequency: -14};
            let data12: vibrator.VibratorCurvePoint = { time: 2468, intensity: 0, frequency: -21};
            let pointsMe:  Array<vibrator.VibratorCurvePoint> = [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12];
            hilog.info(domain, tag, TAG + ' pointsMe: ' + pointsMe);
            done();
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic004
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0400
     * @tc.desc   VibratorEvent Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic004';
        if (isAvailable) {
          try {
            let data1: vibrator.VibratorCurvePoint = { time: 0, intensity: 0, frequency: -7};
            let data2: vibrator.VibratorCurvePoint = { time: 42, intensity: 1, frequency: -6};
            let data3: vibrator.VibratorCurvePoint = { time: 128, intensity: 0.94, frequency: -4};
            let data4: vibrator.VibratorCurvePoint = { time: 217, intensity: 0, frequency: -21};
            let pointsMe:  Array<vibrator.VibratorCurvePoint> = [data1,data2,data3,data4];
            let vibratorEvent: vibrator.VibratorEvent = {
              eventType: vibrator.VibratorEventType.CONTINUOUS,
              time: 20,
              intensity: 97,
              frequency: 34,
              points: pointsMe,
              index: 0,
              duration: 35
            }
            hilog.info(domain, tag, TAG + ' vibratorEvent: ' + vibratorEvent);
            done();
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic048
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0500
     * @tc.desc   VibratorCurvePoint Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic048';
        try {
          let effect: vibrator.HapticFileDescriptor = {
            fd: 1,
            offset: 0,
            length: 1000
          }
          let startVibrationData1: vibrator.VibrateFromFile = {
            type: "file",
            hapticFd: effect,
          }
          let startVibrationData2: vibrator.VibrateAttribute = {
            usage: "unknown"
          }
          vibrator.startVibration(startVibrationData1, startVibrationData2, (error: BusinessError<void> | null): void =>{
            hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic048 should not in this method ');
            expect(error !== null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic069
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0600
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("VibratorProgramticHapticTestStatic069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic069';
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          try {
            vibrator.isSupportEffect(INVALID_EFFECT_ID, (error: BusinessError<void> | null, state: boolean | undefined) : void=>{
              if (error != null){
                hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
                expect(false).assertTrue();
                done();
              } else {
                hilog.info(domain, tag, TAG + ' VibratorProgramticHapticTestStatic069 success ');
                expect(!state).assertTrue();
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic100
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0700
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("VibratorProgramticHapticTestStatic100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic100';
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
          try {
            let isSupportEffectData: boolean = await vibrator.isSupportEffect(INVALID_EFFECT_ID);
            hilog.info(domain, tag, TAG + ' isSupportEffect success ');
            expect(!isSupportEffectData).assertTrue();
            done();
          } catch (error) {
            hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic023
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0800
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic023';
        try {
          let effect: vibrator.VibratePreset = {
            type: "preset",
            effectId: "haptic.clock.timer",
            count: 1,
            intensity: 5,
          }
          let attribute: vibrator.VibrateAttribute = {
            id: 0,
            usage: "unknown"
          }
          vibrator.startVibration(effect, attribute, (error: BusinessError<void> | null): void =>{
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            if (error && !isAvailable) {
              hilog.info(domain, tag, TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
              expect(error.code).assertEqual(14600101);
              done();
            } else if (error && isAvailable) {
              hilog.info(domain, tag, TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
              done();
            } else if (error == undefined && !isAvailable) {
              hilog.info(domain, tag, TAG + `isAvailable is false but startVibration success`);
              expect(false).assertTrue();
              done();
            } else {
              hilog.info(domain, tag, TAG + ' startVibration success' );
              done();
            }
          });
        } catch (error) {
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          expect((error as BusinessError).code == 401).assertTrue();
          expect((error as BusinessError).message).assertEqual(PARAMETER_ERROR_MSG);
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic032
     * @tc.number SUB_SensorsSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0900
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic032';
        try {
          let effect: vibrator.VibratePreset = {
            type: "preset",
            effectId: "haptic.clock.timer",
            count: 1,
          }
          let attribute: vibrator.VibrateAttribute = {
            id: 0,
            usage: "unknown"
          }
          vibrator.startVibration(effect, attribute);
          expect(attribute !== null).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          expect((error as BusinessError).code == 401).assertTrue();
          expect((error as BusinessError).message).assertEqual(PARAMETER_ERROR_MSG);
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic024
     * @tc.number SUB_SensorsSystem_Vibrator_JSTeststatic_0500
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic024';
        try {
          let effect: vibrator.VibrateTime = {
            type: "time",
            duration: 1000,
          }
          let attribute: vibrator.VibrateAttribute = {
            id: 0,
            usage: "unknown"
          }
          vibrator.startVibration(effect, attribute);
          expect(attribute !== null).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          if (error.code == 801) {
            expect((error as BusinessError).code == 801).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   VibratorProgramticHapticTestStatic025
     * @tc.number SUB_SensorsSystem_Vibrator_JSTeststatic_0600
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorProgramticHapticTestStatic025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        TAG = 'VibratorProgramticHapticTestStatic025';
        try {
          let points: Array<vibrator.VibratorCurvePoint> = [
            {
              time: 0,
              intensity: 0.95,
              frequency: 50,
            }
          ];
          let vibratorEvent1: vibrator.VibratorEvent = {
            eventType: vibrator.VibratorEventType.CONTINUOUS,
            time: 20,
            duration: 50,
            intensity: 60,
            frequency: 75,
            index: 1,
            points: points,
          }
          let vibratorEvent2: vibrator.VibratorEvent = {
            eventType: vibrator.VibratorEventType.CONTINUOUS,
            time: 30,
            duration: 60,
            intensity: 75,
            frequency: 95,
            index: 2,
            points: points,
          }
          let vibratorEvent3: vibrator.VibratorEvent = {
            eventType: vibrator.VibratorEventType.CONTINUOUS,
            time: 10,
            duration: 70,
            intensity: 65,
            frequency: 55,
            index: 3,
            points: points,
          }
          let myevents:  Array<vibrator.VibratorEvent> = [vibratorEvent1,vibratorEvent2,vibratorEvent3];
          let vibratorPattern: vibrator.VibratorPattern = {
            time: 5,
            events: myevents,
          }
          let effect: vibrator.VibrateFromPattern = {
            type: "pattern",
            pattern: vibratorPattern,
          }
          let attribute: vibrator.VibrateAttribute = {
            id: 0,
            usage: "unknown"
          }
          vibrator.startVibration(effect, attribute, (error: BusinessError<void> | null): void =>{
            hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
            if (error) {
              expect(error !== null).assertTrue();
            } else {
              expect(false).assertTrue();
            }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          if (error.code == 801) {
            expect((error as BusinessError).code == 801).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   UniversalVibratorJsTest01
     * @tc.number UniversalVibratorJsTest01
     * @tc.desc   test EFFECT_IDSUCCESS vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest01";
      try {
        let ret = await vibrator.isSupportEffect(EFFECT_IDSUCCESS);
        hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
        if (ret) {
          let effect1: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }
          let attr: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
            }
            vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME, (error: BusinessError<void> | null): void => {
              hilog.info(domain, tag, TAG + `stopVibration , error.code: ${error?.code} , error.message: ${error?.message}`);
            })
            done();
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest02
     * @tc.number UniversalVibratorJsTest02
     * @tc.desc   test EFFECT_IDFAIL vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest02";
      try {
        let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
        hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1));
        if (ret1) {
          let effect2: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }
          let attr2: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect2, attr2, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
            }
            vibrator.stopVibration((error: BusinessError<void> | null): void => {
              hilog.info(domain, tag, TAG + `stopVibration , error.code: ${error?.code} , error.message: ${error?.message}`);
            })
            done();
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest03
     * @tc.number UniversalVibratorJsTest03
     * @tc.desc   test EFFECT_IDWARNING vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest03"
      try {
        let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
        hilog.info(0x0000, 'testTag', TAG + "ret2:" + JSON.stringify(ret2));
        if (ret2) {
          let effect3: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }
          let attr3: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect3, attr3, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
            }
            vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_PRESET)
            done();
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest04
     * @tc.number UniversalVibratorJsTest04
     * @tc.desc   test EFFECT_IDFAIL vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest04";
      try {
        let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
        let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
        hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
        if (ret1 && ret2) {
          let effect4: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }
          let effect41: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }
          let attr4: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect4, attr4, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
            }
          });
          vibrator.startVibration(effect41, attr4, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest05
     * @tc.number UniversalVibratorJsTest05
     * @tc.desc   test EFFECT_IDSUCCESS vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest05"
      try {
        let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
        let ret = await vibrator.isSupportEffect(EFFECT_IDSUCCESS);
        hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret) + "ret2:" + JSON.stringify(ret2));
        if (ret && ret2) {
          let effect5: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }
          let effect51: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }
          let attr5: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect5, attr5, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
            }
          });
          vibrator.startVibration(effect51, attr5, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
            }
            vibrator.stopVibration()
            done();
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest06
     * @tc.number UniversalVibratorJsTest06
     * @tc.desc   test EFFECT_IDWARNING vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest06";
      try {
        let ret2 = await vibrator.isSupportEffect(EFFECT_IDWARNING);
        let ret1 = await vibrator.isSupportEffect(EFFECT_IDFAIL);
        hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
        if (ret1 && ret2) {
          let effect6: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }
          let effect61: vibrator.VibratePreset = {
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }
          let attr6: vibrator.VibrateAttribute = {
            usage: 'unknown',
          }
          vibrator.startVibration(effect6, attr6, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
            }
          });
          vibrator.startVibration(effect61, attr6, (error: BusinessError<void> | null): void => {
            if (error != null) {
              hilog.info(domain, tag, TAG + ` error.code: ${error?.code} , error.message: ${error?.message}`);
              expect(false).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
            } else {
              expect(error == null).assertTrue();
              hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else {
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        if (isAvailable) {
          hilog.info(domain, tag, TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest07
     * @tc.number UniversalVibratorJsTest07
     * @tc.desc   test VibrateTime vibrate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest07"
      try {
        let ret = vibrator.isHdHapticSupported();
        hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
        expect(typeof(ret) == 'boolean').assertEqual(true);
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest08
     * @tc.number UniversalVibratorJsTest08
     * @tc.desc   test VibrateTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest08"
      let effect1: vibrator.VibrateTime = {
        type: 'time',
        duration: 10000,
      }
      let attr: vibrator.VibrateAttribute = {
        id: 1,
        usage: 'alarm',
      }
      try {
        vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
          if (error != null && !isAvailable) {
            hilog.info(0x0000, 'testTag', TAG + ` isAvailable is false error: error.code: ${error?.code},error.message: ${error?.message}`);
            expect(error?.code).assertEqual(14600101);
            done();
          } else if (error && isAvailable) {
            hilog.info(0x0000, 'testTag', TAG + ` startVibration error: error.code: ${error?.code},error.message: ${error?.message}`);
            expect(false).assertTrue();
            done();
          } else if (error == undefined && !isAvailable) {
            hilog.info(0x0000, 'testTag', TAG + `isAvailable is false but startVibration success`);
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
            vibrator.stopVibrationSync();
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest09
     * @tc.number UniversalVibratorJsTest09
     * @tc.desc   test vibratePreset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest09"
      try {
        let vibratePreset: vibrator.VibratePreset = {
          type: "preset",
          effectId: "effectId",
          count: 1,
          intensity: 50
        };
        let attribute: vibrator.VibrateAttribute = {
          id: 0,
          usage: "unknown"
        }
        vibrator.startVibration(vibratePreset, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(attribute !== null).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest10
     * @tc.number UniversalVibratorJsTest10
     * @tc.desc   test vibrateTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest10"
      try {
        let vibrateTime: vibrator.VibrateTime = {
          type: "time",
          duration: 10000,
        };
        let attribute: vibrator.VibrateAttribute = {
          id: 1,
          usage: "unknown",
          systemUsage: true,
        }
        vibrator.startVibration(vibrateTime, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(attribute !== null).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_12
     * @tc.number UniversalVibratorJsTest_12
     * @tc.desc   test VibratorEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest_12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest_12"
      try {
        let eventType = vibrator.VibratorEventType.CONTINUOUS;
        let points: Array<vibrator.VibratorCurvePoint> = [
          {
            time: 0,
            intensity: 0.95,
            frequency: 50,
          }
        ];
        let events: Array<vibrator.VibratorEvent> = [
          {
            eventType: eventType,
            time: 1,
            points: points,
          }
        ]
        let patt: vibrator.VibratorPattern = {
          time: 10,
          events: events,
        };
        let pattern: vibrator.VibrateFromPattern = {
          type: "pattern",
          pattern: patt,
        };
        let attribute: vibrator.VibrateAttribute = {
          usage: "unknown"
        }
        vibrator.startVibration(pattern, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(attribute !== null).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_13
     * @tc.number UniversalVibratorJsTest_13
     * @tc.desc   test vibrateFromFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest_13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest_13"
      try {
        let hapticFileDescriptor: vibrator.HapticFileDescriptor = {
          fd: 0,
          offset: 10,
          length: 100,
        };
        let vibrateFromFile: vibrator.VibrateFromFile = {
          type: "file",
          hapticFd: hapticFileDescriptor,
        };
        let attribute: vibrator.VibrateAttribute = {
          usage: "unknown"
        }
        vibrator.startVibration(vibrateFromFile, attribute);
        hilog.info(0x0000, 'testTag', TAG + ' startVibration success');
        expect(attribute !== null).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest14
     * @tc.number UniversalVibratorJsTest14
     * @tc.desc   test isSupportEffectSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest14", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest14";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let ret = vibrator.isSupportEffectSync('haptic.clock.timer');
        ret = vibrator.isSupportEffectSync('haptic.clock.timer');
        hilog.info(domain, tag, TAG + ` isSupportEffectSync function return value is ${ret} `);
        expect(ret == true).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(14600101);
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   UniversalVibratorJsTest_01
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_01
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_01"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        console.info(TAG + "ret:" + ret);
        if(ret){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' startVibration success' );
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_02
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_02"
      try {
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        console.info(TAG + "ret1:" + ret1);
        if(ret1){
          expect(ret1).assertTrue();
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          expect(ret1 == false).assertTrue();
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_03
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0300
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_03"
      try {
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret2:" + ret2);
        if(ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_04
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0400
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_04"
      try {
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        console.info(TAG + "ret1:" + ret1 + "ret2:" + ret2);
        if(ret1 && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_05
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0500
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_05"
      try {
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        console.info(TAG + "ret:" + ret + "ret2:" + ret2);
        if(ret && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_06
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0600
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_06"
      try {
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        console.info(TAG + "ret1:" + ret1 + "ret2:" + ret2);
        if(ret1 && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_07
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0700
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_07"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        console.info(TAG + "ret:" + ret + "ret1:" + ret1);
        if(ret && ret1){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_08
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0800
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_08"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret:" + ret + "ret2:" + ret2);
        if(ret && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_09
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0900
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_09"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret:" + ret + "ret2:" + ret2);
        if(ret && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ' vibrator EFFECT_IDWARNING error:' + error);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest_10
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1000
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest_10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest_10"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
        if(ret && ret1 && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest11
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1100
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest11"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
        if(ret && ret1 && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDWARNING  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest12
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_1200
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("UniversalVibratorJsTest12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      TAG = "====>UniversalVibratorJsTest12"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        let ret1 = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        let ret2 = vibrator.isSupportEffectSync(EFFECT_IDWARNING);
        console.info(TAG + "ret:" + ret + "ret1:" + ret1 + "ret2:" + ret2);
        if(ret && ret1 && ret2){
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDSUCCESS,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDSUCCESS  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDSUCCESS success');
              expect(error == undefined).assertTrue();
            }
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDFAIL,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDFAIL success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
          vibrator.startVibration({
            type: "preset",
            effectId: EFFECT_IDWARNING,
            count: 1,
            intensity: 50,
          }, {
            usage: "unknown"
          }, (error) => {
            if (error) {
              console.info(TAG + ` vibrator EFFECT_IDFAIL  error ,error.code: ${error.code},error.message: ${error.message}`);
              expect(false).assertTrue();
            } else {
              console.info(TAG + ' vibrator EFFECT_IDWARNING success');
              expect(error == undefined).assertTrue();
            }
            setTimeout(() => {
              done();
            }, 500);
          });
        } else{
          console.log(TAG + ' is not supported.');
          done();
        }
      } catch (error) {
        if (isAvailable) {
          console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
        } else {
          console.info(TAG + ` isAvailable1 is false rror.code: ${error.code},error.message: ${error.message}`);
          expect(error.code).assertEqual(14600101);
        }
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest13
     * @tc.number UniversalVibratorJsTest13
     * @tc.desc   test addContinuousEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest13";
      hilog.info(domain, tag, TAG + "----------start----------");
      let builder = new vibrator.VibratorPatternBuilder();
      let pointsMe: vibrator.VibratorCurvePoint[] = [
        {
          time: 0,
          intensity: 0,
          frequency: -7
        },
        {
          time: 42,
          intensity: 1,
          frequency: -6
        },
        {
          time: 128,
          intensity: 1,
          frequency: -4
        },
        {
          time: 217,
          intensity: 0,
          frequency: -4
        }
      ];
      let param: vibrator.ContinuousParam = {
        intensity: 97,
        frequency: 34,
        points: pointsMe,
        index: 0
      };
      try {
        builder.addContinuousEvent(0, 217, param);
        hilog.info(domain, tag, TAG + " builder.build is " + JSON.stringify(builder.build()));
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   VibratorJsTest112
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1120
     * @tc.desc   Test the on function for VIBRATOR_DEVICE_STATE_CHANGE with valid and invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "VibratorJsTest112"
      console.info(TAG + ' isAvailable ' + isAvailable);
      if (isAvailable) {
        try {
          const validCallback = (statusEvent: vibrator.VibratorStatusEvent) => {
            console.info(TAG + " statusEvent.timestamp:" + statusEvent.timestamp);
            console.info(TAG + " statusEvent.deviceId:" + statusEvent.deviceId);
            console.info(TAG + " statusEvent.vibratorCount:" + statusEvent.vibratorCount);
            console.info(TAG + " statusEvent.isVibratorOnline:" + statusEvent.isVibratorOnline);
          };
          vibrator.onVibratorStateChange(validCallback);
          console.info(TAG + " on ");
          setTimeout(() => {
            vibrator.offVibratorStateChange(validCallback);
          }, 500);
          done();
        } catch (error) {
          console.info(TAG + " on error: " + JSON.stringify(error));
          expect(false).assertEqual(true);
          done();
        }
        console.info(TAG + " end");
      } else {
        console.log(TAG + ' is not supported on this device.');
        done();
      }
    })

    /**
     * @tc.name   VibratorJsTest115
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1150
     * @tc.desc   Test the function of obtaining the effect information through the device ID and vibratorId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "VibratorJsTest115"
      console.info(TAG + ' isAvailable ' + isAvailable);
      if (isAvailable) {
        try {
          const effectId:string = "haptic.clock.timer";
          const vibrators = vibrator.getVibratorInfoSync();
          const vibratorInfoParam:vibrator.VibratorInfoParam = {
            deviceId: vibrators[0].deviceId,
            vibratorId: vibrators[0].vibratorId
          };
          const jsEffectInfo = vibrator.getEffectInfoSync(effectId, vibratorInfoParam);
          console.info(TAG + " jsEffectInfo.isEffectSupported:" + jsEffectInfo.isEffectSupported);
          if (!jsEffectInfo.isEffectSupported) {
            console.info(TAG + 'is not supported on this device.');
            done();
            return;
          }
          expect(jsEffectInfo.isEffectSupported).assertTrue();
          done();
        } catch (error) {
          console.info(TAG + " getEffectInfoSync error: " + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        console.info(TAG + " end");
      } else {
        console.log(TAG + ' is not supported on this device.');
        done();
      }
    })

    /**
     * @tc.name   VibratorJsTest116
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1160
     * @tc.desc   Test the function of obtaining the effect information through the vibratorId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "VibratorJsTest116"
      console.info(TAG + ' isAvailable ' + isAvailable);
      if (isAvailable) {
        try {
          const effectId:string = "haptic.clock.timer";
          const jsEffectInfo = vibrator.getEffectInfoSync(effectId);
          console.info(TAG + " jsEffectInfo.isEffectSupported:" + jsEffectInfo.isEffectSupported);
          if (!jsEffectInfo.isEffectSupported) {
            console.info(TAG + 'is not supported on this device.');
            done();
            return;
          }
          expect(jsEffectInfo.isEffectSupported).assertTrue();
          done();
        } catch (error) {
          console.info(TAG + " getEffectInfoSync error: " + JSON.stringify(error));
          expect(false).assertEqual(true);
          done();
        }
      } else {
        console.log(TAG + ' is not supported on this device.');
        done();
      }
    })
    
    /**
     * @tc.name   VibratorJsTest101
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1110
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "VibratorJsTest101"
      console.info(TAG + ' isAvailable ' + isAvailable);
      try {
        vibrator.stopVibrationSync();
        console.info(TAG + " stopVibrationSync success");
        done()
      } catch (err) {
        let error = err as BusinessError;
        if(isAvailable) {
          hilog.info(domain, tag, TAG+`startVibration error:${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG+`isAvailable is false error:${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   IsSupportEffectSyncTest01
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_010
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("IsSupportEffectSyncTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "====>IsSupportEffectSyncTest01"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDSUCCESS);
        console.log(TAG + "ret:" + ret);
        expect(typeof ret === 'boolean').assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        if(isAvailable) {
          hilog.info(domain, tag, TAG+`startVibration error:${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG+`isAvailable is false error:${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   IsSupportEffectSyncTest02
     * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_UniversalVibratoin_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("IsSupportEffectSyncTest02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "====>IsSupportEffectSyncTest02"
      try {
        let ret = vibrator.isSupportEffectSync(EFFECT_IDFAIL);
        console.log(TAG + "ret:" + ret);
        expect(typeof ret === 'boolean').assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        if(isAvailable) {
          hilog.info(domain, tag, TAG+`startVibration error:${JSON.stringify(error.code)}`);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG+`isAvailable is false error:${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(14600101);
          done();
        }
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest16
     * @tc.number UniversalVibratorJsTest16
     * @tc.desc   test addContinuousEvent error.code: 401 , error.message: Invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest16";
      hilog.info(domain, tag, TAG + "----------start----------");
      let builder = new vibrator.VibratorPatternBuilder();
      let param: vibrator.ContinuousParam = {
        intensity: 100,
        frequency: 101
      };
      try {
        builder.addContinuousEvent(0, 5000, param);
        hilog.info(domain, tag, TAG + " builder.build is " + JSON.stringify(builder.build()));
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("Invalid parameter");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   UniversalVibratorJsTest17
     * @tc.number UniversalVibratorJsTest17
     * @tc.desc   test addTransientEvent error.code: 401 , error.message: Invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest17", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest17";
      hilog.info(domain, tag, TAG + "----------start----------");
      let builder = new vibrator.VibratorPatternBuilder();
      let param: vibrator.TransientParam = {
        intensity: 100,
        frequency: 101,
        index: 0
      };
      try {
        builder.addTransientEvent(0, param);
        hilog.info(domain, tag, TAG + " builder.build is " + JSON.stringify(builder.build()));
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("Invalid parameter");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   UniversalVibratorJsTest18
     * @tc.number UniversalVibratorJsTest18
     * @tc.desc   test addTransientEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest18", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest18";
      hilog.info(domain, tag, TAG + "----------start----------");
      let builder = new vibrator.VibratorPatternBuilder();
      let param: vibrator.TransientParam = {
        intensity: 97,
        frequency: 34,
        index: 0
      };
      try {
        builder.addTransientEvent(0, param);
        let pattern = builder.build();
        hilog.info(domain, tag, TAG + " pattern.time: " + pattern.time);
        hilog.info(domain, tag, TAG + " pattern.events.length: " + pattern.events.length);

        if (pattern.events.length > 0) {
          let event = pattern.events[0];
          hilog.info(domain, tag, TAG + " event.time: " + event.time);
          hilog.info(domain, tag, TAG + " event.index: " + event.index);
          hilog.info(domain, tag, TAG + " event.duration: " + event.duration);
          hilog.info(domain, tag, TAG + " event.intensity: " + event.intensity);
          hilog.info(domain, tag, TAG + " event.frequency: " + event.frequency);
        }

        // 验证基础结构
        expect(pattern !== null).assertTrue();
        expect(pattern !== undefined).assertTrue();
        expect(pattern.time).assertEqual(0);
        expect(pattern.events !== undefined).assertTrue();
        expect(pattern.events.length > 0).assertTrue();
        // 验证事件详情
        let event = pattern.events[0];
        expect(event.time).assertEqual(0);
        expect(event.index).assertEqual(0);
        expect(event.duration).assertEqual(48);
        expect(event.intensity).assertEqual(97);
        expect(event.frequency).assertEqual(34);
        expect(event.points !== undefined).assertTrue();

        hilog.info(domain, tag, TAG + " all assertions passed");
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   UniversalVibratorJsTest19
     * @tc.number UniversalVibratorJsTest19
     * @tc.desc   test build: builder.build() success; pattern type: object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest19", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest19";
      hilog.info(domain, tag, TAG + "----------start----------");
      const PARAMETER_ERROR_CODE = 401;
      let builder = new vibrator.VibratorPatternBuilder();
      let pointsMe: vibrator.VibratorCurvePoint[] = [
        {
          time: 0,
          intensity: 0,
          frequency: -7
        },
        {
          time: 42,
          intensity: 1,
          frequency: -6
        },
        {
          time: 128,
          intensity: 1,
          frequency: -4
        },
        {
          time: 217,
          intensity: 0,
          frequency: -4
        }
      ];

      let continuousParam: vibrator.ContinuousParam = {
        intensity: 97,
        frequency: 34,
        points: pointsMe,
        index: 0
      };

      let transientParam: vibrator.TransientParam = {
        intensity: 100,
        frequency: 50
      };

      try {
        builder.addContinuousEvent(0, 217, continuousParam);
        builder.addTransientEvent(218, transientParam);
        let pattern: vibrator.VibratorPattern = builder.build();
        expect(pattern !== null).assertTrue();
        expect(pattern !== undefined).assertTrue();
        hilog.info(domain, tag, TAG + " builder.build() success");
        hilog.info(domain, tag, TAG + " pattern type: " + typeof pattern);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        if (error.code === PARAMETER_ERROR_CODE) {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        } else {
          expect(false).assertTrue();
        }
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   UniversalVibratorJsTest20
     * @tc.number UniversalVibratorJsTest20
     * @tc.desc   test build method with no events (should fail with error code 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest20", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest20";
      hilog.info(domain, tag, TAG + "----------start----------");
      let builder = new vibrator.VibratorPatternBuilder();
      try {
        let pattern: vibrator.VibratorPattern = builder.build();
        // 空的事件，如果构建成功测试失败
        hilog.info(domain, tag, TAG + " builder.build() unexpectedly succeeded");
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("The number of events exceeds the range");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   UniversalVibratorJsTest21
     * @tc.number UniversalVibratorJsTest21
     * @tc.desc   Test getVibratorInfoSync without parameters, verify the returned vibrator information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest21", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        TAG = "UniversalVibratorJsTest21"
        hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
        let vibrators = vibrator.getVibratorInfoSync();
        if (vibrators && vibrators.length > 0) {
          try {
            // 添加对deviceId的断言
            expect(vibrators[0].deviceId >= -1).assertEqual(true);
            hilog.info(domain, tag, TAG + " getVibratorInfoSync deviceId:" + vibrators[0].deviceId);
            expect(typeof vibrators[0].deviceId === 'int').assertEqual(true);
            // 添加对vibratorId的断言
            hilog.info(domain, tag, TAG + " getVibratorInfoSync vibratorId:" + vibrators[0].vibratorId);
            expect(vibrators[0].vibratorId >= 0).assertEqual(true);
            expect(typeof vibrators[0].vibratorId === 'int').assertEqual(true);
            // 添加对deviceName的断言
            hilog.info(domain, tag, TAG + " getVibratorInfoSync deviceName:" + vibrators[0].deviceName);
            expect(typeof vibrators[0].deviceName === 'string').assertEqual(true);
            expect(vibrators[0].deviceName !== undefined).assertEqual(true);
            expect(vibrators[0].deviceName !== null).assertEqual(true);
            // 添加对isHdHapticSupported的断言
            hilog.info(domain, tag, TAG + " getVibratorInfoSync isHdHapticSupported:" + vibrators[0].isHdHapticSupported);
            expect(typeof vibrators[0].isHdHapticSupported === 'boolean').assertEqual(true);
            // 添加对isLocalVibrator的断言
            hilog.info(domain, tag, TAG + " getVibratorInfoSync isLocalVibrator:" + vibrators[0].isLocalVibrator);
            expect(typeof vibrators[0].isLocalVibrator === 'boolean').assertEqual(true);
            expect(vibrators[0].isLocalVibrator).assertEqual(true);

            const freshVibratorsData = vibrator.getVibratorInfoSync();
            hilog.info(domain, tag, `${TAG}  freshVibratorsData[0].deviceId = ${freshVibratorsData[0].deviceId}`);
            hilog.info(domain, tag, `${TAG}  vibrators[0].deviceId         = ${vibrators[0].deviceId}`);
            hilog.info(domain, tag, `${TAG}  vibrators.length              = ${vibrators.length}`);
            hilog.info(domain, tag, `${TAG}  freshVibratorsData.length     = ${freshVibratorsData.length}`);
            expect(freshVibratorsData[0].deviceId >= -1).assertEqual(true);
            expect(vibrators[0].deviceId === freshVibratorsData[0].deviceId).assertEqual(true);
            expect(vibrators.length > 0).assertEqual(true);
            expect(freshVibratorsData.length > 0).assertEqual(true);
            done();
          } catch (error) {
            error = error as BusinessError;
            hilog.info(domain, tag, TAG + " getVibratorInfoSync error: " + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
          hilog.info(domain, tag, TAG + " end");
        } else {
          hilog.info(domain, tag, TAG + ' is not supported on this device.');
          done();
        }
      })

    /**
     * @tc.name   UniversalVibratorJsTest22
     * @tc.number UniversalVibratorJsTest22
     * @tc.desc   Test getVibratorInfoSync with parameters, verify the returned vibrator information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest22", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest22"
      hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
      let vibrators = vibrator.getVibratorInfoSync();
      if (vibrators && vibrators.length > 0) {
        try {
          const vibratorInfoParam: vibrator.VibratorInfoParam = {
            deviceId: -1,
            vibratorId: -1
          };

          const vibrators = vibrator.getVibratorInfoSync(vibratorInfoParam);

          // 添加对deviceId的断言
          expect(vibrators[0].deviceId >= -1).assertEqual(true);
          hilog.info(domain, tag, TAG + " getVibratorInfoSync deviceId:" + vibrators[0].deviceId);
          expect(typeof vibrators[0].deviceId === 'int').assertEqual(true);
          // 添加对vibratorId的断言
          hilog.info(domain, tag, TAG + " getVibratorInfoSync vibratorId:" + vibrators[0].vibratorId);
          expect(vibrators[0].vibratorId >= 0).assertEqual(true);
          expect(typeof vibrators[0].vibratorId === 'int').assertEqual(true);
          // 添加对deviceName的断言
          hilog.info(domain, tag, TAG + " getVibratorInfoSync deviceName:" + vibrators[0].deviceName);
          expect(typeof vibrators[0].deviceName === 'string').assertEqual(true);
          expect(vibrators[0].deviceName !== undefined).assertEqual(true);
          expect(vibrators[0].deviceName !== null).assertEqual(true);
          // 添加对isHdHapticSupported的断言
          hilog.info(domain, tag, TAG + " getVibratorInfoSync isHdHapticSupported:" + vibrators[0].isHdHapticSupported);
          expect(typeof vibrators[0].isHdHapticSupported === 'boolean').assertEqual(true);
          // 添加对isLocalVibrator的断言
          hilog.info(domain, tag, TAG + " getVibratorInfoSync isLocalVibrator:" + vibrators[0].isLocalVibrator);
          expect(typeof vibrators[0].isLocalVibrator === 'boolean').assertEqual(true);
          expect(vibrators[0].isLocalVibrator).assertEqual(true);

          const freshVibratorsData = vibrator.getVibratorInfoSync();
          hilog.info(domain, tag, `${TAG}  freshVibratorsData[0].deviceId = ${freshVibratorsData[0].deviceId}`);
          hilog.info(domain, tag, `${TAG}  vibrators[0].deviceId         = ${vibrators[0].deviceId}`);
          hilog.info(domain, tag, `${TAG}  vibrators.length              = ${vibrators.length}`);
          hilog.info(domain, tag, `${TAG}  freshVibratorsData.length     = ${freshVibratorsData.length}`);
          expect(freshVibratorsData[0].deviceId >= -1).assertEqual(true);
          expect(vibrators[0].deviceId === freshVibratorsData[0].deviceId).assertEqual(true);
          expect(vibrators.length > 0).assertEqual(true);
          expect(freshVibratorsData.length > 0).assertEqual(true);
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag, TAG + " getVibratorInfoSync error: " + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }
        hilog.info(domain, tag, TAG + " end");
      } else {
        hilog.info(domain, tag, TAG + ' is not supported on this device.');
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest23
     * @tc.number UniversalVibratorJsTest23
     * @tc.desc   Test startVibration with excessive duration (1800001ms) and verify that it returns permission error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest23", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest23"
      hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
      try {
        const effect: vibrator.VibrateEffect = {
          type: "time",
          duration: 1800001
        };
        const attribute: vibrator.VibrateAttribute = {
          usage: "alarm"
        };
        await vibrator.startVibration(effect, attribute);
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + " startVibration error: " + JSON.stringify(error));
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(error.message).assertEqual("start vibrator failed");
        done();
      }
      hilog.info(domain, tag, TAG + " end");
    })

    /**
     * @tc.name   UniversalVibratorJsTest24
     * @tc.number UniversalVibratorJsTest24
     * @tc.desc   Test addContinuousEvent method with valid parameters to verify continuous vibration event can be added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest24", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest24";
      try {
        let builder = new vibrator.VibratorPatternBuilder();
        expect(builder !== null).assertEqual(true);
        expect(builder !== undefined).assertEqual(true);
        builder.addContinuousEvent(0, 272);
        hilog.info(domain, tag, TAG + " addContinuousEvent success");
        expect(builder !== null).assertEqual(true);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + " addContinuousEvent error: " + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest25
     * @tc.number UniversalVibratorJsTest25
     * @tc.desc   Test addTransientEvent method with valid parameters to verify continuous vibration event can be added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest25", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest25";
      try {
        let builder = new vibrator.VibratorPatternBuilder();
        expect(builder !== null).assertEqual(true);
        expect(builder !== undefined).assertEqual(true);
        builder.addTransientEvent(0);
        hilog.info(domain, tag, TAG + " addTransientEvent success");
        expect(builder !== null).assertEqual(true);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + " addTransientEvent error: " + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   UniversalVibratorJsTest26
     * @tc.number UniversalVibratorJsTest26
     * @tc.desc   Test HapticFeedback effect constants to verify all predefined vibration effect types have correct string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("UniversalVibratorJsTest26", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "UniversalVibratorJsTest26"
      hilog.info(domain, tag, TAG + ' isAvailable ' + isAvailable);
      let data1 = vibrator.HapticFeedback.EFFECT_SOFT;
      hilog.info(domain, tag, TAG + ` data1: ${data1}`);
      expect(data1).assertEqual('haptic.effect.soft');
      let data2 = vibrator.HapticFeedback.EFFECT_HARD;
      hilog.info(domain, tag, TAG + ` data2: ${data2}`);
      expect(data2).assertEqual('haptic.effect.hard');
      let data3 = vibrator.HapticFeedback.EFFECT_SHARP;
      hilog.info(domain, tag, TAG + ` data3: ${data3}`);
      expect(data3).assertEqual('haptic.effect.sharp');
      let data4 = vibrator.HapticFeedback.EFFECT_NOTICE_SUCCESS;
      hilog.info(domain, tag, TAG + ` data4: ${data4}`);
      expect(data4).assertEqual('haptic.notice.success');
      let data5 = vibrator.HapticFeedback.EFFECT_NOTICE_FAILURE;
      hilog.info(domain, tag, TAG + ` data5: ${data5}`);
      expect(data5).assertEqual('haptic.notice.fail');
      let data6 = vibrator.HapticFeedback.EFFECT_NOTICE_WARNING;
      hilog.info(domain, tag, TAG + ` data6: ${data6}`);
      expect(data6).assertEqual('haptic.notice.warning');
      done();
    })

  })
}