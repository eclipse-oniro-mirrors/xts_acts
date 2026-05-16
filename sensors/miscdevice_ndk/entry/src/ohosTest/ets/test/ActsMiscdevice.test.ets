/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import vibrator from 'libentry.so'
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';
import { common } from '@kit.AbilityKit';
import vibrators from '@ohos.vibrator'

export default function ActsMiscdeviceNdkTest() {
  let isAvailable: boolean;
  const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
  describe('ActsMiscdeviceNdkTest', () => {
    beforeAll(async (done: Function) => {
      /*
       * @tc.setup: setup invoked before all testcases
       */
      console.info('beforeAll called')
      console.info('ActsMiscdeviceNdkTest Device type = ' + deviceInfo.deviceType);
      console.info('ActsMiscdeviceNdkTest isAvailable = ' + isAvailable);
      try {
        const vibratorsList : Array<vibrators.VibratorInfo> = vibrators.getVibratorInfoSync();
        if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
          (vibratorsList.length !== 0 && vibratorsList.every(vibrators => !vibrators.isLocalVibrator))) {
          isAvailable = false;
          console.info('ActsMiscdeviceNdkTest isAvailable ' + isAvailable);
          done()
        } else {
          isAvailable = true;
          console.info('ActsMiscdeviceNdkTest isAvailable ' + isAvailable);
          done()
        }
      } catch (error) {
        console.error('ActsMiscdeviceNdkTest exception :' + JSON.stringify(error))
        done()
      }
    })

    afterAll(() => {
      /*
      * @tc.teardown: teardown invoked after all testcases
      */
      console.info('afterAll called')
    })

    beforeEach(() => {
      /*
      * @tc.setup: setup invoked before each testcases
      */
      console.info('beforeEach called')
    })

    afterEach(() => {
      /*
      * @tc.teardown: teardown invoked after each testcases
      */
      console.info('afterEach called')
    })

    const USAGE_ALARM = 1;
    const USAGE_RING = 2;
    const g_duration = 300;
    const UNSUPPORTED = 801;
    const PARAMETER_ERROR = 401;
    const DEVICE_OPERATION_FAILED = 14600101;
    let TAG = ""

    /**
     * @tc.name   testActsMiscdeviceNdkTest001
     * @tc.number SEN_MISC_Miscdevice_ETS_0100
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest001"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let ret : number = vibrator.startVibrator(0, USAGE_ALARM);
      console.info(TAG + "Test MISC ret Result = " + ret);
      expect(ret).assertEqual(PARAMETER_ERROR);
      done()
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest002
     * @tc.number SEN_MISC_Miscdevice_ETS_0200
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest002"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let ret : number = vibrator.startVibrator(g_duration, USAGE_RING);
      console.info("Test MISC ret Result = " + ret);
      if (isAvailable) {
        expect(ret).assertEqual(0);
        ret = vibrator.cancel();
        expect(ret).assertEqual(0);
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        done()
      }
      
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest003
     * @tc.number SEN_MISC_Miscdevice_ETS_0300
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest003"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let ret : number = vibrator.cancel();
      console.info("Test MISC ret Result = " + ret);
      if (isAvailable) {
        expect(ret).assertEqual(0);
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        done()
      }  
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest004
     * @tc.number SEN_MISC_Miscdevice_ETS_0400
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest004"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('coin_drop.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('coin_drop.json')
      if (ret != 0) {
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      } else {
        expect(ret).assertEqual(0);
        vibrator.cancel();
        done()
      }  
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest005
     * @tc.number SEN_MISC_Miscdevice_ETS_0500
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest005"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_invalid_type.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_type.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest006
     * @tc.number SEN_MISC_Miscdevice_ETS_0600
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest006"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_invalid_startTime.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_startTime.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest007
     * @tc.number SEN_MISC_Miscdevice_ETS_0700
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest007"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_invalid_duration.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_duration.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest008
     * @tc.number SEN_MISC_Miscdevice_ETS_0800
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest008"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_invalid_intensity.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_intensity.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest009
     * @tc.number SEN_MISC_Miscdevice_ETS_0900
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest009"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_invalid_frequency.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_invalid_frequency.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest010
     * @tc.number SEN_MISC_Miscdevice_ETS_0100
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest010"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_129_event.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_129_event.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });

    /**
     * @tc.name   testActsMiscdeviceNdkTest011
     * @tc.number SEN_MISC_Miscdevice_ETS_0110
     * @tc.desc   OH_Misc_ActsMiscdeviceNdkTest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testActsMiscdeviceNdkTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>testActsMiscdeviceNdkTest011"
      console.info(TAG + ' isAvailable ' + isAvailable);
      let context: common.UIAbilityContext = globalThis.abilityContext;
      let file = await context.resourceManager.getRawFdSync('test_big_file_size.json');
      console.info(TAG + "getRawFdSync, file.fd =", file.fd, file.offset, file.length);
      let ret : number = vibrator.startVibratorCustom(file.fd, file.offset, file.length, USAGE_RING);
      console.info(TAG + "Test MISC ret Result = " + ret);
      await globalThis.abilityContext.resourceManager.closeRawFdSync('test_big_file_size.json')
      if (isAvailable) {
        expect(ret !== 0).assertTrue();
        done()
      } else {
        console.info(TAG + ' is not supported on this device.');
        expect(ret).assertEqual(UNSUPPORTED);
        done()
      }
    });
  })}