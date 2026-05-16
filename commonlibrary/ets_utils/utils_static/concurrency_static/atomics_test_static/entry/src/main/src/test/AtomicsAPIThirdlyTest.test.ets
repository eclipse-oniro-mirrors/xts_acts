/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { atomicTask, gc, MemoryMonitor, sleep, taskFunction } from '../testability/pages/TestUtils';


class ExtendedAtomics {
  static exchange(typedArray: Int32Array, index: number, value: number): number {
    console.log(`${index},${value}`);
    const result = Atomics.exchange(typedArray, index as int, value as int);
    console.log(`exchange:${result}`);
    return result;
  }
  static toString(): string {
    return 'extends Atomics';
  }
}

export default function AtomicsAPIThirdlyTest() {
  describe('AtomicsAPIThirdlyTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0100
     * @tc.name AtomicsAddApiThirdlyTest0100
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAddApiThirdlyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsAddApiThirdlyTest0100';
      console.info(`${caseName} test start`);
      const sharedBuffer = new ArrayBuffer(16);
      const intArray = new Int32Array(sharedBuffer);
      intArray[0] = 10;
      const oldValue = ExtendedAtomics.exchange(intArray, 0, 20);
      console.log(`${oldValue}`);
      expect(10).assertEqual(oldValue);
      console.log(ExtendedAtomics.toString());
      expect('extends Atomics').assertEqual(ExtendedAtomics.toString());
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0500
     * @tc.name AtomicsAddApiThirdlyTest0500
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsAddApiThirdlyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsAddApiThirdlyTest0500';
      console.info(`${caseName} test start`);
      const buffer = new ArrayBuffer(4);
      const sharedArray = new Int32Array(buffer);
      Atomics.store(sharedArray, 0, 0);
      const numTasks = 10;
      const startTime = Date.now();
      const taskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < numTasks; i++) {
        const task = new taskpool.Task(atomicTask);
        taskGroup.addTask(task);
      }
      await taskpool.execute(taskGroup);
      const endTime = Date.now();
      const finalResult = Atomics.load(sharedArray, 0);
      console.info(`finalResult: ${finalResult}`);
      console.info(`time-consuming: ${endTime - startTime}`);
      expect(0).assertEqual(finalResult);
      console.info(`${caseName} test end`);
      Done()
    });


  })
}