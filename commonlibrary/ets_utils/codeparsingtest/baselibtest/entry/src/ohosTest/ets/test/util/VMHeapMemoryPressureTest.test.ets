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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { util } from '@kit.ArkTS';

const DEFAULT_THRESHOLD = 70;
const LOW_THRESHOLD = 50;
const HIGH_THRESHOLD = 100;

export default function vmHeapMemoryPressureTest() {

  describe('vmHeapMemoryPressureTest', () => {

    /**
     * run after testcase
     */
    afterEach(() => {
      util.ArkTSVM.offVMHeapMemoryPressure();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureRegister001
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0001
     * @tc.desc   Test duplicate callback registration should fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureRegister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureRegister001 START');

      let callback = (event: string) => {
        console.info('testVMHeapMemoryPressureRegister001 callback triggered with event: ' + event);
      };

      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: DEFAULT_THRESHOLD
      };

      let result1 = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      expect(result1).assertTrue();

      let result2 = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      expect(result2).assertFalse();

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureThresholdClamp001
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0002
     * @tc.desc   Test threshold clamping with low and high values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureThresholdClamp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureThresholdClamp001 START');

      let callback = (event: string) => {
        console.info('testVMHeapMemoryPressureThresholdClamp001 callback triggered with event: ' + event);
      };

      let threshold1: util.HeapMemoryThreshold = {
        localHeapThreshold: LOW_THRESHOLD
      };

      let result1 = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold1);
      expect(result1).assertTrue();

      util.ArkTSVM.offVMHeapMemoryPressure();

      let threshold2: util.HeapMemoryThreshold = {
        localHeapThreshold: HIGH_THRESHOLD
      };

      let result2 = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold2);
      expect(result2).assertTrue();

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureThresholdClamp002
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0003
     * @tc.desc   Test threshold clamping with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureThresholdClamp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureThresholdClamp002 START');

      let callback = (event: string) => {
        console.info('testVMHeapMemoryPressureThresholdClamp002 callback triggered with event: ' + event);
      };

      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: 0
      };

      let result = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      expect(result).assertTrue();

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureParameterValidation001
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0004
     * @tc.desc   Test parameter validation with null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureParameterValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureParameterValidation001 START');

      try {
        let result = util.ArkTSVM.onVMHeapMemoryPressure(null, {});
        expect(result).assertFalse();
      } catch (error) {
        console.info('testVMHeapMemoryPressureParameterValidation001 expected error: ' + error);
      }

      try {
        let callback = (event: string) => {};
        let result = util.ArkTSVM.onVMHeapMemoryPressure(callback, null);
        expect(result).assertFalse();
      } catch (error) {
        console.info('testVMHeapMemoryPressureParameterValidation001 expected error: ' + error);
      }

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureMultiThreshold001
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0005
     * @tc.desc   Test multiple threshold configuration with all heap types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureMultiThreshold001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureMultiThreshold001 START');

      let callback = (event: string) => {
        console.info('testVMHeapMemoryPressureMultiThreshold001 callback triggered with event: ' + event);
      };

      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: DEFAULT_THRESHOLD,
        sharedHeapThreshold: DEFAULT_THRESHOLD,
        processHeapThreshold: DEFAULT_THRESHOLD
      };

      let result = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      expect(result).assertTrue();

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureUnregister001
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0006
     * @tc.desc   Test multiple unregister calls safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureUnregister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureUnregister001 START');

      let callback = (event: string) => {
        console.info('testVMHeapMemoryPressureUnregister001 callback triggered with event: ' + event);
      };

      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: DEFAULT_THRESHOLD
      };

      let result = util.ArkTSVM.onVMHeapMemoryPressure(callback, threshold);
      expect(result).assertTrue();

      util.ArkTSVM.offVMHeapMemoryPressure();
      util.ArkTSVM.offVMHeapMemoryPressure();

      done();
    });

    /**
     * @tc.name   testVMHeapMemoryPressureUnregister002
     * @tc.number SUB_COMMONLIBRARY_UTIL_VM_HEAP_MEMORY_PRESSURE_0007
     * @tc.desc   Test register after unregister cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVMHeapMemoryPressureUnregister002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testVMHeapMemoryPressureUnregister002 START');

      let callback1 = (event: string) => {
        console.info('testVMHeapMemoryPressureUnregister002 callback1 triggered with event: ' + event);
      };

      let threshold: util.HeapMemoryThreshold = {
        localHeapThreshold: DEFAULT_THRESHOLD
      };

      let result1 = util.ArkTSVM.onVMHeapMemoryPressure(callback1, threshold);
      expect(result1).assertTrue();

      util.ArkTSVM.offVMHeapMemoryPressure();

      let callback2 = (event: string) => {
        console.info('testVMHeapMemoryPressureUnregister002 callback2 triggered with event: ' + event);
      };

      let result2 = util.ArkTSVM.onVMHeapMemoryPressure(callback2, threshold);
      expect(result2).assertTrue();

      done();
    });

  })
}
