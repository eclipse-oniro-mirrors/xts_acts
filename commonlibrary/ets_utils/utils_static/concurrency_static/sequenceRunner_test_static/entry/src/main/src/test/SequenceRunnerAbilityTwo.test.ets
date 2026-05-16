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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';

import {
  uint_32_arrayTaskFunction1,
  uint_32_arrayTaskFunction2,
  uint_32_arrayTaskFunction3,
  uint_32_arrayTaskFunction4,
  float_32_arrayTaskFunction1,
  float_32_arrayTaskFunction2,
  float_32_arrayTaskFunction3,
  float_32_arrayTaskFunction4,
  arrayBufferTaskFunction1,
  arrayBufferTaskFunction2,
  arrayBufferTaskFunction3,
  arrayBufferTaskFunction4,
  sharedArrayBufferTaskFunction1,
  sharedArrayBufferTaskFunction2,
  sharedArrayBufferTaskFunction3,
  sharedArrayBufferTaskFunction4,
  concatArrayTaskFunction1,
  concatArrayTaskFunction2,
  concatArrayTaskFunction3,
  concatArrayTaskFunction4,
  // bitVectorTaskFunction1,
  // bitVectorTaskFunction2,
  // bitVectorTaskFunction3,
  // bitVectorTaskFunction4,
  unionTaskFunction1,
  unionTaskFunction2,
  unionTaskFunction3,
  unionTaskFunction4,
  enumTaskFunction1,
  enumTaskFunction2,
  enumTaskFunction3,
  enumTaskFunction4,
  classTaskFunction1,
  classTaskFunction2,
  MyClass,
  sendAbleClassTaskFunction1,
  sendAbleClassTaskFunction2,
  MyClassAble,
  unitClampedArrayTaskFunction1,
  unitClampedArrayTaskFunction2,
  unitClampedArrayTaskFunction3,
  unitClampedArrayTaskFunction4,
  anyTaskFunction1,
  anyTaskFunction2,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
  union1,
  union2,
  union3,
  union4,
  EnumTest
} from '../testability/pages/SequenceRunnerTaskMethodTest';
import { AsyncLock1, BaseClass } from '../testability/pages/SequenceRunnerSendableTest';
import { BusinessError } from '@ohos.base';
import { sleep } from '../testability/pages/Utils';

export class CountStr1 {
  static count: string = ''
}

export class CountStr2 {
  static count: string = ''
}

//正常计数
let task1Count = 0;
let task2Count = 0;
//异常计数
let task3Count = 0;
let task4Count = 0;

let array1: Array<string> = new Array<string>();
let array2: Array<string> = new Array<string>();
let er: string = '';
let ir: string = '';

export default function sequenceRunnerAbilityTest_2() {
  describe('taskPoolSequenceRunnerClassifyTest_2', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      //正常计数
      task1Count = 0;
      task2Count = 0;
      //异常计数
      task3Count = 0;
      task4Count = 0;
      array1 = new Array<string>();
      array2 = new Array<string>();
      er = '';
      ir = '';
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2600_2
     * @tc.name taskPoolSequenceRunnerClassifyTest2600_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest2600_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest2600_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: Uint32Array = value as Uint32Array;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: Uint32Array = value as Uint32Array;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2700_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2700_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_2700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2700_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: ArrayBuffer = value as ArrayBuffer;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: ArrayBuffer = value as ArrayBuffer;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2800_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2800_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_2800_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2800_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: ArrayBuffer = value as ArrayBuffer;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: ArrayBuffer = value as ArrayBuffer;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2900_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2900_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_2900_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2900_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(concatArrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(concatArrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: ConcatArray<string> = value as ConcatArray<string>;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: ConcatArray<string> = value as ConcatArray<string>;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })


    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3100_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3100_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_3100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3100_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(unionTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(unionTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: union3 = value as union3;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string((result as number));
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: union4 = value as union4;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string((result as number));
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })

    /**
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3700_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3700_2
     * @tc.desc test sequenceRunner task with unitClampedArray error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_3700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3700_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: Uint8ClampedArray = value as Uint8ClampedArray;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: Uint8ClampedArray = value as Uint8ClampedArray;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_4000_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_4000_2
     * @tc.desc test sequenceRunner task with asyncLock error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_4000_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_4000_2'
      console.info(`${caseName} test start`)

      task1Count = 0;
      task2Count = 0;
      let asyncLock1: AsyncLock1 = new AsyncLock1()
      let asyncLock2: AsyncLock1 = new AsyncLock1()
      let asn3 = asyncLock1.count
      let asn4 = asyncLock2.count
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(printAsyncLock3, asn3);
        let task4: taskpool.Task = new taskpool.Task(printAsyncLock4, asn4);
        try {
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result: AsyncLock1 = value as AsyncLock1;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result: AsyncLock1 = value as AsyncLock1;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Object|null|undefined) => {
            // expect((error as BusinessError).message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect('0').assertEqual(string(task1Count));
      expect('0').assertEqual(string(task2Count));
      expect('10').assertEqual(string(task3Count));
      expect('10').assertEqual(string(task4Count));
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
    })
  })
}