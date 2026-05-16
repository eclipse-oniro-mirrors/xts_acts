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
  stringTaskFunction1,
  stringTaskFunction2,
  stringTaskFunction3,
  stringTaskFunction4,
  numberTaskFunction1,
  numberTaskFunction2,
  numberTaskFunction3,
  numberTaskFunction4,
  booleanTaskFunction1,
  booleanTaskFunction2,
  booleanTaskFunction3,
  booleanTaskFunction4,
  bigintTaskFunction1,
  bigintTaskFunction2,
  bigintTaskFunction3,
  bigintTaskFunction4,
  undefinedTaskFunction1,
  undefinedTaskFunction2,
  undefinedTaskFunction3,
  undefinedTaskFunction4,
  nullTaskFunction1,
  nullTaskFunction2,
  nullTaskFunction3,
  nullTaskFunction4,
  arrayTaskFunction1,
  arrayTaskFunction2,
  arrayTaskFunction3,
  arrayTaskFunction4,
  mapTaskFunction1,
  mapTaskFunction2,
  mapTaskFunction3,
  mapTaskFunction4,
  setTaskFunction1,
  setTaskFunction2,
  setTaskFunction3,
  setTaskFunction4,
  int_8_arrayTaskFunction2,
  int_8_arrayTaskFunction1,
  int_8_arrayTaskFunction3,
  int_8_arrayTaskFunction4,
  uint_8_arrayTaskFunction1,
  uint_8_arrayTaskFunction2,
  uint_8_arrayTaskFunction3,
  uint_8_arrayTaskFunction4,
  int_16_arrayTaskFunction1,
  int_16_arrayTaskFunction2,
  int_16_arrayTaskFunction3,
  int_16_arrayTaskFunction4,
  uint_16_arrayTaskFunction1,
  uint_16_arrayTaskFunction2,
  uint_16_arrayTaskFunction3,
  uint_16_arrayTaskFunction4,
  int_32_arrayTaskFunction1,
  int_32_arrayTaskFunction2,
  int_32_arrayTaskFunction3,
  int_32_arrayTaskFunction4,
  uint_32_arrayTaskFunction1,
  uint_32_arrayTaskFunction2,
  uint_32_arrayTaskFunction3,
  uint_32_arrayTaskFunction4,
  float_32_arrayTaskFunction1,
  float_32_arrayTaskFunction2,
  float_32_arrayTaskFunction3,
  float_32_arrayTaskFunction4,
} from '../testability/pages/SequenceRunnerTaskMethodTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from '../testability/pages/Utils';

export class CountStr1 {
  static count: string = ''
}

export class CountStr2 {
  static count: string = ''
}

// 正常计数
let task1Count = 0;
let task2Count = 0;
// 异常计数
let task3Count = 0;
let task4Count = 0;

let array1: string[] = [];
let array2: string[] = [];
let er: string = '';
let ir: string = '';

export default function sequenceRunnerAbilityTest() {
  describe('taskPoolSequenceRunnerClassifyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1100
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1100
     * @tc.desc   test sequenceRunner task with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolSequenceRunnerClassifyTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1100'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(stringTaskFunction1, "task1");
        let task2: taskpool.Task = new taskpool.Task(stringTaskFunction2, "task2");
        try {
          sequenceRunner.execute(task1).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)

          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task2).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e: ${JSON.stringify(e)}+e`)
        }
      }
      while (task1Count < 10 || task2Count < 10) {
        await sleep(100)
      }
      expect("task1".repeat(10)).assertEqual(array1.join(''));
      expect("task2".repeat(10)).assertEqual(array2.join(''));
      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      task1Count = 0;
      task2Count = 0;
      array1 = [];
      array2 = [];
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1100_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1100_2
     * @tc.desc   test sequenceRunner task with string error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('taskPoolSequenceRunnerClassifyTest_1100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1100_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);
      const promises: Promise<void>[] = [];

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(stringTaskFunction3, "task3");
        let task4: taskpool.Task = new taskpool.Task(stringTaskFunction4, "task4");
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
      await Promise.all(promises);
      await sleep(1000);
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
      array1 = [];
      array2 = [];
      done();
      console.info(`${caseName} test end`)
    })


    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1200
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1200
     * @tc.desc   test sequenceRunner task with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1200'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(numberTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(numberTaskFunction2, 2);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = result.toString();
          task1Count++;
          array1[i] = er;
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = result.toString();
          task2Count++;
          array2[i] = ir;
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1200_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1200_2
     * @tc.desc   test sequenceRunner task with number error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1200_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1200_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(numberTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(numberTaskFunction4, 4);
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
      await Promise.all(promises);
      await sleep(1000);
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
      array1 = [];
      array2 = [];
      console.info(`${caseName} test end`);
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1300
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1300
     * @tc.desc   test sequenceRunner task with boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1300'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(booleanTaskFunction1, true);
        let task2: taskpool.Task = new taskpool.Task(booleanTaskFunction2, true);
        try {
          sequenceRunner.execute(task1).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = result.toString();
            task1Count++;
            array1[i] = er;
            er = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1300: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message eee: ${JSON.stringify(e)}+e`)
        }
        try {
          sequenceRunner.execute(task2).then((result) => {
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = result.toString();
            task2Count++;
            array2[i] = ir;
            ir = '';
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error3: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e3: ${JSON.stringify(e)}+e`)
        }
      }
      await sleep(1000);
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
      array1 = [];
      array2 = [];
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1300_2
     * @tc.number taskPoolSequenceRunnerClassifyTest_1300_2
     * @tc.desc   taskPoolSequenceRunnerClassifyTest_1300_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1300_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1300_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);
      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(booleanTaskFunction3, true);
        let task4: taskpool.Task = new taskpool.Task(booleanTaskFunction4, true);
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
            console.error(`${caseName} error message error3: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e3: ${JSON.stringify(e)}` + e)
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
            console.error(`${caseName}error message error3: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`${caseName}error message e3: ${JSON.stringify(e)}` + e)
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
      array1 = [];
      array2 = [];
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1400
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1400
     * @tc.desc   test sequenceRunner task with bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1400'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(bigintTaskFunction1, 1n);
        let task2: taskpool.Task = new taskpool.Task(bigintTaskFunction2, 2n);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = result.toString();
          task1Count++;
          array1[i] = er;
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = result.toString();
          task2Count++;
          array2[i] = ir;
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1400_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1400_2
     * @tc.desc   test sequenceRunner task with bigint error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1400_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1400_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(bigintTaskFunction3, 3n);
        let task4: taskpool.Task = new taskpool.Task(bigintTaskFunction4, 4n);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1500
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1500
     * @tc.desc   test sequenceRunner task with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1500'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(undefinedTaskFunction1,);
        let task2: taskpool.Task = new taskpool.Task(undefinedTaskFunction2,);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("undefined".repeat(10)).assertEqual(array1.join(''));
      expect("undefined".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1500_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1500_2
     * @tc.desc   test sequenceRunner task with undefined error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1500_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1500_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(undefinedTaskFunction3,);
        let task4: taskpool.Task = new taskpool.Task(undefinedTaskFunction4,);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1600
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1600
     * @tc.desc   test sequenceRunner task with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1600'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(nullTaskFunction1,);
        let task2: taskpool.Task = new taskpool.Task(nullTaskFunction2,);
        sequenceRunner.execute(task1).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          er = String(result);
          task1Count++;
          array1[i] = er;
          er = '';
        });
        sequenceRunner.execute(task2).then((result) => {
          console.log(`${caseName}Execution ${i + 1}: ${result}`);
          ir = String(result);
          task2Count++;
          array2[i] = ir;
          ir = '';
        });
      }

      while (task1Count < 10 || task2Count < 10) {
        await sleep(100);
      }

      expect(10).assertEqual(task1Count);
      expect(10).assertEqual(task2Count);
      expect("null".repeat(10)).assertEqual(array1.join(''));
      expect("null".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1600_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1600_2
     * @tc.desc   test sequenceRunner task with null error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1600_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1600_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(nullTaskFunction3,);
        let task4: taskpool.Task = new taskpool.Task(nullTaskFunction4,);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1700
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1700
     * @tc.desc   test sequenceRunner task with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1700'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(arrayTaskFunction1, [0, 1]);
        let task2: taskpool.Task = new taskpool.Task(arrayTaskFunction2, [0, 2]);
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
      expect("0,1".repeat(10)).assertEqual(array1.join(''));
      expect("0,2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1700_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1700_2
     * @tc.desc   test sequenceRunner task with array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1700_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      task3Count = 0;
      task4Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(arrayTaskFunction3, [0, 3]);
        let task4: taskpool.Task = new taskpool.Task(arrayTaskFunction4, [0, 4]);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1800
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1800
     * @tc.desc   test sequenceRunner task with map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1800'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(mapTaskFunction1, [0, 1]);
        let task2: taskpool.Task = new taskpool.Task(mapTaskFunction2, [0, 2]);
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
      expect("0,1".repeat(10)).assertEqual(array1.join(''));
      expect("0,2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1800_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1800_2
     * @tc.desc   test sequenceRunner task with map error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1800_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1800_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(mapTaskFunction3, [0, 3]);
        let task4: taskpool.Task = new taskpool.Task(mapTaskFunction4, [0, 4]);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1900
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1900
     * @tc.desc   test sequenceRunner task with float_32_array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1900'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction1, 'test1');
        let task2: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction2, 'test2');
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
      expect("test1".repeat(10)).assertEqual(array1.join(''));
      expect("test2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_1900_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1900_2
     * @tc.desc   test TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_1900_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_1900_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction3, 'test3');
        let task4: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction4, 'test4');
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2000
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2000
     * @tc.desc   test TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2000'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(setTaskFunction1, 'test1');
        let task2: taskpool.Task = new taskpool.Task(setTaskFunction2, 'test2');
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
      expect("test1".repeat(10)).assertEqual(array1.join(''));
      expect("test2".repeat(10)).assertEqual(array2.join(''));
      task1Count = 0;
      task2Count = 0;
      console.info(`${caseName} test end`)
      done();
    })
    /**
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2000_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2000_2
     * @tc.desc   test sequenceRunner task with set error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2000_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2000_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(setTaskFunction3, 'test3');
        let task4: taskpool.Task = new taskpool.Task(setTaskFunction4, 'test4');
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2100
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2100
     * @tc.desc   test sequenceRunner task with int_8_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2100'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction2, 2);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2100_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2100_2
     * @tc.desc   test sequenceRunner task with int_8_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2100_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction4, 4);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2200
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2200
     * @tc.desc   test sequenceRunner task with uint_8_array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2200'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction2, 2);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2200_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2200_2
     * @tc.desc   test sequenceRunner task with uint_8_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2200_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2200_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction4, 4);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2300
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2300
     * @tc.desc   test sequenceRunner task with int_16_array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2300'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction2, 2);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2300_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2300_2
     * @tc.desc   test sequenceRunner task with int_16_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2300_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2300_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction4, 4);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2400
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2400
     * @tc.desc   test sequenceRunner task with uint_16_array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2400'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction2, 2);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2400_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2400_2
     * @tc.desc   test sequenceRunner task with uint_16_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2400_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2400_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction4, 4);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2500
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2500
     * @tc.desc   test sequenceRunner task with int_32_array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2500'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;

      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction1, 1);
        let task2: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction2, 2);
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
     * @tc.name   taskPoolSequenceRunnerClassifyTest_2500_2
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2500_2
     * @tc.desc   test sequenceRunner task with int_32_array error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('taskPoolSequenceRunnerClassifyTest_2500_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'taskPoolSequenceRunnerClassifyTest_2500_2'
      console.info(`${caseName} test start`)
      
      task1Count = 0;
      task2Count = 0;
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      await sleep(100);

      for (let i = 0; i < 10; i++) {
        let task3: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction3, 3);
        let task4: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction4, 4);
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