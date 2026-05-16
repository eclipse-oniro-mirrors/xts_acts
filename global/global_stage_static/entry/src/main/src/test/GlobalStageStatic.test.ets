/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterEach,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import i18n from '@ohos.i18n'
import deviceInfo from '@ohos.deviceInfo'
import intl from '@ohos.intl'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function globalStageTest() {

  describe("globalStageTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start globalStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      resContext = abilityDelegator.getAppContext()
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   getMediaContent_stage_test_static_0100
     * @tc.number getMediaContent_stage_test_static_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContent_stage_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_res_9001001 start');
      try {
        res.getMediaContent(0x01234567, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001001 end');
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0200
     * @tc.number getMediaContent_stage_test_static_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContent_stage_test_static_0200", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent_callback_9001002 start');
      try {
        res.getMediaContent(0x01000014, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001002 end');
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0300
     * @tc.number getMediaContent_stage_test_static_0300
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContent_stage_test_static_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent_callback_9001002 start');
      try {
        res.getMediaContent(0x01000014, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent callback 9001002 end');
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0400
     * @tc.number getMediaContent_stage_test_static_0400
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getRawFileContentSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETRAWFILECONTENTSYNC_STAGE_static_0100
     * @tc.desc   getRawFileContentSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFileContentSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Uint8Array =
        res.getRawFileContentSync('rawfiletest.xml');
      hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContentSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaByNameSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_static_0100
     * @tc.desc   getMediaByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaByNameSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Uint8Array = res.getMediaByNameSync('app_icon');
      console.log('getMediaByNameSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getConfigurationSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETCONFIGURATIONSYNC_STAGE_static_0100
     * @tc.desc   getConfigurationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getConfigurationSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      console.log('getConfigurationSync_stagetest_static_0100 1' + JSON.stringify(value));
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaByNameSync_stagetest_static_0200
     * @tc.number SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_static_0200
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaByNameSync_stagetest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        res.getMediaByNameSync('invalidName', 0);
      } catch (error: BusinessError) {
        console.log('getMediaByNameSync_stagetest_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
        done();
      }
    })

    /**
     * @tc.name   getDeviceCapabilitySync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETDEVICECAPABILITYSYNC_STAGE_static_0100
     * @tc.desc   getDeviceCapabilitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDeviceCapabilitySync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      console.log('getDeviceCapabilitySync_stagetest_static_0100 1' + JSON.stringify(value));
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GetLocales_static_0010
     * @tc.number SUB_GLOBAL_GetLocales_static_0010
     * @tc.desc   getLocales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GetLocales_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let value: string = res.getLocales().toString();
      console.log('SUB_GLOBAL_GetLocales_static_0010' + value);
      expect(value).assertEqual("");
      done();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_isRawDir_static_0010
     * @tc.number SUB_GOLBAL_REMSGR_isRawDir_static_0010
     * @tc.desc   isRawDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_isRawDir_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let value: boolean = res.isRawDir('rawfiletest.xml');
      console.log('SUB_GOLBAL_REMSGR_isRawDir_static_0010_value' + value);
      expect(value == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010
     * @tc.desc   getOverrideConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let value: resourceManager.Configuration = res.getOverrideConfiguration();
      console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_static_0010_value' + value.mnc);
      expect(value.mnc == 0).assertTrue();
    })


    /**
     * @tc.name   SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010
     * @tc.desc   getOverrideResourceManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.LIGHT,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }
      let value =
        res.getOverrideResourceManager(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_static_0010_value' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 460).assertTrue();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010
     * @tc.desc   updateOverrideConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010', Level.LEVEL0, async (): Promise<void> => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 461,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.DARK,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }
      let value = res.getOverrideResourceManager();
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010_value-before' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc != 461).assertTrue();
      value.updateOverrideConfiguration(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_static_0010_value-after' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 461).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0010
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0100
     * @tc.desc   %2$d(The second parameter is an integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0010', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001b, "format string", 10, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0010 value_one:' + value_one);
      expect(value_one).assertEqual('10 TestTest');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0020
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0200
     * @tc.desc   %2$d(The second parameter is an integer in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0020', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100002a, "format string", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0020 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0030
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0300
     * @tc.desc   %2$d(The second parameter is a decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0030', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000022, "format string", 10.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0030 value_one:' + value_one);
      expect(value_one).assertEqual('10');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0040
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0400
     * @tc.desc   %2$d(The second parameter is a decimal number in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0040', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000015, "format string", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0040 value_one:' + value_one);
      expect(value_one).assertEqual('0');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0050
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0500
     * @tc.desc   %3$s(The third parameter is a Chinese string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0050', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000014, "format string", 12, "测试测试");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0050 value_one:' + value_one);
      expect(value_one).assertEqual('测试测试');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0060
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0600
     * @tc.desc   %3$s(The third parameter is an English string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0060', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001e, "format string", 12, "TestTest");
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0060 value_one:' + value_one);
      expect(value_one).assertEqual('TestTest');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0070
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0700
     * @tc.desc   %4$f(The fourth parameter is an integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0070', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001c, "format string", 12, "TestTest", 20);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0070 value_one:' + value_one);
      expect(value_one).assertEqual('20');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0080
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0800
     * @tc.desc   %4$f(The fourth parameter is an integer in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0080', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000010, "format string", 12, "TestTest", 1.234568E+16);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0080 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0090
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_0900
     * @tc.desc   %4$f(The fourth parameter is a decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0090', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000020, "format string", 12, "TestTest", 20.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0090 value_one:' + value_one);
      expect(value_one).assertEqual('20.01');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0100
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1000
     * @tc.desc   %4$f(The fourth parameter is a decimal number in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0100', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000020, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0100 value_one:' + value_one);
      expect(value_one).assertEqual('0');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0110
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1100
     * @tc.desc   %%d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0110', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000012, 12);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0110 value_one:' + value_one);
      expect(value_one).assertEqual('%d');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0120
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1200
     * @tc.desc   %%%s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0120', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000023, "format string", 12, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0120 value_one:' + value_one);
      expect(value_one).assertEqual('%format string');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0130
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1300
     * @tc.desc   %%%%f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0130', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000021, 12.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0130 value_one:' + value_one);
      expect(value_one).assertEqual('%%f');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0140
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1400
     * @tc.desc   %2$d %3$s %4$f(The second parameter is integer, the third is Chinese, the fourth is decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0140', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000016,
        "format string", 10, "测试测试", 98.78);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0140 value_one:' + value_one);
      expect(value_one).assertEqual('10 测试测试 98.78');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0150
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1500
     * @tc.desc   %2$d %3$s %4$f(The second parameter is integer in scientific notation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0150', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000013,
        "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0150 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000 TestTest 0');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0160
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1600
     * @tc.desc   %2$d %3$s %4$f %%d(The parameter is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0160', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001d);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0160 value_one:' + value_one);
      expect(value_one).assertEqual('%d %1$d');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0170
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1700
     * @tc.desc   %d %1$d(The parameter is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0170', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001d);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0170 value_one:' + value_one);
      expect(value_one).assertEqual('%d %1$d');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0180
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1800
     * @tc.desc   %2$d %3$s %4$f(There are more parameters than placeholder indexes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0180', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000011, "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest",
        1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0180 value_one:' + value_one);
      expect(value_one).assertEqual('30 测试测试 98.78');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0190
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_1900
     * @tc.desc   %d %1$d(Inconsistent placeholder styles)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0190', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x0100001a, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0190 value_one:' + value_one);
      expect(value_one).assertEqual('40 40');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0200
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2000
     * @tc.desc   %%%d %1$d(Inconsistent placeholder styles)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0200', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000024, 40);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0200 value_one:' + value_one);
      expect(value_one).assertEqual('%40 40');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0210
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2100
     * @tc.desc   %d %d %s %s %f %f(Arguments and placeholder match and equal in number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0210', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one = resMgr.getStringSync(0x01000027, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0210 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0220
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2200
     * @tc.desc   %d %d %s %s %f %f(The parameters is more than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_static_0220', Level.LEVEL2, () => {
      let resMgr = res;
      let value_one =
        resMgr.getStringSync(0x01000029, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08, 15,
          "format string", 15.01);
      hilog.info(0x0000, 'testTag', '%{public}s',
        'resourceManager_test_getStringSync_static_0220 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0230
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2300
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_static_0230', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x0100002a);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0230' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0260
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2600
     * @tc.desc   The wrong parameter type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_static_0260', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x01000028, "format string", "format", "1.5", "string");
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0260' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_static_0290
     * @tc.number SUB_GLOBAL_FormatStringIndex_static_2900
     * @tc.desc   Parameters less than required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_static_0290', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync(0x01000027);
      } catch (error: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getStringSync_static_0290' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_GetSymbol_static_0010
     * @tc.number SUB_GLOBAL_getSymbol_static_0010
     * @tc.desc   getSymbol resource not found by resid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_GetSymbol_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: long = res.getSymbol(0x0100003e);
      console.log('SUB_GLOBAL_Getsymbol_static_0010_value' + value);
      expect(value == 983043).assertTrue();
      done();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0020
     * @tc.number SUB_GLOBAL_getSymbol_static_0020
     * @tc.desc   getSymbol resource by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_static_0020', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbol(0x01000042);
      console.log('resourceManager_test_getSymbol_static_0020:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0040
     * @tc.number SUB_GLOBAL_getSymbol_static_0040
     * @tc.desc   getSymbol resource resId invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_static_0040', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getSymbol(0x01234567);
        console.log('resourceManager_test_getSymbol_static_0040:' + value);
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_getSymbol_static_0040_errorCode' + error.code);
        console.log('resourceManager_test_getSymbol_static_0040_errorMessage' + error.message);
        expect(error.code).assertEqual(9001001);
      }
    })


    /**
     * @tc.name   resourceManager_test_getSymbol_static_0050
     * @tc.number SUB_GLOBAL_getSymbol_static_0050
     * @tc.desc   getSymbol resource resId invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_static_0050', Level.LEVEL3, () => {
      try {
        let value = res.getSymbol(0x01000002);
        console.log('resourceManager_test_getSymbol_static_0050:' + value);
      } catch (error: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0050_errorCode' + error.code);
        console.log('resourceManager_test_getSymbol_static_0050_errorMessage' + error.message);
        expect(error.code == 9001002).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0060
     * @tc.number SUB_GLOBAL_getSymbol_static_0060
     * @tc.desc   getSymbol resource resource re-ref too much by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_static_0060', Level.LEVEL3, () => {
      try {
        let value = res.getSymbol(0x0100003e);
        console.log('resourceManager_test_getSymbol_static_0060:' + value);
      } catch (error: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0060' + error.code);
        console.log('resourceManager_test_getSymbol_0060_errorMessage' + error.message);
        expect(error.code == 9001006).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_GetSymbol_static_0130
     * @tc.number SUB_GLOBAL_getSymbol_static_0130
     * @tc.desc   getSymbolByName normal name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_GetSymbol_static_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: long = res.getSymbolByName('symbolTest1');
      console.log('SUB_GLOBAL_Getsymbol_static_0130' + value);
      expect(value == 983043).assertTrue();
      done();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0140
     * @tc.number SUB_GLOBAL_getSymbol_static_0140
     * @tc.desc   getSymbolByName reference resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_static_0140', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbolByName('symbolTestReference');
      console.log('resourceManager_test_getSymbol_static_0140:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0160
     * @tc.number SUB_GLOBAL_getSymbol_static_0160
     * @tc.desc   getSymbolByName resName invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_static_0160', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getSymbolByName('invalidName');
        console.log('resourceManager_test_getSymbol_static_0160:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0160_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_static_0160_errorMessage' + e.message);
        expect(e.code == 9001003).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0180
     * @tc.number SUB_GLOBAL_getSymbol_static_0180
     * @tc.desc   getSymbolByName resource re-ref too much
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_static_0180', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getSymbolByName('symbolTestB');
        console.log('resourceManager_test_getSymbol_static_0180:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getSymbol_static_0180_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_static_0180_errorMessage' + e.message);
        expect(e.code == 9001006).assertTrue();
      }
    })


    /**
     * @tc.name   resourceManager_test_getSymbol_static_0190
     * @tc.number SUB_GLOBAL_getSymbol_static_0190
     * @tc.desc   getSymbol normal resource by resId in Chinese
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_static_0190', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbol(0x0100003f);
      console.log('resourceManager_test_getSymbol_static_0190:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_static_0210
     * @tc.number SUB_GLOBAL_getSymbol_static_0210
     * @tc.desc   getSymbolByName normal name ZH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_static_0210', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getSymbolByName('symbolTest2');
      console.log('resourceManager_test_getSymbol_static_0210:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFdSync_static_0020
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0020
     * @tc.desc   getRawFdSync with subdirectory non-empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFdSync_static_0020', Level.LEVEL3, async (): Promise<void> => {
      let value = res.getRawFdSync('A/test.txt');
      console.log('resourceManager_test_getRawFdSync_static_0020_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_static_0020_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_static_0020_length' + value.length);
      expect(value != null && value.length == 4).assertTrue();
      res.closeRawFdSync('A/test.txt');
    })

    /**
     * @tc.name   resourceManager_test_getRawFdSync_static_0030
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0030
     * @tc.desc   getRawFdSync with subdirectory empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFdSync_static_0030', Level.LEVEL3, async (): Promise<void> => {
      let value = res.getRawFdSync('A/none.xml');
      console.log('resourceManager_test_getRawFdSync_static_0030_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_static_0030_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_static_0030_length' + value.length);
      expect(value != null && value.length == 0).assertTrue();
      res.closeRawFdSync('A/none.xml');
    })

    /**
     * @tc.name   resourceManager_test_getRawFdSync_static_0050
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0050
     * @tc.desc   getRawFdSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFdSync_static_0050', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getRawFdSync('error_path.xml');
        console.log('resourceManager_test_getRawFdSync_static_0050:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getRawFdSync_static_0050_errorCode' + e.code);
        console.log('resourceManager_test_getRawFdSync_static_0050_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getRawFileContentSync_static_0170
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0170
     * @tc.desc   getRawFileContentSync with subdirectory empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileContentSync_static_0170', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/none.xml');
      hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0170:' + value);
      expect(value.length == 0).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileContentSync_static_0160
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0160
     * @tc.desc   getRawFileContentSync with subdirectory non-empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileContentSync_static_0160', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/test.txt');
      hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0160:' + value);
      expect(value.length == 4).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileContentSync_static_0190
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0190
     * @tc.desc   getRawFileContentSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFileContentSync_static_0190', Level.LEVEL3, () => {
      try {
        let value = res.getRawFileContentSync('error_path.xml');
        hilog.info(0x0000, 'testTag', '%{public}s', 'resourceManager_test_getRawFileContentSync_static_0190:' + value);
      } catch (e: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getRawFileContentSync_static_0190_errorCode' + e.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'resourceManager_test_getRawFileContentSync_static_0190_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_getRawFileListSync_static_0120
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0120
     * @tc.desc   getRawFileListSync with subdirectory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileListSync_static_0120', Level.LEVEL2, async (): Promise<void> => {
      let value = res.getRawFileListSync('A');
      console.log('resourceManager_test_getRawFileListSync_static_0120:' + value);
      expect(value.length >= 102).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileListSync_static_0140
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0140
     * @tc.desc   getRawFileListSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFileListSync_static_0140', Level.LEVEL3, async (): Promise<void> => {
      try {
        let value = res.getRawFileListSync('error_path');
        console.log('resourceManager_test_getRawFileListSync_static_0140:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getRawFileListSync_static_0140_errorCode' + e.code);
        console.log('resourceManager_test_getRawFileListSync_static_0140_errorMessage' + e.message);
        expect(e.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.name   resourceManager_test_closeRawFdSync_static_0100
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_static_0100
     * @tc.desc   closeRawFdSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_closeRawFdSync_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.closeRawFdSync('error_path.xml');
        console.log('resourceManager_test_closeRawFdSync_static_0100:');
      } catch (err) {
        let error = err as BusinessError
        console.log('resourceManager_test_closeRawFdSync_static_0100_errorCode' + error.code);
        console.log('resourceManager_test_closeRawFdSync_static_0100_errorMessage' + error.message);
        expect(error.code == 9001005).assertTrue();
      }
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1000
     * @tc.number getStringArrayValue_stage_test_static_1000
     * @tc.desc   errcode 9001001 in promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue resId promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue resId promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1011
     * @tc.number getStringArrayValue_stage_test_static_1011
     * @tc.desc   errcode 9001002 in promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1011', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01000008).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })
    /**
     * @tc.name   getStringArrayValue_stage_test_static_1012
     * @tc.number getStringArrayValue_stage_test_static_1012
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1012', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100002e).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getStringArrayValue_resId_promise_9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1013
     * @tc.number getStringArrayValue_stage_test_static_1013
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getStringArrayValue_stage_test_static_1013", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_9001001 start');
      try {
        res.getStringArrayValue(0x01234567, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue resId callback 9001001 end');
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1014
     * @tc.number getStringArrayValue_stage_test_static_1014
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getStringArrayValue_stage_test_static_1014", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getStringArrayValue_callback_res_9001002 start');
      try {
        res.getStringArrayValue(0x01000007, (err: BusinessError<void> | null, data: Array<string> | undefined) => {
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue resId callback 9001002 end');
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1100
     * @tc.number getStringArrayValue_stage_test_static_1100
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01234567, (err: BusinessError<void> | null) => {
        console.log('getStringArrayValue_stage_test_static_1100 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1200
     * @tc.number getStringArrayValue_stage_test_static_1200
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100000c, (err: BusinessError<void> | null) => {
        console.log('getStringArrayValue_stage_test_static_1200 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1300
     * @tc.number getStringArrayValue_stage_test_static_1300
     * @tc.desc   errcode 9001006 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100002e, (err: BusinessError<void> | null) => {
        console.log('getStringArrayValue_stage_test_static_1300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1500
     * @tc.number getStringArrayValue_stage_test_static_1500
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100000c).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        console.log('getStringArrayValue_stage_test_static_1500 error code:' + error.code);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })


    /**
     * @tc.name   getStringArrayValue_stage_test_static_1600
     * @tc.number getStringArrayValue_stage_test_static_1600
     * @tc.desc   errcode 9001006 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x0100002e).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        console.log('getStringArrayValue_stage_test_static_1600 error code:' + error.code);
        expect(error.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0500
     * @tc.number getMediaContent_stage_test_static_0500
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContent_stage_test_static_0500", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent  callback err code 9001001 start');
      try {
        res.getMediaContent(0x01234567, 0, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent density callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent density callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent density callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent density callback 9001001 end');
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0600
     * @tc.number getMediaContent_stage_test_static_0600
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x0100000c).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent  promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0800
     * @tc.number getMediaContent_stage_test_static_0800
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_0800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, 0).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent density  promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent  density promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_0900
     * @tc.number getMediaContent_stage_test_static_0900
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContent_stage_test_static_0900", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent  density callback err code 9001002 start');
      try {
        res.getMediaContent(0x0100000c, 0, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
          hilog.info(domain, tag, 'getMediaContent density callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContent density callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContent density callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContent density callback 9001002 end');
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_1200
     * @tc.number getMediaContent_stage_test_static_1200
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x0100000c, 0).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent density promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent density promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_static_1400
     * @tc.number getStringArrayValue_stage_test_static_1400
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_static_1400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayValue(0x01234567).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_1700
     * @tc.number getMediaContent_stage_test_static_1700
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_1700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1700 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_1800
     * @tc.number getMediaContent_stage_test_static_1800
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_1800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01000005, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1800 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_1900
     * @tc.number getMediaContent_stage_test_static_1900
     * @tc.desc   errcode 9001001 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_1900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_1900 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_2000
     * @tc.number getMediaContent_stage_test_static_2000
     * @tc.desc   errcode 9001002 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_2000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01000005, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContent_stage_test_static_2000 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_2100
     * @tc.number getMediaContent_stage_test_static_2100
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_2100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContent(0x01234567).then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_2200
     * @tc.number getMediaContent_stage_test_static_2200
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_2200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01000005)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_2300
     * @tc.number getMediaContent_stage_test_static_2300
     * @tc.desc   errcode 9001001 in promise mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_2300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01234567, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.name   getMediaContent_stage_test_static_2400
     * @tc.number getMediaContent_stage_test_static_2400
     * @tc.desc   errcode 9001002 in promise mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_static_2400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContent(0x01000005, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContent_stage_test_static_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1100
     * @tc.number getMediaContentBase64_stage_test_static_1100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_1100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001001 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001001 error.message' + error.message);
        expect(error.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1200
     * @tc.number getMediaContentBase64_stage_test_static_1200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContentBase64 resId promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1300
     * @tc.number getMediaContentBase64_stage_test_static_1300
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContentBase64_stage_test_static_1300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 201 start');
      try {
        res.getMediaContentBase64(0x01234567, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001001);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001001 end');
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1400
     * @tc.number getMediaContentBase64_stage_test_static_1400
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getMediaContentBase64_stage_test_static_1400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 9001002 start');
      try {
        res.getMediaContentBase64(0x01000031, (err: BusinessError<void> | null, data: string | undefined) => {
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 data ' + JSON.stringify(data));
          hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 err ' + JSON.stringify(err));
          expect(err?.code).assertEqual(9001002);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'getMediaContentBase64 resId callback 9001002 ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'getStringArrayValue callback 9001002 end');
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1700
     * @tc.number getMediaContentBase64_stage_test_static_1700
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_1700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1700 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1800
     * @tc.number getMediaContentBase64_stage_test_static_1800
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_1800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1800 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_1900
     * @tc.number getMediaContentBase64_stage_test_static_1900
     * @tc.desc   errcode 9001001 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_1900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01234567, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_1900 error code:' + err?.code);
        expect(err?.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.name   getMediaContentBase64_stage_test_static_2000
     * @tc.number getMediaContentBase64_stage_test_static_2000
     * @tc.desc   errcode 9001002 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_2000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaContentBase64(0x01000031, 0, (err: BusinessError<void> | null) => {
        console.log('getMediaContentBase64_stage_test_static_2000 error code:' + err?.code);
        expect(err?.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_2100
     * @tc.number getMediaContentBase64_stage_test_static_2100
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_2100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01234567)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_2200
     * @tc.number getMediaContentBase64_stage_test_static_2200
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_2200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01000031)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_2300
     * @tc.number getMediaContentBase64_stage_test_static_2300
     * @tc.desc   errcode 9001001 in promise mode by resId with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_2300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01234567, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      }
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_static_2400
     * @tc.number getMediaContentBase64_stage_test_static_2400
     * @tc.desc   errcode 9001002 in promise mode by resId with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_static_2400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data = await res.getMediaContentBase64(0x01000031, 0)
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64_stage_test_static_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      }
    })

    /**
     * @tc.name   getStringByName_stage_test_static_0100
     * @tc.number getStringByName_stage_test_static_0100
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringByName('', (err: BusinessError<void> | null) => {
        console.log('getStringByName_stage_test_static_0100 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_static_0100
     * @tc.number getStringArrayByName_stage_test_static_0100
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayByName('', (err: BusinessError<void> | null) => {
        console.log('getStringArrayByName_stage_test_static_0100 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_static_0300
     * @tc.number getMediaByName_test_static_0300
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaByName('', (err: BusinessError<void> | null) => {
        console.log('getMediaByName_test_static_0300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })


    /**
     * @tc.name   getStringByName_stage_test_static_0200
     * @tc.number getStringByName_stage_test_static_0200
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringByName('test_stringLoopA', (err: BusinessError<void> | null) => {
        console.log('getStringByName_stage_test_static_0200 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })


    /**
     * @tc.name   getStringByName_stage_test_static_0300
     * @tc.number getStringByName_stage_test_static_0300
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringByName('').then(() => {
      }).catch((err: Error): void => {
        console.log('getStringByName_stage_test_static_0300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringByName_stage_test_static_0400
     * @tc.number getStringByName_stage_test_static_0400
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringByName('test_stringLoopA').then(() => {
      }).catch((err: Error): void => {
        console.log('getStringByName_stage_test_static_0400 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByName_test_static_0400
     * @tc.number getMediaBase64ByName_test_static_0400
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaBase64ByName('', 0, (err: BusinessError<void> | null) => {
        console.log('getMediaBase64ByName_test_static_0400 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringSync_test_static_0100
     * @tc.number getStringSync_test_static_0100
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000034)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0200
     * @tc.number getStringSync_test_static_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0200', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000019)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0300
     * @tc.number getStringSync_test_static_0300
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0300', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000034, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0400
     * @tc.number getStringSync_test_static_0400
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0400', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01000012, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0400 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0500
     * @tc.number getStringSync_test_static_0500
     * @tc.desc   errcode 9001007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0500', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x0100002a, 'test', 1)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0500 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0600
     * @tc.number getStringSync_test_static_0600
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0600', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0600 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   getStringSync_test_static_0700
     * @tc.number getStringSync_test_static_0700
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_0700', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567, 'aaa', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_0700 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   getStringByNameSync_test_static_0100
     * @tc.number getStringByNameSync_test_static_0100
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringByNameSync('test_stringLoopB')
      } catch (err: BusinessError) {
        console.log('getStringByNameSync_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   getStringByNameSync_test_static_0300
     * @tc.number getStringByNameSync_test_static_0300
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByNameSync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringByNameSync('boolean_static_2', 'aaa', 1)
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringByNameSync_test_static_0300 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getStringByNameSync_test_static_0400
     * @tc.number getStringByNameSync_test_static_0400
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByNameSync_test_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringByNameSync('test_stringLoopB', 'aaa', 1)
      } catch (err:BusinessError) {
        console.log('getStringByNameSync_test_static_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })


    /**
     * @tc.name   getBoolean_test_static_0100
     * @tc.number getBoolean_test_static_0100
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBoolean_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBoolean(0x01000031)
      } catch (err) {
        let error = err as BusinessError
        console.log('getBoolean_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   getBoolean_test_static_0200
     * @tc.number getBoolean_test_static_0200
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBoolean_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBoolean(0x01234567)
      } catch (err) {
        let error = err as BusinessError
        console.log('getBoolean_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getBoolean_test_static_0500
     * @tc.number getBoolean_test_static_0500
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBoolean_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBoolean(0x01000006)
      } catch (err) {
        let error = err as BusinessError
        console.log('getBoolean_test_0500 error code:' + error.code);
        expect(error.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   getBooleanByName_test_static_0100
     * @tc.number getBooleanByName_test_static_0100
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBooleanByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBooleanByName("")
      } catch (err) {
        let error = err as BusinessError
        console.log('getBooleanByName_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getBooleanByName_test_static_0200
     * @tc.number getBooleanByName_test_static_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getBooleanByName_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getBooleanByName("boolean_4")
      } catch (err) {
        let error = err as BusinessError
        console.log('getBooleanByName_test_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   getInt_test_static_0100
     * @tc.number getInt_test_static_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getInt_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getInt(0x01234567)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getInt_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   getDouble_test_static_0100
     * @tc.number getDouble_test_static_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDouble_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getDouble(0x01234567)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getDouble_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
      }
    })

    /**
     * @tc.name   getInt_test_static_0200
     * @tc.number getInt_test_static_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getInt_test_static_0200', Level.LEVEL3, () => {
      try {
        res.getInt(0x01000034)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getInt_test_static_0200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   getDouble_test_static_0200
     * @tc.number getDouble_test_static_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDouble_test_static_0200', Level.LEVEL3, () => {
      try {
        res.getDouble(0x01000034)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getDouble_test_static_0200 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
      }
    })

    /**
     * @tc.name   getInt_test_static_0300
     * @tc.number getInt_test_static_0300
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getInt_test_static_0300', Level.LEVEL3, () => {
      try {
        res.getInt(0x01000004)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getInt_test_static_0300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })
    
    /**
     * @tc.name   getDouble_test_static_0300
     * @tc.number getDouble_test_static_0300
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDouble_test_static_0300', Level.LEVEL3, () => {
      try {
        res.getDouble(0x0100003b)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getDouble_test_static_0300 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
      }
    })

    /**
     * @tc.name   getIntByName_test_static_0100
     * @tc.number getIntByName_test_static_0100
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getIntByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getIntByName('')
      } catch (err) {
        let error = err as BusinessError
        console.log('getIntByName_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getDoubleByName_test_static_0100
     * @tc.number getDoubleByName_test_static_0100
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDoubleByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDoubleByName('')
      } catch (err) {
        let error = err as BusinessError
        console.log('getDoubleByName_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getIntByName_test_static_0200
     * @tc.number getIntByName_test_static_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getIntByName_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getIntByName('integer_loopA')
      } catch (err) {
        let error = err as BusinessError
        console.log('getIntByName_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001006);
      }
    })
    
    /**
     * @tc.name   getDoubleByName_test_static_0200
     * @tc.number getDoubleByName_test_static_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDoubleByName_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDoubleByName('float_loopA')
      } catch (err) {
        let error = err as BusinessError
        console.log('getDoubleByName_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   getRawFileContent_test_static_0100
     * @tc.number getRawFileContent_test_static_0100
     * @tc.desc   errcode 9001005 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFileContent_test_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getRawFileContent('plural_name_loop', (err: BusinessError<void> | null) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_0100 error code:' + err?.code);
        expect(JSON.stringify(err?.code)).assertEqual('9001005');
        done();
      })
    })

    /**
     * @tc.name   getRawFileContent_test_static_0200
     * @tc.number getRawFileContent_test_static_0200
     * @tc.desc   errcode 9001005 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFileContent_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getRawFileContent('plural_name_loop').then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0200
     * @tc.number getDrawableDescriptor_stage_test_static_0200
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01234567)
      } catch (err: BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0300
     * @tc.number getDrawableDescriptor_stage_test_static_0300
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01000035)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })
    
    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0400
     * @tc.number getDrawableDescriptor_stage_test_static_0400
     * @tc.desc   errcode 9001001 debsity?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0400', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01234567, 0)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0500
     * @tc.number getDrawableDescriptor_stage_test_static_0500
     * @tc.desc   errcode 9001002 density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01000035, 0)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })


    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0600
     * @tc.number getDrawableDescriptor_stage_test_static_0600
     * @tc.desc   errcode 9001001 density? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0600', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01234567, 0, 1)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getDrawableDescriptor_stage_test_static_0700
     * @tc.number getDrawableDescriptor_stage_test_static_0700
     * @tc.desc   errcode 9001002 density? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptor_stage_test_static_0700', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptor(0x01000035, 0, 1)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptor_stage_test_static_0700 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   getDrawableDescriptorByName_test_static_0100
     * @tc.number getDrawableDescriptorByName_test_static_0100
     * @tc.desc   errcode 9001003 debsity? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptorByName_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptorByName('test_stringLoopA', 0, 1)
      } catch (err: BusinessError) {
        console.log('getDrawableDescriptorByName_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
      }
    })

    
    /**
     * @tc.name   getDrawableDescriptorByName_test_static_0200
     * @tc.number getDrawableDescriptorByName_test_static_0200
     * @tc.desc   errcode 9001003 debsity?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getDrawableDescriptorByName_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getDrawableDescriptorByName('', 0)
       } catch (err:BusinessError) {
        console.log('getDrawableDescriptorByName_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getRawFdSync_test_static_0100
     * @tc.number getRawFdSync_test_static_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFdSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getRawFdSync('notExist')
      } catch (err) {
        let error = err as BusinessError
        console.log('getRawFdSync_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001005);
      }
    })

    /**
     * @tc.name   getRawFileListSync_test_static_0100
     * @tc.number getRawFileListSync_test_static_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFileListSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getRawFileListSync('notExist')
      } catch (err) {
        let error = err as BusinessError
        console.log('getRawFileListSync_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001005);
      }
    })

    /**
     * @tc.name   getRawFileContentSync_test_static_0100
     * @tc.number getRawFileContentSync_test_static_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFileContentSync_test_static_0100', Level.LEVEL3, () => {
      try {
        res.getRawFileContentSync('notExist')
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContentSync_test_static_0100 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001005');
      }
    })

    /**
     * @tc.name   getMediaContentSync_test_static_0100
     * @tc.number getMediaContentSync_test_static_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentSync(0x01234567)
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaContentSync_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getMediaContentSync_test_static_0200
     * @tc.number getMediaContentSync_test_static_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentSync(0x0100000c)
      } catch (err: BusinessError) {
        console.log('getMediaContentSync_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   getMediaContentSync_test_static_0500
     * @tc.number getMediaContentSync_test_static_0500
     * @tc.desc   getMediaContentSync with res id density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContentSync_test_static_0500', Level.LEVEL2, async (): Promise<void> => {
      let value: Uint8Array = res.getMediaContentSync(0x01000043, 0);
      console.log('getMediaContentSync_test_static_0500 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_test_static_0100
     * @tc.number getMediaContentBase64Sync_test_static_0100
     * @tc.desc   getMediaContentBase64Sync with res id density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContentBase64Sync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getMediaContentBase64Sync(0x01000043, 0);
      console.log('getMediaContentBase64Sync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_test_static_0300
     * @tc.number getMediaContentBase64Sync_test_static_0300
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64Sync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync(0x01234567);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaContentBase64Sync_test_static_0300 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.name   getMediaContentBase64Sync_test_static_0500
     * @tc.number getMediaContentBase64Sync_test_static_0500
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64Sync_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaContentBase64Sync(0x01000005);
      } catch (err: BusinessError) {
        console.log('getMediaContentBase64Sync_test_static_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   getStringArrayValueSync_test_static_0100
     * @tc.number getStringArrayValueSync_test_static_0100
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValueSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x01234567);
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringArrayValueSync_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })


    /**
     * @tc.name   getStringArrayValueSync_test_static_0300
     * @tc.number getStringArrayValueSync_test_static_0300
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValueSync_test_static_0300', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x01000005);
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
      }
    })

    /**
     * @tc.name   getStringArrayValueSync_test_static_0500
     * @tc.number getStringArrayValueSync_test_static_0500
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValueSync_test_static_0500', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayValueSync(0x0100002e);
      } catch (err: BusinessError) {
        console.log('getStringArrayValueSync_test_static_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   getMediaByNameSync_test_static_0100
     * @tc.number getMediaByNameSync_test_static_0100
     * @tc.desc   with density by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaByNameSync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: Uint8Array = res.getMediaByNameSync('background', 0);
      console.log('getMediaByNameSync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaByNameSync_test_static_0200
     * @tc.number getMediaByNameSync_test_static_0200
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaByNameSync('invalidName', 0);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaByNameSync_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getMediaBase64ByNameSync_test_static_0100
     * @tc.number getMediaBase64ByNameSync_test_static_0100
     * @tc.desc   with density by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaBase64ByNameSync_test_static_0100', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getMediaBase64ByNameSync('background', 0);
      console.log('getMediaBase64ByNameSync_test_static_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaBase64ByNameSync_test_static_0200
     * @tc.number getMediaBase64ByNameSync_test_static_0200
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getMediaBase64ByNameSync('invalidName', 0);
      } catch (err) {
        let error = err as BusinessError
        console.log('getMediaBase64ByNameSync_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getStringArrayByNameSync_test_static_0100
     * @tc.number getStringArrayByNameSync_test_static_0100
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayByNameSync('invalidName');
      } catch (err) {
        let error = err as BusinessError
        console.log('getStringArrayByNameSync_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001003);
      }
    })

    /**
     * @tc.name   getStringArrayByNameSync_test_static_0200
     * @tc.number getStringArrayByNameSync_test_static_0200
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByNameSync_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.getStringArrayByNameSync('sizeListThree');
      } catch (err: BusinessError) {
        console.log('getStringArrayByNameSync_test_static_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_GetLocales_static_0020
     * @tc.number SUB_GLOBAL_GetLocales_static_0020
     * @tc.desc   getLocales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GetLocales_static_0020', Level.LEVEL2, async (): Promise<void> => {
      let value: string = res.getLocales(false).toString();
      console.log('SUB_GLOBAL_GetLocales_static_0020:' + value);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name   getStringSync_test_static_1400
     * @tc.number getStringSync_test_static_1400
     * @tc.desc   errcode 9001007 with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringSync_test_static_1400', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x0100002a, 'test', 0)
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_1400 error code:' + err.code);
        expect(JSON.stringify(err.code)).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   isRawDir_test_static_0100
     * @tc.number isRawDir_test_static_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('isRawDir_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.isRawDir('invalidPath');
      } catch (err) {
        let error = err as BusinessError
        console.log('isRawDir_test_static_0100 error code:' + error.code);
        expect(error.code).assertEqual(9001005);
      }
    })


    /**
     * @tc.name   getMediaBase64ByName_test_static_0500
     * @tc.number getMediaBase64ByName_test_static_0500
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_static_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaBase64ByName('').then(() => {
      }).catch((err: Error): void => {
        console.log('getMediaBase64ByName_test_static_0500 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByName_test_static_0600
     * @tc.number getMediaBase64ByName_test_static_0600
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaBase64ByName('', 0).then(() => {
      }).catch((err: Error): void => {
        console.log('getMediaBase64ByName_test_static_0600 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_static_0400
     * @tc.number getMediaByName_test_static_0400
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaByName('', 0, (err: BusinessError<void> | null) => {
        console.log('getMediaByName_test_static_0400 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_static_0500
     * @tc.number getMediaByName_test_static_0500
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_static_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaByName('').then(() => {
      }).catch((err: Error): void => {
        console.log('getMediaByName_test_static_0500 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_static_0600
     * @tc.number getMediaByName_test_static_0600
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaByName('', 0).then(() => {
      }).catch((err: Error): void => {
        console.log('getMediaByName_test_static_0600 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByName_test_static_0300
     * @tc.number getMediaBase64ByName_test_static_0300
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getMediaBase64ByName('', (err: BusinessError<void> | null) => {
        console.log('getMediaBase64ByName_test_static_0300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_static_0400
     * @tc.number getStringArrayByName_stage_test_static_0400
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayByName('sizeListThree').then(() => {
      }).catch((err: Error): void => {
        console.log('getStringArrayByName_stage_test_static_0400 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_static_0200
     * @tc.number getStringArrayByName_stage_test_static_0200
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayByName('sizeListThree', (err: BusinessError<void> | null) => {
        console.log('getStringArrayByName_stage_test_static_0200 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_static_0300
     * @tc.number getStringArrayByName_stage_test_static_0300
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res.getStringArrayByName('').then(() => {
      }).catch((err: Error): void => {
        console.log('getStringArrayByName_stage_test_static_0300 error code:' + err?.code);
        expect(err?.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByNameSync_stagetest_static_0100
     * @tc.number getMediaBase64ByNameSync_stagetest_static_0100
     * @tc.desc   getMediaBase64ByNameSync getMediaBase64ByNameSync with resource name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaBase64ByNameSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: string = res.getMediaBase64ByNameSync('background');
      console.log('getMediaBase64ByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })


    /**
     * @tc.name   getStringByNameSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETSTRINGBYNAME_STAGE_static_0100
     * @tc.desc   getStringByNameSync with resource name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringByNameSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: string = res.getStringByNameSync('app_name');
      console.log('getStringByNameSync_stagetest_static_0100 1' + value);
      expect(value).assertEqual('global_stage_static');
      done();
    })

    /**
     * @tc.name   getStringByNameSync_stagetest_static_0200
     * @tc.number SUB_GLOBAL_GETSTRINGBYNAME_STAGE_static_0200
     * @tc.desc   getStringByNameSync with resource name and format value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringByNameSync_stagetest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: string = res.getStringByNameSync('app_name', 100);
      console.log('getStringByNameSync_stagetest_static_0200 1' + value);
      expect(value).assertEqual('global_stage_static');
      done();
    })

    /**
     * @tc.name   getRawFdSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETRAWFDSYNC_STAGE_static_0100
     * @tc.desc   getRawFdSync with path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFdSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: resourceManager.RawFileDescriptor = res.getRawFdSync('rawfiletest.xml');
      console.log('getRawFdSync_stagetest_static_0100 1' + value.fd);
      console.log('getRawFdSync_stagetest_static_0100 1' + value.offset);
      expect(value !== null).assertTrue();
      res.closeRawFdSync('rawfiletest.xml');
      done();
    })

    /**
     * @tc.name   getRawFileListSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETRAWFILELISTSYNC_STAGE_static_0100
     * @tc.desc   getRawFileListSync with path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFileListSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Array<string> = res.getRawFileListSync('');
      console.log('getRawFileListSync_stagetest_static_0100 1' + value);
      console.log('getRawFileListSync_stagetest_static_0100 1' + value.length);
      expect(value !== null).assertTrue();
      done();
    })


    /**
     * @tc.name   getMediaContentSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_static_0100
     * @tc.desc   getMediaContentSync with res id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Uint8Array = res.getMediaContentSync(0x01000044);
      console.log('getMediaContentSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_static_0100
     * @tc.desc   getMediaContentBase64Sync with res id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64Sync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: string = res.getMediaContentBase64Sync(0x01000044);
      console.log('getMediaContentBase64Sync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getStringArrayValueSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_static_0100
     * @tc.desc   getStringArrayValueSync with res id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringArrayValueSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Array<string> =
        res.getStringArrayValueSync(0x0100002c);
      console.log('getStringArrayValueSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getStringArrayByNameSync_stagetest_static_0100
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYBYNAMESYNC_STAGE_static_0100
     * @tc.desc   getStringArrayByNameSync with resource name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringArrayByNameSync_stagetest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value: Array<string> = res.getStringArrayByNameSync('sizeList');
      console.log('getStringArrayByNameSync_stagetest_static_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   resourceManager_test_getStringByNameSync_static_0250
     * @tc.number SUB_GLOBAL_FormatStringIndex_2500
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required), resourceManager_test_getStringByNameSync_static_0250
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resourceManager_test_getStringByNameSync_static_0250', Level.LEVEL0, async (): Promise<void> => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyThree');
      } catch (error: BusinessError) {
        console.log('resourceManager_test_getStringByNameSync_static_0250' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })


    /**
     * @tc.name   resourceManager_test_getStringByNameSync_static_0310
     * @tc.number SUB_GLOBAL_FormatStringIndex_3100
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resourceManager_test_getStringByNameSync_static_0310', Level.LEVEL0, async (): Promise<void> => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFive');
      } catch (error: BusinessError) {
        console.log('resourceManager_test_getStringByNameSync_static_0310' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.name   resourceManager_test_getDrawable_static_0900
     * @tc.number SUB_GLOBAL_I18N_getDrawable_static_0900
     * @tc.desc   getDrawableDescriptorByName with not exist pic name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resourceManager_test_getDrawable_static_0900', Level.LEVEL0, async (): Promise<void> => {
      try {
        let value = res.getDrawableDescriptorByName('symbolTest2');
        console.log('resourceManager_test_getDrawable_static_0900:' + value);
      } catch (e: BusinessError) {
        console.log('resourceManager_test_getDrawable_static_0900_errorCode' + e.code);
        console.log('resourceManager_test_getDrawable_static_0900_errorMessage' + e.message);
        expect(e.code == 9001003).assertTrue();
      }
    })

    /**
     * @tc.name   closeRawFdSync_test_static_0100
     * @tc.number closeRawFdSync_test_static_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('closeRawFdSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res.closeRawFdSync('notExist')
       } catch (err:BusinessError) {
        console.log('closeRawFdSync_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
      }
    })

    /**
     * @tc.name   resourceProperty_test_static_0100
     * @tc.number resourceProperty_test_static_0100
     * @tc.desc   bundleName,moduleName,moduleName,id,params,type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resourceProperty_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      let resource: resourceManager.Resource = {
        bundleName: 'com.example.myapplication',
        moduleName: 'entry',
        id: 0x01234567,
        params: ["sdfd", 123],
        type: 10001,
      }
      expect(resource.bundleName).assertEqual('com.example.myapplication');
      expect(resource.moduleName).assertEqual('entry');
      expect(resource.id).assertEqual(0x01234567);
      expect(resource.params != null).assertTrue();
      expect(resource.type).assertEqual(10001);
    })

    console.log('*************end globalStageTest*************');
  })
}