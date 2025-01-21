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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import ffrtndk from 'libffrtndk.so';
export default function ffrtTest() {
  describe('ActsFfrtTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0100
     * @tc.name   : conditionVariableTest001
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0200
     * @tc.name   : conditionVariableTest002
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0300
     * @tc.name   : conditionVariableTest003
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0400
     * @tc.name   : conditionVariableTest004
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0500
     * @tc.name   : conditionVariableApiTest001
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0600
     * @tc.name   : conditionVariableApiTest002
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0700
     * @tc.name   : conditionVariableApiTest003
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0800
     * @tc.name   : conditionVariableApiTest004
     * @tc.desc   : Test ffrt condition variable api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('conditionVariableApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_0900
     * @tc.name   : delayCTest001
     * @tc.desc   : Test ffrt delay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('delayCTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.delayCTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1000
     * @tc.name   : ffrtYieldC0001
     * @tc.desc   : Test ffrt yield api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrtYieldC0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrtYieldC0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1100
     * @tc.name   : mutexAbnormalParamTest001
     * @tc.desc   : Test mutex api with abnormal param
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('mutexAbnormalParamTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexAbnormalParamTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1200
     * @tc.name   : mutexAbnormalParamTest002
     * @tc.desc   : Test mutex api with abnormal param
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('mutexAbnormalParamTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexAbnormalParamTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1300
     * @tc.name   : mutexTest006
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('mutexTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1400
     * @tc.name   : mutexTest007
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('mutexTest007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest007();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1500
     * @tc.name   : mutexTest008
     * @tc.desc   : Test mutex api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('mutexTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest008();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1600
     * @tc.name   : queueApiTest001
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1700
     * @tc.name   : queueApiTest002
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1800
     * @tc.name   : queueApiTest003
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_1900
     * @tc.name   : queueApiTest004
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2000
     * @tc.name   : queueApiTest005
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2100
     * @tc.name   : queueApiTest006
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2200
     * @tc.name   : queueApiTest007
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest007();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2300
     * @tc.name   : queueApiTest008
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest008();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2400
     * @tc.name   : queueApiTest009
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest009',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest009();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2500
     * @tc.name   : queueApiTest010
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest010',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest010();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2600
     * @tc.name   : queueApiTest011
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest011',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest011();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2700
     * @tc.name   : queueApiTest012
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest012',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest012();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2800
     * @tc.name   : queueApiTest013
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueApiTest013',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest013();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_2900
     * @tc.name   : queueCancelTest001
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueCancelTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3000
     * @tc.name   : queueCancelTest003
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueCancelTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3100
     * @tc.name   : queueCancelTest004
     * @tc.desc   : Test queueCancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueCancelTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3200
     * @tc.name   : queueDelayTest001
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDelayTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3300
     * @tc.name   : queueDelayTest002
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDelayTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3400
     * @tc.name   : queueDelayTest005
     * @tc.desc   : Test queueDelay api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDelayTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3500
     * @tc.name   : queueDfxTest001
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3600
     * @tc.name   : queueDfxTest002
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3700
     * @tc.name   : queueDfxTest003
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3800
     * @tc.name   : queueDfxTest004
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_3900
     * @tc.name   : queueDfxTest005
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest005();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4000
     * @tc.name   : queueDfxTest006
     * @tc.desc   : Test queueDfx api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueDfxTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest006();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4100
     * @tc.name   : queueTest001
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest001();
      expect(flag).assertEqual(9);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4200
     * @tc.name   : queueTest002
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4300
     * @tc.name   : queueTest003
     * @tc.desc   : Test queue api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4400
     * @tc.name   : queueWaitTest001
     * @tc.desc   : Test queueWait api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queueWaitTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueWaitTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4500
     * @tc.name   : submitAbnormalTest
     * @tc.desc   : Test submitAbnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitAbnormalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitAbnormalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4600
     * @tc.name   : submitBasicTest001
     * @tc.desc   : Test submitBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitBasicTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitBasicTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4700
     * @tc.name   : submitBasicTest002
     * @tc.desc   : Test submitBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitBasicTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitBasicTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4800
     * @tc.name   : submitInDependEmptyTest
     * @tc.desc   : Test submitInDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitInDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_4900
     * @tc.name   : submitInDependNullptrTest
     * @tc.desc   : Test submitInDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitInDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5000
     * @tc.name   : submitOuDependEmptyTest
     * @tc.desc   : Test submitOuDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitOuDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5100
     * @tc.name   : submitOuDependNullptrTest
     * @tc.desc   : Test submitOuDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitOuDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5200
     * @tc.name   : submitIODependTest001
     * @tc.desc   : Test submitIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitIODependTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIODependTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5300
     * @tc.name   : submitIODependTest002
     * @tc.desc   : Test submitIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitIODependTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIODependTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5400
     * @tc.name   : submitIn0Ou0WaitNullTask1Test
     * @tc.desc   : Test submitIn0Ou0WaitNullTask api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitIn0Ou0WaitNullTask1Test',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIn0Ou0WaitNullTask1Test();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5500
     * @tc.name   : submitHBasicTest001
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHBasicTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHBasicTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5600
     * @tc.name   : submitHBasicTest002
     * @tc.desc   : Test submitHBasic api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHBasicTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHBasicTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5700
     * @tc.name   : submitHInDependEmptyTest
     * @tc.desc   : Test submitHInDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHInDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHInDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5800
     * @tc.name   : submitHInDependNullptrTest
     * @tc.desc   : Test submitHInDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHInDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHInDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_5900
     * @tc.name   : submitHOuDependEmptyTest
     * @tc.desc   : Test submitHOuDependEmpty api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHOuDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6000
     * @tc.name   : submitHOuDependNullptrTest
     * @tc.desc   : Test submitHOuDependNullptr api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHOuDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6100
     * @tc.name   : submitHIODependTest001
     * @tc.desc   : Test submitHIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHIODependTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHIODependTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6200
     * @tc.name   : submitHIODependTest002
     * @tc.desc   : Test submitHIODepend api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('submitHIODependTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHIODependTest002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6300
     * @tc.name   : sleepForTest000
     * @tc.desc   : Test ffrt_sleep api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('sleepForTest000',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest000();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6400
     * @tc.name   : sleepForTest001
     * @tc.desc   : Test ffrt_sleep api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('sleepForTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6500
     * @tc.name   : taskAttrAbnormalTest
     * @tc.desc   : Test taskAttrAbnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('taskAttrAbnormalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrAbnormalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6600
     * @tc.name   : taskAttrQosIllegalTest
     * @tc.desc   : Test taskAttrQosIllegal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('taskAttrQosIllegalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrQosIllegalTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6700
     * @tc.name   : taskAttrQosQueryTest
     * @tc.desc   : Test taskAttrQosQuery api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('taskAttrQosQueryTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrQosQueryTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6800
     * @tc.name   : taskAttrSetNameTest
     * @tc.desc   : Test taskAttrSetName api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('taskAttrSetNameTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrSetNameTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_6900
     * @tc.name   : taskAttrSetQosTest
     * @tc.desc   : Test taskAttrSetQos api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('taskAttrSetQosTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrSetQosTest();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7000
     * @tc.name   : ffrt_timer_start_0001
     * @tc.desc   : Test ffrt_timer_start api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_timer_start_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_timer_start_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7100
     * @tc.name   : ffrt_timer_start_0002
     * @tc.desc   : Test ffrt_timer_start api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_timer_start_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_timer_start_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7200
     * @tc.name   : ffrt_timer_cancel_0001
     * @tc.desc   : Test ffrt_timer_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_timer_cancel_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_timer_cancel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7300
     * @tc.name   : ffrt_loop_0001
     * @tc.desc   : Test ffrt_loop api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7400
     * @tc.name   : ffrt_loop_0002
     * @tc.desc   : Test ffrt_loop cases
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7500
     * @tc.name   : ffrt_timer_start_abnormal_0001
     * @tc.desc   : Test ffrt_timer_start abnormal cases
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_timer_start_abnormal_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_timer_start_abnormal_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7600
     * @tc.name   : ffrt_loop_abnormal_0001
     * @tc.desc   : Test ffrt_loop abnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_abnormal_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_abnormal_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7700
     * @tc.name   : ffrt_loop_abnormal_0002
     * @tc.desc   : Test ffrt_loop abnormal api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_abnormal_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_abnormal_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7800
     * @tc.name   : ffrt_queue_parallel_api_0001
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_queue_parallel_api_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_queue_parallel_api_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_7900
     * @tc.name   : ffrt_queue_parallel_api_0002
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_queue_parallel_api_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_queue_parallel_api_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8000
     * @tc.name   : ffrt_queue_parallel_api_0003
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_queue_parallel_api_0003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_queue_parallel_api_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8100
     * @tc.name   : ffrt_queue_parallel_api_0004
     * @tc.desc   : Test ffrt_queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_queue_parallel_api_0004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_queue_parallel_api_0004();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8200
     * @tc.name   : queue_parallel_cancel_0001
     * @tc.desc   : Test queue_parallel_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queue_parallel_cancel_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue_parallel_cancel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8300
     * @tc.name   : queue_parallel_cancel_0002
     * @tc.desc   : Test queue_parallel_cancel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queue_parallel_cancel_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue_parallel_cancel_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8400
     * @tc.name   : queue_parallel_0001
     * @tc.desc   : Test queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queue_parallel_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue_parallel_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8500
     * @tc.name   : queue_parallel_0002
     * @tc.desc   : Test queue_parallel api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('queue_parallel_0002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queue_parallel_0002();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8600
     * @tc.name   : ffrt_loop_abnormal_0003
     * @tc.desc   : Test ffrt_loop_abnormal_0003 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_abnormal_0003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_abnormal_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8700
     * @tc.name   : ffrt_loop_normal_0003
     * @tc.desc   : Test ffrt_loop_normal_0003 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_loop_normal_0003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_loop_normal_0003();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8800
     * @tc.name   : ffrt_get_main_queue_0001
     * @tc.desc   : Test ffrt_get_main_queue_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_get_main_queue_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_get_main_queue_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_8900
     * @tc.name   : ffrt_get_current_queue_0001
     * @tc.desc   : Test ffrt_get_current_queue_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_get_current_queue_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_get_current_queue_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_9000
     * @tc.name   : ffrt_this_task_get_qos_0001
     * @tc.desc   : Test ffrt_this_task_get_qos_0001 api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_this_task_get_qos_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_this_task_get_qos_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_9100
     * @tc.name   : ffrt_attr_stack_size_0001
     * @tc.desc   : Test ffrt_attr_stack_size api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_attr_stack_size_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_attr_stack_size_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_9200
     * @tc.name   : ffrt_task_handle_ref_0001
     * @tc.desc   : Test ffrt_task_handle_ref api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('ffrt_task_handle_ref_0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrt_task_handle_ref_0001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_9300
     * @tc.name   : recursiveMutexAbnormalParamTest001
     * @tc.desc   : Test recursiveMutexAbnormalParamTest api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('recursiveMutexAbnormalParamTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.recursiveMutexAbnormalParamTest001();
      expect(flag).assertEqual(0);
    })

    /**
     * @tc.number : SUB_KERNEL_DISPATCH_FFRTNDK_9400
     * @tc.name   : recursiveMutexAbnormalInvalidParamTest001
     * @tc.desc   : Test recursiveMutexAbnormalInvalidParamTest api
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('recursiveMutexAbnormalInvalidParamTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.recursiveMutexAbnormalInvalidParamTest001();
      expect(flag).assertEqual(0);
    })
  })
}