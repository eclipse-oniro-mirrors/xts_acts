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
  StoreWorker,
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
  Worker3,
  WorkerSrc,
  WorkerSrc1,
  WorkerSrc2,
  WorkerSrc3,
  WorkerSrc4,
  XorWorker} from '../testability/pages/TestUtils';
import { ErrorEvent, MessageEvents, taskpool } from '@kit.ArkTS';


export default function AtomicsFunctionTest() {
  describe('AtomicsFunctionTest', () => {
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
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0100
     * @tc.name AtomicsFunctionTest0100
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0100';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(4);
      const sharedArray = new Int8Array(buffer);
      Atomics.store(sharedArray, 0, 0);

      const task = new taskpool.Task(atomicTask1,sharedArray);
      const taskResult = await taskpool.execute(task);
      const mainThreadResult = Atomics.load(sharedArray, 0);
      expect(taskResult).assertEqual(mainThreadResult);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0200
     * @tc.name AtomicsFunctionTest0200
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0200';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(100);
      const sharedArray = new Uint8Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i + 1;
      }
      console.log(`${buffer.byteLength}`)
      const workerFinished = new Promise<void>((resolve) => {
        WorkerSrc.workerInstance.postMessage(buffer);
        WorkerSrc.workerInstance.onmessage = (e) => {
          const workerData:Uint8Array = e.data;
          console.info('workerInstance onmessage is: ', workerData);
          for (let i = 0; i < 100; i++) {
            const mainResult = Atomics.load(sharedArray, i);
            expect(mainResult).assertEqual(workerData[i]);
          }
        };
        WorkerSrc.workerInstance.onexit = (code) => {
          console.info(`${caseName} worker exited with code: ${code}`);
          resolve();
        };
      });
      await workerFinished;
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
    it('AtomicsFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0300';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(200);
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
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0400
     * @tc.name AtomicsFunctionTest0400
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0400';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(200);
      const sharedArray = new Uint16Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const workerFinished = new Promise<void>((resolve) => {
        WorkerSrc2.workerInstance.postMessage(buffer);
        WorkerSrc2.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new Uint16Array(e.data);
          console.info('workerInstance onmessage is: ', workerData);
          for (let i = 0; i < 100; i++) {
            const mainResult = Atomics.load(sharedArray, i);
            expect(mainResult).assertEqual(workerData[i]);
          }
        };

        WorkerSrc2.workerInstance.onexit = (e) => {
          console.log(`${e}`)
          expect(e).assertEqual(0);
          resolve();
        };
      })
      await workerFinished;
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
    it('AtomicsFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0500';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(400);
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
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0600
     * @tc.name AtomicsFunctionTest0600
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0600';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(400);
      const sharedArray = new Uint32Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = i;
      }
      const workerFinished = new Promise<void>((resolve) => {
        WorkerSrc3.workerInstance.postMessage(buffer);
        WorkerSrc3.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new Uint32Array(e.data);
          console.info('workerInstance onmessage is: ', workerData);
          for (let i = 0; i < 100; i++) {
            const mainResult = Atomics.load(sharedArray, i);
            expect(mainResult).assertEqual(workerData[i]);
          }
        };
        WorkerSrc3.workerInstance.onexit = (e) => {
          console.log(`${e}`)
          expect(e).assertEqual(0);
          resolve();
        };
      })
      await workerFinished;
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
    it('AtomicsFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0700';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(800);
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
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0800
     * @tc.name AtomicsFunctionTest0800
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0800';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(800);
      const sharedArray = new BigUint64Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = BigInt(i);
      }
      const workerFinished = new Promise<void>((resolve) => {
        WorkerSrc4.workerInstance.postMessage(buffer);
        WorkerSrc4.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new BigUint64Array(e.data);
          console.info('workerInstance onmessage is: ', workerData);
          for (let i = 0; i < 100; i++) {
            const mainResult = Atomics.load(sharedArray, i);
            expect(mainResult).assertEqual(workerData[i]);
          }
        };
        WorkerSrc4.workerInstance.onexit = (e) => {
          console.log(`${e}`)
          expect(e).assertEqual(0);
          resolve();
        };
      });
      await workerFinished;
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_0900
     * @tc.name AtomicsFunctionTest0900
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest0900';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(800);
      const sharedArray = new BigUint64Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = BigInt(i);
      }
      const workerFinished = new Promise<void>((resolve) => {
        WorkerSrc1.workerInstance.postMessage(buffer);
        WorkerSrc1.workerInstance.onmessage = (e: MessageEvents) => {
          const workerData = new BigUint64Array(e.data);
          console.info('workerInstance onmessage is: ', workerData);
          for (let i = 0; i < 100; i++) {
            const mainResult = Atomics.load(sharedArray, i);
            expect(mainResult).assertEqual(workerData[i]);
          }
        };
        WorkerSrc1.workerInstance.onexit = (e) => {
          console.log(`${e}`)
          expect(e).assertEqual(0);
          resolve();
        };
      });
      WorkerSrc1.workerInstance.terminate();
      await workerFinished;
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1000
     * @tc.name AtomicsFunctionTest1000
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1000';
      console.info(`${caseName} test start`);
      const buffer = new SharedArrayBuffer(800);
      const sharedArray = new BigInt64Array(buffer);
      for (let i = 0; i < 100; i++) {
        sharedArray[i] = BigInt(i);
      }
      let completedTasks = 0;
      const totalTasks = 6;

      await new Promise<void>((resolve, reject) => {
        XorWorker.workerInstance.onmessage = (e) => {
          const resultBuffer:SharedArrayBuffer = e.data;
          if (resultBuffer instanceof SharedArrayBuffer) {
            const resultArray = new BigInt64Array(resultBuffer);
            for (let i = 0; i < 100; i++) {
              sharedArray[i] = resultArray[i];
            }
            completedTasks++;
          }
        };

        XorWorker.workerInstance.onerror = (error) => {
          console.error(`${caseName} XorWorker:`, error);
          reject(error);
        };

        XorWorker.workerInstance.onexit = (code) => {
          console.log(`${caseName} XorWorker: ${code}`);
          expect(code).assertEqual(0);
          resolve();
        };

        XorWorker.workerInstance.postMessage(buffer);
      });

      await new Promise<void>((resolve, reject) => {
        StoreWorker.workerInstance.onmessage = (e) => {
          const resultBuffer:SharedArrayBuffer = e.data;
          if (resultBuffer instanceof SharedArrayBuffer) {
            const resultArray = new BigInt64Array(resultBuffer);
            for (let i = 0; i < 100; i++) {
              sharedArray[i] = resultArray[i];
            }
            completedTasks++;
          }
        };

        StoreWorker.workerInstance.onerror = (error) => {
          console.error(`${caseName} StoreWorker:`, error);
          reject(error);
        };

        StoreWorker.workerInstance.onexit = (code) => {
          console.log(`${caseName} StoreWorker: ${code}`);
          expect(code).assertEqual(0);
          resolve();
        };

        StoreWorker.workerInstance.postMessage(buffer);
      });

      const andTaskInstance = new taskpool.Task(andTask, buffer);
      const andResultBuffer = await taskpool.execute(andTaskInstance);
      if (andResultBuffer instanceof SharedArrayBuffer) {
        const resultArray = new BigInt64Array(andResultBuffer);
        for (let i = 0; i < 100; i++) {
          sharedArray[i] = resultArray[i];
        }
        completedTasks++;
      }

      const exchangeTaskInstance = new taskpool.Task(exchangeTask, buffer);
      const exchangeResultBuffer = await taskpool.execute(exchangeTaskInstance);
      if (exchangeResultBuffer instanceof SharedArrayBuffer) {
        const resultArray = new BigInt64Array(exchangeResultBuffer);
        for (let i = 0; i < 100; i++) {
          sharedArray[i] = resultArray[i];
        }
        completedTasks++;
      }

      const orTaskInstance = new taskpool.Task(orTask, buffer);
      const orResultBuffer = await taskpool.execute(orTaskInstance);
      if (orResultBuffer instanceof SharedArrayBuffer) {
        const resultArray = new BigInt64Array(orResultBuffer);
        for (let i = 0; i < 100; i++) {
          sharedArray[i] = resultArray[i];
        }
        completedTasks++;
        console.info('orTask: ', completedTasks);
      }

      const subTaskInstance = new taskpool.Task(subTask, buffer);
      const subResultBuffer = await taskpool.execute(subTaskInstance);
      if (subResultBuffer instanceof SharedArrayBuffer) {
        const resultArray = new BigInt64Array(subResultBuffer);
        for (let i = 0; i < 100; i++) {
          sharedArray[i] = resultArray[i];
        }
        completedTasks++;
      }
      expect(totalTasks).assertEqual(completedTasks);
      console.info(`${caseName} test end`);
      Done();
    });



    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1100
     * @tc.name AtomicsFunctionTest1100
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1100';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer = new SharedArrayBuffer(4 * (100 * 10 + 1));
      const int32Array = new Int32Array(sharedArrayBuffer);
      for (let i = 0; i < 100 * 10; i++) {
        int32Array[i] = i;
      }
      const counterIndex = 100 * 10;
      Atomics.store(int32Array, counterIndex, 0);

      const taskGroup = new taskpool.TaskGroup();
      const tasks = [taskXor, taskStore, taskAnd, taskExchange, taskOr, taskSub];
      for (let i = 0; i < tasks.length; i++) {
        const startIndex = i * 100;
        const task = new taskpool.Task(tasks[i], int32Array, startIndex, counterIndex);
        taskGroup.addTask(task);
      }
      await taskpool.execute(taskGroup);
      console.info('All tasks executed successfully');

      for (let i = 0; i < 6; i++) {
        const startIndex = i * 100;
        for (let j = 0; j < 100; j++) {
          const value = Atomics.load(int32Array, startIndex + j);
          console.info(`Int32Array[${startIndex + j}] value: ${value}`);
        }
      }
      const finalCount = Atomics.load(int32Array, counterIndex);
      console.info(`Final counter value: ${finalCount}`);
      expect(600).assertEqual(finalCount);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1200
     * @tc.name AtomicsFunctionTest1200
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1200';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer = new SharedArrayBuffer(1);
      const int8Array = new Int8Array(sharedArrayBuffer);
      int8Array[0] = 10;
      const targetIndex = 0;
      const task = new taskpool.Task(modifyValueTask, int8Array, targetIndex);
      await taskpool.execute(task);
      console.info('Task executed successfully');
      const newValue = Atomics.load(int8Array, targetIndex);
      console.log(`Value at index ${targetIndex} after modification: ${newValue}`);
      expect(20).assertEqual(newValue);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1300
     * @tc.name AtomicsFunctionTest1300
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1300';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(sharedArrayBuffer);

      for (let i: number = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }

      const statusIndex: number = 10;
      const targetIndex: number = 3;
      const newValue: bigint = 100n;

      Atomics.store(bigInt64Array, statusIndex, 0n);

      const workerExited = new Promise<void>((resolve, reject) => {
        Worker3.workerInstance.onexit = (code: number) => {
          console.info(`Worker exited with code ${code}`);
          if (code === 0) {
            resolve();
          } else {
            reject(new Error(`Worker exited with non-zero code: ${code}`));
          }
        };

        Worker3.workerInstance.onerror = (err: ErrorEvent) => {
          console.error('Worker error: ', err.message);
          reject(err);
        };
      });

      interface WorkerData {
          sharedArrayBuffer: SharedArrayBuffer;
          targetIndex: number;
          newValue: bigint;
          statusIndex: number;
        }

      const dataToSend:WorkerData = {
        sharedArrayBuffer,
        targetIndex,
        newValue,
        statusIndex
      };
      Worker3.workerInstance.postMessage(dataToSend);

      let waitResult = Atomics.wait(bigInt64Array, statusIndex, 0n, 1000);

      const firstLoadedValue = Atomics.load(bigInt64Array, targetIndex);
      const originalValue = BigInt(targetIndex * 2);
      expect(firstLoadedValue).assertEqual(originalValue);

      if (waitResult === 'timed-out') {
        console.log('Main thread timed out waiting for worker (1 second).');
        waitResult = Atomics.wait(bigInt64Array, statusIndex, 0n, 4000);
          if (waitResult === 'timed-out') {
            console.error('Main thread timed out again (4 seconds). Worker might not have updated the value.');
            const finalValue = Atomics.load(bigInt64Array, targetIndex);
            expect(finalValue).assertEqual(newValue);
            Done(new Error('Test timed out after 4 seconds'));
          } else {
            console.log('Main thread received notification after second wait.');
            const finalValue = Atomics.load(bigInt64Array, targetIndex);
            expect(finalValue).assertEqual(newValue);
            console.info(`${caseName} test end`);
            Done();
          }
      }
    });


    /**
     * @tc.number SUB_ATOMICS_FUNCTION_TEST_1400
     * @tc.name AtomicsFunctionTest1400
     * @tc.desc Test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AtomicsFunctionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1400';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 4);
      const int32Array = new Int32Array(sharedArrayBuffer);
      for (let i: number = 0; i < 10; i++) {
        int32Array[i] = i * 2;
      }
      const statusIndex: number = 10;
      Atomics.store(int32Array, statusIndex, 0);
      const targetIndex: number = 3;
      const newValue: number = 100;
      const task: taskpool.Task = new taskpool.Task(modifyInt16Array, sharedArrayBuffer, targetIndex, newValue, statusIndex);
      taskpool.execute(task)
        .then(() => {
          console.log('Task in taskpool completed.');
        })
        .catch((err: ErrorEvent) => {
          console.error('Error in taskpool: ', err.message);
        });
      Atomics.wait(int32Array, statusIndex, 0);
      const firstLoadedValue: number = Atomics.load(int32Array, targetIndex);
      const originalValue: number = targetIndex * 2
      expect(firstLoadedValue).assertEqual(originalValue);
      Atomics.wait(int32Array, statusIndex, 0);
      const secondLoadedValue: number = Atomics.load(int32Array, targetIndex);
      expect(secondLoadedValue).assertEqual(newValue)
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
    it('AtomicsFunctionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1500';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(sharedArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }

      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex, 0n);
      const checkIndex: number = 3;
      const expectedValue: bigint = BigInt(6);

      for (let i = 0; i < 10; i++) {
        const task: taskpool.Task = new taskpool.Task(waitInTaskpool, sharedArrayBuffer, statusIndex);
        taskpool.execute(task)
          .then(() => {
            console.log(`Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in taskpool task ${i}: `, err.message);
          });
      }
      Atomics.store(bigInt64Array, statusIndex, 1n);
      Atomics.notify(bigInt64Array, statusIndex);
      console.log('Main thread has notified all taskpool tasks');
      const actualValue: bigint = Atomics.load(bigInt64Array, checkIndex);
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
    it('AtomicsFunctionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1600';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 4);
      const int32Array: Int32Array = new Int32Array(sharedArrayBuffer);
      for (let i = 0; i < 10; i++) {
        int32Array[i] = i * 2;
      }
      const statusIndex: number = 10;
      Atomics.store(int32Array, statusIndex, 0);
      for (let i = 0; i < 10; i++) {
        const task: taskpool.Task = new taskpool.Task(waitInTaskpool2, sharedArrayBuffer, statusIndex);
        taskpool.execute(task)
          .then(() => {
            console.log(`Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(int32Array, statusIndex);
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
    it('AtomicsFunctionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1700';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(sharedArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }
      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex, 0n);

      for (let i = 0; i < 10; i++) {
        const waitTask: taskpool.Task = new taskpool.Task(waitInTaskpool, sharedArrayBuffer, statusIndex);
        taskpool.execute(waitTask)
          .then(() => {
            console.log(`Wait Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in wait taskpool task ${i}: `, err.message);
          });
      }

      for (let i = 0; i < 10; i++) {
        const notifyTask: taskpool.Task = new taskpool.Task(notifyInTaskpool, sharedArrayBuffer, statusIndex);
        taskpool.execute(notifyTask)
          .then(() => {
            console.log(`Notify Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in notify taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(bigInt64Array, statusIndex);
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
    it('AtomicsFunctionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done: Function) => {
      const caseName = 'AtomicsFunctionTest1800';
      console.info(`${caseName} test start`);
      const sharedArrayBuffer: SharedArrayBuffer = new SharedArrayBuffer(11 * 8);
      const bigInt64Array: BigInt64Array = new BigInt64Array(sharedArrayBuffer);
      for (let i = 0; i < 10; i++) {
        bigInt64Array[i] = BigInt(i * 2);
      }
      const statusIndex: number = 10;
      Atomics.store(bigInt64Array, statusIndex, 0n);
      for (let i = 0; i < 10; i++) {
        const expectedValue = BigInt(i + 1);
        const waitTask: taskpool.Task = new taskpool.Task(waitInTaskpool3, sharedArrayBuffer, statusIndex, expectedValue);
        taskpool.execute(waitTask)
          .then(() => {
            console.log(`Wait Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in wait taskpool task ${i}: `, err.message);
          });
      }

      for (let i = 0; i < 10; i++) {
        const notifyTask: taskpool.Task = new taskpool.Task(notifyInTaskpool, sharedArrayBuffer, statusIndex);
        taskpool.execute(notifyTask)
          .then(() => {
            console.log(`Notify Task ${i} in taskpool completed.`);
          })
          .catch((err: ErrorEvent) => {
            console.error(`Error in notify taskpool task ${i}: `, err.message);
          });
      }
      const loadedValue = Atomics.load(bigInt64Array, statusIndex);
      expect(loadedValue).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}