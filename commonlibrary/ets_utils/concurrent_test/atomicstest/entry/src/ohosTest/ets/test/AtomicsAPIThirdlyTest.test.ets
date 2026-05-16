/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { atomicTask, gc, MemoryMonitor, sleep, taskFunction } from '../testability/pages/TestUtils';
import { taskpool } from '@kit.ArkTS';


export default function AtomicsAPIThirdlyTest() {
  describe('AtomicsAPIThirdlyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   AtomicsAddApiThirdlyTest0100
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0100
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0100';
      console.info(`${caseName} test start`);
      class ExtendedAtomics {
        static exchange(typedArray: Int32Array, index: number, value: number): number {
          console.log(`${index},${value}`);
          const result = Atomics.exchange(typedArray, index, value);
          console.log(`exchange:${result}`);
          return result;
        }
        static toString(): string {
          return 'extends Atomics';
        }
      }

      const sharedBuffer = new SharedArrayBuffer(16);
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
     * @tc.name   AtomicsAddApiThirdlyTest0200
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0200
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0200';
      console.info(`${caseName} test start`);
      const sharedBuffer = new SharedArrayBuffer(Int32Array.BYTES_PER_ELEMENT);
      const sharedArray = new Int32Array(sharedBuffer);
      sharedArray[0] = 0;
      const taskGroup = new taskpool.TaskGroup();
      const taskCount = 10;
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(taskFunction, sharedArray, 0, i);
        taskGroup.addTask(task);
      }
      await taskpool.execute(taskGroup);
      console.log(`${sharedArray[0]}`);
      expect(9).assertEqual(sharedArray[0]);
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.name   AtomicsAddApiThirdlyTest0300
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0300
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0300';
      console.info(`${caseName} test start`);

      try {
        const iterations = 1000;
        const bufferSize = 1024;
        const monitor = new MemoryMonitor(caseName);
        await monitor.takeSnapshot('Initial');
        for (let i = 0; i < iterations; i++) {
          const sab = new SharedArrayBuffer(bufferSize);
          const int32Array = new Int32Array(sab);
          Atomics.add(int32Array, 0, 1);
          if (i == 0 || i == 200 || i == 400 || i == 600 || i == 800 || i == 999) {
            console.info(`${caseName}: Completed ${i} iterations`);
            await monitor.takeSnapshot(`After ${i} iterations`);
          }
        }
        console.info(`${caseName}: Completed all ${iterations} iterations`);
        await monitor.takeSnapshot('Final');
        const memoryLeakDetected = !monitor.checkForLeaks(1.5);
        console.info(`${caseName}: Memory leak detected: ${memoryLeakDetected}`);
        expect(memoryLeakDetected).assertFalse();
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        Done();
      }
    });

    /**
     * @tc.name   AtomicsAddApiThirdlyTest0400
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0400
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0400';
      console.info(`${caseName} test start`);
      try {
        let startTime: number = Date.now();
        let totalSum: number = 0;
        const buffer = new SharedArrayBuffer(64);
        const int32Array = new Int32Array(buffer);
        for (let i = 0; i < 1000; i++) {
          for (let j = 0; j < int32Array.length; j++) {
            Atomics.store(int32Array, j, j);
          }
          const float64Array = new Float64Array(buffer);
          float64Array[0] = 3.14;
          let sum: number = 0;
          for (let j = 0; j < int32Array.length; j++) {
            sum += Atomics.load(int32Array, j);
          }
          totalSum += sum;

          const sabSlice = buffer.slice(0, 32);
          const sliceView = new Int32Array(sabSlice);
          if (sliceView.length > 0) {
            Atomics.add(sliceView, 0, 1);
          }

          expect(sliceView[0]).assertEqual(1374389536);
        }
        let endTime: number = Date.now();
        console.info(`${caseName}: Completed 1000 iterations in ${endTime - startTime} ms with total sum: ${totalSum}`);
        expect(totalSum).assertEqual(2448729166000);
      } catch (error) {
        console.error(`${caseName} Test failed: ${error}`);
      } finally {
        console.info(`${caseName} test end`);
        Done();
      }
    });


    /**
     * @tc.name   AtomicsAddApiThirdlyTest0500
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0500
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0500';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(4);
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


    /**
     * @tc.name   AtomicsAddApiThirdlyTest0600
     * @tc.number SUB_ATOMICS_API_THIRDLY_TEST_0600
     * @tc.desc   Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AtomicsAddApiThirdlyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsAddApiThirdlyTest0600';
      console.info(`${caseName} test start`);
      const sharedBuffer = new SharedArrayBuffer(4);
      const sharedArray = new Int32Array(sharedBuffer);
      Atomics.store(sharedArray, 0, 0);
      const loopCount = 1000;
      let count = 0;
      const startTime = Date.now();
      for (let i = 0; i < loopCount; i++) {
        Atomics.add(sharedArray, 0, 1);
        if (i % 100 === 0 && i!== 0) {
         gc();
         count++;
        }
      }
      console.log(`${count}`);
      const endTime = Date.now();
      const finalResult = Atomics.load(sharedArray, 0);
      console.info(`finalResult: ${finalResult}`);
      console.info(`time-consuming: ${endTime - startTime}`);
      expect(9).assertEqual(count);
      expect(1000).assertEqual(finalResult);
      console.info(`${caseName} test end`);
      Done()
    });

  })
}