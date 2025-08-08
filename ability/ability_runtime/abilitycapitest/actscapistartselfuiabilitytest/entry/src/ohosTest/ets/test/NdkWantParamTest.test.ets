/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';
export default function ndkTest() {
  describe('NdkWantParamTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0100
     * @tc.name   : The input parameter want is null of OH_AbilityBase_SetWantUri.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0200
     * @tc.name   : The input parameter uri is empty of OH_AbilityBase_SetWantUri
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0300
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantUri
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0400
     * @tc.name   : The input parameter uri is empty of OH_AbilityBase_GetWantUri
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0500
     * @tc.name   : The input parameter size is equal the OH_AbilityBase_GetWantUri return size.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0600
     * @tc.name   : The input parameter size is less the OH_AbilityBase_GetWantUri return size.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0700
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_SetWantInt32Param
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0800
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_SetWantInt32Param.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_0900
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantInt32Param
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_0900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_0900';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_0900();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1000
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_GetWantInt32Param
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1000';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1000();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1100
     * @tc.name   : The input parameter value is empty of OH_AbilityBase_GetWantInt32Param.
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1200
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_SetWantBoolParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1200';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1200();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1300
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_SetWantBoolParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1300';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1300();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1400
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantBoolParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1400();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1500
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_GetWantBoolParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1500', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1500();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1600
     * @tc.name   : The input parameter value is empty of OH_AbilityBase_GetWantBoolParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1600', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1600();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1700
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_SetWantDoubleParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1700', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1700();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1800
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_SetWantDoubleParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1800', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1800();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_1900
     * @tc.name   : The input parameter want is empty of OH_AbilityBase_GetWantDoubleParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_1900', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_1900';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_1900();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_2000
     * @tc.name   : The input parameter key is empty of OH_AbilityBase_GetWantDoubleParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_2000', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_2000';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_2000();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_NdkWantEx_2100
     * @tc.name   : The input parameter value is empty of OH_AbilityBase_GetWantDoubleParam
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_NdkWantEx_2100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NdkWantEx_2100';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.ndkWantEx_2100();
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= ` + JSON.stringify(result));
      expect(result).assertEqual(401);
      done();
    })
  })
}