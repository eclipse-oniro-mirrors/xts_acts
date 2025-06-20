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
import { ArkTSUtils, ErrorEvent, MessageEvents, taskpool, worker } from '@kit.ArkTS';
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
import { BusinessError } from '@kit.BasicServicesKit';
import { WorkThread, WorkThread1 } from '../testability/pages/OtherUtils';
import { sleep } from '../testability/pages/Utils';

export default function sequenceRunnerTaskTest() {
  describe('sequenceRunnerTaskTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
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
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3000
     * @tc.name Sequence_Runner_TaskTest_3000
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sequence_Runner_TaskTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3000'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner('test');

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
        runner.execute(task1).then(() => {
          count++
          let work =
            new worker.ThreadWorker('../testability/pages/workers/WorkerTaskRqRunnerTask.ets');
          work.onmessage = (e: MessageEvents): void => {
            console.info('======e.message', e.data)
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              count1++
              work.terminate()
            }
          }
          work.postMessage('1')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgs10, 1);
        runner.execute(task2).then(() => {
          count++
          let work =
            new worker.ThreadWorker('../testability/pages/workers/WorkerTaskRqRunnerTask.ets');
          work.onmessage = (e: MessageEvents): void => {
            console.info('======e.message', e.data)
            try {
              let s: string[] = []
              s[0].split('')[1].toString()
            } catch (e) {
              count2++
              work.terminate()
            }
          }
          work.postMessage('1')
        })
      }

      while (count2 < 10 || count1 < 10) {
        await sleep(100)
      }

      expect(20).assertEqual(count)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(count1)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3100
     * @tc.name Sequence_Runner_TaskTest_3100
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sequence_Runner_TaskTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3100'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner('test1');

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
        runner.execute(task1).then(() => {
          count++
          let work =
            new worker.ThreadWorker('../testability/pages/workers/WorkerTaskRqRunnerTask.ets');
          work.onerror = (e: ErrorEvent): void => {
            console.info('======e.message', e.message)
            count1++
            work.terminate()
          }
          work.postMessage('2')
        })
        let task2: taskpool.Task = new taskpool.Task(printArgs10, 1);
        runner.execute(task2).then(() => {
          count++
          let work =
            new worker.ThreadWorker('../testability/pages/workers/WorkerTaskRqRunnerTask.ets');
          work.onerror = (e: ErrorEvent): void => {
            console.info('======e.message', e.message)
            count2++
            work.terminate()
          }
          work.postMessage('2')
        })
      }

      while (count2 < 10 || count1 < 10) {
        await sleep(100)
      }

      expect(20).assertEqual(count)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(count1)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1000
     * @tc.name Sequence_Runner_TaskTest_1000
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1000'
      

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);
        let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
        try {
          runner.execute(task1).then(() => {
          }).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            count1 = count1 + 1
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s', `Task1 ---error：：${JSON.stringify(error)}}`);
        }
        try {
          runner.execute(task2).then().catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            count2 = count2 + 1
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s', `Task2 ---error：：${JSON.stringify(error)}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()

    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1100
     * @tc.name Sequence_Runner_TaskTest_1100
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1100'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs4, 1);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs4, 1);
        try {
          runner.execute(task1).then(() => {
          }).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            count1 = count1 + 1
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s', `Task1 ---error：：${JSON.stringify(error)}}`);
        }
        try {
          runner.execute(task2).then().catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
            count2 = count2 + 1
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s', `Task2 ---error：：${JSON.stringify(error)}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1200
     * @tc.name Sequence_Runner_TaskTest_1200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1200'
      

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);
          task1.onEnqueued(() => {
            try {
              count1 += 1
              throw Error(`${Tag}--error`)
            } catch (e) {
              expect(e.message).assertContain('Sequence_Runner_TaskTest_1200--error')
            }
          });
          runner.execute(task1).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task1 ---error：Code is ${error.code}, message is ${error.message}`);
        }

        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
          try {
            task2.onEnqueued(() => {
              count2 = count2 + 1
              throw Error(`${Tag}--error`)
            });
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1200--error')
          }
          runner.execute(task2).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task2 ---error：Code is ${error.code}, message is ${error.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1300
     * @tc.name Sequence_Runner_TaskTest_1300
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1300'
      

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);

          task1.onStartExecution(() => {
            try {
              count1 += 1
              throw Error(`${Tag}--error`)
            } catch (e) {
              console.log('13000000' + e)
              expect(e.message).assertContain('Sequence_Runner_TaskTest_1300--error')
            }
          });
          runner.execute(task1).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task1 ---error：Code is ${error.code}, message is ${error.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);

          task2.onStartExecution(() => {
            try {
              throw Error(`${Tag}--error`)
            } catch (e) {
              count2 += 1
              console.log('13000000' + e)
              expect(e.message).assertContain('Sequence_Runner_TaskTest_1300--error')
            }
          });

          runner.execute(task2).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task2 ---error：Code is ${error.code}, message is ${error.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1400
     * @tc.name Sequence_Runner_TaskTest_1400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1400'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);
          try {
            task1.onExecutionFailed(() => {
              count1 += 1
              throw Error(`${Tag}--error`)
            });
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1400--error')
          }
          runner.execute(task1).then(() => {
          })

        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task1 ---error：Code is ${error.code}, message is ${error.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
          try {
            task2.onExecutionFailed(() => {
              count2 += 1
              throw Error(`${Tag}--error`)
            });
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1400--error')
          }
          runner.execute(task2).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task2 ---error：Code is ${error.code}, message is ${error.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)

      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1500
     * @tc.name Sequence_Runner_TaskTest_1500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1500'
      

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          try {
            task1.onExecutionSucceeded(() => {
              count1 += 1
              throw Error(`${Tag}--error`)
            });
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1500--error')
          }
          runner.execute(task1).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task1 ---error：Code is ${error.code}, message is ${error.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
          try {
            task2.onExecutionSucceeded(() => {
              count2 = count2 + 1
              throw Error(`${Tag}--error`)
            });
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1500--error')
          }
          runner.execute(task2).then(() => {
          })
        } catch (error) {
          console.info( `${Tag}`, '%{public}s',
            `Task2 ---error：Code is ${error.code}, message is ${error.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1600
     * @tc.name Sequence_Runner_TaskTest_1600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1600'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs7, 1);
        task1.onReceiveData((num: number) => {
          try {
            count1 += 1
            throw Error(`${Tag}---error`)
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1600---error')
          }
        })
        runner.execute(task1).then(() => {
          console.log('ssssss==')
        });

        let task2: taskpool.Task = new taskpool.Task(printArgs7, 1);
        task2.onReceiveData((num: number) => {
          try {
            count2 += 1
            throw Error(`${Tag}---error`)
          } catch (e) {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1600---error')
          }
        })
        runner.execute(task2).then(() => {
        });
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1700
     * @tc.name Sequence_Runner_TaskTest_1700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {


      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1700'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
          runner.execute(task1).then(() => {
            count1 += 1
            throw Error(`${Tag}--error`)
          }).catch((e: Error) => {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1700--error')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs1, 1);
          runner.execute(task2).then(() => {
            count2 += 1
            throw Error(`${Tag}--error`)
          }).catch((e: Error) => {
            expect(e.message).assertContain('Sequence_Runner_TaskTest_1700--error')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)

      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1800
     * @tc.name Sequence_Runner_TaskTest_1800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1800'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);
          runner.execute(task1).then(() => {
          }).catch((e: BusinessError) => {
            count1 += 1
            expect(e.message).assertContain('Cannot read property split of undefined')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
          runner.execute(task2).then(() => {
          }).catch((e: BusinessError) => {
            count2 += 1
            expect(e.message).assertContain('Cannot read property split of undefined')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_1900
     * @tc.name Sequence_Runner_TaskTest_1900
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {


      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const Tag: string = 'Sequence_Runner_TaskTest_1900'
      
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      for (let i = 0; i < 10; i++) {
        try {
          let task1: taskpool.Task = new taskpool.Task(printArgs4, 1);

          runner.execute(task1).then(() => {
          }).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
          }).finally(() => {
            count1 += 1
            throw Error(`${Tag}--error`)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
        try {
          let task2: taskpool.Task = new taskpool.Task(printArgs4, 1);
          runner.execute(task2).then(() => {
          }).catch((e: BusinessError) => {
            expect(e.message).assertContain('Cannot read property split of undefined')
          }).finally(() => {
            count2 += 1
            throw Error(`${Tag}--error`)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(count1).assertEqual(10)
      expect(count2).assertEqual(10)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2000
     * @tc.name Sequence_Runner_TaskTest_2000
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2000'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2100
     * @tc.name Sequence_Runner_TaskTest_2100
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2100'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTestThen()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          console.info('=====', e.message)
          expect(e.message).assertContain('Cannot read property split of undefined')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(asyncLock1, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          console.info('=====', e.message)
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      console.info( `${Tag}`, '%{public}s', 'it Over');
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2200
     * @tc.name Sequence_Runner_TaskTest_2200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2200'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTestCatch()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(asyncLock2, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2300
     * @tc.name Sequence_Runner_TaskTest_2300
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2300'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTestFinally()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(asyncLock3, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('Cannot read property split of undefined')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2400
     * @tc.name Sequence_Runner_TaskTest_2400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2400'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsPromise1, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1++
          expect(e.message).assertContain('error')

        })
        let task2: taskpool.Task = new taskpool.Task(printArgsPromise2, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          expect(e.message).assertContain('2error')

        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2500
     * @tc.name Sequence_Runner_TaskTest_2500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2500'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsPromise3, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1++
          expect(e.message).assertContain('then error')
        })
        let task2: taskpool.Task = new taskpool.Task(printArgsPromise4, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          expect(e.message).assertContain('then error2')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2600
     * @tc.name Sequence_Runner_TaskTest_2600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2600'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsPromise5, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('catch error')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(printArgsPromise6, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('catch error2')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2700
     * @tc.name Sequence_Runner_TaskTest_2700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2700'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsPromise7, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('finally error')
          count1++
        })
        let task2: taskpool.Task = new taskpool.Task(printArgsPromise8, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          expect(e.message).assertContain('finally error2')
          count2++
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2800
     * @tc.name Sequence_Runner_TaskTest_2800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2800'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsSetTime1, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          expect(e.message).assertContain('setTime error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsSetTime2, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          expect(e.message).assertContain('setTime error2')

        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_2900
     * @tc.name Sequence_Runner_TaskTest_2900
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_2900'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(asyncWays1, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          expect(e.message).assertContain('asyncWays1 error')
        })

        let task2: taskpool.Task = new taskpool.Task(asyncWays2, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          expect(e.message).assertContain('asyncWays2 error')

        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3200
     * @tc.name Sequence_Runner_TaskTest_3200
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3200'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let asyncLockTest = new AsyncLockTest1()
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsWaitA, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsWaitB, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3300
     * @tc.name Sequence_Runner_TaskTest_3300
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3300'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let asyncLockTest = new AsyncLockTest1()
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsWaitC, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsWaitD, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3400
     * @tc.name Sequence_Runner_TaskTest_3400
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3400'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let asyncLockTest = new AsyncLockTest1()
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsWaitE, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsWaitF, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3500
     * @tc.name Sequence_Runner_TaskTest_3500
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3500'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let asyncLockTest = new AsyncLockTest1()
      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsWaitG, asyncLockTest);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsWaitH, asyncLockTest);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('await error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3600
     * @tc.name Sequence_Runner_TaskTest_3600
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3600'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsNested, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsNested, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3700
     * @tc.name Sequence_Runner_TaskTest_3700
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3700'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsNested2, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsNested2, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3800
     * @tc.name Sequence_Runner_TaskTest_3800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3800'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsNested3, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsNested3, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

    /**
     * @tc.number SUB_SEQUENCE_RUNNER_TASK_TEST_3900
     * @tc.name Sequence_Runner_TaskTest_3800
     * @tc.desc test TaskGroup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Sequence_Runner_TaskTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const Tag: string = 'Sequence_Runner_TaskTest_3900'
      
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let count1: number = 0
      let count2: number = 0
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgsNested4, 1);
        runner.execute(task1).then(() => {
        }).catch((e: BusinessError) => {
          count1 += 1
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })

        let task2: taskpool.Task = new taskpool.Task(printArgsNested4, 1);
        runner.execute(task2).then(() => {
        }).catch((e: BusinessError) => {
          count2++
          console.log('ssssss' + e)
          expect(e.message).assertContain('nested error')
        })
      }

      while (count2 < 10) {
        await sleep(100)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })

  })
}