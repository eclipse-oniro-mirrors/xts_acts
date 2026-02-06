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
import { taskpool } from '@kit.ArkTS';
import {
  asyncLock,
  asyncLockThen,
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs7,
  printArgs8,
  printArgs9,
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import {
  AsyncLockTest,
  AsyncLockTestCatch,
  AsyncLockTestFinally,
  AsyncLockTestThen,
} from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';


export default function SequenceRunnerErrorSuccessTest() {
  describe('SequenceRunnerErrorSuccessTest', () => {
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
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name TestSequenceRunnerErrorSuccess0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TestSequenceRunnerErrorSuccess0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count);
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
        }).catch((err: object[]) => {
          Count1.count++
          console.error('=======', JSON.stringify(err))
        })

        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count);
        sequenceRunner.execute(task2).then(() => {
          Count3.count++
        }).catch((error: Error) => {
          Count3.count++
          expect(error.message).assertContain('Cannot read property split of undefined')
          console.error('error message error', JSON.stringify(error))
        })
      }

      while (Count1.count < 10 || Count3.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      Count1.count = 0
      Count3.count = 0
      done()

    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0300
     * @tc.name TestSequenceRunnerErrorSuccess0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TestSequenceRunnerErrorSuccess0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, Count1.count);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, Count3.count);
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
        }).catch((error: Error) => {
          Count1.count++
          console.error('=======', JSON.stringify(error))
        })
        sequenceRunner.execute(task2).then(() => {
          Count3.count++
        }).catch((error: Error) => {
          expect(error.message).assertContain("Cannot read property split of undefined")
          Count3.count++
          console.error(`error message error: ${JSON.stringify(error)}`)
        })

      }

      while (Count1.count < 10 || Count3.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      Count1.count = 0
      Count3.count = 0
      done()

    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020300
     * @tc.desc Testing Task onEnqueued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0
      let count1: number = 0
      let count3: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count);
        task1.onEnqueued(() => {
          count1++
          console.info("taskpool: onEnqueued" + count1)
        });
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
        })

        task2.onEnqueued(() => {
          count3++
          console.info("taskpool: onEnqueued" + count3)
        });
        sequenceRunner.execute(task2).then(() => {
        }).catch((error: Error) => {
          Count3.count++
          expect(error.message).assertContain("Cannot read property split of undefined")
        })
      }

      while (Count1.count < 10 || Count3.count < 10 || count1 < 10 || count3 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count3)
      Count1.count = 0
      Count3.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020400
     * @tc.desc Testing Task onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0
      let count1: number = 0
      let count3: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count);
        task1.onStartExecution(() => {
          count1++
          console.info("taskpool: onStartExecution" + count1)
        });
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
        })

        task2.onStartExecution(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count3++
          }
          console.info("taskpool: onStartExecution" + count3)
        });
        sequenceRunner.execute(task2).then(() => {
          Count3.count++
        }).catch((error: Error) => {
          Count3.count++
          expect(error.message).assertContain("Cannot read property split of undefined")
        })
      }

      while (Count1.count < 10 || Count3.count < 10 || count1 < 10 || count3 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count3)
      Count1.count = 0
      Count3.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020500
     * @tc.desc Testing Task onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count4.count = 0
      let count4: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count)

        task1.onExecutionFailed((e: Error) => {
          console.info("taskpool: onExecutionFailed error is " + e);
        })
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.info("SequenceRunner: execute task success" + Count1.count)
        })

        task2.onExecutionFailed(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count4++
            console.log("count4:" + count4)
          }
        })
        sequenceRunner.execute(task2).then(() => {
          Count4.count++
          console.info("SequenceRunner: execute task success")
        }).catch((error: Error) => {
          Count4.count++
          console.info("SequenceRunner: execute task failed" + error)
          expect(error.message).assertContain("Cannot read property split of undefined")
        })
      }

      while (Count1.count < 10 || Count4.count < 10 || count4 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count4.count)
      expect(10).assertEqual(count4)
      Count1.count = 0
      Count4.count = 0
      done()
    })

    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020600
     * @tc.desc Testing Task onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count)

        task1.onExecutionSucceeded(() => {
          count1++
          console.info("task1.count1:" + count1)
          console.info("taskpool: onExecutionSucceeded")
        })
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.info("SequenceRunner: execute task success")
        })

        task2.onExecutionSucceeded(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.info("SequenceRunner: execute task success")
        })

      }

      while (Count1.count < 10 || Count2.count < 10 || count1 < 10 || count2 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      Count1.count = 0
      Count2.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020700
     * @tc.desc Testing Task onReceiveData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs7, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs8, Count2.count)

        task1.onReceiveData(() => {
          count1++
          console.info("taskpool: onReceiveData")
        })
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.info("SequenceRunner: execute task success")
        })

        task2.onReceiveData(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.info("SequenceRunner: execute task success")
        })

      }

      while (Count1.count < 10 || Count2.count < 10 || count1 < 10 || count2 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      Count1.count = 0
      Count2.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)

        try {
          sequenceRunner.execute(task1).then(() => {
            Count1.count++
            console.info("SequenceRunner: execute task1 success")
            throw Error("error task1")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            Count3.count++
            throw Error("error task2")
          }).catch((error: Error) => {
            Count3.count++
            console.log("error message" + error.message)
            expect(error.message).assertContain('Cannot read property split of undefined')
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (Count1.count < 10 || Count3.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      Count1.count = 0
      Count3.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess020900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess020900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)

        try {
          sequenceRunner.execute(task1).then(() => {
            Count1.count++
            console.info("SequenceRunner: execute task1 success")
            throw Error("error task1")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            Count3.count++
          }).catch((error: Error) => {
            Count3.count++
            expect(error.message).assertContain('Cannot read property split of undefined')
            throw Error("error task2")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (Count1.count < 10 || Count3.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      Count1.count = 0
      Count3.count = 0
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let equenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count3.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)

        try {
          equenceRunner.execute(task1).then(() => {
            Count1.count++
            console.info("SequenceRunner: execute task1 success")
            throw Error("error task1")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          equenceRunner.execute(task2).finally(() => {
            Count3.count++
            throw new Error('finally  error');
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (Count1.count < 10 || Count3.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count3.count)
      Count1.count = 0
      Count3.count = 0
      done()
    })

    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021100
     * @tc.desc Testing Task asyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (count1 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021200
     * @tc.desc Testing Task asyncLock-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockThenTest = new AsyncLockTestThen()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockThenTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (count1 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021300
     * @tc.desc Testing Task asyncLock-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockCatchTest = new AsyncLockTestCatch()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockCatchTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

      }

      while (count1 < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021400
     * @tc.desc Testing Task  asyncLock-finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockFinallyTest = new AsyncLockTestFinally()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockFinallyTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021500
     * @tc.desc Testing Task task-promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021600
     * @tc.desc Testing Task task-promise-then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockThenTest = new AsyncLockTestThen()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockThenTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021700
     * @tc.desc Testing Task task-promise-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockCatchTest = new AsyncLockTestCatch()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockCatchTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021800
     * @tc.desc Testing Task task-promise-finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockFinallyTest = new AsyncLockTestFinally()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockFinallyTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success" + count2)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess021900
     * @tc.desc Testing Task task-settimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess021900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs9, 1)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.info("SequenceRunner: execute task2 success")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess022000
     * @tc.desc Testing Task async-task-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess022000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest);

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.log("TestSequenceRunnerErrorSuccess022000-1:" + count1)
            console.info("SequenceRunner: execute task1 success" + count1)
          }).catch((e: Error) => {
            count1++
            console.log("error message" + e.message)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.log("TestSequenceRunnerErrorSuccess022000-2:" + count2)
            console.info("SequenceRunner: execute task2 success")
          }).catch((e: Error) => {
            count2++
            console.log("error message" + e.message)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess022100
     * @tc.desc Testing Task await error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess022100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockTest = new AsyncLockTest()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLock, asyncLockTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.log('TestSequenceRunnerErrorSuccess022100-1:' + count1)
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          await sleep(500)
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.log('TestSequenceRunnerErrorSuccess022100-2:' + count2)
            console.info("SequenceRunner: execute task2 success")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_SEQUENCERUNNER_ERROR_SUCCESS_TEST_0200
     * @tc.name SequenceRunnerErrorSuccess022200
     * @tc.desc Testing Task await-then-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunnerErrorSuccess022200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let asyncLockThenTest = new AsyncLockTestThen()
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(asyncLockThen, asyncLockThenTest)

        try {
          sequenceRunner.execute(task1).then(() => {
            count1++
            console.log('TestSequenceRunnerErrorSuccess022200-1:' + count1)
            console.info("SequenceRunner: execute task1 success" + count1)
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }

        try {
          sequenceRunner.execute(task2).then(() => {
            count2++
            console.log('TestSequenceRunnerErrorSuccess022200-2:' + count2)
            console.info("SequenceRunner: execute task2 success")
          })
        } catch (e) {
          console.error(`taskpool: error code: ${e.code}, info: ${e.message}`);
        }
      }

      while (count1 < 10) {
        await sleep(500)
      }

      expect(10).assertEqual(count1)
      expect(0).assertEqual(count2)
      done()
    })

  })
}