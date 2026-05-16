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
// import { ArkTSUtils, ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  asyncLock,
  asyncLock1,
  asyncLock2,
  asyncLock3,
  asyncWays1,
  asyncWays2,
  printArgs1,
  printArgs10,
  printArgs4,
  printArgs7,
  printArgsNested,
  printArgsNested2,
  printArgsNested3,
  printArgsNested4,
  printArgsPromise1,
  printArgsPromise2,
  printArgsPromise3,
  printArgsPromise4,
  printArgsPromise5,
  printArgsPromise6,
  printArgsPromise7,
  printArgsPromise8,
  printArgsSetTime1,
  printArgsSetTime2,
  printArgsWaitA,
  printArgsWaitB,
  printArgsWaitC,
  printArgsWaitD,
  printArgsWaitE,
  printArgsWaitF,
  printArgsWaitG,
  printArgsWaitH,
} from '../testability/pages/TaskConcurrent';
import {
  AsyncLockTest,
  AsyncLockTest1,
  AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen,
} from '../testability/pages/SendableWays';
import { BusinessError } from '@ohos.base';
// import { WorkThread, WorkThread1 } from '../testability/pages/OtherUtils';
import { sleep } from '../testability/pages/Utils';

export default function sequenceRunnerTaskTest() {
  describe('sequenceRunnerTaskTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (): Promise<void> => {
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
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1000
     * @tc.name Sequence_Runner_TaskTest_1000
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1000'


        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0

        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
          try {
            runner.execute(task1).then((): void => {
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Cannot read property split of undefined')
              count1 = count1 + 1
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s', `Task1 ---error：：${JSON.stringify(error)}}`);
          }
          try {
            runner.execute(task2).then((): void => {
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Cannot read property split of undefined')
              count2 = count2 + 1
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s', `Task2 ---error：：${JSON.stringify(error)}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')

      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1200
     * @tc.name Sequence_Runner_TaskTest_1200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1200'


        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0

        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            task1.onEnqueued((): void => {
              try {
                count1 += 1
                throw Error(`${Tag}--error`)
              } catch (e) {
                e = e as BusinessError;
                // expect(e.message).assertContain('Sequence_Runner_TaskTest_1200--error')
              }
            });
            runner.execute(task1).then((): void => {
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task1 ---error：Code is  , message is ${error.message}`);
          }

          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            try {
              task2.onEnqueued((): never => {
                count2 = count2 + 1
                throw Error(`${Tag}--error`)
              });
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1200--error')
            }
            runner.execute(task2).then((): void => {
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task2 ---error：Code is  , message is ${error.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1400
     * @tc.name Sequence_Runner_TaskTest_1400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1400'

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0

        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            try {
              task1.onExecutionFailed((): void => {
                count1 += 1
                throw Error(`${Tag}--error`)
              });
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1400--error')
            }
            runner.execute(task1).then((): void => {
            })

          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task1 ---error：Code is  , message is ${error.message}`);
          }
          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            try {
              task2.onExecutionFailed((): void => {
                count2 += 1
                throw Error(`${Tag}--error`)
              });
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1400--error')
            }
            runner.execute(task2).then((): void => {
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task2 ---error：Code is  , message is ${error.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')

      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1500
     * @tc.name Sequence_Runner_TaskTest_1500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1500'


        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0

        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
            try {
              task1.onExecutionSucceeded((): void => {
                count1 += 1
                throw Error(`${Tag}--error`)
              });
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1500--error')
            }
            runner.execute(task1).then((): void => {
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task1 ---error：Code is  , message is ${error.message}`);
          }
          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
            try {
              task2.onExecutionSucceeded((): void => {
                count2 = count2 + 1
                throw Error(`${Tag}--error`)
              });
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1500--error')
            }
            runner.execute(task2).then((): void => {
            })
          } catch (error) {
            error = error as BusinessError;
            console.info(`${Tag}`, '%{public}s',
              `Task2 ---error：Code is  , message is ${error.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1600
     * @tc.name Sequence_Runner_TaskTest_1600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1600'

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0

        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(printArgs7, 1.0);
          task1.onReceiveData(() => {
            try {
              count1 += 1
              throw Error(`${Tag}---error`)
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1600---error')
            }
          })
          runner.execute(task1).then((): void => {
            console.log('ssssss==')
          });

          let task2: taskpool.Task = new taskpool.Task(printArgs7, 1.0);
          task2.onReceiveData(() => {
            try {
              count2 += 1
              throw Error(`${Tag}---error`)
            } catch (e) {
              e = e as BusinessError;
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1600---error')
            }
          })
          runner.execute(task2).then((): void => {
          });
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1700
     * @tc.name Sequence_Runner_TaskTest_1700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {


        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1700'

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
            runner.execute(task1).then((): void => {
              count1 += 1
              throw Error(`${Tag}--error`)
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1700--error')
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs1, 1.0);
            runner.execute(task2).then((): void => {
              count2 += 1
              throw Error(`${Tag}--error`)
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Sequence_Runner_TaskTest_1700--error')
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')

      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1800
     * @tc.name Sequence_Runner_TaskTest_1800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1800'

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            runner.execute(task1).then((): void => {
            }).catch((e: Object | null | undefined) => {
              count1 += 1
              // expect(e.message).assertContain('Cannot read property split of undefined')
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            runner.execute(task2).then((): void => {
            }).catch((e: Object | null | undefined) => {
              count2 += 1
              // expect(e.message).assertContain('Cannot read property split of undefined')
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1900
     * @tc.name Sequence_Runner_TaskTest_1900
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {


        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        const Tag: string = 'Sequence_Runner_TaskTest_1900'

        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let count1: number = 0
        let count2: number = 0
        for (let i = 0; i < 10; i++) {
          try {
            let task1: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            runner.execute(task1).then((): void => {
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Cannot read property split of undefined')
            }).finally(() => {
              count1 += 1
              throw Error(`${Tag}--error`)
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
          try {
            let task2: taskpool.Task = new taskpool.Task(printArgs4, 1.0);
            runner.execute(task2).then((): void => {
            }).catch((e: Object | null | undefined) => {
              // expect(e.message).assertContain('Cannot read property split of undefined')
            }).finally(() => {
              count2 += 1
              throw Error(`${Tag}--error`)
            })
          } catch (e) {
            e = e as BusinessError;
            console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
          }
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect(string(count1)).assertEqual('10')
        expect(string(count2)).assertEqual('10')
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2000
     * @tc.name Sequence_Runner_TaskTest_2000
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2000'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTest()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        for (let i = 0; i < 10; i++) {
          let task1: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);

          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2100
     * @tc.name Sequence_Runner_TaskTest_2100
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2100'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTestThen()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // console.info('=====', e.message)
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // console.info('=====', e.message)
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }
        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
        console.info(`${Tag}`, '%{public}s', 'it Over');
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2200
     * @tc.name Sequence_Runner_TaskTest_2200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2200'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTestCatch()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2300
     * @tc.name Sequence_Runner_TaskTest_2300
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2300'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTestFinally()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('Cannot read property split of undefined')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2400
     * @tc.name Sequence_Runner_TaskTest_2400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2400'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsPromise1, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1++
            // expect(e.message).assertContain('error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise2, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            // expect(e.message).assertContain('2error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2500
     * @tc.name Sequence_Runner_TaskTest_2500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2500'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsPromise3, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1++
            // expect(e.message).assertContain('then error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise4, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            // expect(e.message).assertContain('then error2')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2600
     * @tc.name Sequence_Runner_TaskTest_2600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2600'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTest()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsPromise5, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('catch error')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise6, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('catch error2')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2700
     * @tc.name Sequence_Runner_TaskTest_2700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2700'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let asyncLockTest = new AsyncLockTest()
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsPromise7, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('finally error')
            count1++
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsPromise8, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            // expect(e.message).assertContain('finally error2')
            count2++
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })


    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2800
     * @tc.name Sequence_Runner_TaskTest_2800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2800'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsSetTime1, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            // expect(e.message).assertContain('setTime error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsSetTime2, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            // expect(e.message).assertContain('setTime error2')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2900
     * @tc.name Sequence_Runner_TaskTest_2900
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_2900'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(asyncWays1, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            // expect(e.message).assertContain('asyncWays1 error')
          })
          let task2: taskpool.Task = new taskpool.Task(asyncWays2, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            // expect(e.message).assertContain('asyncWays2 error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })


    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3200
     * @tc.name Sequence_Runner_TaskTest_3200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3200'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let asyncLockTest = new AsyncLockTest1()
        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsWaitA, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsWaitB, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3300
     * @tc.name Sequence_Runner_TaskTest_3300
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3300'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let asyncLockTest = new AsyncLockTest1()
        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsWaitC, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsWaitD, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3400
     * @tc.name Sequence_Runner_TaskTest_3400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3400'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let asyncLockTest = new AsyncLockTest1()
        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsWaitE, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsWaitF, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3500
     * @tc.name Sequence_Runner_TaskTest_3500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3500'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        let asyncLockTest = new AsyncLockTest1()
        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsWaitG, asyncLockTest);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsWaitH, asyncLockTest);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('await error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3600
     * @tc.name Sequence_Runner_TaskTest_3600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3600'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsNested, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsNested, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3700
     * @tc.name Sequence_Runner_TaskTest_3700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3700'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsNested2, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsNested2, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3800
     * @tc.name Sequence_Runner_TaskTest_3800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3800'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsNested3, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsNested3, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3900
     * @tc.name Sequence_Runner_TaskTest_3900
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Sequence_Runner_TaskTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const Tag: string = 'Sequence_Runner_TaskTest_3900'

        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        let count1: number = 0
        let count2: number = 0
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

        for (let i = 0; i < 10; i++) {

          let task1: taskpool.Task = new taskpool.Task(printArgsNested4, 1.0);
          runner.execute(task1).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count1 += 1
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
          let task2: taskpool.Task = new taskpool.Task(printArgsNested4, 1.0);
          runner.execute(task2).then((): void => {
          }).catch((e: Object | null | undefined) => {
            count2++
            console.log('ssssss' + e)
            // expect(e.message).assertContain('nested error')
          })
        }

        while (count1 < 10 || count2 < 10) {
          await sleep(100)
        }

        expect('10').assertEqual(string(count1))
        expect('10').assertEqual(string(count2))
      })
  })
}