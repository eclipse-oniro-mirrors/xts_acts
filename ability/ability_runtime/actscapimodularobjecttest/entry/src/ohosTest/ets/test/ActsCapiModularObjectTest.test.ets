/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import AbilityKitTest from 'libentry.so';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const ERRORCODE_801: string = '801';

export default function ActsCapiModularObjectTest() {
  describe('ActsCapiModularObjectTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0100
     * @tc.desc   Testing AcquireSelfModularObjectExtensionInfos and get all extension info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0100`;
        try {
          let result: string = AbilityKitTest.ModularObject_0100();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('count=1');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0200
     * @tc.desc   Testing AcquireSelfModularObjectExtensionInfos with nullptr parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0200`;
        try {
          let result: string = AbilityKitTest.ModularObject_0200();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0300
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0300
     * @tc.desc   Testing GetCountFromAllModObjExtensionInfos with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0300`;
        try {
          let result: string = AbilityKitTest.ModularObject_0300();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0400
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0400
     * @tc.desc   Testing GetCountFromAllModObjExtensionInfos with null allExtensionInfos.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0400`;
        try {
          let result: string = AbilityKitTest.ModularObject_0400();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0500
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0500
     * @tc.desc   Testing GetModObjExtensionInfoByIndex with correct parameters (index=0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0500`;
        try {
          let result: string = AbilityKitTest.ModularObject_0500();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0600
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0600
     * @tc.desc   Testing GetModObjExtensionInfoByIndex with null allExtensionInfos.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0600`;
        try {
          let result: string = AbilityKitTest.ModularObject_0600();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0700
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0700
     * @tc.desc   Testing GetModObjExtensionInfoByIndex with out of bounds index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0700`;
        try {
          let result: string = AbilityKitTest.ModularObject_0700();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0800
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0800
     * @tc.desc   Testing GetModObjExtensionInfoByIndex with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0800`;
        try {
          let result: string = AbilityKitTest.ModularObject_0800();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_0900
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_0900
     * @tc.desc   Testing GetModularObjectExtensionInfoLaunchMode with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_0900`;
        try {
          let result: string = AbilityKitTest.ModularObject_0900();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1000
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1000
     * @tc.desc   Testing GetModularObjectExtensionInfoLaunchMode with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1000`;
        try {
          let result: string = AbilityKitTest.ModularObject_1000();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1100
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1100
     * @tc.desc   Testing GetModularObjectExtensionInfoLaunchMode with nullptr launchMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1100`;
        try {
          let result: string = AbilityKitTest.ModularObject_1100();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1200
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1200
     * @tc.desc   Testing GetModularObjectExtensionInfoProcessMode with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1200`;
        try {
          let result: string = AbilityKitTest.ModularObject_1200();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1300
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1300
     * @tc.desc   Testing GetModularObjectExtensionInfoProcessMode with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1300`;
        try {
          let result: string = AbilityKitTest.ModularObject_1300();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1400
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1400
     * @tc.desc   Testing GetModularObjectExtensionInfoProcessMode with nullptr processMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1400`;
        try {
          let result: string = AbilityKitTest.ModularObject_1400();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1500
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1500
     * @tc.desc   Testing GetModularObjectExtensionInfoThreadMode with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1500`;
        try {
          let result: string = AbilityKitTest.ModularObject_1500();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1600
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1600
     * @tc.desc   Testing GetModularObjectExtensionInfoThreadMode with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1600`;
        try {
          let result: string = AbilityKitTest.ModularObject_1600();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1700
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1700
     * @tc.desc   Testing GetModularObjectExtensionInfoThreadMode with nullptr threadMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1700`;
        try {
          let result: string = AbilityKitTest.ModularObject_1700();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1800
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1800
     * @tc.desc   Testing GetModularObjectExtensionInfoElementName with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1800`;
        try {
          let result: string = AbilityKitTest.ModularObject_1800();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_1900
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_1900
     * @tc.desc   Testing GetModularObjectExtensionInfoElementName with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_1900`;
        try {
          let result: string = AbilityKitTest.ModularObject_1900();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2000
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2000
     * @tc.desc   Testing GetModularObjectExtensionInfoElementName with nullptr element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2000`;
        try {
          let result: string = AbilityKitTest.ModularObject_2000();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2100
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2100
     * @tc.desc   Testing GetModularObjectExtensionInfoDisableState with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2100`;
        try {
          let result: string = AbilityKitTest.ModularObject_2100();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2200
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2200
     * @tc.desc   Testing GetModularObjectExtensionInfoDisableState with nullptr extensionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2200`;
        try {
          let result: string = AbilityKitTest.ModularObject_2200();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2300
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2300
     * @tc.desc   Testing GetModularObjectExtensionInfoDisableState with nullptr isDisabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2300`;
        try {
          let result: string = AbilityKitTest.ModularObject_2300();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2400
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2400
     * @tc.desc   Testing ReleaseAllExtensionInfos with correct parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2400`;
        try {
          let result: string = AbilityKitTest.ModularObject_2400();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModularObject_2500
     * @tc.number SUB_Ability_AbilityRuntime_ModularObject_2500
     * @tc.desc   Testing ReleaseAllExtensionInfos with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ModularObject_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const TESTCASE_NAME = `SUB_Ability_AbilityRuntime_ModularObject_2500`;
        try {
          let result: string = AbilityKitTest.ModularObject_2500();
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} result: ${result}`);
          if (result === ERRORCODE_801) {
            expect(result).assertEqual(ERRORCODE_801);
            done();
          } else {
            expect(result).assertContain('success');
            done();
          }
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} catch code: ${err.code}`);
          expect().assertFail();
          done();
        }
      })
  })
}
