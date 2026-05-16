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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {
  printArgs4,
  printArgs5,
  printArgs6,
  printArgs7,
  printArgs8,
  sleep
} from '../testability/pages/TaskpoolMethods';
let tag: string = 'ProcessInterfacetTest'

export default function ProcessInterfacetTest() {
  describe('ProcessInterfacetTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
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
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0400
     * @tc.name ProcessInterfacetTest0400
     * @tc.desc test The is64Bit() is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessInterfacetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessInterfacetTest0400'
      console.info(`${caseName}, test start`);
      let count: number = 0;
      for (let i = 0; i < 100; i++) {
        const result = StdProcess.is64Bit();
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
     * @tc.number SUB_PROCESS_INTERFACE_TEST_0700
     * @tc.name ProcessInterfacetTest0700
     * @tc.desc test The getPastCpuTime() is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessInterfacetTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessInterfacetTest0700';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = StdProcess.getStartRealtime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = StdProcess.getStartRealtime();
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
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1000
     * @tc.name ProcessInterfacetTest1000
     * @tc.desc test The getPastCpuTime() is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessInterfacetTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessInterfacetTest1000';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = StdProcess.getPastCpuTime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = StdProcess.getPastCpuTime();
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
     * @tc.number SUB_PROCESS_INTERFACE_TEST_1300
     * @tc.name ProcessInterfacetTest1300
     * @tc.desc test The uptime() is tested in the main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ProcessInterfacetTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'ProcessInterfacetTest1300';
      console.info(`${caseName}, test start`);
      let count: number = 0;
      const startTime = StdProcess.uptime();
      console.log(`Initial start time: ${startTime}`);
      for (let i = 0; i < 100; i++) {
        const currentTime = StdProcess.uptime();
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

  })
}