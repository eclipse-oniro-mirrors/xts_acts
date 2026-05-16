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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../hypium/index';
import hilog from '@ohos.hilog';
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
import { BusinessError } from '@ohos.base';
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

let array1: Array<string> = new Array<string>();
let array2: Array<string> = new Array<string>();
let er: string = '';
let ir: string = '';

export default function sequenceRunnerAbilityTest() {
  describe('taskPoolSequenceRunnerClassifyTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {
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
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1100
     * @tc.name taskPoolSequenceRunnerClassifyTest_1100
     * @tc.desc test sequenceRunner task with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const caseName = 'taskPoolSequenceRunnerClassifyTest_1100'
        console.info(`${caseName} test start`)

        task1Count = 0;
        task2Count = 0;
        await sleep(100);

        for (let i = 0; i < 10; i++) {
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task1: taskpool.Task = new taskpool.Task(stringTaskFunction1, 'task1');
          let task2: taskpool.Task = new taskpool.Task(stringTaskFunction2, 'task2');
          sequenceRunner.execute(task1).then((value: Any): void => {
            const result = value as string;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string(result);
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)

          })
          sequenceRunner.execute(task2).then((value: Any): void => {
            const result = value as string;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string(result);
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        }
        while (task1Count < 10 || task2Count < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(task1Count));
        expect('10').assertEqual(string(task2Count));
        expect('task1'.repeat(10)).assertEqual(array1.join(''));
        expect('task2'.repeat(10)).assertEqual(array2.join(''));
        task1Count = 0;
        task2Count = 0;
        array1 = new Array<string>();
        array2 = new Array<string>();
        console.info(`${caseName} test end`)
      })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1100_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_1100_2
     * @tc.desc test sequenceRunner task with string error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_1100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const caseName = 'taskPoolSequenceRunnerClassifyTest_1100_2'
        console.info(`${caseName} test start`)

        task1Count = 0;
        task2Count = 0;
        await sleep(100);
        const promises: Promise<void>[] = [];

        for (let i = 0; i < 10; i++) {
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task3: taskpool.Task = new taskpool.Task(stringTaskFunction3, 'task3');
          let task4: taskpool.Task = new taskpool.Task(stringTaskFunction4, 'task4');

          sequenceRunner.execute(task3).then((value: Any): void => {
            const result = value as string;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string(result);
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
          })
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result = value as string;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string(result);
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error2: ${JSON.stringify(error)}`)
          })
        }
        await Promise.all(promises);
        await sleep(1000);
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
        array1 = new Array<string>();
        array2 = new Array<string>();
        console.info(`${caseName} test end`)
      })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1200
     * @tc.name taskPoolSequenceRunnerClassifyTest_1200
     * @tc.desc test sequenceRunner task with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const caseName = 'taskPoolSequenceRunnerClassifyTest_1200'
        console.info(`${caseName} test start`)

        task1Count = 0;
        task2Count = 0;
        await sleep(100);
        for (let i = 0; i < 10; i++) {
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task1: taskpool.Task = new taskpool.Task(numberTaskFunction1, 1.0);
          let task2: taskpool.Task = new taskpool.Task(numberTaskFunction2, 2.0);
          sequenceRunner.execute(task1).then((value: Any): void => {
            const result = value as number;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string(result);
            task1Count++;
            array1.push(er);
            er = '';
          });
          sequenceRunner.execute(task2).then((value: Any): void => {
            const result = value as number;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string(result);
            task2Count++;
            array2.push(ir);
            ir = '';
          });
        }

        while (task1Count < 10 || task2Count < 10) {
          await sleep(100);
        }

        expect('10').assertEqual(string(task1Count));
        expect('10').assertEqual(string(task2Count));
        expect('1'.repeat(10)).assertEqual(array1.join(''));
        expect('2'.repeat(10)).assertEqual(array2.join(''));
        task1Count = 0;
        task2Count = 0;
        console.info(`${caseName} test end`)
      })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1300
     * @tc.name taskPoolSequenceRunnerClassifyTest_1300
     * @tc.desc test sequenceRunner task with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const caseName = 'taskPoolSequenceRunnerClassifyTest_1300'
        console.info(`${caseName} test start`)

        task1Count = 0;
        task2Count = 0;
        task3Count = 0;
        task4Count = 0;
        await sleep(100);
        for (let i = 0; i < 10; i++) {
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task1: taskpool.Task = new taskpool.Task(booleanTaskFunction1, true);
          let task2: taskpool.Task = new taskpool.Task(booleanTaskFunction2, true);

          sequenceRunner.execute(task1).then((value: Any): void => {
            const result = value as boolean;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string(result);
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName}error message error1300: ${JSON.stringify(error)}`)
          })
          sequenceRunner.execute(task2).then((value: Any): void => {
            const result = value as boolean;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string(result);
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`error message error3: ${JSON.stringify(error)}`)
          })
        }
        await sleep(1000);
        while (task1Count < 10 || task2Count < 10) {
          await sleep(100);
        }
        expect('10').assertEqual(string(task1Count));
        expect('10').assertEqual(string(task2Count));
        expect('0').assertEqual(string(task3Count));
        expect('0').assertEqual(string(task4Count));
        task1Count = 0;
        task2Count = 0;
        task3Count = 0;
        task4Count = 0;
        array1 = new Array<string>();
        array2 = new Array<string>();
        console.info(`${caseName} test end`);
      })

    /**
     * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1300_2
     * @tc.name taskPoolSequenceRunnerClassifyTest_1300_2
     * @tc.desc test sequenceRunner task with boolean error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('taskPoolSequenceRunnerClassifyTest_1300_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const caseName = 'taskPoolSequenceRunnerClassifyTest_1300_2'
        console.info(`${caseName} test start`)

        task1Count = 0;
        task2Count = 0;
        await sleep(100);
        for (let i = 0; i < 10; i++) {
          let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
          let task3: taskpool.Task = new taskpool.Task(booleanTaskFunction3, true);
          let task4: taskpool.Task = new taskpool.Task(booleanTaskFunction4, true);
          sequenceRunner.execute(task3).then((value: Any): void => {
            const result = value as boolean;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            er = string(result);
            task1Count++;
            array1.push(er);
            er = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task3Count++;
            console.error(`${caseName} error message error3: ${JSON.stringify(error)}`)
          })
          sequenceRunner.execute(task4).then((value: Any): void => {
            const result = value as boolean;
            console.log(`${caseName}Execution ${i + 1}: ${result}`);
            ir = string(result);
            task2Count++;
            array2.push(ir);
            ir = '';
          }).catch((error: Any) => {
            // expect(error.message).assertContain('Cannot read property split of undefined')
            task4Count++;
            console.error(`${caseName}error message error3: ${JSON.stringify(error)}`)
          })
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
        array1 = new Array<string>();
        array2 = new Array<string>();
        console.info(`${caseName} test end`)
      })

    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1400
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1400
    //  * @tc.desc test sequenceRunner task with bigint
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1400'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task1: taskpool.Task = new taskpool.Task(bigintTaskFunction1, 1n);
    //       let task2: taskpool.Task = new taskpool.Task(bigintTaskFunction2, 2n);
    //       sequenceRunner.execute(task1).then((result: Any): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = result as string;
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       });
    //       sequenceRunner.execute(task2).then((result: Any): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = result as string;
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       });
    //     }
    //
    //     while (task1Count < 10 || task2Count < 10) {
    //       await sleep(100);
    //     }
    //
    //     expect('10').assertEqual(string(task1Count));
    //     expect('10').assertEqual(string(task2Count));
    //     expect('1'.repeat(10)).assertEqual(array1.join(''));
    //     expect('2'.repeat(10)).assertEqual(array2.join(''));
    //     task1Count = 0;
    //     task2Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1400_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1400_2
    //  * @tc.desc test sequenceRunner task with bigint error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1400_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1400_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(bigintTaskFunction3, 3n);
    //       let task4: taskpool.Task = new taskpool.Task(bigintTaskFunction4, 4n);
    //
    //       sequenceRunner.execute(task3).then((result: bigint): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: bigint): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1500_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1500_2
    //  * @tc.desc test sequenceRunner task with undefined error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1500_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1500_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(undefinedTaskFunction3,);
    //       let task4: taskpool.Task = new taskpool.Task(undefinedTaskFunction4,);
    //
    //       sequenceRunner.execute(task3).then((result: undefined): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: undefined): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1600_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1600_2
    //  * @tc.desc test sequenceRunner task with null error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1600_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1600_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(nullTaskFunction3,);
    //       let task4: taskpool.Task = new taskpool.Task(nullTaskFunction4,);
    //       sequenceRunner.execute(task3).then((result: null): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: null): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1700_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1700_2
    //  * @tc.desc test sequenceRunner task with array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1700_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1700_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(arrayTaskFunction3, new Array<string>('0', '3'));
    //       let task4: taskpool.Task = new taskpool.Task(arrayTaskFunction4, new Array<string>('0', '4'));
    //       sequenceRunner.execute(task3).then((result: Array<string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Array<string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1800_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1800_2
    //  * @tc.desc test sequenceRunner task with map error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1800_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1800_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let map1: Map<string, string> = new Map<string, string>();
    //       map1.set('0', '3');
    //       let map2: Map<string, string> = new Map<string, string>();
    //       map2.set('0', '4');
    //       let task3: taskpool.Task = new taskpool.Task(mapTaskFunction3, map1);
    //       let task4: taskpool.Task = new taskpool.Task(mapTaskFunction4, map2);
    //
    //       sequenceRunner.execute(task3).then((result: Map<string, string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Map<string, string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_1900_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_1900_2
    //  * @tc.desc test TaskGroup
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_1900_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_1900_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction3, 'test3');
    //       let task4: taskpool.Task = new taskpool.Task(float_32_arrayTaskFunction4, 'test4');
    //       sequenceRunner.execute(task3).then((result: Float32Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Float32Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2000_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2000_2
    //  * @tc.desc test sequenceRunner task with set error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2000_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2000_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let set1: Set<string> = new Set<string>();
    //       set1.add('test3');
    //       let set2: Set<string> = new Set<string>();
    //       set2.add('test4');
    //       let task3: taskpool.Task = new taskpool.Task(setTaskFunction3, set1);
    //       let task4: taskpool.Task = new taskpool.Task(setTaskFunction4, set2);
    //       sequenceRunner.execute(task3).then((result: Set<string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Set<string>): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2100_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2100_2
    //  * @tc.desc test sequenceRunner task with int_8_array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2100_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2100_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction3, 3);
    //       let task4: taskpool.Task = new taskpool.Task(int_8_arrayTaskFunction4, 4);
    //       sequenceRunner.execute(task3).then((result: Int8Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Int8Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2200_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2200_2
    //  * @tc.desc test sequenceRunner task with uint_8_array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2200_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2200_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction3, 3);
    //       let task4: taskpool.Task = new taskpool.Task(uint_8_arrayTaskFunction4, 4);
    //
    //       sequenceRunner.execute(task3).then((result: Uint8Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Uint8Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2300_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2300_2
    //  * @tc.desc test sequenceRunner task with int_16_array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2300_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2300_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction3, 3);
    //       let task4: taskpool.Task = new taskpool.Task(int_16_arrayTaskFunction4, 4);
    //
    //       sequenceRunner.execute(task3).then((result: Int16Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Int16Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2400_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2400_2
    //  * @tc.desc test sequenceRunner task with uint_16_array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2400_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2400_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction3, 3);
    //       let task4: taskpool.Task = new taskpool.Task(uint_16_arrayTaskFunction4, 4);
    //
    //       sequenceRunner.execute(task3).then((result: Uint16Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Uint16Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })
    //
    // /**
    //  * @tc.number TASKPOOL_SEQUENCERUNNERCLASSIFY_TEST_2500_2
    //  * @tc.name taskPoolSequenceRunnerClassifyTest_2500_2
    //  * @tc.desc test sequenceRunner task with int_32_array error
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level Level 2
    //  */
    // it('taskPoolSequenceRunnerClassifyTest_2500_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    //   async (): Promise<void> => {
    //     const caseName = 'taskPoolSequenceRunnerClassifyTest_2500_2'
    //     console.info(`${caseName} test start`)
    //
    //     task1Count = 0;
    //     task2Count = 0;
    //     await sleep(100);
    //
    //     for (let i = 0; i < 10; i++) {
    //       let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
    //       let task3: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction3, 3);
    //       let task4: taskpool.Task = new taskpool.Task(int_32_arrayTaskFunction4, 4);
    //
    //       sequenceRunner.execute(task3).then((result: Int32Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         er = string(result);
    //         task1Count++;
    //         array1.push(er);
    //         er = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task3Count++;
    //         console.error(`${caseName}error message error1: ${JSON.stringify(error)}`)
    //       })
    //       sequenceRunner.execute(task4).then((result: Int32Array): void => {
    //         console.log(`${caseName}Execution ${i + 1}: ${result}`);
    //         ir = string(result);
    //         task2Count++;
    //         array2.push(ir);
    //         ir = '';
    //       }).catch((error: Any) => {
    //         // expect(error.message).assertContain('Cannot read property split of undefined')
    //         task4Count++;
    //         console.error(`error message error2: ${JSON.stringify(error)}`)
    //       })
    //     }
    //     while (task3Count < 10 || task4Count < 10) {
    //       await sleep(100);
    //     }
    //     expect('0').assertEqual(string(task1Count));
    //     expect('0').assertEqual(string(task2Count));
    //     expect('10').assertEqual(string(task3Count));
    //     expect('10').assertEqual(string(task4Count));
    //     task1Count = 0;
    //     task2Count = 0;
    //     task3Count = 0;
    //     task4Count = 0;
    //     console.info(`${caseName} test end`)
    //   })

  })
}