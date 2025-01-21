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
    it('conditionVariableTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest001();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest002();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest003();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableTest004();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest001();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest002();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest003();
      expect(flag).assertEqual(0);
    })
    it('conditionVariableApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.conditionVariableApiTest004();
      expect(flag).assertEqual(0);
    })
    it('delayCTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.delayCTest001();
      expect(flag).assertEqual(0);
    })
    it('ffrtYieldC0001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.ffrtYieldC0001();
      expect(flag).assertEqual(0);
    })
    it('mutexAbnormalParamTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexAbnormalParamTest001();
      expect(flag).assertEqual(0);
    })
    it('mutexAbnormalParamTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexAbnormalParamTest002();
      expect(flag).assertEqual(0);
    })
    it('mutexTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest006();
      expect(flag).assertEqual(0);
    })
    it('mutexTest007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest007();
      expect(flag).assertEqual(0);
    })
    it('mutexTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.mutexTest008();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest001();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest002();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest003();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest004();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest005();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest006();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest007',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest007();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest008',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest008();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest009',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest009();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest010',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest010();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest011',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest011();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest012',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest012();
      expect(flag).assertEqual(0);
    })
    it('queueApiTest013',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueApiTest013();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest001();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest003();
      expect(flag).assertEqual(0);
    })
    it('queueCancelTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueCancelTest004();
      expect(flag).assertEqual(0);
    })
    it('queueDelayTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest001();
      expect(flag).assertEqual(0);
    })
    it('queueDelayTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest002();
      expect(flag).assertEqual(0);
    })
    it('queueDelayTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDelayTest005();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest001();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest002();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest003();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest004',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest004();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest005',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest005();
      expect(flag).assertEqual(0);
    })
    it('queueDfxTest006',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueDfxTest006();
      expect(flag).assertEqual(0);
    })
    it('queueTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest001();
      expect(flag).assertEqual(9);
    })
    it('queueTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest002();
      expect(flag).assertEqual(0);
    })
    it('queueTest003',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueTest003();
      expect(flag).assertEqual(0);
    })
    it('queueWaitTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.queueWaitTest001();
      expect(flag).assertEqual(0);
    })
    it('submitAbnormalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitAbnormalTest();
      expect(flag).assertEqual(0);
    })
    it('submitBasicTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitBasicTest001();
      expect(flag).assertEqual(0);
    })
    it('submitBasicTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitBasicTest002();
      expect(flag).assertEqual(0);
    })
    it('submitInDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitInDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitInDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitOuDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitOuDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitIODependTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIODependTest001();
      expect(flag).assertEqual(0);
    })
    it('submitIODependTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIODependTest002();
      expect(flag).assertEqual(0);
    })
    it('submitIn0Ou0WaitNullTask1Test',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitIn0Ou0WaitNullTask1Test();
      expect(flag).assertEqual(0);
    })
    it('submitHBasicTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHBasicTest001();
      expect(flag).assertEqual(0);
    })
    it('submitHBasicTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHBasicTest002();
      expect(flag).assertEqual(0);
    })
    it('submitHInDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHInDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitHInDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHInDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitHOuDependEmptyTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHOuDependEmptyTest();
      expect(flag).assertEqual(0);
    })
    it('submitHOuDependNullptrTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHOuDependNullptrTest();
      expect(flag).assertEqual(0);
    })
    it('submitHIODependTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHIODependTest001();
      expect(flag).assertEqual(0);
    })
    it('submitHIODependTest002',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.submitHIODependTest002();
      expect(flag).assertEqual(0);
    })
    it('sleepForTest000',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest000();
      expect(flag).assertEqual(0);
    })
    it('sleepForTest001',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.sleepForTest001();
      expect(flag).assertEqual(0);
    })
    it('taskAttrAbnormalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrAbnormalTest();
      expect(flag).assertEqual(0);
    })
    it('taskAttrQosIllegalTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrQosIllegalTest();
      expect(flag).assertEqual(0);
    })
    it('taskAttrQosQueryTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrQosQueryTest();
      expect(flag).assertEqual(0);
    })
    it('taskAttrSetNameTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrSetNameTest();
      expect(flag).assertEqual(0);
    })
    it('taskAttrSetQosTest',0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      var flag = ffrtndk.taskAttrSetQosTest();
      expect(flag).assertEqual(0);
    })
  })
}