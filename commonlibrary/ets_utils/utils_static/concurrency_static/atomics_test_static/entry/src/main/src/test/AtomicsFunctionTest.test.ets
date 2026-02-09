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
import {
  andTask,
  atomicCompareExchangeTask, atomicOrTask, atomicTask1,
  atomicXorTask,
  exchangeTask,
  modifyInt16Array,
  modifyValueTask,
  notifyInTaskpool,
  orTask,
  sleep,
  subTask,
  taskAnd,
  taskExchange,
  taskOr,
  taskStore,
  taskSub,
  taskXor,
  waitInTaskpool,
  waitInTaskpool2,
  waitInTaskpool3,
  } from '../testability/pages/TestUtils';


export default function AtomicsFunctionTest() {
  describe('AtomicsFunctionTest', ():void => {
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
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0100
     * @tc.name AtomicsFunctionTest0100
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest0100';
      console.info(`${caseName} test start`);
      let flag:boolean = false;
      const buffer = new ArrayBuffer(4);
      const sharedArray = new Int8Array(buffer);
      Atomics.store(sharedArray, 0, 0);
      const task = new taskpool.Task(atomicTask1,sharedArray);
      await taskpool.execute(task).then(()=>{
        flag = true
      })
      const mainThreadResult = Atomics.load(sharedArray, 0);
      expect(flag).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0300
     * @tc.name AtomicsFunctionTest0300
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest0300';
      console.info(`${caseName} test start`);
      const buffer = new ArrayBuffer(200);
      const sharedArray = new Int16Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const task = new taskpool.Task(atomicCompareExchangeTask,sharedArray);
      const result = await taskpool.execute(task);
      console.info(`${result}`);

      for (let i = 0; i < 100; i++) {
        const mainResult = Atomics.load(sharedArray, i);
        const expected = i + 1;
        expect(mainResult).assertEqual(expected);
      }
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0500
     * @tc.name AtomicsFunctionTest0500
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest0500';
      console.info(`${caseName} test start`);
      const buffer = new ArrayBuffer(400);
      const sharedArray = new Int32Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const task = new taskpool.Task(atomicOrTask,sharedArray);
      const result = await taskpool.execute(task);
      console.info(`${result}`);

      for (let i = 0; i < 100; i++) {
        const mainResult = Atomics.load(sharedArray, i);
        const expected = i | 2;
        expect(mainResult).assertEqual(expected);
      }
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0700
     * @tc.name AtomicsFunctionTest0700
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest0700';
      console.info(`${caseName} test start`);
      const buffer = new ArrayBuffer(800);
      const sharedArray = new BigInt64Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = BigInt(i);
      }
      const task = new taskpool.Task(atomicXorTask,buffer);
      const result = await taskpool.execute(task);
      console.info(`${result}`);
      for (let i = 0; i < 100; i++) {
        const mainResult = Atomics.load(sharedArray, i);
        const expected = BigInt(i) ^ 2n;
        expect(mainResult).assertEqual(expected);
      }
      console.info(`${caseName} test end`);
      Done();
    });

    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1500
     * @tc.name AtomicsFunctionTest1500
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest1500';
      console.info(`${caseName} test start`);
      const ArrayBuffer: ArrayBuffer = new ArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(ArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }

      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex as int, 0n);
      const checkIndex: number = 3;
      const expectedValue: bigint = BigInt(6);

      for (let i = 0; i < 10; i++) {
        const task: taskpool.Task = new taskpool.Task(waitInTaskpool, ArrayBuffer, statusIndex);
        taskpool.execute(task)
          .then(() => {
            console.log(`Task ${i} in taskpool completed.`);
          })
          .catch((err: Error):void => {
            console.error(`Error in taskpool task ${i}: `, err.message);
          });
      }
      Atomics.store(bigInt64Array, statusIndex as int, 1n);
      Atomics.notify(bigInt64Array, statusIndex as int);
      console.log('Main thread has notified all taskpool tasks');
      const actualValue: bigint = Atomics.load(bigInt64Array, checkIndex as int);
      expect(actualValue).assertEqual(expectedValue);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1600
     * @tc.name AtomicsFunctionTest1600
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest1600';
      console.info(`${caseName} test start`);
      const ArrayBuffer: ArrayBuffer = new ArrayBuffer(11 * 4);
      const int32Array: Int32Array = new Int32Array(ArrayBuffer);
      for (let i = 0; i < 10; i++) {
        int32Array[i] = i * 2;
      }
      const statusIndex: number = 10;
      Atomics.store(int32Array, statusIndex as int, 0);
      for (let i = 0; i < 10; i++) {
        const task: taskpool.Task = new taskpool.Task(waitInTaskpool2, ArrayBuffer, statusIndex);
        taskpool.execute(task)
          .then(() => {
            console.log(`Task ${i} in taskpool completed.`);
          })
          .catch((err: Error):void => {
            console.error(`Error in taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(int32Array, statusIndex as int);
      expect(loadedValue).assertEqual(0);
      console.info(`${caseName} test end`);
      Done();
    });




    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1700
     * @tc.name AtomicsFunctionTest1700
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest1700';
      console.info(`${caseName} test start`);
      const ArrayBuffer: ArrayBuffer = new ArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(ArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }
      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex as int, 0n);

      for (let i = 0; i < 10; i++) {
        const waitTask: taskpool.Task = new taskpool.Task(waitInTaskpool, ArrayBuffer, statusIndex);
        taskpool.execute(waitTask)
          .then(() => {
            console.log(`Wait Task ${i} in taskpool completed.`);
          })
          .catch((err: Error):void => {
            console.error(`Error in wait taskpool task ${i}: `, err.message);
          });
      }

      for (let i = 0; i < 10; i++) {
        const notifyTask: taskpool.Task = new taskpool.Task(notifyInTaskpool, ArrayBuffer, statusIndex);
        taskpool.execute(notifyTask)
          .then(() => {
            console.log(`Notify Task ${i} in taskpool completed.`);
          })
          .catch((err: Error):void => {
            console.error(`Error in notify taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(bigInt64Array, statusIndex as int);
      expect(loadedValue).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1800
     * @tc.name AtomicsFunctionTest1800
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: ()=>void):Promise<void> => {
      const caseName = 'AtomicsFunctionTest1800';
      console.info(`${caseName} test start`);
      const ArrayBuffer: ArrayBuffer = new ArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(ArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }
      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex as int, 0n);
      for (let i = 0; i < 10; i++) {
        const expectedValue = BigInt(i + 1);
        const waitTask: taskpool.Task = new taskpool.Task(waitInTaskpool3, ArrayBuffer, statusIndex, expectedValue);
        taskpool.execute(waitTask)
          .then(() => {
            console.log(`Wait Task ${i} in taskpool completed.`);
          })
          .catch((err: Error):void => {
            console.error(`Error in wait taskpool task ${i}: `, err.message);
          });
      }

      for (let i = 0; i < 10; i++) {

        const notifyTask: taskpool.Task = new taskpool.Task(notifyInTaskpool, ArrayBuffer, statusIndex);
        taskpool.execute(notifyTask)
          .then(() => {
            console.log(`Notify Task ${i} in taskpool completed.`);
          })
          .catch((err) => {
            let error = err as Error
            console.error(`Error in notify taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(bigInt64Array, statusIndex as int);
      expect(loadedValue).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}