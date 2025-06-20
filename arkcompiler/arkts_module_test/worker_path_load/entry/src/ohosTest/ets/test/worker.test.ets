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

import { describe, it, expect, afterEach } from "@ohos/hypium"
import { worker } from "@kit.ArkTS";
import { Sleep } from "./utils/utils";
import { harAbsolutePathLoadWorker, harRelativePathLoadWorker, } from "har";
import { hspAbsolutePathLoadWorker, hspLoadHarWorker, hspRelativePathLoadWorker } from "hsp";

export default function workerLoad() {
  describe('workerTest', () => {

    afterEach(async () => {
      // 等待用例创建的 worker 实例释放
      await Sleep(50);
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0100
     * @tc.name      : testWorkerLoadingInHap01
     * @tc.desc      : Load the worker file in the entry relative path.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHap01', 0, async () => {
      const caseName: string = "testWorkerLoadingInHap01";
      try {
        let state: boolean = false;
        let workerLoadSuccess: boolean = false;
        let threadWorker = new worker.ThreadWorker('./workers/worker.ets');
        threadWorker.postMessage(caseName);
        threadWorker.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          workerLoadSuccess = e.data as boolean;
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        threadWorker.terminate();
        expect(workerLoadSuccess).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0200
     * @tc.name      : testWorkerLoadingInHap02
     * @tc.desc      : The worker file in the entry is loaded in the absolute path.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHap02', 0, async () => {
      const caseName: string = "testWorkerLoadingInHap02";
      try {
        let state: boolean = false;
        let workerLoadSuccess: boolean = false;
        let threadWorker = new worker.ThreadWorker('entry_test/ets/test/workers/worker.ets');
        threadWorker.postMessage(caseName);
        threadWorker.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          workerLoadSuccess = e.data as boolean;
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        threadWorker.terminate();
        expect(workerLoadSuccess).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0300
     * @tc.name      : testWorkerLoadingInHap03
     * @tc.desc      : Load the worker file of the HSP.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHap03', 0, async () => {
      const caseName: string = "testWorkerLoadingInHap03";
      try {
        let state: boolean = false;
        let workerLoadSuccess: boolean = false;
        let threadWorker = new worker.ThreadWorker('hsp/ets/workers/worker.ets');
        threadWorker.postMessage(caseName);
        threadWorker.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          workerLoadSuccess = e.data as boolean;
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        threadWorker.terminate();
        expect(workerLoadSuccess).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0400
     * @tc.name      : testWorkerLoadingInHap04
     * @tc.desc      : Load the worker file in the local HAR.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHap04', 0, async () => {
      const caseName: string = "testWorkerLoadingInHap04";
      try {
        let state: boolean = false;
        let workerLoadSuccess: boolean = false;
        let threadWorker = new worker.ThreadWorker('@har/ets/workers/worker.ets');
        threadWorker.postMessage(caseName);
        threadWorker.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          workerLoadSuccess = e.data as boolean;
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
        threadWorker.terminate();
        expect(workerLoadSuccess).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0600
     * @tc.name      : testWorkerLoadingInHar01
     * @tc.desc      : Worker is used in the test har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("testWorkerLoadingInHar01", 0, async () => {
      const caseName: string = "testWorkerLoadingInHar01";
      try {
        let res = false;
        res = await harAbsolutePathLoadWorker();
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0700
     * @tc.name      : testWorkerLoadingInHar02
     * @tc.desc      : Worker is used in the test har.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHar02', 0, async () => {
      const caseName: string = "testWorkerLoadingInHar02";
      try {
        let res = false;
        res = await harRelativePathLoadWorker();
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0800
     * @tc.name      : testWorkerLoadingInHsp01
     * @tc.desc      : Worker is used in the test hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHsp01', 0, async () => {
      const caseName: string = "testWorkerLoadingInHsp01";
      try {
        let res = false;
        res = await hspAbsolutePathLoadWorker();
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_0900
     * @tc.name      : testWorkerLoadingInHsp02
     * @tc.desc      : Worker is used in the test hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHsp02', 0, async () => {
      const caseName: string = "testWorkerLoadingInHsp02";
      try {
        let res = false;
        res = await hspRelativePathLoadWorker();
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_WORKER_PATH_LOAD_1000
     * @tc.name      : testWorkerLoadingInHsp03
     * @tc.desc      : Worker is used in the test hsp.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testWorkerLoadingInHsp03', 0, async () => {
      const caseName: string = "testWorkerLoadingInHsp03";
      try {
        let res = false;
        res = await hspLoadHarWorker();
        expect(res).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
    })
  })
}