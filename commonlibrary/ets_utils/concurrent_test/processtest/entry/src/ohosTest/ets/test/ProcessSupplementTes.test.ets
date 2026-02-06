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
import { process, taskpool} from '@kit.ArkTS';
import { printArgs1, printArgs2, printArgs3,
  sleep,
  WorkThread, WorkThread2,
  WorkThread3 } from '../testability/pages/TaskpoolMethods';

let tag: string = 'ProcessSupplementTest'


export default function ProcessSupplementTest() {
  describe('ProcessSupplementTest', () => {
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
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0100
     * @tc.name ProcessSupplementTest0100
     * @tc.desc test The uid is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0100'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        console.log(`Call ${i + 1}: UID = ${process.uid}`);
        count++;
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(count).assertEqual(100)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0200
     * @tc.name ProcessSupplementTest0200
     * @tc.desc test The uid is tested in the taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0200'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      let task:taskpool.Task = new taskpool.Task(printArgs1, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then(() => {
            count++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(100).assertEqual(count)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0300
     * @tc.name ProcessSupplementTest0300
     * @tc.desc test The uid is tested in the Worker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0300';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainUid = process.uid;
      WorkThread.workerStageModel.onmessage = (event) => {
        if (event.data !== mainUid) {
          errorCount++;
        }
        console.log(event.data);
      };

      WorkThread.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread.workerStageModel.postMessage('getUid');
      }
      await sleep(100);
      WorkThread.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0400
     * @tc.name ProcessSupplementTest0400
     * @tc.desc test The pid is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0400'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        console.log(`Call ${i + 1}: UID = ${process.pid}`);
        count++;
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(count).assertEqual(100)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0500
     * @tc.name ProcessSupplementTest0500
     * @tc.desc test The pid is tested in the taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0500'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      let task:taskpool.Task = new taskpool.Task(printArgs2, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then(() => {
            count++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(100).assertEqual(count)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0600
     * @tc.name ProcessSupplementTest0600
     * @tc.desc test The pid is tested in the Worker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0600';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainPid = process.pid;
      console.info(`${caseName}, PID: ${mainPid}`);

      WorkThread2.workerStageModel.onmessage = (event) => {
        if (event.data !== mainPid) {
          errorCount++;
        }
        console.log(event.data);
      };

      WorkThread2.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread2.workerStageModel.postMessage('getPid');
      }
      await sleep(100);
      WorkThread2.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })
    
    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0700
     * @tc.name ProcessSupplementTest0700
     * @tc.desc test The tid is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0500';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        console.log(`Call ${i + 1}: TID = ${process.tid}`);
        count++;
      }
      while (count < 100) {
        await sleep(100);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0800
     * @tc.name ProcessSupplementTest0800
     * @tc.desc test The tid is tested in the taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0800'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      let task:taskpool.Task = new taskpool.Task(printArgs3, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then(() => {
            count++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(100).assertEqual(count)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_PROCESS_SUPPLEMENT_TEST_0900
     * @tc.name ProcessSupplementTest0900
     * @tc.desc test The tid is tested in the Worker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessSupplementTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessSupplementTest0900';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainTid = process.tid;
      console.info(`${caseName}, TID: ${mainTid}`);

      WorkThread3.workerStageModel.onmessage = (event) => {
        if (event.data !== mainTid) {
          errorCount++;
        }
        console.log(event.data);
      };

      WorkThread3.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread3.workerStageModel.postMessage('getTid');
      }
      await sleep(100);
      WorkThread3.workerStageModel.terminate();
      expect(errorCount).assertEqual(100);
      console.info(`${caseName}, test end`);
      Done();
    })
  })
}