/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import {
  printArrayBuffer1,
  printArrayBuffer2,
  printASON1,
  printASON2,
  printASON3,
  printASON4,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
  printBitVector1,
  printBitVector2,
  printBitVector3,
  printBitVector4,
  printConcatArray1,
  printConcatArray2,
  printConcatArray3,
  printConcatArray4,
  printEnum1,
  printEnum2,
  printEnum3,
  printEnum4,
  printFloat32Array1,
  printFloat32Array2,
  printFloat32Array4,
  printMyClass1,
  printMyClass2,
  printSendableTestClass1,
  printSendableTestClass2,
  printSharedArrayBuffer3,
  printSharedArrayBuffer4,
  printUint8ClampedArray1,
  printUint8ClampedArray2,
  printUint8ClampedArray3,
  printUint8ClampedArray4,
  printUnion1,
  printUnion2,
  printUnion3,
  printUnion4
} from '../testability/pages/TaskParamTest';
import {
  Count1,
  Count2,
  Count3,
  Count4,
  MyClass,
  MyEnum,
  SendableTestClass
} from '../testability/pages/DataFlg';
import { BusinessError } from '@kit.BasicServicesKit';
import { AsyncLock } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';

export default function taskPoolAsyncRunnerAbility2() {
  describe('TaskPoolAsyncRunnerAbility2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(500);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3100
     * @tc.desc   Create two tasks with Uint8ClampedArray parameters and Uint8ClampedArray return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3100: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
        const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint8ClampedArray1, uint8ClampedArray1);
          let task2: taskpool.Task = new taskpool.Task(printUint8ClampedArray2, uint8ClampedArray2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility3100: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3200
     * @tc.desc   Create two tasks with Uint8ClampedArray parameters and Uint8ClampedArray return values, and execute them 5 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3200: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const uint8ClampedArray1 = new Uint8ClampedArray([1, 2, 3]);
        const uint8ClampedArray2 = new Uint8ClampedArray([4, 5, 6]);
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUint8ClampedArray3, uint8ClampedArray1);
          let task2: taskpool.Task = new taskpool.Task(printUint8ClampedArray4, uint8ClampedArray2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`11error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`12error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`13error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility3200: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3300
     * @tc.desc   Create two tasks with Float32Array parameters and Float32Array return values, and execute them 5 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3300: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        const float32Array1 = new Float32Array([1.2, 2.3, 3.3]);
        const float32Array2 = new Float32Array([4.3, 5.3, 6.3]);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printFloat32Array1, float32Array1);
          let task2: taskpool.Task = new taskpool.Task(printFloat32Array2, float32Array2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility3300: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3500
     * @tc.desc   Create two tasks with ArrayBuffer parameters and ArrayBuffer return values, and execute them 5 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3500: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let arraybuffer1 = new ArrayBuffer(1);
        let arraybuffer2 = new ArrayBuffer(2);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(printArrayBuffer1, arraybuffer1);
          let task2 = new taskpool.Task(printArrayBuffer2, arraybuffer2);
          task1.setTransferList([]);
          task2.setTransferList([]);
          asyncRunner.execute(task1).then((result) => {
            console.info('+++++' + result);
            Count1++;
            console.info('======', Count1);
          });

          asyncRunner.execute(task2).then((result) => {
            console.info('+++++' + result);
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility3500: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3700
     * @tc.desc   Create two tasks with SharedArrayBuffer parameters and SharedArrayBuffer return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3700: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let shared1 = new SharedArrayBuffer(1);
        let shared2 = new SharedArrayBuffer(2);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printArrayBuffer1, shared1);
          let task2: taskpool.Task = new taskpool.Task(printArrayBuffer2, shared2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1)
        expect(10).assertEqual(Count2)
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility3700: end');
        Done()
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility3900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_3900
     * @tc.desc   Create two tasks with ConcatArray parameters and ConcatArray return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility3900: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let concat1: ConcatArray<number> = [1, 2, 3];
        let concat2: ConcatArray<number> = [4, 5, 6];
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printConcatArray1, concat1);
          let task2: taskpool.Task = new taskpool.Task(printConcatArray2, concat2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1)
        expect(10).assertEqual(Count2)
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility3900: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4000
     * @tc.desc   Create two tasks with ConcatArray parameters and ConcatArray return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4000: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let concat1: ConcatArray<number> = [1, 2, 3];
        let concat2: ConcatArray<number> = [4, 5, 6];
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printConcatArray3, concat1);
          let task2: taskpool.Task = new taskpool.Task(printConcatArray4, concat2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility4000: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4100
     * @tc.desc   Create two tasks with BitVector parameters and BitVector return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4100: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let bitVector1: collections.BitVector = new collections.BitVector(5);
        let bitVector2: collections.BitVector = new collections.BitVector(6);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBitVector1, bitVector1);
          let task2: taskpool.Task = new taskpool.Task(printBitVector2, bitVector2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1)
        expect(10).assertEqual(Count2)
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility4100: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4200
     * @tc.desc   Create two tasks with BitVector parameters and BitVector return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4200: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let bitVector1: collections.BitVector = new collections.BitVector(5);
        let bitVector2: collections.BitVector = new collections.BitVector(6);
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printBitVector3, bitVector1);
          let task2: taskpool.Task = new taskpool.Task(printBitVector4, bitVector2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility4200: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4300
     * @tc.desc   Create two tasks with union parameters and union return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4300: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        type Union = string | number | Array<number>;
        let union1: Union[] = ['hello1', 7, [1, 2, 3]];
        let union2: Union[] = ['hello2', 8, [4, 5, 6]];
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUnion1, union1);
          let task2: taskpool.Task = new taskpool.Task(printUnion2, union2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count1 < 10 || Count2 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility4300: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4400
     * @tc.desc   Create two tasks with union parameters and union return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4400: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        type Union = string | number | Array<number>;
        let union1: Union[] = ['hello1', 7, [1, 2, 3]];
        let union2: Union[] = ['hello2', 8, [4, 5, 6]];
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printUnion3, union1);
          let task2: taskpool.Task = new taskpool.Task(printUnion4, union2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility4400: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4500
     * @tc.desc   Create two tasks with enum parameters and enum return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4500: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printEnum1, MyEnum.Value1);
          let task2: taskpool.Task = new taskpool.Task(printEnum2, MyEnum.Value2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility4500: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4600
     * @tc.desc   Create two tasks with enum parameters and enum return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4600: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printEnum3, MyEnum.Value1);
          let task2: taskpool.Task = new taskpool.Task(printEnum4, MyEnum.Value2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility4600: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4700
     * @tc.desc   Create two tasks with ASON parameters and ASON return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4700: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let ason1: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3));
        let ason2: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6));
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printASON1, ason1);
          let task2: taskpool.Task = new taskpool.Task(printASON2, ason2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility4700: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility4800
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4800
     * @tc.desc   Create two tasks with ASON parameters and ASON return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4800: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let ason1: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3));
        let ason2: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6));
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printASON3, ason1);
          let task2: taskpool.Task = new taskpool.Task(printASON4, ason2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility4800: end');
        Done();
      })


    /**
     * @tc.name   taskPoolAsyncRunnerAbility4900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_4900
     * @tc.desc   Create two tasks with AsyncLock parameters and AsyncLock return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility4900: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let asyncLock1: AsyncLock = new AsyncLock();
        let asyncLock2: AsyncLock = new AsyncLock();
        let asn1 = asyncLock1.count_;
        let asn2 = asyncLock2.count_;
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printAsyncLock1, asn1);
          let task2: taskpool.Task = new taskpool.Task(printAsyncLock2, asn2);
          asyncRunner.execute(task).then(() => {
            Count1++;
            console.info('======', Count1);
          });
          await sleep(100);
          asyncRunner.execute(task2).then(() => {
            Count2++;
            console.info('======', Count2);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility4900: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility5000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5000
     * @tc.desc   Create two tasks with AsyncLock parameters and AsyncLock return values, and execute them 10 times,error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility5000: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let asyncLock1: AsyncLock = new AsyncLock();
        let asyncLock2: AsyncLock = new AsyncLock();
        let asn1 = asyncLock1.count_;
        let asn2 = asyncLock2.count_;
        let count: number = 0;
        let count2: number = 0;
        let Count3: number = 0;
        let Count4: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printAsyncLock3, asn1);
          let task2: taskpool.Task = new taskpool.Task(printAsyncLock4, asn2);
          try {
            asyncRunner.execute(task)
              .then((num: object) => {
                Count3++;
                console.info('======', Count3);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });

            asyncRunner.execute(task2)
              .then((num: object) => {
                Count4++;
                console.info('======', Count4);
              })
              .catch((error: BusinessError) => {
                expect(error.message).assertContain('Cannot read property split of undefined');
                count2++;
                console.error(`error message error: ${JSON.stringify(error.message)}`);
              });
          } catch (e) {
            console.error(`error message e: ${JSON.stringify(e)}`);
          }
        }
        while (count < 10 || count2 < 10) {
          await sleep(100);
        }
        expect(0).assertEqual(Count3);
        expect(0).assertEqual(Count4);
        expect(10).assertEqual(count);
        Count3 = 0;
        Count4 = 0;
        console.log('taskPoolAsyncRunnerAbility5000: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility5100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5100
     * @tc.desc   Create two tasks with class parameters and class return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility5100: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let myClass1 = new MyClass(1,);
        let myClass2 = new MyClass(2,);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printMyClass1, myClass1);
          let task2: taskpool.Task = new taskpool.Task(printMyClass2, myClass2);
          asyncRunner.execute(task).then((result) => {
            Count1++;
            console.log(`Execution1 ${i + 1}: ${result}`);
            console.log(`Task1 Result (${i + 1}): ${result.toString()}`);
            console.log(`Task1 Method Call: ${result}`);
          });

          asyncRunner.execute(task2).then((result) => {
            Count2++;
            console.log(`Execution2 ${i + 1}: ${result}`);
            console.log(`Task2 Result (${i + 1}): ${result.toString()}`);
            console.log(`Task2 Method Call: ${result}`);
          });
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility5100: end');
        Done();
      })

    /**
     * @tc.name   taskPoolAsyncRunnerAbility5200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_ABILITY_5200
     * @tc.desc   Create two tasks with SendableClass parameters and SendableClass return values, and execute them 10 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolAsyncRunnerAbility5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        console.log('taskPoolAsyncRunnerAbility5200: begin');
        let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 50);
        let myClassInstance = new SendableTestClass(1);
        let Count1: number = 0;
        let Count2: number = 0;
        for (let i = 0; i < 10; i++) {
          let task: taskpool.Task = new taskpool.Task(printSendableTestClass1, myClassInstance);
          let task2: taskpool.Task = new taskpool.Task(printSendableTestClass2, myClassInstance);
          try {
            asyncRunner.execute(task).then((result) => {
              Count1++;
              (result as SendableTestClass).printValue();
            });

            asyncRunner.execute(task2).then((result) => {
              Count2++;
              (result as SendableTestClass).printValue();
            });
          } catch (error) {
            console.error(`第 ${i + 1} 次执行任务组时出错:`, error);
          }
        }
        while (Count2 < 10 || Count1 < 10) {
          await sleep(100);
        }
        expect(10).assertEqual(Count1);
        expect(10).assertEqual(Count2);
        Count1 = 0;
        Count2 = 0;
        console.log('taskPoolAsyncRunnerAbility5200: end');
        Done();
      })
  })
}