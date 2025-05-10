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
import {
  ArkTSUtils,
  collections,
  ErrorEvent,
  JSON,
  lang,
  MessageEvents,
  taskpool,
  worker,
  ThreadWorkerPriority
} from '@kit.ArkTS';
import { GetTime, Sleep } from '../utils/utils';

declare class ArkTools {
  static forceFullGC(): void;
}

@Concurrent
export function printNum(args: number): number {
  console.info('printNum: ' + args);
  return args;
}

@Sendable
export class SendableObject {
  a: number = 45;
}

class TestObj {
  private message: string = "this is a message from TestObj"

  public getMessage(): string {
    return this.message;
  }

  public getMessageWithInput(str: string): string {
    return this.message + " with input: " + str;
  }
}

class TestObjAsync {
  private message: string = "this is worker"

  public async getMessage(): Promise<string> {
    return this.message;
  }

  public getMessageWithInput(str: string): string {
    return this.message + " with input: " + str;
  }
}

class TestObjTime {
  private message: string = "this is worker"

  public getMessage(): string {
    let start: number = new Date().getTime();
    while (new Date().getTime() - start < 1000) {
      continue;
    }
    return this.message;
  }

  public getMessageWithInput(str: string): string {
    return this.message + " with input: " + str;
  }
}

@Sendable
export function undefinedReturn(): undefined {
  return undefined
}

export default function workerErrorCodeTest() {
  describe('workerErrorCodeTest', () => {
    afterEach(async () => {
      await Sleep(50);
    })
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0100
     * @tc.name       : testThreadWorkerErrorCode0001
     * @tc.desc       : WorkerEventListener Constructor 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0001";
      let num = 0;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.addEventListener("workerInstance_addEventListener", () => {
              console.log('workerInstance_addEventListener listener callback');
            })
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            num++;
            expect(err.code).assertEqual(10200004)
          }
        })
      }
      while (num < 1) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0300
     * @tc.name       : testThreadWorkerErrorCode0003
     * @tc.desc       : WorkerEventTarget9+ addEventListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0003";
      let num = 0;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.addEventListener("workerInstance_addEventListener", () => {
              console.log('workerInstance_addEventListener callback');
            })
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            num++;
            expect(err.code).assertEqual(10200004)
          }
        })
      }
      while (num < 1) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0500
     * @tc.name       : testThreadWorkerErrorCode0005
     * @tc.desc       : WorkerEventTarget9+ dispatchEvent9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0005";
      let num = 0;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.dispatchEvent({
              type: "eventType", timeStamp: 0
            });
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            num++;
            expect(err.code).assertEqual(10200004)
          }
        })
      }
      while (num < 1) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0600
     * @tc.name       : testThreadWorkerErrorCode0006
     * @tc.desc       : WorkerEventTarget9+ removeEventListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0006";
      let num = 0;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.addEventListener("workerInstance_addEventListener", () => {
        console.log('workerInstance_addEventListener callback');
      })
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.removeEventListener("workerInstance_addEventListener");
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            num++;
            expect(err.code).assertEqual(10200004)
          }
        })
      }
      while (num < 1) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0700
     * @tc.name       : testThreadWorkerErrorCode0007
     * @tc.desc       : WorkerEventTarget9+ removeAllListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0007";
      let num = 0;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.addEventListener("workerInstance_addEventListener", () => {
        console.log('workerInstance_addEventListener callback');
      })
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.removeAllListener();
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            num++;
            expect(err.code).assertEqual(10200004)
          }
        })
      }
      while (num < 1) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_0800
     * @tc.name       : testThreadWorkerErrorCode0008
     * @tc.desc       : ThreadWorkerGlobalScope onmessage9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0008";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerOnmessage1", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          console.log(`${caseName} main onmessage code: ` + JSON.stringify(e));
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true;
        }
        while (!bool) {
          await Sleep(200)
          console.log(`${caseName} main while code: ` + JSON.stringify(bool));
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1300
     * @tc.name       : testThreadWorkerErrorCode0013
     * @tc.desc       : ThreadWorkerGlobalScope postMessage9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0013";
      let bool = false
      try {
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage1",
            {
              priority: ThreadWorkerPriority.HIGH
            });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1400
     * @tc.name       : testThreadWorkerErrorCode0014
     * @tc.desc       : ThreadWorkerGlobalScope postMessage9+ 10200006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0014";
      let bool = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage4", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200006)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        bool = true
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1500
     * @tc.name       : testThreadWorkerErrorCode0015
     * @tc.desc       : ThreadWorkerGlobalScope postMessage9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0015";
      let bool = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage3",
          {
            priority: ThreadWorkerPriority.HIGH
          });
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        workerInstance.terminate()
      }
      workerInstance.postMessage(1);
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        bool = true
        try {
          workerInstance.postMessage(10);
        } catch (err) {
          console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
          expect(err.code).assertEqual(10200004)
          done();
        }
      }
      while (!bool) {
        await Sleep(200)
      }
      done();

    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1600
     * @tc.name       : testThreadWorkerErrorCode0016
     * @tc.desc       : ThreadWorkerGlobalScope postMessage9+ 10200006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0016";
      let bool = false
      try {
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage4",
            {
              priority: ThreadWorkerPriority.HIGH
            });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200006)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1700
     * @tc.name       : testThreadWorkerErrorCode0017
     * @tc.desc       : ThreadWorkerGlobalScope postMessageWithSharedSendable12+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0017";
      let bool = false
      try {
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage5",
            {
              priority: ThreadWorkerPriority.HIGH
            });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate()
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1800
     * @tc.name       : testThreadWorkerErrorCode0018
     * @tc.desc       : ThreadWorkerGlobalScope postMessageWithSharedSendable12+ 10200006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0018";
      let bool = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerPostMessage6", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200006)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        bool = true
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1900
     * @tc.name       : testThreadWorkerErrorCode0019
     * @tc.desc       : ThreadWorkerGlobalScope callGlobalCallObjectMethod11+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0019";
      let finish = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerRegister1", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      let registerObj = new TestObj();
      workerInstance.registerGlobalCallObject("myObj", registerObj);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200004)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        finish = true
      }
      while (!finish) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2000
     * @tc.name       : testThreadWorkerErrorCode0020
     * @tc.desc       : ThreadWorkerGlobalScope callGlobalCallObjectMethod11+ 10200006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0020";
      let finish = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerRegister2", {
          priority: ThreadWorkerPriority.HIGH
        });
      let registerObj = new TestObj();
      workerInstance.registerGlobalCallObject("myObj", registerObj);
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200006)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        finish = true
      }
      while (!finish) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2100
     * @tc.name       : testThreadWorkerErrorCode0021
     * @tc.desc       : ThreadWorkerGlobalScope callGlobalCallObjectMethod11+ 10200019
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0021";
      let finish = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerRegister3", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200019)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        finish = true
      }
      while (!finish) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2200
     * @tc.name       : testThreadWorkerErrorCode0022
     * @tc.desc       : ThreadWorkerGlobalScope callGlobalCallObjectMethod11+ 10200020
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0022";
      let finish = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerRegister4", {
          priority: ThreadWorkerPriority.HIGH
        });
      let registerObj = new TestObjAsync();
      workerInstance.registerGlobalCallObject("myObj", registerObj);
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200020)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        finish = true
      }
      while (!finish) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2300
     * @tc.name       : testThreadWorkerErrorCode0023
     * @tc.desc       : ThreadWorkerGlobalScope callGlobalCallObjectMethod11+ 10200021
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0023";
      let finish = false
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerRegister5", {
          priority: ThreadWorkerPriority.HIGH
        });
      let registerObj = new TestObjTime();
      workerInstance.registerGlobalCallObject("myObj", registerObj);
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        console.log(`${caseName} main onmessage: ` + JSON.stringify(e.data));
        expect(e.data).assertEqual(10200021)
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        finish = true
      }
      while (!finish) {
        await Sleep(100)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2500
     * @tc.name       : testThreadWorkerErrorCode0025
     * @tc.desc       : ThreadWorker9+ constructor9+ 10200007
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0025";
      let bool = false;
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/ErrorCode/WorkerData");
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        while (!bool) {
          await Sleep(100)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200007)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2600
     * @tc.name       : testThreadWorkerErrorCode0026
     * @tc.desc       : ThreadWorker9+ onexit9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0026";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.terminate();
            workerInstance.onexit = (code) => {
              console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            }
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2700
     * @tc.name       : testThreadWorkerErrorCode0027
     * @tc.desc       : ThreadWorker9+ onerror9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0027";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerOnmessageError2",
            {
              priority: ThreadWorkerPriority.HIGH
            });
        workerInstance.postMessage(10);
        workerInstance.terminate();
        workerInstance.onmessage = (e) => {
        }
        workerInstance.onerror = (e) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(e));
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.onerror = (e) => {
                console.log(`${caseName} main onexit code: ` + JSON.stringify(e));
              }
              bool = true;
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2800
     * @tc.name       : testThreadWorkerErrorCode0028
     * @tc.desc       : ThreadWorker9+ onAllErrors9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0028";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.onAllErrors = (e: ErrorEvent) => {
              console.log(`${caseName} main onexit code: ` + JSON.stringify(e));
            }
            bool = true;
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(300)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2900
     * @tc.name       : testThreadWorkerErrorCode0029
     * @tc.desc       : ThreadWorker9+ onmessageerror9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0029";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.onmessageerror = (err: MessageEvents) => {
                console.log('onmessageerror');
              }
              bool = true;
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3000
     * @tc.name       : testThreadWorkerErrorCode0030
     * @tc.desc       : ThreadWorker9+ postMessage9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0030";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.postMessage(10);
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3100
     * @tc.name       : testThreadWorkerErrorCode0031
     * @tc.desc       : ThreadWorker9+ postMessage9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0031";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.postMessage(10);
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3200
     * @tc.name       : testThreadWorkerErrorCode0032
     * @tc.desc       : ThreadWorker9+ postMessageWithSharedSendable12+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0032";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.terminate();
      let object: SendableObject = new SendableObject();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.postMessageWithSharedSendable(object);
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3300
     * @tc.name       : testThreadWorkerErrorCode0033
     * @tc.desc       : ThreadWorker9+ postMessageWithSharedSendable12+ 10200006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0033";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        let task: taskpool.Task = new taskpool.Task(printNum, 10)
        workerInstance.postMessageWithSharedSendable(task);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        workerInstance.onerror = (err: ErrorEvent) => {
          console.log(`${caseName} main onerror code: ` + JSON.stringify(err));
        }
        while (!bool) {
          await Sleep(500)
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200006)
        done();
      }
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3400
     * @tc.name       : testThreadWorkerErrorCode0034
     * @tc.desc       : ThreadWorker9+ on9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0034";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.on("workerInstance_on", () => {
                console.log('workerInstance_on callback');
              })
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3600
     * @tc.name       : testThreadWorkerErrorCode0036
     * @tc.desc       : ThreadWorker9+ once9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0036";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.once("workerInstance_once", () => {
                console.log('workerInstance_once callback');
              })
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_3800
     * @tc.name       : testThreadWorkerErrorCode0038 10200004
     * @tc.desc       : ThreadWorker9+ off9+
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0038";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.on("workerInstance_on", () => {
          console.log('workerInstance_on callback');
        })
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.off("workerInstance_on")
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4000
     * @tc.name       : testThreadWorkerErrorCode0040
     * @tc.desc       : ThreadWorker9+ addEventListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0040";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.addEventListener("workerInstance_addEventListener", () => {
                console.log('workerInstance_addEventListener callback');
              })
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4200
     * @tc.name       : testThreadWorkerErrorCode0042
     * @tc.desc       : ThreadWorker9+ dispatchEvent9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0042";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.dispatchEvent({
              type: "eventType", timeStamp: 0
            });
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4300
     * @tc.name       : testThreadWorkerErrorCode0043
     * @tc.desc       : ThreadWorker9+ removeEventListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0043";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      workerInstance.postMessage(10);
      workerInstance.onmessage = (e) => {
        workerInstance.terminate();
      }
      workerInstance.on("workerInstance_on", () => {
        console.log('workerInstance_on callback');
      })
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.removeEventListener("workerInstance_on")
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });

    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4500
     * @tc.name       : testThreadWorkerErrorCode0045
     * @tc.desc       : ThreadWorker9+ registerGlobalCallObject9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0045";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      let registerObj = new TestObj();
      workerInstance.postMessage(10);
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.registerGlobalCallObject("myObj", registerObj);
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004);
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(200)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4600
     * @tc.name       : testThreadWorkerErrorCode0046
     * @tc.desc       : ThreadWorker9+ unregisterGlobalCallObject9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0046";
      let bool = false;
      const workerInstance: worker.ThreadWorker =
        new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
          priority: ThreadWorkerPriority.HIGH
        });
      let registerObj = new TestObj();
      workerInstance.registerGlobalCallObject("myObj", registerObj);
      workerInstance.postMessage(10);
      workerInstance.terminate();
      workerInstance.onmessage = (e) => {
      }
      workerInstance.onexit = (code) => {
        console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
        setTimeout(() => {
          try {
            workerInstance.unregisterGlobalCallObject("myObj");
          } catch (err) {
            console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
            expect(err.code).assertEqual(10200004)
            bool = true;
          }
        })
      }
      while (!bool) {
        await Sleep(500)
      }
      done();
    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_2400
     * @tc.name       : testThreadWorkerErrorCode0024
     * @tc.desc       : ThreadWorker9+ constructor9+ 10200003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0024";
      const workerInstancesONE: worker.ThreadWorker[] = [];
      try {
        for (let i: number = 0; i < 64; i++) {
          workerInstancesONE.push(new worker.ThreadWorker('../../workers/ErrorCode/WorkerData',
            {
              priority: ThreadWorkerPriority.HIGH
            }));
        }
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200003)
      }
      let count = 0
      for (let i: number = 0; i < 64; i++) {
        try {
          let worker: worker.ThreadWorker = workerInstancesONE[i]
          worker.terminate()
          worker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            count++
          }
        } catch (e) {
          console.log(`${caseName} main catch: ` + JSON.stringify(e));
          count++
        }
      }
      while (count < 64) {
        await Sleep(100)
      }
      done();

    });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_4301
     * @tc.name       : testThreadWorkerErrorCode0043_2
     * @tc.desc       : ThreadWorker9+ removeEventListener9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0043_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerErrorCode0043_2";
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerData", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage(10);
        workerInstance.onmessage = (e) => {
          workerInstance.terminate();
        }
        workerInstance.on("workerInstance_on", () => {
          console.log('workerInstance_on callback');
        })
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          setTimeout(() => {
            try {
              workerInstance.removeEventListener("workerInstance_on", () => {
                console.log('workerInstance_on removeEventListener callback');
              })
            } catch (err) {
              console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
              expect(err.code).assertEqual(10200004)
              bool = true;
            }
          })
        }
        while (!bool) {
          await Sleep(200)
        }
        done();
      });
    /**
     * @tc.number     : SUB_RUNTIME_LANGUAGE_BACKEND_WORKER_Error_Code_1000
     * @tc.name       : testThreadWorkerErrorCode0010
     * @tc.desc       : ThreadWorkerGlobalScope onmessageerror9+ 10200004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testThreadWorkerErrorCode0010', 0, async (done: Function) => {
      const caseName = "testThreadWorkerErrorCode0010";
      try {
        let bool = false;
        const workerInstance: worker.ThreadWorker =
          new worker.ThreadWorker("../../workers/ErrorCode/WorkerOnmessageError1", {
            priority: ThreadWorkerPriority.HIGH
          });
        workerInstance.postMessage('aa');
        workerInstance.onmessage = (e) => {
        }
        workerInstance.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          bool = true
        }
        while (!bool) {
          await Sleep(200)
          console.log(`${caseName} main while code: ` + JSON.stringify(bool));
        }
        done();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.code} =>${err.message}`);
        expect(err.code).assertEqual(10200004)
        done();
      }
    });
  })
}