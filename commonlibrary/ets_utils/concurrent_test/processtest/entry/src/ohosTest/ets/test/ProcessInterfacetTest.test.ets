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
import { process, taskpool } from '@kit.ArkTS';
import {
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  sleep,
  WorkThread4,
  WorkThread5,
  WorkThread6,
  WorkThread7,
  WorkThread8
} from '../testability/pages/TaskpoolMethods';

let tag: string = 'ProcessInterfacetTest'

export default function ProcessInterfacetTest() {
  describe('ProcessInterfacetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   ProcessInterfacetTest0100
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0100
     * @tc.desc   test The isIsolatedProcess() is tested in the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0100'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        const result = process.isIsolatedProcess();
        console.info(`Call ${i + 1}: isIsolatedProcess() = ${result}`);
        expect(result).assertEqual(true);
        count++;
      }
      await sleep(100);
      expect(count).assertEqual(100)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest0200
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0200
     * @tc.desc   test The isIsolatedProcess() is tested in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0200'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      let task:taskpool.Task = new taskpool.Task(printArgs4, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then(() => {
            count++;
          })
        } catch (e) {
          console.info(`${tag} execute error:${e.message}`)
        }
      }
      while (count<100){
        await sleep(100);
      }
      expect(100).assertEqual(count)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest0300
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0300
     * @tc.desc   testThe isIsolatedProcess() is tested in the Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0300';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainIsIsolatedProcess = process.isIsolatedProcess();
      console.info(`${caseName}, isIsolatedProcess: ${mainIsIsolatedProcess}`);

      WorkThread4.workerStageModel.onmessage = (event) => {
        if (event.data !== mainIsIsolatedProcess) {
          errorCount++;
        }
        console.log(`${event.data}`);
      };

      WorkThread4.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread4.workerStageModel.postMessage('getIsIsolatedProcess');
      }
      await sleep(100);
      WorkThread4.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest0400
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0400
     * @tc.desc   test The is64Bit() is tested in the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0400'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        const result = process.is64Bit();
        console.info(`Call ${i + 1}: is64Bit() = ${result}`);
        count++;
      }
      while (count<100){
        await sleep(100);
      }
      expect(count).assertEqual(100);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest0500
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0500
     * @tc.desc   test The is64Bit() is tested in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0500'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      let task:taskpool.Task = new taskpool.Task(printArgs5, 1);
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
     * @tc.name   ProcessInterfacetTest0600
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0600
     * @tc.desc   test The is64Bit() is tested in the Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0600';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainIs64Bit = process.is64Bit();
      console.info(`${caseName}, isIs64Bit: ${mainIs64Bit}`);
      WorkThread5.workerStageModel.onmessage = (event) => {
        if (event.data !== mainIs64Bit) {
          errorCount++;
        }
        console.log(`${event.data}`);
      };

      WorkThread5.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread5.workerStageModel.postMessage('getIsIs64Bit');
      }
      await sleep(100);
      WorkThread5.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest0700
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0700
     * @tc.desc   test The getPastCpuTime() is tested in the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0700';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.getStartRealtime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = process.getStartRealtime();
        console.log(`Call ${i + 1}: Start Realtime = ${currentTime}`);
        expect(startTime).assertEqual(currentTime);
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
     * @tc.name   ProcessInterfacetTest0800
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0800
     * @tc.desc   test The getStartRealtime is tested in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0800'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.getStartRealtime();
      let task:taskpool.Task = new taskpool.Task(printArgs6, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then((result)=>{
            const currentTime = result;
            console.info(JSON.stringify(currentTime));
            expect(startTime).assertEqual(currentTime);
          });
          count++;
        } catch (e) {
          console.info(`execute error: ${e.message}`);
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
     * @tc.name   ProcessInterfacetTest0900
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0900
     * @tc.desc   test The getStartRealtime is tested in the Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest0900';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainGetStartRealtime = process.getStartRealtime();
      console.info(`${caseName}, getStartRealtime: ${mainGetStartRealtime}`);
      WorkThread6.workerStageModel.onmessage = (event) => {
        if (event.data !== mainGetStartRealtime) {
          errorCount++;
        }
        console.log(`${event.data}`);
      };
      WorkThread6.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread6.workerStageModel.postMessage('getStartRealtime');
      }
      await sleep(100);
      WorkThread6.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest1000
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1000
     * @tc.desc   test The getPastCpuTime() is tested in the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1000';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.getPastCpuTime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = process.getPastCpuTime();
        console.log(`Call ${i + 1}: Start Realtime = ${currentTime}`);
        if (startTime > currentTime) {
          throw new Error('startTime is greater than currentTime');
        } else {
          count++;
        }
      }
      while (count < 100) {
        await sleep(1000);
      }
      expect(count).assertEqual(100)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest1100
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1100
     * @tc.desc   test The getPastCpuTime() is tested in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1100'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.getPastCpuTime();
      console.info(`Realtime = ${startTime}`)
      let task:taskpool.Task = new taskpool.Task(printArgs7, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then((result)=>{
            const currentTime = result;
            console.info(JSON.stringify(currentTime));
            if (startTime > currentTime) {
              throw new Error('startTime is greater than currentTime');
            } else {
              count++;
            }
          });
        } catch (e) {
          console.info(`execute error: ${e.message}`);
        }
      }
      while (count < 100) {
        await sleep(1000);
      }
      expect(100).assertEqual(count)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest1200
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1200
     * @tc.desc   test The getPastCpuTime() is tested in the Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1200';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainGetPastCpuTime = process.getPastCpuTime();
      console.info(`${caseName}, getPastCpuTime: ${mainGetPastCpuTime}`);
      WorkThread7.workerStageModel.onmessage = (event) => {
        if (mainGetPastCpuTime > event.data) {
          throw new Error('mainGetPastCpuTime is greater than currentTime');
        }
        errorCount++;
        console.log(`${event.data}`);
      };
      WorkThread7.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread7.workerStageModel.postMessage('getPastCpuTime');
      }
      await sleep(1000);
      WorkThread7.workerStageModel.terminate();
      expect(errorCount).assertEqual(100);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest1300
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1300
     * @tc.desc   test The uptime() is tested in the main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1300';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.uptime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = process.uptime();
        console.log(`Call ${i + 1}: Start Realtime = ${currentTime}`);
        if (startTime > currentTime) {
          throw new Error('startTime is greater than currentTime');
        } else {
          count++;
        }
      }
      while (count < 100) {
        await sleep(100);
      }
      expect(count).assertEqual(100)
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.name   ProcessInterfacetTest1400
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1400
     * @tc.desc   test The uptime() is tested in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1400'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = process.uptime();
      console.info(`Realtime = ${startTime}`)
      let task:taskpool.Task = new taskpool.Task(printArgs8, 1);
      for (let i = 0; i < 100; i++) {
        try {
          taskpool.execute(task).then((result)=>{
            const currentTime = result;
            console.info(JSON.stringify(currentTime));
            if (startTime > currentTime) {
              throw new Error('startTime is greater than currentTime');
            } else {
              count++;
            }
          });
        } catch (e) {
          console.info(`execute error: ${e.message}`);
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
     * @tc.name   ProcessInterfacetTest1500
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1500
     * @tc.desc   test The getPastCpuTime() is tested in the Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ProcessInterfacetTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'ProcessInterfacetTest1500';
      console.info(`${caseName}, test start`);
      let errorCount = 0;
      const totalCalls = 100;
      const mainUptime = process.uptime();
      console.info(`${caseName}, uptime: ${mainUptime}`);
      WorkThread8.workerStageModel.onmessage = (event) => {
        if (event.data !== mainUptime) {
          errorCount++;
        }
        console.log(`${event.data}`);
      };
      WorkThread8.workerStageModel.onerror = (err) => {
        console.error(`${caseName}, Worker error: ${err.message}`);
        errorCount++;
      };

      for (let i = 0; i < totalCalls; i++) {
        WorkThread8.workerStageModel.postMessage('uptime');
      }
      await sleep(100);
      WorkThread8.workerStageModel.terminate();
      expect(errorCount).assertEqual(0);
      console.info(`${caseName}, test end`);
      Done();
    })

  })
}