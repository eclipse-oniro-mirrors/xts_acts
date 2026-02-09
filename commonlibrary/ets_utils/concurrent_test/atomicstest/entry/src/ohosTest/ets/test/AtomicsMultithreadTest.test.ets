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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';
import {SharedCounter} from '../testability/pages/AtomicsMultithreadUtils';
import { sleep } from '../testability/pages/TestUtils';

export default function AtomicsMultithreadTest() {
  describe('AtomicsMultithreadTest', () => {
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
     * @tc.name   AtomicsMultithreadTest0100
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AtomicsMultithreadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const sharedBuffer = new SharedArrayBuffer(4);
      const sharedArray = new Int32Array(sharedBuffer);
      sharedArray[0] = 10;
      const worker1 = new worker.ThreadWorker('../testability/pages/workers/Worker4');
      const worker2 = new worker.ThreadWorker('../testability/pages/workers/Worker5');
      worker1.postMessage(sharedBuffer);
      worker2.postMessage(sharedBuffer);
      await Promise.all([
        new Promise<void>((resolve) => {
          worker1.onmessage = (e) => {
            console.log(`Worker1 result: ${e.data}`);
            worker1.terminate();
            resolve();
          };
        }),
        new Promise<void>((resolve) => {
          worker2.onmessage = (e) => {
            console.log(`Worker2 result: ${e.data}`);
            worker2.terminate();
            resolve();
          };
        }),
      ]);
      console.log(`Final sharedArray[0]: ${sharedArray[0]}`);
      expect([1, 5].includes(sharedArray[0])).assertTrue();
      Done();
    });


    /**
     * @tc.name   AtomicsMultithreadTest0200
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AtomicsMultithreadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const sharedBuffer = new SharedArrayBuffer(4);
      const sharedArray = new Int32Array(sharedBuffer);
      sharedArray[0] = 5;
      const worker1 = new worker.ThreadWorker('../testability/pages/workers/Worker4');
      worker1.postMessage(sharedBuffer);
      const finalValue = await new Promise<number>((resolve) => {
        worker1.onmessage = (e) => {
          console.log(`Worker1 result: ${e.data}`);
          worker1.terminate();
          resolve(sharedArray[0]);
        };
      });
      expect(10).assertEqual(finalValue);
      Done();
    });



    /**
     * @tc.name   AtomicsMultithreadTest0300
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AtomicsMultithreadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const sharedBuffer = new SharedArrayBuffer(4);
      const sharedArray = new Int32Array(sharedBuffer);
      sharedArray[0] = 10;
      const worker1 = new worker.ThreadWorker('../testability/pages/workers/Worker4');
      const worker2 = new worker.ThreadWorker('../testability/pages/workers/Worker5');
      worker1.postMessage(sharedBuffer);
      worker2.postMessage(sharedBuffer);
      await Promise.all([
        new Promise<void>((resolve) => {
          worker1.onmessage = (e) => {
            console.log(`Worker1 result: ${e.data}`);
            worker1.terminate();
            resolve();
          };
        }),
        new Promise<void>((resolve) => {
          worker2.onmessage = (e) => {
            console.log(`Worker2 result: ${e.data}`);
            worker2.terminate();
            resolve();
          };
        }),
      ]);
      console.log(`Final sharedArray[0]: ${sharedArray[0]}`);
      expect([1, 5].includes(sharedArray[0])).assertTrue();
      Done();
    });

    /**
     * @tc.name   AtomicsMultithreadTest0400
     * @tc.number SUB_ATOMICS_MULTITHREAD_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AtomicsMultithreadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const counter = new SharedCounter(10);
      const worker1 = new worker.ThreadWorker('../testability/pages/workers/Worker6');
      let result = 0;
      worker1.postMessage(counter.getBuffer());
      result = await new Promise<number>((resolve)=>{
        worker1.onmessage = () => {
          console.log(`Worker1`);
        };
        result = counter.add(11);
        setTimeout(() => {
          worker1.terminate();
        }, 3000);
        resolve(result)
      })

      expect(10).assertEqual(result);
      Done();
    });
  })
}