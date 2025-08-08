/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import entry from 'libentry.so';
export default function ffrtTest() {
  describe('ActsFfrtTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0100
     * @tc.name   : conditionVariableTest001
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0200
     * @tc.name   : conditionVariableTest002
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0300
     * @tc.name   : conditionVariableTest003
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0400
     * @tc.name   : conditionVariableTest004
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableTest004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0500
     * @tc.name   : conditionVariableApiTest001
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableApiTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableApiTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0600
     * @tc.name   : conditionVariableApiTest002
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableApiTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableApiTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0700
     * @tc.name   : conditionVariableApiTest003
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableApiTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableApiTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0800
     * @tc.name   : conditionVariableApiTest004
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('conditionVariableApiTest004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.conditionVariableApiTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_0900
     * @tc.name   : delayCTest001
     * @tc.desc   : Test ffrt delay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('delayCTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.delayCTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1000
     * @tc.name   : ffrtYieldC0001
     * @tc.desc   : Test ffrt yield api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrtYieldC0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrtYieldC0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1100
     * @tc.name   : mutexAbnormalParamTest001
     * @tc.desc   : Test mutex api with abnormal param
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('mutexAbnormalParamTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.mutexAbnormalParamTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1200
     * @tc.name   : mutexAbnormalParamTest002
     * @tc.desc   : Test mutex api with abnormal param
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('mutexAbnormalParamTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.mutexAbnormalParamTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1300
     * @tc.name   : mutexTest006
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('mutexTest006', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.mutexTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1400
     * @tc.name   : mutexTest007
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('mutexTest007', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.mutexTest007();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1500
     * @tc.name   : mutexTest008
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('mutexTest008', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.mutexTest008();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1600
     * @tc.name   : queueApiTest001
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1700
     * @tc.name   : queueApiTest002
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1800
     * @tc.name   : queueApiTest003
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_1900
     * @tc.name   : queueApiTest004
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2000
     * @tc.name   : queueApiTest005
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest005', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2100
     * @tc.name   : queueApiTest006
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest006', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2200
     * @tc.name   : queueApiTest007
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest007', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest007();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2300
     * @tc.name   : queueApiTest008
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest008', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest008();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2400
     * @tc.name   : queueApiTest009
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest009', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest009();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2500
     * @tc.name   : queueApiTest010
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest010', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest010();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2600
     * @tc.name   : queueApiTest011
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest011', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest011();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2700
     * @tc.name   : queueApiTest012
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest012', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest012();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2800
     * @tc.name   : queueApiTest013
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest013', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest013();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_2900
     * @tc.name   : queueCancelTest001
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueCancelTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueCancelTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3000
     * @tc.name   : queueCancelTest003
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueCancelTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueCancelTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3100
     * @tc.name   : queueCancelTest004
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueCancelTest004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueCancelTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3200
     * @tc.name   : queueDelayTest001
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDelayTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDelayTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3300
     * @tc.name   : queueDelayTest002
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDelayTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDelayTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3400
     * @tc.name   : queueDelayTest005
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDelayTest005', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDelayTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3500
     * @tc.name   : queueDfxTest001
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3600
     * @tc.name   : queueDfxTest002
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3700
     * @tc.name   : queueDfxTest003
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3800
     * @tc.name   : queueDfxTest004
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_3900
     * @tc.name   : queueDfxTest005
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest005', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4000
     * @tc.name   : queueDfxTest006
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueDfxTest006', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueDfxTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4100
     * @tc.name   : queueTest001
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueTest001();
      expect(flag).assertEqual(9);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4200
     * @tc.name   : queueTest002
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4300
     * @tc.name   : queueTest003
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueTest003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4400
     * @tc.name   : queueWaitTest001
     * @tc.desc   : Test queueWait api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueWaitTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueWaitTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4500
     * @tc.name   : submitAbnormalTest
     * @tc.desc   : Test submitAbnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitAbnormalTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitAbnormalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4600
     * @tc.name   : submitBasicTest001
     * @tc.desc   : Test submitBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitBasicTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitBasicTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4700
     * @tc.name   : submitBasicTest002
     * @tc.desc   : Test submitBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitBasicTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitBasicTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4800
     * @tc.name   : submitInDependEmptyTest
     * @tc.desc   : Test submitInDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitInDependEmptyTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitInDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_4900
     * @tc.name   : submitInDependNullptrTest
     * @tc.desc   : Test submitInDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitInDependNullptrTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitInDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5000
     * @tc.name   : submitOuDependEmptyTest
     * @tc.desc   : Test submitOuDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitOuDependEmptyTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5100
     * @tc.name   : submitOuDependNullptrTest
     * @tc.desc   : Test submitOuDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitOuDependNullptrTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5200
     * @tc.name   : submitIODependTest001
     * @tc.desc   : Test submitIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitIODependTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitIODependTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5300
     * @tc.name   : submitIODependTest002
     * @tc.desc   : Test submitIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitIODependTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitIODependTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5400
     * @tc.name   : submitIn0Ou0WaitNullTask1Test
     * @tc.desc   : Test submitIn0Ou0WaitNullTask api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitIn0Ou0WaitNullTask1Test', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitIn0Ou0WaitNullTask1Test();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5500
     * @tc.name   : submitHBasicTest001
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHBasicTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHBasicTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5600
     * @tc.name   : submitHBasicTest002
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHBasicTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHBasicTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5700
     * @tc.name   : submitHInDependEmptyTest
     * @tc.desc   : Test submitHInDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHInDependEmptyTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHInDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5800
     * @tc.name   : submitHInDependNullptrTest
     * @tc.desc   : Test submitHInDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHInDependNullptrTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHInDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_5900
     * @tc.name   : submitHOuDependEmptyTest
     * @tc.desc   : Test submitHOuDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHOuDependEmptyTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6000
     * @tc.name   : submitHOuDependNullptrTest
     * @tc.desc   : Test submitHOuDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHOuDependNullptrTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6100
     * @tc.name   : submitHIODependTest001
     * @tc.desc   : Test submitHIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHIODependTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHIODependTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6200
     * @tc.name   : submitHIODependTest002
     * @tc.desc   : Test submitHIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHIODependTest002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHIODependTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6300
     * @tc.name   : sleepForTest000
     * @tc.desc   : Test ffrt_sleep api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('sleepForTest000', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.sleepForTest000();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6400
     * @tc.name   : sleepForTest001
     * @tc.desc   : Test ffrt_sleep api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('sleepForTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.sleepForTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6500
     * @tc.name   : taskAttrAbnormalTest
     * @tc.desc   : Test taskAttrAbnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('taskAttrAbnormalTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.taskAttrAbnormalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6600
     * @tc.name   : taskAttrQosIllegalTest
     * @tc.desc   : Test taskAttrQosIllegal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('taskAttrQosIllegalTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.taskAttrQosIllegalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6700
     * @tc.name   : taskAttrQosQueryTest
     * @tc.desc   : Test taskAttrQosQuery api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('taskAttrQosQueryTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.taskAttrQosQueryTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6800
     * @tc.name   : taskAttrSetNameTest
     * @tc.desc   : Test taskAttrSetName api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('taskAttrSetNameTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.taskAttrSetNameTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_6900
     * @tc.name   : taskAttrSetQosTest
     * @tc.desc   : Test taskAttrSetQos api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('taskAttrSetQosTest', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.taskAttrSetQosTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7000
     * @tc.name   : ffrt_timer_start_0001
     * @tc.desc   : Test ffrt_timer_start api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_timer_start_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_timer_start_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7100
     * @tc.name   : ffrt_timer_start_0002
     * @tc.desc   : Test ffrt_timer_start api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_timer_start_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_timer_start_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7200
     * @tc.name   : ffrt_timer_cancel_0001
     * @tc.desc   : Test ffrt_timer_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_timer_cancel_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_timer_cancel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7300
     * @tc.name   : ffrt_loop_0001
     * @tc.desc   : Test ffrt_loop api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7400
     * @tc.name   : ffrt_loop_0002
     * @tc.desc   : Test ffrt_loop cases
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7500
     * @tc.name   : ffrt_timer_start_abnormal_0001
     * @tc.desc   : Test ffrt_timer_start abnormal cases
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_timer_start_abnormal_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_timer_start_abnormal_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7600
     * @tc.name   : ffrt_loop_abnormal_0001
     * @tc.desc   : Test ffrt_loop abnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_abnormal_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_abnormal_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7700
     * @tc.name   : ffrt_loop_abnormal_0002
     * @tc.desc   : Test ffrt_loop abnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_abnormal_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_abnormal_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7800
     * @tc.name   : ffrt_queue_parallel_api_0001
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_queue_parallel_api_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_queue_parallel_api_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_7900
     * @tc.name   : ffrt_queue_parallel_api_0002
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_queue_parallel_api_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_queue_parallel_api_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8000
     * @tc.name   : ffrt_queue_parallel_api_0003
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_queue_parallel_api_0003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_queue_parallel_api_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8100
     * @tc.name   : ffrt_queue_parallel_api_0004
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_queue_parallel_api_0004', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_queue_parallel_api_0004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8200
     * @tc.name   : queue_parallel_cancel_0001
     * @tc.desc   : Test queue_parallel_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queue_parallel_cancel_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queue_parallel_cancel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8300
     * @tc.name   : queue_parallel_cancel_0002
     * @tc.desc   : Test queue_parallel_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queue_parallel_cancel_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queue_parallel_cancel_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8400
     * @tc.name   : queue_parallel_0001
     * @tc.desc   : Test queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queue_parallel_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queue_parallel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8500
     * @tc.name   : queue_parallel_0002
     * @tc.desc   : Test queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queue_parallel_0002', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queue_parallel_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8600
     * @tc.name   : ffrt_loop_abnormal_0003
     * @tc.desc   : Test ffrt_loop_abnormal_0003 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_abnormal_0003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_abnormal_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8700
     * @tc.name   : ffrt_loop_normal_0003
     * @tc.desc   : Test ffrt_loop_normal_0003 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_loop_normal_0003', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_loop_normal_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8800
     * @tc.name   : ffrt_get_main_queue_0001
     * @tc.desc   : Test ffrt_get_main_queue_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_get_main_queue_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_get_main_queue_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_8900
     * @tc.name   : ffrt_get_current_queue_0001
     * @tc.desc   : Test ffrt_get_current_queue_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_get_current_queue_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_get_current_queue_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9000
     * @tc.name   : ffrt_this_task_get_qos_0001
     * @tc.desc   : Test ffrt_this_task_get_qos_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_this_task_get_qos_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_this_task_get_qos_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9100
     * @tc.name   : ffrt_attr_stack_size_0001
     * @tc.desc   : Test ffrt_attr_stack_size api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_attr_stack_size_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_attr_stack_size_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9200
     * @tc.name   : ffrt_task_handle_ref_0001
     * @tc.desc   : Test ffrt_task_handle_ref api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_task_handle_ref_0001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_task_handle_ref_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9300
     * @tc.name   : recursiveMutexAbnormalParamTest001
     * @tc.desc   : Test recursiveMutexAbnormalParamTest api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('recursiveMutexAbnormalParamTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.recursiveMutexAbnormalParamTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9400
     * @tc.name   : recursiveMutexAbnormalInvalidParamTest001
     * @tc.desc   : Test recursiveMutexAbnormalInvalidParamTest api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('recursiveMutexAbnormalInvalidParamTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.recursiveMutexAbnormalInvalidParamTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9500
     * @tc.name   : ffrtThisTaskGetId001
     * @tc.desc   : Test ffrtThisTaskGetId api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrtThisTaskGetId001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrtThisTaskGetId();
      expect(flag).assertEqual(1);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9600
     * @tc.name   : ffrtThisTaskUpdateQos001
     * @tc.desc   : Test ffrtThisTaskUpdateQos api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrtThisTaskUpdateQos001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrtThisTaskUpdateQos();
      expect(flag).assertEqual(100);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9700
     * @tc.name   : sharedMutexTest001
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('sharedMutexTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.sharedMutexTest001();
      expect(flag).assertEqual(0);
    })
    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9800
     * @tc.name   : submitHFTest001
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitHFTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitHFTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_9900
     * @tc.name   : submitFTest001
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('submitFTest001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.submitFTest001();
      expect(flag).assertEqual(0);
    })
    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_10000
     * @tc.name   : queueApiTest014
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest014', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest014();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_10100
     * @tc.name   : queueApiTest015
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest015', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest015();
      expect(flag).assertEqual(0);
    })

     /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_10200
     * @tc.name   : ffrt_fiber_001
     * @tc.desc   : Test ffrt_fiber_init api && ffrt_fiber_switch api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('ffrt_fiber_001', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.ffrt_fiber_001();
      expect(flag).assertEqual(1);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_entry_10300
     * @tc.name   : queueApiTest016
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('queueApiTest016', Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let flag = entry.queueApiTest016();
      expect(flag).assertEqual(0);
    })
  })
}