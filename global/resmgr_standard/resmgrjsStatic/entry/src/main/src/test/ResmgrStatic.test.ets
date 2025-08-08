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

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ResmgrTest() {

  describe("ResmgrTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start ResmgrTest*************');
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

    /* *
     * @tc.number  getStringValue_test_static_003
     * @tc.name    getStringValue_test_static_003
     * @tc.desc    get the string in callback mode
     */
    it('getStringValue_test_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getStringValue(0x01000000, (err: BusinessError<void> | null, value: string | undefined) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_003 ' + value);
        expect(value).assertEqual('resmgr');
        done();
      })
    })

    /* *
    * @tc.number  getStringValue_test_static_004
    * @tc.name    getStringValue_test_static_004
    * @tc.desc    get the string in promise mode
    */
    it('getStringValue_test_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getStringValue(0x01000000).then((value: string) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_004 ' + value);
        expect(value).assertEqual('resmgr');
        done();
      })
    })

    /* *
    * @tc.number getStringValue_test_static_005
    * @tc.name getStringValue_test_static_005
    * @tc.desc get the string in callback mode
    */
    it('getStringValue_test_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x1001 id not exist,throw 9001001 error code
      res?.getStringValue(0x1001, (err: BusinessError<void> | null, value: string | undefined) => {
        if (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_005 err.code' + err?.code);
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_005 err.message' + err?.message);
          expect(err?.code == 9001001).assertTrue();
          done();
        } else {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_005');
          expect(value !== null).assertTrue();
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_005 ' + value);
          done();
        }
      })
    })

    /* *
    * @tc.number SUB_GLOBAL_RESMGR_JS_static_0500
    * @tc.name getStringValue_test_static_006
    * @tc.desc  test getString method in callback mode get the string in callback mode
    */
    it('getStringValue_test_static_006', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x01000000 id is integer resource,throw 9001002 error code
      res?.getStringValue(0x01000002, (err: BusinessError<void> | null, value: string | undefined) => {
        if (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_006 err.code' + err?.code);
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_006 err.message' + err?.message);
          expect(err?.code == 9001002).assertTrue();
          done();
        } else {
          expect(value !== null).assertTrue();
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_006 ' + value);
          done();
        }
      })
    })

    /* *
    * @tc.number getStringValue_test_static_007
    * @tc.name   getStringValue_test_static_007
    * @tc.desc   test getString method in callback mode get the string in callback mode
    */
    it('getStringValue_test_static_007', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getStringValue(0x01000017, (err: BusinessError<void> | null, value: string | undefined) => {
        if (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_007 err.code' + err?.code);
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_007 err.message' + err?.message);
          expect(err?.code == 9001006).assertTrue();
          done();
        } else {
          expect(value !== null).assertTrue();
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_007 ' + value);
          done();
        }
      })
    })

    /* *
    * @tc.number getStringValue_test_static_0090
    * @tc.name getStringValue_test_static_0090
    * @tc.desc test getString method in promise mode
    */
    it('getStringValue_test_static_0090', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x1001 id not exist,throw 9001001 error code
      res?.getStringValue(0x1001).then((value: string) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 ' + value);
        expect(value).assertEqual('L2Test');
        done();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_009 error.message' + error.message);
        expect(JSON.stringify(error.code) == '9001001').assertTrue();
        done();
      })
    })

    /* *
    * @tc.number getStringValue_test_static_010
    * @tc.name getStringValue_test_static_010
    * @tc.desc test getString method in promise mode
    */
    it('getStringValue_test_static_010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x02000000 id is integer resource,throw 9001002 error code
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 promise start');
      res?.getStringValue(0x01000002).then((value: string) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 promise try' + value);
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 ' + value);
        expect(value).assertEqual('L2Test');
        done();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 promise catch');
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_010 error.message' + error.message);
        expect(JSON.stringify(error.code) == '9001002').assertTrue();
        done();
      })
    })

    /* *
    * @tc.number getStringValue_test_static_011
    * @tc.name getStringValue_test_static_011
    * @tc.desc test getString method in promise mode
    */
    it('getStringValue_test_static_011', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x01000006 id re-ref,throw 9001006 error code
      res?.getStringValue(0x01000019).then((value: string) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_011 ' + value);
        expect(value).assertEqual('%4$f');
        done();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_011 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringValue_test_static_011 error.message' + error.message);
        expect(JSON.stringify(error.code) == '9001006').assertTrue();
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_0800
    * @tc.name    getStringArrayValue_test_static_004
    * @tc.desc    test getStringArray method in promise mode
    */
    it('getStringArrayValue_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res?.getStringArrayValue(0x200000A).then((value: string[]) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_test_static_004 ' + value);
        console.log('getStringArrayValue_test_static_004 ' + value.length);
        console.log('getStringArrayValue_test_static_004 ' + value[0]);
        expect(value.length).assertEqual(4);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_0900
     * @tc.name    getMediaContent_test_static_003
     * @tc.desc    test getMedia method in callback mode
    */
    it('getMediaContent_test_static_003', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContent(0x01000001, (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaContent_test_static_003 ' + value?.length);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContent_test_static_003 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1000
     * @tc.name    getMediaContent_test_static_004
     * @tc.desc    test getMedia method in promise mode
    */
    it('getMediaContent_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContent(0x200001C).then((value: string): void => {
        console.log('getMediaContent_test_static_004 ' + value.length);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1100
     * @tc.name    getMediaContentBase64_test_static_003
     * @tc.desc    test getMediaBase64 method in callback mode
    */
    it('getMediaContentBase64_test_static_003', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContentBase64(0x01000001, (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaContentBase64_test_static_003 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContentBase64_test_static_003 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1200
     * @tc.name    getMediaContentBase64_test_static_004
     * @tc.desc    test getMediaBase64 method in promise mode
    */
    it('getMediaContentBase64_test_static_004', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContentBase64(0x200001C).then((value: string) => {
        expect(value.length > 0).assertTrue();
      })
    })


    /* *
     * @tc.number  getConfiguration_test_static_002
     * @tc.name    getConfiguration_test_static_002
     * @tc.desc    test getConfiguration method in promise mode
     */
    it('getConfiguration_test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getConfiguration_test_static_002 0');
      expect(resourceManager.Direction.DIRECTION_HORIZONTAL == 1).assertTrue();
      console.log('getConfiguration_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1400
     * @tc.name  getConfiguration_test_static_003
     * @tc.desc    test getConfiguration method in promise mode
   */
    it('getConfiguration_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getConfiguration_test_static_003 0');
      expect(resourceManager.Direction.DIRECTION_VERTICAL == 0).assertTrue();
      console.log('getConfiguration_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1300
     * @tc.name  getConfiguration_test_static_004
     * @tc.desc    test getConfiguration method in promise mode
     */
    it('getConfiguration_test_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getConfiguration().then((cfg: resourceManager.Configuration) => {
        expect(cfg !== null).assertTrue();
        console.log('getConfiguration_test_static_004 ' + JSON.stringify(cfg));
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1500
    * @tc.name  getDeviceCapability_test_static_001
    * @tc.desc    test getDeviceCapability method in callback mode
    */
    it('getDeviceCapability_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getDeviceCapability((error, dc) => {
        expect(dc !== null).assertTrue();
        console.log('getDeviceCapability_test_static_001 ' + JSON.stringify(dc));
        done();
      })
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_002
     * @tc.name    getDeviceCapability_test_static_002
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_002 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_PHONE == 0).assertTrue();
      console.log('getDeviceCapability_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_003
     * @tc.name    getDeviceCapability_test_static_003
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_003 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_TABLET == 1).assertTrue();
      console.log('getDeviceCapability_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_004
     * @tc.name    getDeviceCapability_test_static_004
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_004 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_CAR == 2).assertTrue();
      console.log('getDeviceCapability_test_static_004 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_005
     * @tc.name    getDeviceCapability_test_static_005
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_005 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_PC == 3).assertTrue();
      console.log('getDeviceCapability_test_static_005 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_006
     * @tc.name    getDeviceCapability_test_static_006
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_006 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_TV == 4).assertTrue();
      console.log('getDeviceCapability_test_static_006 1');
      done();
    })

    /* *
     * @tc.number  getDeviceCapability_test_static_007
     * @tc.name    getDeviceCapability_test_static_007
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getDeviceCapability_test_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_007 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_WEARABLE == 6).assertTrue();
      console.log('getDeviceCapability_test_static_007 1');
      done();
    })


    /* *
     * @tc.number  getDeviceCapability_test_static_017
     * @tc.name    getDeviceCapability_test_static_017
     * @tc.desc    test getDeviceCapability method in promise mode
     */
    it('getDeviceCapability_test_static_017', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getDeviceCapability_test_static_017 0');
      expect(resourceManager.DeviceType.DEVICE_TYPE_2IN1 == 7).assertTrue();
      console.log('getDeviceCapability_test_static_017 1');
      done();
    })

    /* *
    * @tc.number  getDeviceCapability_test_static_008
    * @tc.name    getDeviceCapability_test_static_008
    * @tc.desc    test getDeviceCapability method in callback mode
    */
    it('getDeviceCapability_test_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getDeviceCapability().then((dc: resourceManager.DeviceCapability): void => {
        expect(dc !== null).assertTrue();
        console.log('getDeviceCapability_test_static_008 ' + dc);
        done();
      })
    })

    /* *
        * @tc.number  getScreenDensity_test_static_002
        * @tc.name    getScreenDensity_test_static_002
        * @tc.desc    test getDeviceCapability method in promise mode
       */
    it('getScreenDensity_test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_002 0');
      expect(resourceManager.ScreenDensity.SCREEN_SDPI == 120).assertTrue();
      console.log('getScreenDensity_test_static_002 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_003
     * @tc.name    getScreenDensity_test_static_003
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_003 0');
      expect(resourceManager.ScreenDensity.SCREEN_MDPI == 160).assertTrue();
      console.log('getScreenDensity_test_static_003 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_004
     * @tc.name    getScreenDensity_test_static_004
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_004 0');
      expect(resourceManager.ScreenDensity.SCREEN_LDPI == 240).assertTrue();
      console.log('getScreenDensity_test_static_004 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_005
     * @tc.name    getScreenDensity_test_static_005
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_005 0');
      expect(resourceManager.ScreenDensity.SCREEN_XLDPI == 320).assertTrue();
      console.log('getScreenDensity_test_static_005 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_006
     * @tc.name    getScreenDensity_test_static_006
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_006 0');
      expect(resourceManager.ScreenDensity.SCREEN_XXLDPI == 480).assertTrue();
      console.log('getScreenDensity_test_static_006 1');
      done();
    })

    /* *
     * @tc.number  getScreenDensity_test_static_007
     * @tc.name    getScreenDensity_test_static_007
     * @tc.desc    test getDeviceCapability method in promise mode
    */
    it('getScreenDensity_test_static_007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.log('getScreenDensity_test_static_007 0');
      expect(resourceManager.ScreenDensity.SCREEN_XXXLDPI == 640).assertTrue();
      console.log('getScreenDensity_test_static_007 1');
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1700
    * @tc.name    getRawFileContent_test_static_001
    * @tc.desc    test getRawFile method in callback mode
    */
    it('getRawFileContent_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getRawFileContent('rawfile/rawfiletest.xml',
        (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
          expect(value !== null).assertTrue();
          hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_001 ' + value);
          done();
        })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_1800
    * @tc.name    getRawFileContent_test_static_002
    * @tc.desc    test getRawFile method in promise mode
    */
    it('getRawFileContent_test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getRawFileContent('rawfile/rawfiletest.xml').then((value: Uint8Array) => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getRawFileContent_test_static_002 ' + value);
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_Static_2000
    * @tc.name    getRawFd_test_static_001
    * @tc.desc    test getRawFileDescriptor method in callback mode
    */
    it('getRawFd_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res?.getRawFd('rawfiletest.xml',
        (error: BusinessError<void> | null, rawfile: resourceManager.RawFileDescriptor | undefined) => {
          let fdValue = rawfile?.fd;
          let offsetValue = rawfile?.offset;
          let lengthValue = rawfile?.length;
          expect(rawfile !== null).assertTrue();
          console.log('getRawFd_test_static_001--'
            + 'fd:' + fdValue
            + ' offset:' + offsetValue
            + ' length:' + lengthValue);
        })
    })

    /* *
    * @tc.number  getRawFd_test_static_002
    * @tc.name    getRawFd_test_static_002
    * @tc.desc    test getRawFileDescriptor method in promise mode
    */
    it('getRawFd_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res?.getRawFd('rawfiletest.xml').then((rawfile: resourceManager.RawFileDescriptor): void => {
        rawfile.fd = 2000;
        rawfile.offset = 20;
        rawfile.length = 200;
        expect(rawfile !== null).assertTrue();
        console.log('getRawFd_test_static_002--' + rawfile);
        console.log('getRawFd_test_static_002--'
          + 'fd:' + rawfile.fd
          + ' offset:' + rawfile.offset
          + ' length:' + rawfile.length);
      })
    })

    /**
     * @tc.number   : getRawFd_test_static_0100
     * @tc.name     : getRawFd_test_static_0100
     * @tc.desc     : errcode 9001005 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      res.getRawFd('plural_name_loop', (error: BusinessError<void> | null) => {
        console.log('getRawFd_test_static_0100 error code:' + error?.code);
        expect(error?.code).assertEqual(9001005);
      })
    })

    /**
     * @tc.number   : getRawFd_test_static_0200
     * @tc.name     : getRawFd_test_static_0200
     * @tc.desc     : errcode 9001005 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_test_static_0200', Level.LEVEL3, async (): Promise<void> => {
      res.getRawFd('plural_name_loop').then(() => {
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError;
        console.log('getRawFd_test_static_0200 error code:' + error.code);
        expect(error.code).assertEqual(9001005);
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2200
     * @tc.name    closeRawFd_test_static_001
     * @tc.desc    test closeRawFileDescriptor method in callback mode
    */
    it('closeRawFd_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        res?.closeRawFd('notexist.xml', (error: BusinessError<void> | null) => {
          if (error) {
            console.log('closeRawFd_test_static_001 err.code:' + error?.code);
            console.log('closeRawFd_test_static_001 err.message:' + error?.message);
            expect(error?.code == 9001005).assertTrue();
            done();
          } else {
            console.log('closeRawFd_test_static_001 ');
            done();
          }
        })
      } catch (err) {
        let error = err as BusinessError
        console.log('closeRawFd_test_static_001 e.code' + error.code);
        console.log('closeRawFd_test_static_001 e.message' + error.message);
      }
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2300
     * @tc.name    closeRawFd_test_static_005
     * @tc.desc    test closeRawFd method in promise mode throw 9001005 error code
    */
    it('closeRawFd_test_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.closeRawFd('notexist.xml').then((): void => {
          console.log('closeRawFd_test_static_005 ');
          done();
        }).catch((err: BusinessError): void => {
          console.log('closeRawFd_test_static_005 error.code' + err.code);
          console.log('closeRawFd_test_static_005 error.message' + err.message);
          expect(err.code == 9001005).assertTrue();
          done();
        })
      } catch (err) {
        let error = err as BusinessError
        console.log('closeRawFd_test_static_005 err.code' + error.code);
        console.log('closeRawFd_test_static_005 err.message' + error.message);
        done();
      }
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2400
     * @tc.name    getStringByName_test_static_001
     * @tc.desc    test getStringByName method in callback mode
     */
    it('getStringByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res?.getStringByName('app_name').then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringByName_test_static_001 ' + value);
        expect(value).assertEqual('resmgr');
      })
    })

    /* *
      * @tc.number  getStringByName_test_static_002
      * @tc.name    getStringByName_test_static_002
      * @tc.desc    test getString method in promise mode
      */
    it('getStringByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res?.getStringByName('app_name').then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringByName_test_static_002 ' + value);
        expect(value).assertEqual('resmgr');
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2600
     * @tc.name    getStringArrayByName_test_static_001
     * @tc.desc    test getStringArrayByName method in callback mode
     */
    it('getStringArrayByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res?.getStringArrayByName('sizeList', (err: BusinessError<void> | null, value: Array<string> | undefined) => {
        expect(value !== null).assertTrue();
        if (value != null) {
          console.log('getStringArrayByName_test_static_001 ' + value);
          console.log('getStringArrayByName_test_static_001 ' + value?.length);
          console.log('getStringArrayByName_test_static_001 ' + value[0]);
          expect(value?.length).assertEqual(4);
          let str0: string = value[0];
          let str1: string = value[1];
          let str2: string = value[2];
          let str3: string = value[3];
          expect(str0).assertEqual('small');
          expect(str1).assertEqual('middle');
          expect(str2).assertEqual('large');
          expect(str3).assertEqual('extra large');
        } else {
          console.log('getStringArrayByName_test_static_001 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2700
    * @tc.name    getStringArrayByName_test_static_002
    * @tc.desc    test getStringArrayByName method in promise mode
    */
    it('getStringArrayByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res?.getStringArrayByName('sizeList').then((value: string[]) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayByName_test_static_002 ' + value);
        console.log('getStringArrayByName_test_static_002 ' + value.length);
        console.log('getStringArrayByName_test_static_002 ' + value[0]);
        expect(value.length).assertEqual(4);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2800
    * @tc.name    getMediaByName_test_static_001
    * @tc.desc    test getMediaByName method in callback mode
    */
    it('getMediaByName_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getMediaByName('background', (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaByName_test_static_001 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaByName_test_static_001 Failed');
          expect().assertFail();
        }
        done();
      })
    })
    
    /**
     * @tc.number SUB_GLOBAL_RESMGR_DENSITY_JS_static_0100
     * @tc.name getMediaByName_test_static_0100
     * @tc.desc get the media in callback mode, test getMediaByName method in callback mode with density
     */
    it('getMediaByName_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getMediaByName('foreground', 0, (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaByName_test_static_0100 ' + value?.length);
          expect(true).assertTrue();
          done();
        } else {
          console.log('getMediaByName_test_static_0100 Failed');
          expect().assertFail();
          done();
        }
      })
    })
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_2900
    * @tc.name    getMediaByName_test_static_002
    * @tc.desc    get the media in promise mode, test getMediaByName method in promise mode
    */
    it('getMediaByName_test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getMediaByName('startIcon').then((value: Uint8Array) => {
        expect(value.length > 0).assertTrue();
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2000
    * @tc.name    getMediaBase64ByName_test_static_001
    * @tc.desc    test getMediaBase64ByName method in callback mode
    */
    it('getMediaBase64ByName_test_static_001', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaBase64ByName('background', (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaBase64ByName_test_static_001 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaBase64ByName_test_static_001 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2100
     * @tc.name    getMediaBase64ByName_test_static_002
     * @tc.desc    test getMediaBase64ByName method in promise mode
     */
    it('getMediaBase64ByName_test_static_002', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaBase64ByName('icon').then((value: string): void => {
        expect(value.length > 0).assertTrue();
        console.log('getMediaBase64ByName_test_static_002 ' + value);
      })
    })

    /* *
    * @tc.number  getStringSync_test_static_001
    * @tc.name    getStringSync_test_static_001
    * @tc.desc    test getStringSync method
    */
    it('getStringSync_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getStringSync(0x01000000);
      expect(value !== null).assertTrue();
      hilog.info(0x0000, 'testTag', '%{public}s', 'getStringSync_test_static_001 ' + value);
      expect(value).assertEqual('resmgr');
      done();
    })

    /* *
     * @tc.number  getStringByNameSync_test_static_001
     * @tc.name    getStringByNameSync_test_static_001
     * @tc.desc    test getStringByNameSync method
     */
    it('getStringByNameSync_test_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getStringByNameSync('notexist');
        console.log('getStringByNameSync_test_static_001 value');
        expect(value !== null).assertTrue();
        console.log('getStringByNameSync_test_static_001 ' + value);
        done();
      } catch (e: BusinessError) {
        console.log('getStringByNameSync_test_static_001 err.code' + e.code);
        console.log('getStringByNameSync_test_static_001 err.message' + e.message);
        expect(e.code == 9001003).assertTrue();
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_static_2500
    * @tc.name    getStringByNameSync_test_static_002
    * @tc.desc    test getStringByNameSync method
    */
    it('getStringByNameSync_test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getStringByNameSync('app_name');
      expect(value !== null).assertTrue();
      expect(value).assertEqual('resmgr');
      console.log('getStringByNameSync_test_static_002 ' + value);
      done();
    })
    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_JS_static_4100
     * @tc.name    getfloatByName_test_static_001
     * @tc.desc    test getNumberByName with float
    */
    it('getfloatByName_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getNumberByName('page_text_font_size');
      console.log('getfloatByName_test_static_001 ' + value);
      if (value) {
        console.log('getfloatByName_test_static_001 ' + value);
        expect(true).assertTrue();
      } else {
        console.log('getfloatByName_test_static_001 Failed');
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_static_0100
     * @tc.name getRawFileList_test_static_0100
     * @tc.desc getRawFileList with callback method
     */
    it('getRawFileList_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        res?.getRawFileList("", (err: BusinessError<void> | null, value: Array<string> | undefined) => {
          if (err) {
            console.log('getRawFileList_test_static_0100 err.code' + err?.code);
            console.log('getRawFileList_test_static_0100 err.message' + err?.message);
            done();
          } else {
            expect(value !== null).assertTrue();
            console.log('getRawFileList_test_static_0100 ' + value);
            done();
          }
        })
      } catch (e: BusinessError) {
        console.log('getRawFileList_test_static_0100 e.code' + e.code);
        console.log('getRawFileList_test_static_0100 e.message' + e.message);
      }
    })

    /**
     * @tc.number getRawFileList_test_static_0110
     * @tc.name getRawFileList_test_static_0110
     * @tc.desc getRawFileList with callback method
     */
    it('getRawFileList_test_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        res?.getRawFileList("bb", (err: BusinessError<void> | null, value: Array<string> | undefined) => {
          if (err) {
            console.log('getRawFileList_test_static_0110 err.code' + err?.code);
            console.log('getRawFileList_test_static_0110 err.message' + err?.message);
            expect(err?.code == 9001005).assertTrue();
          } else {
            expect(value !== null).assertTrue();
            console.log('getRawFileList_test_static_0110 ' + value);
          }
          done();
        })
      } catch (e: BusinessError) {
        console.log('getRawFileList_test_static_0110 e.code' + e.code);
        console.log('getRawFileList_test_static_0110 e.message' + e.message);
        done();
      }
    })

    /**
     * @tc.number SUB_GLOBAL_RESMGR_RAWFILELIST_JS_static_0210
     * @tc.name getRawFileList_test_static_0210
     * @tc.desc getRawFileList with promise method
     */
    it('getRawFileList_test_static_0210', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getRawFileList("bb").then((value: string): void => {
          expect(value !== null).assertTrue();
          console.log('getRawFileList_test_static_0210 ' + value);
          done();
        }).catch((error: BusinessError): void => {

          console.log('getRawFileList_test_static_0210 error.code' + error.code);
          console.log('getRawFileList_test_static_0210 error.message' + error.message);
          expect(error.code == 9001005).assertTrue();
          done();
        })
      } catch (err: BusinessError) {
        console.log('getRawFileList_test_static_0210 err.code' + err.code);
        console.log('getRawFileList_test_static_0210 err.message' + err.message);
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0300
    * @tc.name    getMediaBase64ByName_test_static_0100
    * @tc.desc    test getMediaBase64ByName method in callback mode with density
   */
    it('getMediaBase64ByName_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaBase64ByName('background', 0, (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaBase64ByName_test_static_0100 ' + value);
          expect(true).assertTrue();
        } else {
          console.log('getMediaBase64ByName_test_static_0100 Failed');
          expect().assertFail();
        }
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0600
     * @tc.name    getMediaContent_test_static_0200
     * @tc.desc    test getMediaContent method in promise mode with density
    */
    it('getMediaContent_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContent(0x01000001, 0).then((value: string): void => {
        console.log('getMediaContent_test_static_0200 ' + value);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0800
     * @tc.name    getMediaContentBase64_test_static_0200
     * @tc.desc    test getMediaContentBase64 method in promise mode with density
    */
    it('getMediaContentBase64_test_static_0200', Level.LEVEL0, async (): Promise<void> => {
      res?.getMediaContentBase64(0x01000001, 0).then((value: string): void => {
        console.log('getMediaContentBase64_test_static_0200 ' + value);
        expect(value.length > 0).assertTrue();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETSYSRESOURCEMANAGER_JS_static_0100
    * @tc.name    getSysResourceManager_test_static_0100
    * @tc.desc    test getSysResourceManager method
    */
    it('getSysResourceManager_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = resourceManager.getSysResourceManager();
      hilog.info(0x0000, 'testTag', '%{public}s', 'getSysResourceManager_test_static_0100 ' + value);
      expect(value !== null).assertTrue();
      done();
    })
 
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0100
    * @tc.name    getColor_test_static_0100
    * @tc.desc    test getColor method in callback mode get the color in callback mode
    */
    it('getColor_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getColor(0x01000033, (err: BusinessError<void> | null, value: number | undefined) => {
          expect(value !== null).assertTrue();
          console.log('getColor_test_static_001 ' + value);
          expect(value).assertEqual(4294967295);
          done();
      })
    })
   
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0200
    * @tc.name    getColor_test_static_0200
    * @tc.desc    get the color in promise mode,test getColor method in promise mode
    */
    it('getColor_test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getColor(0x01000033).then(value => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_static_0200 ' + value);
        expect(value).assertEqual(4294967295);
        done();
      })
    }) 

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0110
     * @tc.name    getColor_test_static_0110
     * @tc.desc    test getColor method in callback mode
     */
    it('getColor_test_static_0110', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColor(0x21000014, (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColor_test_static_0110 err.code ' + err?.code + '-');
          console.log('getColor_test_static_0110 err.message ' + err?.message + '-');
          expect(err?.code == 9001001).assertTrue();
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColor_test_static_0110 error.code' + error.code);
        console.log('getColor_test_static_0110 error.message' + error.message);
      }
    })
   
    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0120
     * @tc.name    getColor_test_static_0120
     * @tc.desc    test getColor method in callback mode
     */
    it('getColor_test_static_0120', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColor(0x21000014, (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColor_test_static_0120 err.code ' + err?.code + '-');
          console.log('getColor_test_static_0120 err.message ' + err?.message + '-');
          expect(err?.code == 9001001).assertTrue();
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColor_test_static_0120 error.code' + error.code);
        console.log('getColor_test_static_0120 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0130
    * @tc.name    getColor_test_static_0130
    * @tc.desc    test getColor method in callback mode
    */
    it('getColor_test_static_0130', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColor(0x0100000e, (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColor_test_static_0130 err.code ' + err?.code + '-');
          console.log('getColor_test_static_0130 err.message ' + err?.message + '-');
          expect(err?.code == 9001002).assertTrue();
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColor_test_static_0130 error.code' + error.code);
        console.log('getColor_test_static_0130 error.message' + error.message);
      }
    })

     /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0140
    * @tc.name    getColor_test_static_0140
    * @tc.desc    test getColor method in callback mode
    */
    it('getColor_test_static_0140', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColor(0x01000034, (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColor_test_static_0140 err.code ' + err?.code + '-');
          console.log('getColor_test_static_0140 err.message ' + err?.message + '-');
          expect(err?.code == 9001006).assertTrue();
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColor_test_static_0140 error.code' + error.code);
        console.log('getColor_test_static_0140 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0150
    * @tc.name    getColor_test_static_0150
    * @tc.desc    test getColor method in callback mode
    */
    it('getColor_test_static_0150', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColor(0x01000034, (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColor_test_static_0150 err.code ' + err?.code + '-');
          console.log('getColor_test_static_0150 err.message ' + err?.message + '-');
          expect(err?.code == 9001006).assertTrue();
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColor_test_static_0150 error.code' + error.code);
        console.log('getColor_test_static_0150 error.message' + error.message);
      }
    })
        /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0210
    * @tc.name    getColor_test_static_0210
    * @tc.desc    test getColor method in promise mode get the color in promise mode
    */
    it('getColor_test_static_0210', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColor(0x01234567).then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColor_test_static_0210 err.code ' + error.code + '-');
              console.log('getColor_test_static_0210 err.message ' + error.message + '-');
              expect(error.code == 9001001).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColor_test_static_0210 error.code' + error.code);
          console.log('getColor_test_static_0210 error.message' + error.message);
      }
    })

     /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0220
    * @tc.name    getColor_test_static_0220
    * @tc.desc    test getColor method in promise mode get the color in promise mode
    */
    it('getColor_test_static_0220', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColor(0x01000006).then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColor_test_static_0220 err.code ' + error.code + '-');
              console.log('getColor_test_static_0220 err.message ' + error.message + '-');
              expect(error.code == 9001002).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColor_test_static_0220 error.code' + error.code);
          console.log('getColor_test_static_0220 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0230
    * @tc.name    getColor_test_static_0230
    * @tc.desc    test getColor method in promise mode get the color in promise mode
    */
    it('getColor_test_static_0230', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColor(0x01000006).then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColor_test_static_0230 err.code ' + error.code + '-');
              console.log('getColor_test_static_0230 err.message ' + error.message + '-');
              expect(error.code == 9001002).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColor_test_static_0230 error.code' + error.code);
          console.log('getColor_test_static_0230 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLOR_JS_static_0240
    * @tc.name    getColor_test_static_0240
    * @tc.desc    test getColor method in promise mode get the color in promise mode
    */
    it('getColor_test_static_0240', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColor(0x01000034).then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColor_test_static_0240 err.code ' + error.code + '-');
              console.log('getColor_test_static_0240 err.message ' + error.message + '-');
              expect(error.code == 9001006).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColor_test_static_0240 error.code' + error.code);
          console.log('getColor_test_static_0240 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_static_0100
    * @tc.name    getColorSync_test_static_001
    * @tc.desc    test getColorSync method
    */
    it('getColorSync_test_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let value = res?.getColorSync(0x01000033);
      expect(value !== null).assertTrue();
      hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_001 ' + value);
      expect(value).assertEqual(4294967295);
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_static_0300
    * @tc.name    getColorSync_test_static_003
    * @tc.desc    test getColorSync method
    */
    it('getColorSync_test_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorSync(0x21000014);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_003 err.code' + err.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_003 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001001');
        expect(err.message).assertEqual('Invalid resource ID');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_static_0400
    * @tc.name    getColorSync_test_static_004
    * @tc.desc    test getColorSync method
    */
    it('getColorSync_test_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorSync(0x01000000);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_004 err.code' + err.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_004 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
        expect(err.message).assertEqual('No matching resource is found based on the resource ID');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_static_0500
    * @tc.name    getColorSync_test_static_005
    * @tc.desc    test getColorSync method
    */
    it('getColorSync_test_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorSync(0x0100002d);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_005 err.code' + err.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_005 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001002');
        expect(err.message).assertEqual('No matching resource is found based on the resource ID');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORSYNC_JS_static_0600
    * @tc.name    getColorSync_test_static_006
    * @tc.desc    test getColorSync method
    */
    it('getColorSync_test_static_006', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorSync(0x01000034);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_006 err.code' + err.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getColorSync_test_static_006 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001006');
        expect(err.message).assertEqual('The resource is referenced cyclically');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0100
    * @tc.name    getColorByName_test_static_0100
    * @tc.desc    test getColorByName method in callback mode
   */
    it('getColorByName_test_static_0100', Level.LEVEL0, async (): Promise<void> => {
      res?.getColorByName('color_test1', (err: BusinessError<void> | null, value: number | undefined) => {
        expect(value !== null).assertTrue();
        console.log('getColorByName_test_static_0100 ' + value);
        expect(value).assertEqual(4294967295);
      })
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0110
     * @tc.name    getColorByName_test_static_0110
     * @tc.desc    test getColorByName method in callback mode
     */
    it('getColorByName_test_static_0110', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColorByName('0x2000010', (err: BusinessError<void> | null, value: number | undefined) => {
          done();
        })
      } catch (err: BusinessError) {
        console.log('getColorByName_test_static_0110 err.code' + err.code);
        console.log('getColorByName_test_static_0110 err.message' + err.message);
        expect(err.code).assertEqual('401');
        expect(err.message).assertEqual('Invalid input parameter');
        done();
      }
    })

    /* *
     * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0120
     * @tc.name    getColorByName_test_static_0120
     * @tc.desc    test getColorByName method in callback mode
     */
    it('getColorByName_test_static_0120', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColorByName('color_notexist', (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColorByName_test_static_0120 err.code ' + err?.code + '-');
          console.log('getColorByName_test_static_0120 err.message ' + err?.message + '-');
          expect(err?.code == 9001003).assertTrue();
          expect(err?.message).assertEqual('Invalid resource name');
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColorByName_test_static_0120 error.code' + error.code);
        console.log('getColorByName_test_static_0120 error.message' + error.message);
      }
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0130
    * @tc.name    getColorByName_test_static_0130
    * @tc.desc    test getColorByName method in callback mode get the color by name in callback mode
    */
    it('getColorByName_test_static_0130', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColorByName('integer_0', (err: BusinessError<void> | null, value: number | undefined) => {
              console.log('getColorByName_test_static_0130 err.code ' + err?.code + '-');
              console.log('getColorByName_test_static_0130 err.message ' + err?.message + '-');
              expect(err?.code == 9001003).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColorByName_test_static_0130 error.code' + error.code);
          console.log('getColorByName_test_static_0130 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0140
    * @tc.name    getColorByName_test_static_0140
    * @tc.desc    test getColorByName method in callback mode
    */
    it('getColorByName_test_static_0140', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColorByName('color_test5', (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColorByName_test_static_0140 err.code ' + err?.code + '-');
          console.log('getColorByName_test_static_0140 err.message ' + err?.message + '-');
          expect(err?.code == 9001004).assertTrue();
          expect(err?.message).assertEqual('No matching resource is found based on the resource name');
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColorByName_test_static_0140 error.code' + error.code);
        console.log('getColorByName_test_static_0140 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0150
    * @tc.name    getColorByName_test_static_0150
    * @tc.desc    test getColorByName method in callback mode
    */
    it('getColorByName_test_static_0150', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.getColorByName('color_test3', (err: BusinessError<void> | null, value: number | undefined) => {
          console.log('getColorByName_test_static_0150 err.code ' + err?.code + '-');
          console.log('getColorByName_test_static_0150 err.message ' + err?.message + '-');
          expect(err?.code == 9001006).assertTrue();
          expect(err?.message).assertEqual('The resource is referenced cyclically');
          done();
        })
      } catch (error: BusinessError) {
        console.log('getColorByName_test_static_0150 error.code' + error.code);
        console.log('getColorByName_test_static_0150 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0100
    * @tc.name    getColorByNameSync_test_static_001
    * @tc.desc    get the sync color by name,test getColorByNameSync method
    */
    it('getColorByNameSync_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getColorByNameSync('color_test1');
      expect(value !== null).assertTrue();
      console.log('getColorByNameSync_test_static_001 ' + value);
      expect(value).assertEqual(4294967295);
      done();
    })

    /* *
   * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0200
   * @tc.name    getColorByNameSync_test_static_003
   * @tc.desc    test getColorByNameSync method
   */
    it('getColorByNameSync_test_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorByNameSync('0x2000010');
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_003 err.code' + err.code);
        console.log('getColorByNameSync_test_static_003 err.message' + err.message);
        expect(JSON.stringify(err.code)).assertEqual('9001003');
        expect(err.message).assertEqual('Invalid resource name');
        done();
      }
    })
    
   
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0400
    * @tc.name    getColorByNameSync_test_static_004
    * @tc.desc    get the sync color by name,test getColorByNameSync method
    */
    it('getColorByNameSync_test_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorByNameSync('color_notexist');
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_004 err.code' + err.code);
        console.log('getColorByNameSync_test_static_004 err.message' + err.message);
        expect(err.code).assertEqual(9001003);
        expect(err.message).assertEqual('Invalid resource name');
        done();
      }
    })
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0200
    * @tc.name    getColorByName_test_static_0200
    * @tc.desc    test getColorByName method in promise mode get the color by name in promise mode
    */
    it('getColorByName_test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getColorByName('color_test1').then((value: number) => {
          expect(value !== null).assertTrue();
          console.log('getColorByName_test_static_0200 ' + value);
          expect(value).assertEqual(4294967295);
          done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_0210
    * @tc.name    getColorByName_test_static_0210
    * @tc.desc    test getColorByName method in promise mode get the color by name in promise mode
    */
    it('getColorByName_test_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
          res?.getColorByName('color_notexist').then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColorByName_test_static_0210 err.code ' + error.code + '-');
              console.log('getColorByName_test_static_0210 err.message ' + error.message + '-');
              expect(error.code == 9001003).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColorByName_test_static_0210 error.code' + error.code);
          console.log('getColorByName_test_static_0210 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0220
    * @tc.name    getColorByName_test_static_0220
    * @tc.desc    test getColorByName method in promise mode get the color by name in promise mode
    */
    it('getColorByName_test_static_0220', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColorByName('integer_0').then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColorByName_test_static_0220 err.code ' + error.code + '-');
              console.log('getColorByName_test_static_0220 err.message ' + error.message + '-');
              expect(error.code == 9001003).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColorByName_test_static_0220 error.code' + error.code);
          console.log('getColorByName_test_static_0220 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0230
    * @tc.name    getColorByName_test_static_0230
    * @tc.desc    test getColorByName method in promise mode get the color by name in promise mode
    */
    it('getColorByName_test_static_0230', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColorByName('color_test5').then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColorByName_test_static_0230 err.code ' + error.code + '-');
              console.log('getColorByName_test_static_0230 err.message ' + error.message + '-');
              expect(error.code == 9001004).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColorByName_test_static_0230 error.code' + error.code);
          console.log('getColorByName_test_static_0230 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAME_JS_static_0240
    * @tc.name    getColorByName_test_static_0250
    * @tc.desc    test getColorByName method in promise mode get the color by name in promise mode
    */
    it('getColorByName_test_static_0250', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try{
          res?.getColorByName('color_test3').then((value: number) => {
          }).catch((err: Object | null | undefined) => {
              let error = err as BusinessError
              console.log('getColorByName_test_static_0240 err.code ' + error.code + '-');
              console.log('getColorByName_test_static_0240 err.message ' + error.message + '-');
              expect(error.code == 9001006).assertTrue();
              done();
          })
      } catch (error: BusinessError) {
          console.log('getColorByName_test_static_0240 error.code' + error.code);
          console.log('getColorByName_test_static_0240 error.message' + error.message);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0500
    * @tc.name    getColorByNameSync_test_static_005
    * @tc.desc    test getColorByNameSync method
    */
    it('getColorByNameSync_test_static_005', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorByNameSync('color_test5');
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_005 err.code' + err.code);
        console.log('getColorByNameSync_test_static_005 err.message' + err.message);
        expect(err.code).assertEqual(9001004);
        expect(err.message).assertEqual('No matching resource is found based on the resource name');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0600
    * @tc.name    getColorByNameSync_test_static_006
    * @tc.desc    test getColorByNameSync method
    */
    it('getColorByNameSync_test_static_006', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorByNameSync('color_test3');
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_006 err.code' + err.code);
        console.log('getColorByNameSync_test_static_006 err.message' + err.message);
        expect(err.code).assertEqual(9001006);
        expect(err.message).assertEqual('The resource is referenced cyclically');
        done();
      }
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_GETCOLORBYNAMESYNC_JS_static_0700
    * @tc.name    getColorByNameSync_test_static_007
    * @tc.desc    get the sync color by name,test getColorByNameSync method
    */
    it('getColorByNameSync_test_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value = res?.getColorByNameSync('integer_1');
      } catch (err: BusinessError) {
        console.log('getColorByNameSync_test_static_007 err.code' + err.code);
        console.log('getColorByNameSync_test_static_007 err.message' + err.message);
        expect(err.code).assertEqual(9001003);
        expect(err.message).assertEqual('Invalid resource name');
        done();
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_ADDRESOURCE_JS_static_0100
    * @tc.name    addResource_test_static_002
    * @tc.desc    test addResource method with int param
    */
    it('addResource_test_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.addResource('123');
      } catch (err) {
        let error = err as BusinessError
        console.log('addResource_test_static_002 err.code' + error.code);
        console.log('addResource_test_static_002 err.message' + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001010');
        expect(error.message).assertEqual('Invalid overlay path');
        done();
      }
    })

    /* *
   * @tc.number  SUB_GLOBAL_RESMGR_REMOVERESOURCE_JS_static_0100
   * @tc.name    removeResource_test_static_002
   * @tc.desc    test removeResource method with int param
   */
    it('removeResource_test_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res?.removeResource('123');
      } catch (err) {
        let error = err as BusinessError
        console.log('removeResource_test_static_002 err.code' + error.code);
        console.log('removeResource_test_static_002 err.message' + error.message);
        expect(JSON.stringify(error.code)).assertEqual('9001010');
        expect(error.message).assertEqual('Invalid overlay path');
        done();
      }
    })

    /**
     * @tc.number    : getIntPluralStringByNameSync_test_static_0100
     * @tc.name      : getIntPluralStringByNameSync_test_static_0100
     * @tc.desc      : test getMediaContent 9error code 9001004 by name
     */

    it('getIntPluralStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getIntPluralStringByNameSync('string_format8', 1);
      } catch (err: BusinessError) {
        let error = err as BusinessError
        console.log('getIntPluralStringByNameSync_test_static_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001004);
      }
    })
    /**
     * @tc.number    : getDoublePluralStringByNameSync_test_static_0100
     * @tc.name      : getDoublePluralStringByNameSync_test_static_0100
     * @tc.desc      : test getDoublePluralStringByNameSync with error code 9001004
     */
    it('getDoublePluralStringByNameSync_test_static_0100', Level.LEVEL3, async (): Promise<void> => {
      try {
        res?.getDoublePluralStringByNameSync('string_format8', 2.1);
      } catch (err: BusinessError) {
        let error = err as BusinessError
        console.log('getDoublePluralStringByNameSync_test_static_0100 error code:' + error.code);
        expect(err.code).assertEqual(9001004);
      }
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0500
    * @tc.name    getMediaContent_test_static_0100
    * @tc.desc    get the media in callback mode,test getMediaContent method in callback mode with density
    */
    it('getMediaContent_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getMediaContent(0x01000001, 0, (err: BusinessError<void> | null, value: Uint8Array | undefined) => {
        if (value?.length) {
          console.log('getMediaContent_test_static_0100 ' + value?.length);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContent_test_static_0100 Failed');
          expect().assertFail();
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_test_static_0300
     * @tc.name     : getMediaContent_test_static_0300
     * @tc.desc     : test getMediaContent density callback err code 9001002
     */
    it("getMediaContent_test_static_0300", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContent  density callback err code 9001002 start');
      try {
        res?.getMediaContent(0x0100004a, 0, (err: BusinessError<void> | null, data: Uint8Array | undefined): void => {
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
     * @tc.number   : getMediaContent_test_static_0400
     * @tc.name     : getMediaContent_test_static_0400
     * @tc.desc     : test getMediaContent density promise errcode 9001002
     */
    it('getMediaContent_test_static_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getMediaContent(0x0100000a, 0).then(() => {
        expect().assertFail();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getMediaContent density promise 9001002 error.code' + error.code);
        hilog.info(0x0000, 'testTag', '%{public}s',
          'getMediaContent density promise 9001002 error.message' + error.message);
        expect(error.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_test_static_0500
     * @tc.name     : getMediaContent_test_static_0500
     * @tc.desc     : test getMediaContent density promise errcode 9001001
     */
    it('getMediaContent_test_static_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getMediaContentBase64(0x01234567).then(() => {
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
     * @tc.number   : getMediaContent_test_static_0600
     * @tc.name     : getMediaContent_test_static_0600
     * @tc.desc     : test getMediaContent density promise errcode 9001001
     */
    it('getMediaContent_test_static_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getMediaContent(0x01234567, 0).then(() => {
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


    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_DENSITY_JS_static_0700
    * @tc.name    getMediaContentBase64_test_static_0100
    * @tc.desc    get the media in callback mode,test getMediaContentBase64 method in callback mode with density
    */
    it('getMediaContentBase64_test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      res?.getMediaContentBase64(0x01000001, 0, (err: BusinessError<void> | null, value: string | undefined) => {
        if (value?.length) {
          console.log('getMediaContentBase64_test_static_0100 ' + value?.length);
          expect(true).assertTrue();
        } else {
          console.log('getMediaContentBase64_test_static_0100 Failed');
          expect().assertFail();
        }
        done();
      })
    })
    
    /**
     * @tc.number   : getMediaContentBase64_test_static_0300
     * @tc.name     : getMediaContentBase64_test_static_0300
     * @tc.desc     : test getMediaContentBase64 density promise errcode 9001002
     */
    it('getMediaContentBase64_test_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getMediaContentBase64(0x01000007).then(() => {
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
     * @tc.number   : getMediaContentBase64_test_static_0400
     * @tc.name     : getMediaContentBase64_test_static_0400
     * @tc.desc     : test getMediaContentBase64 density callback errcode 9001001
     */
    it("getMediaContentBase64_test_static_0400", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 201 start');
      try {
        res?.getMediaContentBase64(0x01234567, (err: BusinessError<void> | null, data: string | undefined) => {
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
     * @tc.number   : getMediaContentBase64_test_static_0500
     * @tc.name     : getMediaContentBase64_test_static_0500
     * @tc.desc     : test getMediaContentBase64 density callback errcode 9001002
     */
    it("getMediaContentBase64_test_static_0500", Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'getMediaContentBase64 resId callback err code 9001002 start');
      try {
        res?.getMediaContentBase64(0x01000007, (err: BusinessError<void> | null, data: string | undefined) => {
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
     * @tc.number   : roundingIncrement_test_static_0100
     * @tc.name     : roundingIncrement_test_static_0100
     * @tc.desc     : test roundingIncrement success
     */
    it("roundingIncrement_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG: string = "roundingIncrement";
      try {
        let options: intl.NumberOptions = {
          maximumFractionDigits: 2, roundingIncrement: 1
        }
        let numberFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", options);
        let numberFormatted: string = numberFormat.format(123.456);
        expect(numberFormatted == "123.46").assertEqual(true);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   : roundingMode_test_static_0100
     * @tc.name     : roundingMode_test_static_0100
     * @tc.desc     : test roundingIncrement success
     */
    it("roundingMode_test_static_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG: string = "roundingMode";
      try {
        let options: intl.NumberOptions = {
          roundingMode: "halfExpand", maximumSignificantDigits: 5
        }
        let numberFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", options);
        let numberFormatted: string = numberFormat.format(123.456);
        expect(numberFormatted == "123.46").assertEqual(true);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', `${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /* *
     * @tc.number  getConfiguration_test_static_001
     * @tc.name    getConfiguration_test_static_001
     * @tc.desc    test getConfiguration method in callback mode
     */
    it('getConfiguration_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('getConfiguration_test_static_001 0');
      res?.getConfiguration((error, cfg) => {
        expect(cfg !== null).assertTrue();
        console.log('getConfiguration_test_static_001 ' + JSON.stringify(cfg));
        done();
      })
    })
 
    /* *
    * @tc.number getStringArrayByName_test_static_003
    * @tc.name   getStringArrayByName_test_static_003
    * @tc.desc   test getStringArrayByName method in callback mode get the string in callback mode
    */
    it('getStringArrayByName_test_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      res?.getStringArrayByName('sizeListThree', (err: BusinessError<void> | null, value: Array<String> | undefined) => {
        if (err) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_003 err.code' + err?.code);
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_003 err.message' + err?.message);
          expect(err?.code == 9001006).assertTrue();
          done();
        } else {
          expect(value !== null).assertTrue();
          hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_003' + value);
          done();
        }
      })
    })

    /* *
    * @tc.number getStringArrayByName_test_static_004
    * @tc.name getStringArrayByName_test_static_004
    * @tc.desc test getStringArrayByName method in promise mode
    */
    it('getStringArrayByName_test_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // 0x01000006 id re-ref,throw 9001006 error code
      res?.getStringArrayByName('sizeListThree').then((value: string): void => {
        expect(value !== null).assertTrue();
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_004' + value);
        expect(value).assertEqual('%4$f');
        done();
      }).catch((err: Object | null | undefined) => {
        let error = err as BusinessError
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_004 error.code' + error?.code);
        hilog.info(0x0000, 'testTag', '%{public}s', 'getStringArrayByName_test_static_004 error.message' + error?.message);
        expect(JSON.stringify(error?.code) == '9001006').assertTrue();
        done();
      })
    })

    /**
     * @tc.number   : resourceManager_test_getStringByNameSync_static_0270
     * @tc.name     : resourceManager_test_getStringByNameSync_static_0270
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('resourceManager_test_getStringByNameSync_static_0270', Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        res.getStringByNameSync('test_stringLoopB', 'aaa', 1);
        done();
      } catch (err: BusinessError) {
        console.log('resourceManager_test_getStringByNameSync_static_0270 error code:' + err?.code);
        expect(err?.code).assertEqual(9001006);
        done();
      }
    })

    /**
     * @tc.number    : resourceManager_test_getStringByNameSync_static_0280
     * @tc.name      : resourceManager_test_getStringByNameSync_static_0280
     * @tc.desc      : Parameter out of index
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_static_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFour', "format string", "format", "1.5", "string");
        done();
      } catch (error: BusinessError) {
        console.log('resourceManager_test_getStringByNameSync_0280' + error?.code + error?.message);
        expect(error?.code).assertEqual(9001008);
        done();
      }
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3600
    * @tc.name    getBoolean_test_static_001
    * @tc.desc    get the boolean value, test getBoolean method
    */
    it('getBoolean_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getBoolean(0x0100002f);
      console.log('getBoolean_test_static_001 ' + value);
      expect(value).assertTrue();
      done();
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3700
    * @tc.name    getBooleanByName_test_static_001
    * @tc.desc    get the boolean value, test getBooleanByName method
    */
    it('getBooleanByName_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getBooleanByName('boolean_1');
      console.log('getBooleanByName_test_static_001 ' + value);
      expect(value).assertTrue();
      done();
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3800
    * @tc.name    getinteger_test_static_001
    * @tc.desc    get the interger value, test getNumber method with interger id
    */
    it('getinteger_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getNumber(0x01000002);
      console.log('getinteger_test_static_001 1');
      console.log('getinteger_test_static_001 ' + value);
      expect(value).assertEqual(100);
      done();
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_3900
    * @tc.name    getintegerByName_test_static_001
    * @tc.desc    get the interger value, test getNumberByName with interger
    */
    it('getintegerByName_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res?.getNumberByName('integer_1');
      console.log('getintegerByName_test_static_001 ' + value);
      expect(value).assertEqual(100);
      done();
    })
    
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_JS_4000
    * @tc.name    getfloat_test_static_001
    * @tc.desc    get the float value, test getNumber with float id
    */
    it('getfloat_test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let value = res!.getNumber(0x01000002);
      console.log('getfloat_test_static_001 ' + value);
      expect(value > 0).assertTrue();
      done();
    })

    console.log('*************end ResmgrTest*************');
  })
}