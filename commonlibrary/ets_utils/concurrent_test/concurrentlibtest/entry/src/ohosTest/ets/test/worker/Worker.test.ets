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

import { describe, it, afterEach, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, ErrorEvent, JSON, lang, worker } from '@kit.ArkTS';
import { GetTime, Sleep } from '../utils/utils';
import { Obj } from '../../workers/postMessage//WorkerPostMessageObj';
import {
  ImplISendableClass,
  TestCallObject,
  TestClass,
  TestObj,
  TestSendableClass,
  testSendableFunction,
  TestSendableObj,
  testUnionType
} from '../utils/workerCommon';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function workerTest() {
  describe('workerTest', () => {

    afterEach(async () => {
      // 等待用例创建的 worker 实例释放
      await Sleep(50);
    })

    /**
     * @tc.name   testThreadWorker0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_0100
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0001";
      try {
        const workerInstance = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_0200
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0002";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_0600
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0006";
      try {
        const workerInstance = new worker.ThreadWorker('entry_test/ets/workers/NotConfigureWorker.ets');
        workerInstance.terminate();
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err}`);
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_0700
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0007";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/NotConfigureWorker.ets');
        workerInstance.terminate();
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err}`);
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1100
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0011";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          name: ""
        });
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1300
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0013";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          name: undefined
        });
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1400
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0014";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          name: 'worker'
        });
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1600
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0016";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          type: "classic"
        });
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1700
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0017";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          type: "module"
        });
        expect().assertFail();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
      }
      done()
    });

    /**
     * @tc.name   testThreadWorker0018
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_CONSTRUCTOR_1800
     * @tc.desc   Test the function of the interface Constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThreadWorker0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = "testThreadWorker0018";
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets', {
          type: "classic", name: "worker"
        });
        expect(workerInstance instanceof worker.ThreadWorker).assertTrue();
        workerInstance.terminate();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testPostMessage0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0100
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = [];
        workerInstance.postMessage(message, transfer);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0200
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0002';
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = null;
        try {
          workerInstance.postMessage(message, transfer);
          workerInstance.onmessage = (e) => {
            console.log(`${caseName} main result: ` + JSON.stringify(e));
          }
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName} catch error: ${error.message}`);
          workerInstance.terminate();
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0300
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0003';
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = undefined;
        try {
          workerInstance.postMessage(message, transfer);
          workerInstance.onmessage = (e) => {
            console.log(`${caseName} main result: ` + JSON.stringify(e));
          }
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName} catch error: ${error.message}`);
          workerInstance.terminate();
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0400
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0004';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let buffer = new ArrayBuffer(16);
        let view1 = new Uint8Array(buffer);
        view1[0] = 2;
        let view2 = new Int32Array(buffer, 0, 2);
        const message = 'message';
        const transfer = [view1.buffer, view2.buffer];
        workerInstance.postMessage(message, transfer);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0600
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0006';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let value: number = 1;
        let num: Int8Array = new Int8Array(1);
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(value + 1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0700
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0007';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let value: boolean = false;
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(!value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0800
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0008';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let value: undefined = undefined;
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(!value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_0900
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0009';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let value: null = null;
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1000
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0010';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessage.ets");
        let value: bigint = 1n;
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(value + value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testPostMessage0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1100
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0011';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageDate.ets");
        let assertRes: Date = new Date(1630273545222);
        let value: Date = new Date(1630316745222);
        let num: Int32Array = new Int32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          expect((e.data).toUTCString()).assertEqual(assertRes.toUTCString());
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1200
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0012';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let assertRes: String = '11';
        let value: String = '1';
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(assertRes);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1300
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0013';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageRegExp.ets');
        let assertRes: RegExp = /b/;
        let value: RegExp = /a/;
        let num: Float32Array = new Float32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).source).assertEqual(assertRes.source);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1400
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0014';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageArray.ets');
        let assertRes: number[] = [1, 2, 3];
        let value: number[] = [1, 2];
        let num: Float64Array = new Float64Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).toString()).assertEqual(assertRes.toString());
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1500
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0015';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageMap.ets');
        let value: Map<string, number> = new Map();
        value.set('a', 1)
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).get('b')).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1600
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0016';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageSet.ets');
        let value: Set<string> = new Set();
        value.add('a');
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).has('b')).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1700
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0017';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageObj.ets');
        let value: Obj = {
          x: 1
        };
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).x).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0018
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1800
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0018';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageObj.ets');
        let value: Object = new Object({
          "x": 1
        });
        let num: Int32Array = new Int32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data).x).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0019
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_1900
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0019';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageArrayBuffer.ets');
        let value: ArrayBuffer = new ArrayBuffer(16);
        let num: Float64Array = new Float64Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ArrayBuffer).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0020
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2000
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0020';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageInt8Array.ets');
        let value: Int8Array = new Int8Array(8);
        let num: Float32Array = new Float32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Int8Array).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0021
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2100
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0021';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageUint8Array.ets');
        let value: Uint8Array = new Uint8Array(8);
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Uint8Array).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0022
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2200
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0022';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageUint8ClampedArray.ets');
        let value: Uint8ClampedArray = new Uint8ClampedArray(8);
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Uint8ClampedArray).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0023
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2300
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0023';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageInt16Array.ets');
        let value: Int16Array = new Int16Array(8);
        let num: Int8Array = new Int8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Int16Array).byteLength).assertEqual(4);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0024
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2400
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0024';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageUint16Array.ets');
        let value: Uint16Array = new Uint16Array(8);
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Uint16Array).byteLength).assertEqual(4);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0025
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2500
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0025';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageInt32Array.ets');
        let value: Int32Array = new Int32Array(8);
        let num: Float64Array = new Float64Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Int32Array).byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0026
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2600
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0026';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let value: Function = () => 1;
        let num: Int8Array = new Int8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0027
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2700
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0027';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageUint32Array.ets');
        let value: Uint32Array = new Uint32Array(8);
        let num: Float32Array = new Float32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Uint32Array).byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0028
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2800
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0028';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let value: TestClass = new TestClass();
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(value.getA, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0029
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_2900
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0029';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let value: TestClass = new TestClass();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value.a, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0030
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3000
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0030';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessage(TestClass.getB, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0031
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3100
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0031';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFloat32Array.ets');
        let value: Float32Array = new Float32Array(8);
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Float32Array).byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0032
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3200
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0032';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFloat64Array.ets');
        let value: Float64Array = new Float64Array(8);
        let num: Int32Array = new Int32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Float64Array).byteLength).assertEqual(16);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0033
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3300
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0033';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessage(TestClass.b, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0034
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3400
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0034';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageConcatArray.ets");
        let value: collections.ConcatArray<string> = new collections.Array<string>('a', 'b');
        let num: Int32Array = new Int32Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as collections.ConcatArray<string>).length).assertEqual(1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0035
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3500
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0035';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageCollectionsArray.ets");
        let value: collections.Array<string> = new collections.Array<string>('a', 'b');
        let num: Uint16Array = new Uint16Array();
        ArkTools.forceFullGC();
        workerInstance.postMessage(value, [num.buffer]);
        ArkTools.forceFullGC();
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as collections.Array<string>).pop()).assertEqual('c');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0036
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3600
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0036';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageCollectionsMap.ets");
        let value: collections.Map<string, number> = new collections.Map<string, number>();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as collections.Map<string, number>).get('key')).assertEqual(1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0037
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_3700
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0037';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageCollectionsSet.ets");
        let value: collections.Set<string> = new collections.Set<string>();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as collections.Set<string>).has('key')).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0040
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4000
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0040';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/postMessage/WorkerPostMessageAson.ets");
        let jsonText = '{"name": "John", "age": 30, "city": "ChangKing"}';
        let value: lang.ISendable = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = ArkTSUtils.ASON.parse(e.data as string) as lang.ISendable;
          expect((res as object)['name']).assertEqual('John');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0041
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4100
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0041';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(value.a, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0042
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4200
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0042';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(testSendableFunction, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0043
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4300
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0043';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(value.getA, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0044
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4400
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0044';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageSendableClass.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as TestSendableClass).a).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0046
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4600
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0046';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessage(TestSendableClass.b, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0047
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4700
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0047';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageFunction.ets');
        let num: Int16Array = new Int16Array();
        workerInstance.postMessage(TestSendableClass.getB, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0048
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4800
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0048';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageImplSendableClass');
        let value: ImplISendableClass = new ImplISendableClass();
        let num: Int8Array = new Int8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ImplISendableClass).count).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0049
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_4900
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0049';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessage.ets');
        let value: testUnionType = 1;
        let num: Int8Array = new Int8Array();
        workerInstance.postMessage(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data as testUnionType).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessage0050
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_5000
     * @tc.desc   Test the function of the interface PostMessage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessage0050';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/postMessage/WorkerPostMessageArrayBuffer.ets');
        let value: ArrayBuffer = new ArrayBuffer(16);
        workerInstance.postMessage(value, [value]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          try {
            const length = value.byteLength;
            expect().assertFail();
          } catch (error) {
            console.error(`${caseName} transfer catch error: ${error}`);
            expect(error instanceof TypeError).assertTrue();
          }
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ArrayBuffer).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0100
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = [];
        workerInstance.postMessageWithSharedSendable(message, transfer);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0200
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0002';
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = null;
        try {
          workerInstance.postMessageWithSharedSendable(message, transfer);
          workerInstance.onmessage = (e) => {
            console.log(`${caseName} main result: ` + JSON.stringify(e));
          }
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName} catch error: ${error.message}`);
          workerInstance.terminate();
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0300
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0003';
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        const message = 'message';
        const transfer = undefined;
        try {
          workerInstance.postMessageWithSharedSendable(message, transfer);
          workerInstance.onmessage = (e) => {
            console.log(`${caseName} main result: ` + JSON.stringify(e));
          }
          expect().assertFail();
        } catch (error) {
          console.error(`${caseName} catch error: ${error.message}`);
          workerInstance.terminate();
          expect(error.code).assertEqual(401);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0400
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0004';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let buffer = new ArrayBuffer(8);
        let view1 = new Uint8Array(buffer);
        view1[0] = 2;
        let view2 = new Int32Array(buffer, 0, 2);
        const message = 'message';
        const transfer = [view1.buffer, view2.buffer];
        workerInstance.postMessageWithSharedSendable(message, transfer);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error.message}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0600
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0006';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let value: number = 1;
        let num: Int8Array = new Int8Array(1);
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(value + 1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0700
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0007';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let value: boolean = false;
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(!value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0800
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0008';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let value: undefined = undefined;
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(!value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_0900
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0009';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let value: null = null;
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1000
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0010';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessage.ets");
        let value: bigint = 1n;
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as bigint;
          expect(res).assertEqual(value + value);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testPostMessageWithSharedSendable0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1100
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0011';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageDate.ets");
        let assertRes: Date = new Date(1630273545222);
        let value: Date = new Date(1630316745222);
        let num: Int32Array = new Int32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Date;
          expect(res.toUTCString()).assertEqual(assertRes.toUTCString());
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1200
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0012';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let assertRes: String = '11';
        let value: String = '1';
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as String;
          expect(res).assertEqual(assertRes);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1300
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0013';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageRegExp.ets');
        let assertRes: RegExp = /b/;
        let value: RegExp = /a/;
        let num: Float32Array = new Float32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as RegExp;
          expect(res.source).assertEqual(assertRes.source);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1400
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0014';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageArray.ets');
        let assertRes: number[] = [1, 2, 3];
        let value: number[] = [1, 2];
        let num: Float64Array = new Float64Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as number[];
          expect(res.toString()).assertEqual(assertRes.toString());
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1500
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0015';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageMap.ets');
        let value: Map<string, number> = new Map();
        value.set('a', 1)
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Map<string, number>;
          expect(res.get('b')).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1600
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0016';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageSet.ets');
        let value: Set<string> = new Set();
        value.add('a');
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Set<string>;
          expect(res.has('b')).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1700
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0017';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageObj.ets');
        let value: Obj = {
          x: 1
        };
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Obj;
          expect(res.x).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0018
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1800
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0018';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageObj.ets');
        let value: Object = new Object({
          "x": 1
        });
        let num: Int32Array = new Int32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Obj;
          expect(res.x).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0019
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_1900
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0019';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageArrayBuffer.ets');
        let value: ArrayBuffer = new ArrayBuffer(16);
        let num: Float64Array = new Float64Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        ArkTools.forceFullGC();
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as ArrayBuffer;
          expect(res.byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0020
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2000
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0020';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageInt8Array.ets');
        let value: Int8Array = new Int8Array(8);
        let num: Float32Array = new Float32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Int8Array;
          expect(res.byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0021
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2100
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0021';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageUint8Array.ets');
        let value: Uint8Array = new Uint8Array(8);
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Uint8Array;
          expect(res.byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0022
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2200
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0022';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageUint8ClampedArray.ets');
        let value: Uint8ClampedArray = new Uint8ClampedArray(8);
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Uint8ClampedArray;
          expect(res.byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0023
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2300
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0023';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageInt16Array.ets');
        let value: Int16Array = new Int16Array(8);
        let num: Int8Array = new Int8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Int16Array;
          expect(res.byteLength).assertEqual(4);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0024
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2400
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0024';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageUint16Array.ets');
        let value: Uint16Array = new Uint16Array(8);
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Uint16Array;
          expect(res.byteLength).assertEqual(4);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0025
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2500
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0025';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageInt32Array.ets');
        let value: Int32Array = new Int32Array(8);
        let num: Float64Array = new Float64Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Int32Array;
          expect(res.byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0026
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2600
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0026';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let value: Function = () => 1;
        let num: Int8Array = new Int8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0027
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2700
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0027';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageUint32Array.ets');
        let value: Uint32Array = new Uint32Array(8);
        let num: Float32Array = new Float32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Uint32Array;
          expect(res.byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0028
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2800
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0028';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let value: TestClass = new TestClass();
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(value.getA, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0029
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_2900
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0029';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let value: TestClass = new TestClass();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value.a, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0030
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3000
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0030';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessageWithSharedSendable(TestClass.getB, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
        }
        workerInstance.terminate();
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0031
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3100
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0031';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFloat32Array.ets');
        let value: Float32Array = new Float32Array(8);
        let num: Uint32Array = new Uint32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Float32Array;
          expect(res.byteLength).assertEqual(8);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0032
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3200
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0032';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFloat64Array.ets');
        let value: Float64Array = new Float64Array(8);
        let num: Int32Array = new Int32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as Float64Array;
          expect(res.byteLength).assertEqual(16);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0033
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3300
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0033';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let num: Uint8ClampedArray = new Uint8ClampedArray();
        workerInstance.postMessageWithSharedSendable(TestClass.b, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as number;
          expect(res).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0034
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3400
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0034';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageConcatArray.ets");
        let value: collections.ConcatArray<string> = new collections.Array<string>('a', 'b');
        let num: Int32Array = new Int32Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as collections.ConcatArray<string>;
          expect(res.length).assertEqual(1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0035
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3500
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0035';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageCollectionsArray.ets");
        let value: collections.Array<string> = new collections.Array<string>('a', 'b');
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as collections.Array<string>;
          expect(res.pop()).assertEqual('c');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0036
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3600
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0036';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageCollectionsMap.ets");
        let value: collections.Map<string, number> = new collections.Map<string, number>();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as collections.Map<string, number>;
          expect(res.get('key')).assertEqual(1);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0037
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3700
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0037';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageCollectionsSet.ets");
        let value: collections.Set<string> = new collections.Set<string>();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as collections.Set<string>;
          expect(res.has('key')).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0038
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3800
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0038';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageCollectionsBitVector.ets");
        let value: collections.BitVector = new collections.BitVector(8);
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = e.data as collections.BitVector;
          expect(res.length).assertEqual(9);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0039
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_3900
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0039';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageAsyncLock.ets");
        let value: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(caseName);
        let num: Uint16Array = new Uint16Array();
        ArkTools.forceFullGC();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ArkTSUtils.locks.AsyncLock).name).assertEqual(caseName);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0040
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4000
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0040';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/sharedSendable/WorkerPostMessageAson.ets");
        let jsonText = '{"name": "John", "age": 30, "city": "ChangKing"}';
        let value: lang.ISendable = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          let res = ArkTSUtils.ASON.parse(e.data as string) as lang.ISendable;
          expect((res as object)['name']).assertEqual('John');
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0041
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4100
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0041';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(value.a, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0042
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4200
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0042';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(testSendableFunction, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0043
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4300
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0043';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(value.getA, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0044
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4400
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0044';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageSendableClass.ets');
        let value: TestSendableClass = new TestSendableClass();
        let num: Uint8Array = new Uint8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as TestSendableClass).a).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0046
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4600
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0046';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let num: Uint16Array = new Uint16Array();
        workerInstance.postMessageWithSharedSendable(TestSendableClass.b, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0047
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4700
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0047';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageFunction.ets');
        let num: Int16Array = new Int16Array();
        workerInstance.postMessageWithSharedSendable(TestSendableClass.getB, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as Function)()).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0048
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4800
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0048';
      try {
        let state: boolean = false;
        const workerInstance =
          new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageImplSendableClass.ets');
        let value: ImplISendableClass = new ImplISendableClass();
        let num: Int8Array = new Int8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ImplISendableClass).count).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testPostMessageWithSharedSendable0049
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_4900
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0049';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessage.ets');
        let value: testUnionType = 1;
        let num: Int8Array = new Int8Array();
        workerInstance.postMessageWithSharedSendable(value, [num.buffer]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testPostMessageWithSharedSendable0050
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_POST_MESSAGE_WITH_SHARED_SENDABLE_5000
     * @tc.desc   Test the function of the interface PostMessageWithSharedSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageWithSharedSendable0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testPostMessageWithSharedSendable0050';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/sharedSendable/WorkerPostMessageArrayBuffer.ets');
        let value: ArrayBuffer = new ArrayBuffer(16);
        workerInstance.postMessageWithSharedSendable(value, [value]);
        workerInstance.onmessage = (e) => {
          ArkTools.forceFullGC();
          try {
            const length = value.byteLength;
            expect().assertFail();
          } catch (error) {
            console.error(`${caseName} transfer catch error: ${error}`);
            expect(error instanceof TypeError).assertTrue();
          }
          console.log(`${caseName} main onmessage result: ` + JSON.stringify(e));
          expect((e.data as ArrayBuffer).byteLength).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testOn0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0100
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0001'
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on('alert', (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0200
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0002'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('on', (e) => {
          console.log(`${caseName} on listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "on", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0300
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0003'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('once', (e) => {
          console.log(`${caseName} once listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "once", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0400
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0004'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('off', (e) => {
          console.log(`${caseName} off listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "off", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0500
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0005'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('terminate', (e) => {
          console.log(`${caseName} terminate listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "terminate", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0600
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0006'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('exit', (e) => {
          console.log(`${caseName} exit listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "exit", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0700
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0007'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('message', (e) => {
          console.log(`${caseName} message listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "message", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   testOn0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0800
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0008'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('messageerror', (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "messageerror", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_0900
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0009'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('error', (e) => {
          console.log(`${caseName} error listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "error", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1000
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0010'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('addEventListener', (e) => {
          console.log(`${caseName} addEventListener listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "addEventListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1100
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0011'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('removeEventListener', (e) => {
          console.log(`${caseName} removeEventListener listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeEventListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1200
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0012'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('dispatchEvent', (e) => {
          console.log(`${caseName} dispatchEvent listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "dispatchEvent", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1300
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0013'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('removeAllListener', (e) => {
          console.log(`${caseName} removeAllListener listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeAllListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1400
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0014'
      try {
        let results = 0;
        let assertResults = 3;
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        workerInstance.on('postMessage', (e) => {
          console.log(`${caseName} postMessage listener callback, e: ${e}`)
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "postMessage", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOn0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ON_1500
     * @tc.desc   Test the function of the interface ThreadWorker.on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOn0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOn0015'
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOnce0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0100
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0001';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert",
            timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    }); /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0200
     * @tc.name      : testOnce0002
     * @tc.desc      : Add an event listener to the Worker. The event listener is executed only once and is
     *                 automatically deleted
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    /**
     * @tc.name   testOnce0002
     * @tc.number testOnce0002
     * @tc.desc   testOnce0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0002';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0300
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0003';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("on", (e) => {
          console.log(`${caseName} on listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "on", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0400
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0004';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("once", (e) => {
          console.log(`${caseName} once listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "once", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0500
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0005';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("off", (e) => {
          console.log(`${caseName} off listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "off", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0600
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0006';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("terminate", (e) => {
          console.log(`${caseName} terminate listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "terminate", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testOnce0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0700
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0007';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("exit", (e) => {
          console.log(`${caseName} exit listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "exit", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0800
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0008';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("message", (e) => {
          console.log(`${caseName} message listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "message", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_0900
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0009';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("messageerror", (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "messageerror", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testOnce0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1000
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0010';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("error", (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "error", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      ;
      done()
    });
    /**
     * @tc.name   testOnce0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1100
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0011';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("addEventListener", (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "addEventListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testOnce0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1200
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0012';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("removeEventListener", (e) => {
          console.log(`${caseName} removeEventListener listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeEventListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testOnce0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1300
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0013';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("dispatchEvent", (e) => {
          console.log(`${caseName} dispatchEvent listener callback, e: ${e}`);
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "dispatchEvent", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testOnce0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1400
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0014';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("removeAlListener", (e) => {
          console.log(`${caseName} removeAlListener listener callback, e: ${e}`)
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeAlListener", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testOnce0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_ONCE_1500
     * @tc.desc   Add an event listener to the Worker. The event listener is executed only once and is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnce0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnce0015';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("postMessage", (e) => {
          console.log(`${caseName} postMessage listener callback, e: ${e}`)
          results++;
        });
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "postMessage", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testOff0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0001
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0001';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("alert");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testOff0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0002
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0002';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("alert");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0003
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0003';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("on", (e) => {
          console.log(`${caseName} on listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("on");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "on", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0004
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0004';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("once", (e) => {
          console.log(`${caseName} once listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("once");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "once", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0005
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0005';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("off", (e) => {
          console.log(`${caseName} off listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("off");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "off", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0006
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0006';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("terminate", (e) => {
          console.log(`${caseName} terminate listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("terminate");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "terminate", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0007
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0007';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("exit", (e) => {
          console.log(`${caseName} exit listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("exit");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "exit", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0008
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0008';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("message", (e) => {
          console.log(`${caseName} message listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("message");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "message", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0009
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0009';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("messageerror", (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("messageerror");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "messageerror", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0010
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0010';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("error", (e) => {
          console.log(`${caseName} error listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("error");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "error", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0011
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0011';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("addEventListener", (e) => {
          console.log(`${caseName} addEventListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("addEventListener");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "addEventListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0012
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0012';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("removeEventListener", (e) => {
          console.log(`${caseName} removeEventListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("removeEventListener");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeEventListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0013
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0013';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("dispatchEvent", (e) => {
          console.log(`${caseName} dispatchEvent listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("dispatchEvent");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "dispatchEvent", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0014
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0014';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("removeAllListener", (e) => {
          console.log(`${caseName} removeAllListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("removeAllListener");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeAllListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0015
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0015';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("postMessage", (e) => {
          console.log(`${caseName} postMessage listener callback, e: ${e}`)
          results++;
        })
        await Sleep(50);
        workerInstance.off("postMessage");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "postMessage", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0016
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0016';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("alert");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOff0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_OFF_0017
     * @tc.desc   Test the function of the interface off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOff0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testOff0017';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.addEventListener("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.off("alert");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0100
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        workerInstance.registerGlobalCallObject("", registerObj);
        let message = new TestCallObject("", "func1", 200);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0200
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0002';
      let workerInstance: worker.ThreadWorker | undefined;
      try {
        workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        workerInstance.registerGlobalCallObject(undefined, registerObj);
        let message = new TestCallObject(null, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
        }
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        if (workerInstance) {
          workerInstance.terminate();
        }
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0300
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0003';
      let workerInstance: worker.ThreadWorker | undefined;
      try {
        workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        workerInstance.registerGlobalCallObject(null, registerObj);
        let message = new TestCallObject(undefined, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
        }
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        if (workerInstance) {
          workerInstance.terminate();
        }
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0400
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0004';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        workerInstance.registerGlobalCallObject("obj", registerObj);
        let message = new TestCallObject("obj1", "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0500
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0005';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        workerInstance.registerGlobalCallObject("obj", registerObj);
        let message = new TestCallObject("obj2", "func2", 5000, "string");
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0600
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0006';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj: TestObj = new Object({
          func1: () => "func1",
          func2: (str?: string) => "func2",
          getMessageWithInput: (str: string) => str,
        }) as TestObj;
        workerInstance.registerGlobalCallObject("obj", registerObj);
        let message = new TestCallObject("obj2", "func2", 0, "string");
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRegisterGlobalCallObject0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0700
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterGlobalCallObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRegisterGlobalCallObject0007';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new collections.Array<string>('a', 'b');
        workerInstance.registerGlobalCallObject("obj", registerObj);
        let message = new TestCallObject("obj2", "func2", 5001, "string");
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0800
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = "";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_0900
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0002';
      let workerInstance: worker.ThreadWorker | undefined;
      try {
        workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = undefined;
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
        }
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        if (workerInstance) {
          workerInstance.terminate();
        }
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1000
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0003';
      let workerInstance: worker.ThreadWorker | undefined;
      try {
        workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = null;
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
        }
        expect().assertFail();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        if (workerInstance) {
          workerInstance.terminate();
        }
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1100
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0004';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1200
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0005';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestSendableObj();
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1300
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0006';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new Object({
          func1: () => "func1",
          func2: (str?: string) => "func2",
          getMessageWithInput: (str: string) => str,
        }) as TestObj;
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1400
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0007';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new collections.Array<string>('a', 'b');
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(instanceName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1500
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0008';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject();
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertFalse();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testUnRegisterGlobalCallObject0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_CALL_OBJECT_1600
     * @tc.desc   Test the callGlobalCallObjectMethod interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnRegisterGlobalCallObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testUnRegisterGlobalCallObject0009';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerGlobalCallObject.ets");
        let registerObj = new TestObj();
        const instanceName = "obj";
        workerInstance.registerGlobalCallObject(instanceName, registerObj);
        await Sleep(50);
        workerInstance.unregisterGlobalCallObject(caseName);
        await Sleep(50);
        let message = new TestCallObject(instanceName, "func1", 1);
        workerInstance.postMessage(message);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage result:` + JSON.stringify(e));
          expect(e.data).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testTerminate0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_TERMINATE_0001
     * @tc.desc   Test the terminate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTerminate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTerminate0001';
      let res = true;
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker.ets");
        workerInstance.terminate();
        console.log(`${caseName} succeeded in terminating the worker.`);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        res = false;
      }
      expect(res).assertTrue();
      done()
    });

    /**
     * @tc.name   testTerminate0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_TERMINATE_0002
     * @tc.desc   Test the terminate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTerminate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTerminate0002';
      let res = true;
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker.ets");
        workerInstance.postMessage('hello');
        workerInstance.terminate();
        console.log(`${caseName} succeeded in terminating the worker.`);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        res = false;
      }
      expect(res).assertTrue();
      done()
    });

    /**
     * @tc.name   testTerminate0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_TERMINATE_0003
     * @tc.desc   Test the terminate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTerminate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTerminate0003';
      let res = true;
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker.ets");
        workerInstance.postMessageWithSharedSendable('hello');
        workerInstance.terminate();
        console.log(`${caseName} succeeded in terminating the worker.`);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        res = false;
      }
      expect(res).assertTrue();
      done()
    });

    /**
     * @tc.name   testOnexit0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_ONEXIT_0001
     * @tc.desc   Test the onexit interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnexit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnexit0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/Worker.ets");
        workerInstance.onexit = (code) => {
          console.log(`${caseName} onexit with code: ${code}`);
          expect(code).assertEqual(0);
          state = true;
        }
        workerInstance.terminate();
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOnexit0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_ONEXIT_0002
     * @tc.desc   Test the onexit interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnexit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnexit0002';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerClose.ets");
        workerInstance.onexit = (code) => {
          console.log(`${caseName} onexit with code: ${code}`);
          expect(code).assertEqual(0);
          state = true;
        }
        workerInstance.postMessage('hello');
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testOnerror0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_ONERROR_0001
     * @tc.desc   Test the onexit interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnerror0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testOnerror0001';
      let state: boolean = false;
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/WorkerError.ets");
        workerInstance.onerror = (err: ErrorEvent) => {
          console.error(`${caseName} onerror: ${JSON.stringify(err)}`);
          expect(err.message ? true : false).assertTrue();
          expect(err.filename ? true : false).assertTrue();
          expect(err.lineno ? true : false).assertTrue();
          expect(err.colno ? true : false).assertTrue();
          expect(err.error ? true : false).assertTrue();
          workerInstance.terminate();
        }
        workerInstance.postMessage('onerror');
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testAddEventListener0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_ADD_EVENT_LISTENER_0001
     * @tc.desc   Test the addEventListener interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEventListener0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testAddEventListener0001';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.addEventListener('alert', (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testAddEventListener0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_ADD_EVENT_LISTENER_0002
     * @tc.desc   Test the addEventListener interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEventListener0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testAddEventListener0002';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.addEventListener("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        await Sleep(100);
        workerInstance.terminate();
        expect(results).assertEqual(assertResults);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveEventListener0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORK_REMOVE_EVENT_LISTENER_0001
     * @tc.desc   Test the removeEventListener interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEventListener0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testRemoveEventListener0001';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.addEventListener("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeEventListener("alert");
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0001
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0001';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("alert", async (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testRemoveAllListener0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0002
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0002';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0003
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0003';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("on", (e) => {
          console.log(`${caseName} on listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "on", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0004
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0004';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("once", (e) => {
          console.log(`${caseName} once listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "once", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0005
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0005';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("off", (e) => {
          console.log(`${caseName} off listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "off", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0006
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0006';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("terminate", (e) => {
          console.log(`${caseName} terminate listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "terminate", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0007
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0007';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("exit", (e) => {
          console.log(`${caseName} exit listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "exit", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0008
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0008';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("message", (e) => {
          console.log(`${caseName} message listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "message", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0009
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0009';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("messageerror", (e) => {
          console.log(`${caseName} messageerror listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "messageerror", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0010
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0010';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("error", (e) => {
          console.log(`${caseName} error listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "error", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0011
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0011';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("addEventListener", (e) => {
          console.log(`${caseName} addEventListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "addEventListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0012
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0012';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("removeEventListener", (e) => {
          console.log(`${caseName} removeEventListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeEventListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0013
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0013';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("dispatchEvent", (e) => {
          console.log(`${caseName} dispatchEvent listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "dispatchEvent", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0014
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0014';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("removeAllListener", (e) => {
          console.log(`${caseName} removeAllListener listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "removeAllListener", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0015
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0015';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.on("postMessage", (e) => {
          console.log(`${caseName} postMessage listener callback, e: ${e}`)
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "postMessage", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0016
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0016';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.once("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testRemoveAllListener0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_REMOVE_ALL_LISTENER_0017
     * @tc.desc   Test the function of the interface removeAllListener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAllListener0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testRemoveAllListener0017';
      try {
        const workerInstance = new worker.ThreadWorker('../../workers/Worker.ets');
        let results = 0;
        let assertResults = 3;
        workerInstance.addEventListener("alert", (e) => {
          console.log(`${caseName} alert listener callback, e: ${e}`);
          results++;
        })
        await Sleep(50);
        workerInstance.removeAllListener();
        await Sleep(50);
        for (let i = 0; i < assertResults; i++) {
          workerInstance.dispatchEvent({
            type: "alert", timeStamp: GetTime()
          });
        }
        workerInstance.terminate();
        expect(results).assertEqual(0);
      } catch (e) {
        console.error(`${caseName} failed, error: ${e.code}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testGlobalScope0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_GLOBAL_SCOPE_0001
     * @tc.desc   Test the function of the interface GlobalScope.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testGlobalScope0001';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/WorkerGlobalScope.ets', {
          name: caseName
        });
        const message = 'name';
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(caseName);
          workerInstance.terminate();
        }
        workerInstance.postMessage(message);
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testGlobalScope0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_GLOBAL_SCOPE_0002
     * @tc.desc   Test the function of the interface GlobalScope.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobalScope0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testGlobalScope0002';
      try {
        let state: boolean = false;
        const workerInstance = new worker.ThreadWorker('../../workers/WorkerGlobalScope.ets', {
          name: caseName
        });
        const message = 'selfName';
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(caseName);
          workerInstance.terminate();
        }
        workerInstance.postMessage(message);
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testComposite0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_COMPOSITE_0001
     * @tc.desc   Worker Combination Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComposite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testComposite0001';
      try {
        let state: boolean = false;
        let workerInstance = new worker.ThreadWorker('../../workers/CompositeWorker.ets');
        workerInstance.onmessage = async (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2);
          workerInstance.terminate();
        }
        workerInstance.postMessage(caseName);
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   testComposite0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_COMPOSITE_0002
     * @tc.desc   Worker Combination Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComposite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testComposite0002';
      try {
        let state: boolean = false;
        let workerInstance = new worker.ThreadWorker('../../workers/CompositeWorker.ets');
        workerInstance.onmessage = async (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(3);
          workerInstance.terminate();
        }
        workerInstance.postMessage(caseName);
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await Sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    });
  })
}