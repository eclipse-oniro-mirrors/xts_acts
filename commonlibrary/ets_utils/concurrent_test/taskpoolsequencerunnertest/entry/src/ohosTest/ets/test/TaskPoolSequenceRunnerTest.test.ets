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
  printArgs1,
  printArgs2,
  printArgs3,
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  testFunc,
  testTransfer
} from '../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4 } from '../testability/pages/DataFlg';
import { BusinessError } from '@kit.BasicServicesKit';
import { BaseClass } from '../testability/pages/SendableTest';
import { sleep } from '../testability/pages/Utils';


export default function TaskPoolSequenceRunnerTest() {
  describe('TaskPoolSequenceRunnerTest', () => {
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
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0100
     * @tc.name TestSequenceRunner0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TestSequenceRunner0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count);
        await sleep(100)
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.log("count1.count" + Count1.count)
        }).catch((err: object[]) => {
          Count1.count++
          console.error('=======', JSON.stringify(err))
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.log("count1.count" + Count2.count)
        }).catch((err: object[]) => {
          Count2.count++
          console.error('=======', JSON.stringify(err))
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(500)
      }
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0200
     * @tc.name TestSequenceRunner0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunner0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count3.count = 0
      Count4.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.Task(printArgs3, Count3.count);
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count);
        try {
          sequenceRunner.execute(task1).then(() => {
            Count3.count++
            console.info('======', Count3.count)
          }).catch((error: BusinessError) => {
            count1++
            console.error(`error message error: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
        try {
          sequenceRunner.execute(task2).then(() => {
            Count4.count++
            console.info('======', Count4.count)
          }).catch((error: BusinessError) => {
            expect(error.message).assertContain("Cannot read property split of undefined")
            count2++
            console.error(`error message error: ${JSON.stringify(error)}`)
          })
        } catch (e) {
          console.error(`error message e: ${JSON.stringify(e)}`)
        }
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(0).assertEqual(Count3.count)
      expect(0).assertEqual(Count4.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      Count3.count = 0
      Count4.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0300
     * @tc.name TestSequenceRunner0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TestSequenceRunner0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs1, 1);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs2, 1);
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.log("count1:" + Count1.count)
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.log("count2:" + Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0400
     * @tc.name TestSequenceRunner0400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunner0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count3.count = 0
      Count4.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs3, 1);
        let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs4, 1);
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.log("count1:" + Count1.count)
        }).catch((error: Error) => {
          expect(error.message).assertContain("Cannot read property split of undefined")
          count1++
          console.error(`error message error: ${JSON.stringify(error)}`)
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.log("count2:" + Count2.count)
        }).catch((error: Error) => {
          expect(error.message).assertContain("Cannot read property split of undefined")
          count2++
          console.error(`error message error: ${JSON.stringify(error)}`)
        })

      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(0).assertEqual(Count1.count)
      expect(0).assertEqual(Count2.count)
      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      Count1.count = 0
      Count2.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0500
     * @tc.name TestSequenceRunner0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunner0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let name1: String = ''
      let name2: String = ''
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        await sleep(100)
        let task1: taskpool.Task = new taskpool.Task("Task1", printArgs1, 1);
        let task2: taskpool.Task = new taskpool.Task("Task2", printArgs2, 1);
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          name1 = task1.name
          console.log("count1:" + Count1.count)
        })
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          name2 = task2.name
          console.log("count2:" + Count2.count)
        })
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(Count1.count)
      expect("Task1").assertEqual(name1)
      expect(10).assertEqual(Count2.count)
      expect("Task2").assertEqual(name2)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0600
     * @tc.name TestSequenceRunner0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunner0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs5, 1);
        let task2: taskpool.Task = new taskpool.Task(printArgs6, 1);
        sequenceRunner.execute(task1).then(() => {
        }).catch((e: Error) => {
          Count1.count++
          console.log("count1:" + Count1.count)
          console.log("error message1" + e)
        })
        sequenceRunner.execute(task2).then(() => {
        }).catch((e: Error) => {
          Count2.count++
          console.log("count2:" + Count2.count)
          console.log("error message2" + e)
        })
        taskpool.cancel(task1)
        taskpool.cancel(task2)
      }

      while (Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count1.count = 0
      Count2.count = 0
      done()
    })

    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0700
     * @tc.name TestSequenceRunner0700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TestSequenceRunner0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      let finalView: Uint8Array | null = null;
      let finalView1: Uint8Array | null = null;
      let finalViews: Uint8Array | null = null;
      let finalViews1: Uint8Array | null = null;

      for (let i = 0; i < 10; i++) {
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let buffer1: ArrayBuffer = new ArrayBuffer(16);
        let view1: Uint8Array = new Uint8Array(buffer1);

        let buffers: ArrayBuffer = new ArrayBuffer(8);
        let views: Uint8Array = new Uint8Array(buffers);
        let buffers1: ArrayBuffer = new ArrayBuffer(16);
        let views1: Uint8Array = new Uint8Array(buffers1);

        let task1: taskpool.Task = new taskpool.Task(testTransfer, view, view1);
        task1.setTransferList([view.buffer, view1.buffer]);

        let task2: taskpool.Task = new taskpool.Task(testTransfer, views, views1);
        task2.setTransferList([views.buffer, views1.buffer]);

        sequenceRunner.execute(task1).then((res: Object) => {
          console.info("test result: " + res);
        }).catch((e: string) => {
          console.error("test catch: " + e);
        })

        sequenceRunner.execute(task2).then((res: Object) => {
          console.info("test result: " + res);
        }).catch((e: string) => {
          console.error("test catch: " + e);
        })

        finalView = view;
        finalView1 = view1;
        finalViews = views;
        finalViews1 = views1;
      }

      if (finalView && finalView1 && finalViews && finalViews1) {

        while (finalView.byteLength != 0) {
          await sleep(500)
        }

        console.info("testTransfer view2 byteLength: " + finalView.byteLength);
        console.info("testTransfer view3 byteLength: " + finalView1.byteLength);
        console.info("testTransfer view4 byteLength: " + finalViews.byteLength);
        console.info("testTransfer view5 byteLength: " + finalViews1.byteLength);

        expect(0).assertEqual(finalView.byteLength);
        expect(0).assertEqual(finalView1.byteLength);
        expect(0).assertEqual(finalViews.byteLength);
        expect(0).assertEqual(finalViews1.byteLength);
      }

      done();
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0800
     * @tc.name sequenceRunner0800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let res1: number = 0
      let res2: number = 0

      for (let i = 0; i < 10; i++) {
        let baseInstance1: BaseClass = new BaseClass();
        let array1 = new Array<BaseClass>();
        array1.push(baseInstance1);
        let task1 = new taskpool.Task(testFunc, array1, 10);
        task1.setCloneList(array1);

        let baseInstance2: BaseClass = new BaseClass();
        let array2 = new Array<BaseClass>();
        array2.push(baseInstance2);
        let task2 = new taskpool.Task(testFunc, array2, 10);
        task2.setCloneList(array2);

        sequenceRunner.execute(task1).then((res: Object) => {
          console.info("sendable: task1 res is: " + res);
          res1 = res as number
        }).catch((e: BusinessError) => {
          console.error(`sendable: task1 execute Code is ${e.code}, message is ${e.message}`);
        })

        sequenceRunner.execute(task2).then((res: Object) => {
          console.info("sendable: task2 res is: " + res);
          res2 = res as number
        }).catch((e: BusinessError) => {
          console.error(`sendable: task2 execute Code is ${e.code}, message is ${e.message}`);
        })
      }
      while (res1 < 55 || res2 < 55) {
        await sleep(1000)
      }
      expect(55).assertEqual(res1)
      expect(55).assertEqual(res2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_0900
     * @tc.name sequenceRunner0900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count1.count = 0
      Count2.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count)
        task1.onEnqueued(() => {
          count1++
          console.info("taskpool: onEnqueued" + count1)
        });
        sequenceRunner.execute(task1).then(() => {
          Count1.count++
          console.log("Count1.count++:" + Count1.count++)
        })

        task2.onEnqueued(() => {
          count2++
          console.info("taskpool: onEnqueued" + count2)
        });
        sequenceRunner.execute(task2).then(() => {
          Count2.count++
          console.log("Count2.count++:" + Count2.count++)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      Count1.count = 0
      Count2.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1000
     * @tc.name sequenceRunner1000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      Count3.count = 0
      Count4.count = 0
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count)
        task1.onEnqueued(() => {
          Count1.count++
          console.info("taskpool: onEnqueued" + count1)
        });
        sequenceRunner.execute(task1).then(() => {
        }).catch((error: Error) => {
          count1++
          console.log("Count1.count:" + Count1.count)
          expect(error.message).assertContain("Cannot read property split of undefined")
        })

        task2.onEnqueued(() => {
          Count2.count++
          console.info("taskpool: onEnqueued" + count2)
        });
        sequenceRunner.execute(task2).then(() => {
        }).catch((error: Error) => {
          count2++
          console.log("Count2.count:" + Count2.count)
          expect(error.message).assertContain("Cannot read property split of undefined")
        })
      }

      while (count1 < 10 || count2 < 10 || Count1.count < 10 || Count2.count < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      expect(10).assertEqual(Count1.count)
      expect(10).assertEqual(Count2.count)
      Count3.count = 0
      Count4.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1100
     * @tc.name sequenceRunner1100
     * @tc.desc Testing Task onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      Count1.count = 0
      Count2.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, Count1.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, Count2.count)
        task1.onStartExecution(() => {
          count1++
          console.info("taskpool: onStartExecution")
        });
        sequenceRunner.execute(task1).then(() => {
          console.log("Count3.count:" + Count3.count)
        })

        task2.onStartExecution(() => {
          count2++
          console.info("taskpool: onStartExecution" + count2)
        });
        sequenceRunner.execute(task2).then(() => {
          console.log("Count4.count:" + Count4.count)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      expect(0).assertEqual(Count1.count)
      expect(0).assertEqual(Count2.count)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1200
     * @tc.name sequenceRunner1200
     * @tc.desc Testing Task  onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0
      Count3.count = 0
      Count4.count = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, Count3.count)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, Count4.count)
        task1.onStartExecution(() => {
          console.info("taskpool: onStartExecution")
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count1++
          }
        });
        sequenceRunner.execute(task1).then(() => {
          console.log("Count3.count:" + Count3.count)
        }).catch((error: Error) => {
          console.log("error message" + error)
        })

        task2.onStartExecution(() => {
          console.info("taskpool: onStartExecution" + count2)
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        });
        sequenceRunner.execute(task2).then(() => {
          console.log("Count4.count:" + Count4.count)
        }).catch((error: Error) => {
          console.log("error message" + error)
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      expect(0).assertEqual(Count3.count)
      expect(0).assertEqual(Count4.count)
      Count3.count = 0
      Count4.count = 0
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1300
     * @tc.name sequenceRunner1300
     * @tc.desc Testing Task  onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, 1)
        task1.onExecutionFailed((e: Error) => {
          count1++
          console.info("task1.count1:" + count1)
          console.info("taskpool: onExecutionFailed error is " + e);
        })
        sequenceRunner.execute(task1).then(() => {
          console.info("SequenceRunner: execute task success")
        })

        task2.onExecutionFailed((e: Error) => {
          count2++
          console.info("task2.count2:" + count2)
          console.info("taskpool: onExecutionFailed error is " + e);
        })
        sequenceRunner.execute(task2).then(() => {
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1400
     * @tc.name sequenceRunner1400
     * @tc.desc Testing Task  onExecutionFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs3, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs4, 1)

        task1.onExecutionFailed(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count1++
            console.log("count1" + count1)
          }
        })

        task2.onExecutionFailed(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
            console.log("count2" + count2)
          }
        })

        sequenceRunner.execute(task1).then(() => {
          console.info("SequenceRunner: execute task success")
        })
        sequenceRunner.execute(task2).then(() => {
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1500
     * @tc.name sequenceRunner1500
     * @tc.desc Testing Task  onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1)

        task1.onExecutionSucceeded(() => {
          count1++
          console.info("task1.count1:" + count1)
          console.info("taskpool: onExecutionSucceeded")
        })
        sequenceRunner.execute(task1).then(() => {
          console.info("SequenceRunner: execute task success")
        })

        task2.onExecutionSucceeded(() => {
          count2++
          console.info("task2.count2:" + count2)
          console.info("taskpool: onExecutionSucceeded")
        })
        sequenceRunner.execute(task2).then(() => {
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1600
     * @tc.name sequenceRunner1600
     * @tc.desc Testing Task  onExecutionSucceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1)

        task1.onExecutionSucceeded(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count1++
          }
        })

        task2.onExecutionSucceeded(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count2++
          }
        })

        sequenceRunner.execute(task1).then(() => {
          console.info("SequenceRunner: execute task success")
        })

        sequenceRunner.execute(task2).then(() => {
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1700
     * @tc.name sequenceRunner1700
     * @tc.desc Testing Task  onReceiveData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs7, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs8, 1)

        task1.onReceiveData(() => {
          count1++
          console.info("task1.count1:" + count1)
          console.info("taskpool: onReceiveData")
        })
        sequenceRunner.execute(task1).then(() => {
          console.info("SequenceRunner: execute task success")
        })

        task2.onReceiveData(() => {
          count2++
          console.info("task2.count2:" + count2)
          console.info("taskpool: onReceiveData")
        })
        sequenceRunner.execute(task2).then(() => {
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1800
     * @tc.name sequenceRunner1800
     * @tc.desc Testing Task  onReceiveData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let count1: number = 0
      let count2: number = 0

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs7, 1)
        let task2: taskpool.Task = new taskpool.Task(printArgs8, 1)

        task1.onReceiveData(() => {
          try {
            let s: string[] = []
            s[0].split('')[1].toString()
          } catch (e) {
            count1++
          }
        })
        sequenceRunner.execute(task1).then(() => {
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
          console.info("SequenceRunner: execute task success")
        })
      }

      while (count1 < 10 || count2 < 10) {
        await sleep(1000)
      }

      expect(10).assertEqual(count1)
      expect(10).assertEqual(count2)
      done()
    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_1900
     * @tc.name sequenceRunner1900
     * @tc.desc Testing Task  idDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs1, 1);
        sequenceRunner.execute(task1)
        task1.isDone()
        while (!task1.isDone()) {
          await sleep(100)
        }
        expect(task1.isDone()).assertTrue()

        let task2: taskpool.Task = new taskpool.Task(printArgs2, 1);
        sequenceRunner.execute(task2)
        task2.isDone()
        while (!task2.isDone()) {
          await sleep(100)
        }
        expect(task2.isDone()).assertTrue()
      }
      done()

    })


    /**
     * @tc.number SUB_TASKPOOL_SEQUENCERUNNER_TEST_2000
     * @tc.name sequenceRunner2000
     * @tc.desc Testing Task  idDone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequenceRunner2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();

      for (let i = 0; i < 10; i++) {
        let task1: taskpool.Task = new taskpool.Task(printArgs5, 1);
        let task2: taskpool.Task = new taskpool.Task(printArgs6, 1);
        sequenceRunner.execute(task1)
        sequenceRunner.execute(task2)
        expect(task1.isDone()).assertFalse()
        expect(task2.isDone()).assertFalse()
      }
      done()
    })

  })
}