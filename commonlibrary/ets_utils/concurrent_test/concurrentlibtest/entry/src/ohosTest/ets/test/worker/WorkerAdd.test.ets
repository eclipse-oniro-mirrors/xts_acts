/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, afterEach, TestType, Level, Size } from '@ohos/hypium';
import { JSON, MessageEvents, worker, ThreadWorkerPriority } from '@kit.ArkTS';
import { Sleep } from '../utils/utils';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function workerAddTest() {
  describe('workerAddTest', () => {

    afterEach(async () => {
      await Sleep(50);
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0100
     * @tc.name       : testThreadWorkerAdd0001
     * @tc.desc       : Enumeration of the priority of the Worker thread high priority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0001";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", { priority: ThreadWorkerPriority.HIGH });
        const message = 'message';
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('message');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0200
     * @tc.name       : testThreadWorkerAdd0002
     * @tc.desc       : Enumeration of the priority of the Worker thread medium priority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0002";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", { priority: ThreadWorkerPriority.MEDIUM });
        const message = 'message';
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('message');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0300
     * @tc.name       : testThreadWorkerAdd0003
     * @tc.desc       : Enumeration of the priority of the Worker thread low priority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0003";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", { priority: ThreadWorkerPriority.LOW });
        const message = 'message';
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('message');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0400
     * @tc.name       : testThreadWorkerAdd0004
     * @tc.desc       : Enumeration of the priority of the Worker thread background priority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0004";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", { priority: ThreadWorkerPriority.IDLE });
        const message = 'message';
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('message');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0500
     * @tc.name       : testThreadWorkerAdd0005
     * @tc.desc       : Message class, which holds data passed between Worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0005";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode//WorkerMessageEvent",
            { priority: ThreadWorkerPriority.IDLE });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          let result: number = e.data as number;
          expect(result).assertEqual(10);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Add_0600
     * @tc.name       : testThreadWorkerAdd0006
     * @tc.desc       : The class that needs to transfer ownership objects during data transfer must be ArrayBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerAdd0006";
      try {
        let state: boolean = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData1", { priority: ThreadWorkerPriority.IDLE });
        let buffer = new ArrayBuffer(8);
        workerInstance.postMessage(buffer, [buffer]);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          let data: ArrayBuffer = e.data;
          expect(data.byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
        done()
      }
    });
  })
}