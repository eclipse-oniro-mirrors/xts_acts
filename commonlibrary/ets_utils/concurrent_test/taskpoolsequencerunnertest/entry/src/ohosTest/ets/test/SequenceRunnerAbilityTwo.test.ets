/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

import { ArkTSUtils, collections, lang, taskpool } from '@kit.ArkTS';
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
  bitVectorTaskFunction1,
  bitVectorTaskFunction2,
  bitVectorTaskFunction3,
  bitVectorTaskFunction4,
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
  isInterfaceTaskFunction1,
  isInterfaceTaskFunction2,
  isInterfaceTaskFunction3,
  isInterfaceTaskFunction4,
  sendAbleClassTaskFunction1,
  sendAbleClassTaskFunction2,
  MyClassAble,
  sampleFunction,
  printSendableFunction1,
  printSendableFunction2,
  unitClampedArrayTaskFunction1,
  unitClampedArrayTaskFunction2,
  unitClampedArrayTaskFunction3,
  unitClampedArrayTaskFunction4,
  anyTaskFunction1,
  anyTaskFunction2,
  printASON1,
  printASON2,
  printASON3,
  printASON4,
  printAsyncLock1,
  printAsyncLock2,
  printAsyncLock3,
  printAsyncLock4,
} from '../testability/pages/SequenceRunnerTaskMethodTest';
import { AsyncLock, BaseClass } from '../testability/pages/SequenceRunnerSendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
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

let array1: string[] = [];
let array2: string[] = [];
let er: string = '';
let ir: string = '';

export default function sequenceRunnerAbilityTest_2() {
  describe('taskPoolSequenceRunnerClassifyTest_2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      //正常计数
      task1Count = 0;
      task2Count = 0;
      //异常计数
      task3Count = 0;
      task4Count = 0;
      array1 = [];
      array2 = [];
      er = '';
      ir = '';
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
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2600
     * @tc.name taskPoolSequenceRunnerClassifyTest_2600
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('taskPoolSequenceRunnerClassifyTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2600'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2600_2
     * @tc.name taskPoolSequenceRunnerClassifyTest2600_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('taskPoolSequenceRunnerClassifyTest2600_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest2600_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(uint_32_arrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2700
     * @tc.name taskPoolSequenceRunnerClassifyTest2700
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2700'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2700_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2700_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2700_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(arrayBufferTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2800
     * @tc.name taskPoolSequenceRunnerClassifyTest_2800
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2800'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2800_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2800_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2800_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2800_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(sharedArrayBufferTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2900
     * @tc.name taskPoolSequenceRunnerClassifyTest_2900
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2900'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(concatArrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(concatArrayTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2900_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_2900_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_2900_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2900_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(concatArrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(concatArrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3000
     * @tc.name taskPoolSequenceRunnerClassifyTest_3000
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3000'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(bitVectorTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(bitVectorTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3000_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3000_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3000_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3000_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(bitVectorTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(bitVectorTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3100
     * @tc.name taskPoolSequenceRunnerClassifyTest_3100
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3100'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(unionTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(unionTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3100_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3100_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3100_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(unionTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(unionTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3200
     * @tc.name taskPoolSequenceRunnerClassifyTest_3200
     * @tc.desc test sequenceRunner task with uint_32_array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3200'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(enumTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(enumTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3200_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3200_2
     * @tc.desc test sequenceRunner task with uint_32_array error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3200_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3200_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(enumTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(enumTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3300
     * @tc.name taskPoolSequenceRunnerClassifyTest_3300
     * @tc.desc test sequenceRunner task with class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */

    it('taskPoolSequenceRunnerClassifyTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3300'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let myclass1 = new MyClass(1,);
      let myclass2 = new MyClass(2,);
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(classTaskFunction1, myclass1);
        let task2: taskpool.Task = new taskpool.Task(classTaskFunction2, myclass2);
        try {
          sequenceRunner.execute(task1).then((result) => {
            console.log(`${caseName}Execution1 ${i + 1}: ${result}`);
            console.log(`Task 1 Result (${i + 1}): ${result.toString()}`);
            console.log(`Task 1 Method Call: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {

          sequenceRunner.execute(task2).then((result) => {
            console.log(`${caseName}Execution2 ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {

            expect(error.message).assertContain('TypeError: undefined is not callable')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error.message)}`)
          })
        } catch (e) {

          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task1Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task4Count);
      expect(0).assertEqual(task3Count);
      expect(0).assertEqual(task2Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3400
     * @tc.name taskPoolSequenceRunnerClassifyTest_3400
     * @tc.desc test sequenceRunner task with sendClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */

    it('taskPoolSequenceRunnerClassifyTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3400'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let myclass1 = new MyClassAble(1, 'test1');
      let myclass2 = new MyClassAble(2, 'test2');
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(sendAbleClassTaskFunction1, myclass1);
        let task2: taskpool.Task = new taskpool.Task(sendAbleClassTaskFunction2, myclass2);
        try {
          sequenceRunner.execute(task1).then((result) => {
            console.log(`${caseName}Execution1 ${i + 1}: ${result}`);
            console.log(`Task 1 Result (${i + 1}): ${result.toString()}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task2).then((result) => {
            console.log(`${caseName}Execution2 ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            console.error(`error message error2: ${JSON.stringify(error)}`)
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }
      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect(0).assertEqual(task3Count);
      expect(0).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3500
     * @tc.name taskPoolSequenceRunnerClassifyTest_3500
     * @tc.desc test sequenceRunner task with isEndAbleInterface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3500'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let iSendable1: lang.ISendable = 1
      let iSendable2: lang.ISendable = "test2"
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(isInterfaceTaskFunction1, iSendable1);
        let task2: taskpool.Task = new taskpool.Task(isInterfaceTaskFunction2, iSendable2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3500_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3500_2
     * @tc.desc test sequenceRunner task with isEndAbleInterface error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3500_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3500_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let iSendable3: lang.ISendable = 1
      let iSendable4: lang.ISendable = "test2"
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(isInterfaceTaskFunction3, iSendable3);
        let task4: taskpool.Task = new taskpool.Task(isInterfaceTaskFunction4, iSendable4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3600
     * @tc.name taskPoolSequenceRunnerClassifyTest_3600
     * @tc.desc test sequenceRunner task with sendableFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3600'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printSendableFunction1, sampleFunction);
        let task2: taskpool.Task = new taskpool.Task(printSendableFunction2, sampleFunction);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          task1Count++;
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          task2Count++;
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }
      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3700
     * @tc.name taskPoolSequenceRunnerClassifyTest_3700
     * @tc.desc test sequenceRunner task with unitClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3700'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3700_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3700_2
     * @tc.desc test sequenceRunner task with unitClampedArray error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3700_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(unitClampedArrayTaskFunction4, 4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3800
     * @tc.name taskPoolSequenceRunnerClassifyTest_3800
     * @tc.desc test sequenceRunner task with any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3800'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(anyTaskFunction1, 'test1', 'test2');
        let task2: taskpool.Task = new taskpool.Task(anyTaskFunction2, 'test1', 'test2');
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("test1test2".repeat(10)).assertEqual(array1.join(''));
      expect("test1test2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3900
     * @tc.name taskPoolSequenceRunnerClassifyTest_3900
     * @tc.desc test sequenceRunner task with ASON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3900'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let ason1: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3))
      let ason2: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6))
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printASON1, ason1);
        let task2: taskpool.Task = new taskpool.Task(printASON2, ason2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("[1,2,3]".repeat(10)).assertEqual(array1.join(''));
      expect("[4,5,6]".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_3900_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_3900_2
     * @tc.desc test sequenceRunner task with ASON error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_3900_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_3900_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let ason3: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(1, 2, 3))
      let ason4: ArkTSUtils.ASON.ISendable = ArkTSUtils.ASON.stringify(new collections.Array(4, 5, 6))
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(printASON3, ason3);
        let task4: taskpool.Task = new taskpool.Task(printASON4, ason4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_4000
     * @tc.name taskPoolSequenceRunnerClassifyTest_4000
     * @tc.desc test sequenceRunner task with asyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_4000'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let asyncLock1: AsyncLock = new AsyncLock()
      let asyncLock2: AsyncLock = new AsyncLock()
      let asn1 = asyncLock1.count_
      let asn2 = asyncLock2.count_

      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printAsyncLock1, asn1);
        let task2: taskpool.Task = new taskpool.Task(printAsyncLock2, asn2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          console.log(`this i=${i}this array = ${array1}`);
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          console.log(`this i=${i}this array = ${array2}`);
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("1".repeat(10)).assertEqual(array1.join(''));
      expect("1".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_4000_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_4000_2
     * @tc.desc test sequenceRunner task with asyncLock error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('taskPoolSequenceRunnerClassifyTest_4000_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_4000_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let asyncLock1: AsyncLock = new AsyncLock()
      let asyncLock2: AsyncLock = new AsyncLock()
      let asn3 = asyncLock1.count_
      let asn4 = asyncLock2.count_
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(printAsyncLock3, asn3);
        let task4: taskpool.Task = new taskpool.Task(printAsyncLock4, asn4);
        try {
          sequenceRunner.execute(task3).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task4).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task3Count < 10 || task4Count < 10) {
        await sleep(100);
      }
      expect(0).assertEqual(task1Count);
      expect(0).assertEqual(task2Count);
      expect(10).assertEqual(task3Count);
      expect(10).assertEqual(task4Count);
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
  })
}