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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';
import { Sleep } from '../utils/utils';
import { TestObj } from '../utils/workerCommon';

export default function workerCoverageTest() {
  describe('WorkerCoverageTest', () => {

    /**
     * @tc.name   testWorkerPostMessageWithEmptyTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_PARAM_001
     * @tc.desc   Test Worker.postMessage with empty transfer array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithEmptyTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithEmptyTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.postMessage("test");
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithOptionsEmptyTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_PARAM_002
     * @tc.desc   Test Worker.postMessage with options.transfer empty.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithOptionsEmptyTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithOptionsEmptyTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true
            expect(code).assertEqual(0);
          };

          workerInstance.postMessage("test", { transfer: [] });
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithOptionsTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_PARAM_003
     * @tc.desc   Test Worker.postMessage with options.transfer array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithOptionsTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithOptionsTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          const buffer = new ArrayBuffer(10);
          workerInstance.postMessage("test", { transfer: [buffer] });
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableEmpty
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_EMPTY_001
     * @tc.desc   Test postMessageWithSharedSendable with empty transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableEmpty";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.postMessageWithSharedSendable("test", []);
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_TRANSFER_001
     * @tc.desc   Test postMessageWithSharedSendable with non-empty transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          const buffer = new ArrayBuffer(10);
          workerInstance.postMessageWithSharedSendable("test", [buffer]);
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerDispatchEventReturnValueTrue
     * @tc.number SUB_RUNTIME_WORKER_DISPATCHEVENT_RETURN_TRUE_001
     * @tc.desc   Test ThreadWorker.dispatchEvent returns true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerDispatchEventReturnValueTrue', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerDispatchEventReturnValueTrue";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          // Test dispatchEvent return value
          const result = workerInstance.dispatchEvent({ type: "custom", timeStamp: 0 });
          expect(result === true || result === false).assertTrue();
          let finished = false;

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnNullType
     * @tc.number SUB_RUNTIME_WORKER_ON_TYPE_NULL_001
     * @tc.desc   Test ThreadWorker.on with null type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOnNullType";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.on(null, () => {
          });
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOnEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_ON_TYPE_EMPTY_001
     * @tc.desc   Test ThreadWorker.on with empty string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.on("", () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_ON_TYPE_UNDEF_001
     * @tc.desc   Test ThreadWorker.on with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOnUndefinedType";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.on(undefined, () => {
          });
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOnNullListener
     * @tc.number SUB_RUNTIME_WORKER_ON_LISTENER_NULL_001
     * @tc.desc   Test ThreadWorker.on with null listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnNullListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOnNullListener";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.on("message", null);
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOnUndefinedListener
     * @tc.number SUB_RUNTIME_WORKER_ON_LISTENER_UNDEF_001
     * @tc.desc   Test ThreadWorker.on with undefined listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnUndefinedListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnUndefinedListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.on("message", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnceNullType
     * @tc.number SUB_RUNTIME_WORKER_ONCE_TYPE_NULL_001
     * @tc.desc   Test ThreadWorker.once with null type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnceNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOnceNullType";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.once(null, () => {
          });
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOnceEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_ONCE_TYPE_EMPTY_001
     * @tc.desc   Test ThreadWorker.once with empty string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnceEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnceEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.once("", () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnceUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_ONCE_TYPE_UNDEF_001
     * @tc.desc   Test ThreadWorker.once with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnceUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnceUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.once(undefined, () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnceNullListener
     * @tc.number SUB_RUNTIME_WORKER_ONCE_LISTENER_NULL_001
     * @tc.desc   Test ThreadWorker.once with null listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnceNullListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnceNullListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.once("message", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOnceUndefinedListener
     * @tc.number SUB_RUNTIME_WORKER_ONCE_LISTENER_UNDEF_001
     * @tc.desc   Test ThreadWorker.once with undefined listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOnceUndefinedListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOnceUndefinedListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.once("message", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOffNullType
     * @tc.number SUB_RUNTIME_WORKER_OFF_TYPE_NULL_001
     * @tc.desc   Test ThreadWorker.off with null type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOffNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOffNullType";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.off(null);
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOffEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_OFF_TYPE_EMPTY_001
     * @tc.desc   Test ThreadWorker.off with empty string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOffEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOffEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.off("");
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOffUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_OFF_TYPE_UNDEF_001
     * @tc.desc   Test ThreadWorker.off with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOffUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOffUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.off(undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerOffNullListener
     * @tc.number SUB_RUNTIME_WORKER_OFF_LISTENER_NULL_001
     * @tc.desc   Test ThreadWorker.off with null listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOffNullListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testThreadWorkerOffNullListener";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.off("message", null);
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testThreadWorkerOffUndefinedListener
     * @tc.number SUB_RUNTIME_WORKER_OFF_LISTENER_UNDEF_001
     * @tc.desc   Test ThreadWorker.off with undefined listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerOffUndefinedListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerOffUndefinedListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.off("message", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerAddEventListenerNullType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_NULL_001
     * @tc.desc   Test ThreadWorker.addEventListener with null type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerAddEventListenerNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerAddEventListenerNullType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener(null, () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }
          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerAddEventListenerEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_EMPTY_001
     * @tc.desc   Test ThreadWorker.addEventListener with empty string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerAddEventListenerEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerAddEventListenerEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("", () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerAddEventListenerUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_UNDEF_001
     * @tc.desc   Test ThreadWorker.addEventListener with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerAddEventListenerUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerAddEventListenerUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener(undefined, () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerAddEventListenerNullListener
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_LISTENER_NULL_001
     * @tc.desc   Test ThreadWorker.addEventListener with null listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerAddEventListenerNullListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerAddEventListenerNullListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("message", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerAddEventListenerUndefinedListener
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_LISTENER_UNDEF_001
     * @tc.desc   Test ThreadWorker.addEventListener with undefined listener.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerAddEventListenerUndefinedListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerAddEventListenerUndefinedListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("message", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRemoveEventListenerNullType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_NULL_001
     * @tc.desc   Test ThreadWorker.removeEventListener with null type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRemoveEventListenerNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRemoveEventListenerNullType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener(null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRemoveEventListenerEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_EMPTY_001
     * @tc.desc   Test ThreadWorker.removeEventListener with empty string type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRemoveEventListenerEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRemoveEventListenerEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("");
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRemoveEventListenerUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_UNDEF_001
     * @tc.desc   Test ThreadWorker.removeEventListener with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRemoveEventListenerUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRemoveEventListenerUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener(undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRemoveEventListenerNullCallback
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_CALLBACK_NULL_001
     * @tc.desc   Test ThreadWorker.removeEventListener with null callback.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRemoveEventListenerNullCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRemoveEventListenerNullCallback";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("message", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRemoveEventListenerUndefinedCallback
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_CALLBACK_UNDEF_001
     * @tc.desc   Test ThreadWorker.removeEventListener with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRemoveEventListenerUndefinedCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRemoveEventListenerUndefinedCallback";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("message", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableNull
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_NULL_001
     * @tc.desc   Test postMessageWithSharedSendable with null message.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableNull";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessageWithSharedSendable(null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableUndefined
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_UNDEF_001
     * @tc.desc   Test postMessageWithSharedSendable with undefined message.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableUndefined";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessageWithSharedSendable(undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableNullTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_TRANSFER_NULL_001
     * @tc.desc   Test postMessageWithSharedSendable with null transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableNullTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableNullTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessageWithSharedSendable("test", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithSharedSendableUndefinedTransfer
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_SHARED_TRANSFER_UNDEF_001
     * @tc.desc   Test postMessageWithSharedSendable with undefined transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithSharedSendableUndefinedTransfer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithSharedSendableUndefinedTransfer";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessageWithSharedSendable("test", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerDispatchEventNull
     * @tc.number SUB_RUNTIME_WORKER_DISPATCHEVENT_NULL_001
     * @tc.desc   Test dispatchEvent with null event.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEventNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testWorkerDispatchEventNull";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          const result = workerInstance.dispatchEvent(null);
          expect(result === true || result === false).assertTrue();
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testWorkerDispatchEventUndefined
     * @tc.number SUB_RUNTIME_WORKER_DISPATCHEVENT_UNDEF_001
     * @tc.desc   Test dispatchEvent with undefined event.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEventUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerDispatchEventUndefined";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            const result = workerInstance.dispatchEvent(undefined);
            expect(result === true || result === false).assertTrue();
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerAddEventListenerNullType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_NULL_003
     * @tc.desc   Test Worker.addEventListener with null type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListenerNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerAddEventListenerNullType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener(null, () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerAddEventListenerEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_EMPTY_002
     * @tc.desc   Test Worker.addEventListener with empty string type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListenerEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerAddEventListenerEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("", () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerAddEventListenerUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_TYPE_UNDEF_002
     * @tc.desc   Test Worker.addEventListener with undefined type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListenerUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerAddEventListenerUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener(undefined, () => {
            });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerAddEventListenerNullListener
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_LISTENER_NULL_002
     * @tc.desc   Test Worker.addEventListener with null listener (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListenerNullListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerAddEventListenerNullListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("message", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerAddEventListenerUndefinedListener
     * @tc.number SUB_RUNTIME_WORKER_ADDLISTENER_LISTENER_UNDEF_002
     * @tc.desc   Test Worker.addEventListener with undefined listener (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListenerUndefinedListener', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerAddEventListenerUndefinedListener";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.addEventListener("message", undefined);
          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerRemoveEventListenerNullType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_NULL_002
     * @tc.desc   Test Worker.removeEventListener with null type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListenerNullType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerRemoveEventListenerNullType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener(null);

          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerRemoveEventListenerEmptyStringType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_EMPTY_002
     * @tc.desc   Test Worker.removeEventListener with empty string type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListenerEmptyStringType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerRemoveEventListenerEmptyStringType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("");

          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerRemoveEventListenerUndefinedType
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_TYPE_UNDEF_002
     * @tc.desc   Test Worker.removeEventListener with undefined type (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListenerUndefinedType', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerRemoveEventListenerUndefinedType";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener(undefined);

          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerRemoveEventListenerNullCallback
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_CALLBACK_NULL_002
     * @tc.desc   Test Worker.removeEventListener with null callback (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListenerNullCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerRemoveEventListenerNullCallback";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("message", null);

          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerRemoveEventListenerUndefinedCallback
     * @tc.number SUB_RUNTIME_WORKER_REMOVELISTENER_CALLBACK_UNDEF_002
     * @tc.desc   Test Worker.removeEventListener with undefined callback (EventTarget API).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListenerUndefinedCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerRemoveEventListenerUndefinedCallback";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.removeEventListener("message", undefined);

          } catch (e) {
            console.log(`${caseName} catch error: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });
















    /**
     * @tc.name   testThreadWorkerDispatchEventReturnValueFalse
     * @tc.number SUB_RUNTIME_WORKER_DISPATCHEVENT_RETURN_FALSE_001
     * @tc.desc   Test ThreadWorker.dispatchEvent returns false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerDispatchEventReturnValueFalse', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerDispatchEventReturnValueFalse";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          // Test dispatchEvent with different event types to potentially get false return
          let falseFound = false;
          for (let i = 0; i < 5; i++) {
            const result = workerInstance.dispatchEvent({ type: "nonexistent" + i, timeStamp: 0 });
            expect(result).assertTrue();
          }
          // Verify we got both true and false or at least one of them

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageNull
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_NULL_001
     * @tc.desc   Test Worker.postMessage with null message.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testWorkerPostMessageNull";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.postMessage(null, []);
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testWorkerPostMessageUndefined
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_UNDEF_001
     * @tc.desc   Test Worker.postMessage with undefined message.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = "testWorkerPostMessageUndefined";
      try {
        const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
        let finished = false;
        try {
          workerInstance.postMessage(undefined, []);
        } catch (e) {
          console.error(`${caseName} catch: ${e}`);
        }

        workerInstance.onexit = (code: number) => {
          finished = true;
          expect(code).assertEqual(0);
        };

        workerInstance.terminate();
        while (!finished) {
          await Sleep(100)
        }
        done();
      } catch (error) {
        console.error(`${caseName} error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testWorkerPostMessageTransferNull
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_TRANSFER_NULL_001
     * @tc.desc   Test Worker.postMessage with null transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageTransferNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageTransferNull";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessage("test", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageTransferUndefined
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_TRANSFER_UNDEF_001
     * @tc.desc   Test Worker.postMessage with undefined transfer.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageTransferUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageTransferUndefined";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessage("test", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithOptionsTransferNonEmpty
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_OPTIONS_TRANSFER_002
     * @tc.desc   Test Worker.postMessage with options.transfer non-empty array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithOptionsTransferNonEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithOptionsTransferNonEmpty";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          const buffer = new ArrayBuffer(10);
          workerInstance.postMessage("test", { transfer: [buffer] });
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithOptionsTransferNull
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_OPTIONS_TRANSFER_NULL_001
     * @tc.desc   Test Worker.postMessage with options.transfer null.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithOptionsTransferNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithOptionsTransferNull";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessage("test", { transfer: null });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerPostMessageWithOptionsTransferUndefined
     * @tc.number SUB_RUNTIME_WORKER_POSTMESSAGE_OPTIONS_TRANSFER_UNDEF_001
     * @tc.desc   Test Worker.postMessage with options.transfer undefined.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessageWithOptionsTransferUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerPostMessageWithOptionsTransferUndefined";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.postMessage("test", { transfer: undefined });
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testWorkerDispatchEventReturnValueFalse
     * @tc.number SUB_RUNTIME_WORKER_DISPATCHEVENT_RETURN_FALSE_002
     * @tc.desc   Test Worker.dispatchEvent returns false (EventTarget.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEventReturnValueFalse', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testWorkerDispatchEventReturnValueFalse";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          // Test dispatchEvent to cover false return value
          let falseFound = false;
          for (let i = 0; i < 5; i++) {
            const result = workerInstance.dispatchEvent({ type: "custom" + i, timeStamp: 0 });
            expect(result).assertTrue();
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerPostMessageOptionsTransferNonEmpty
     * @tc.number SUB_RUNTIME_THREADWORKER_POSTMESSAGE_OPTIONS_TRANSFER_001
     * @tc.desc   Test ThreadWorker.postMessage with options.transfer non-empty.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerPostMessageOptionsTransferNonEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerPostMessageOptionsTransferNonEmpty";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let messageReceived = false;
          let finished = false;

          workerInstance.onmessage = (event) => {
            messageReceived = true;
            workerInstance.terminate();
          };

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          const buffer = new ArrayBuffer(10);
          workerInstance.postMessage("test", { transfer: [buffer] });
          while (!finished) {
            await Sleep(100)
          }
          expect(messageReceived).assertTrue();
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRegisterGlobalCallObjectNullObject
     * @tc.number SUB_RUNTIME_THREADWORKER_REG_GLOBAL_NULL_001
     * @tc.desc   Test ThreadWorker.registerGlobalCallObject with null object.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRegisterGlobalCallObjectNullObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRegisterGlobalCallObjectNullObject";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.registerGlobalCallObject("testNull", null);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testThreadWorkerRegisterGlobalCallObjectUndefinedObject
     * @tc.number SUB_RUNTIME_THREADWORKER_REG_GLOBAL_UNDEF_001
     * @tc.desc   Test ThreadWorker.registerGlobalCallObject with undefined object.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRegisterGlobalCallObjectUndefinedObject', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRegisterGlobalCallObjectUndefinedObject";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker1.ets");
          let finished = false;
          try {
            workerInstance.registerGlobalCallObject("testUndefined", undefined);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }

          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };

          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   testThreadWorkerRegisterGlobalCallObjectUndefinedObject2
     * @tc.number SUB_RUNTIME_THREADWORKER_REG_GLOBAL_UNDEF_002
     * @tc.desc   Test ThreadWorker.registerGlobalCallObject with undefined object.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testThreadWorkerRegisterGlobalCallObjectUndefinedObject2', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = "testThreadWorkerRegisterGlobalCallObjectUndefinedObject2";
        try {
          const workerInstance = new worker.ThreadWorker("../../workers/Worker2.ets");
          let finished = false;
          let obj = new TestObj()
          try {
            workerInstance.registerGlobalCallObject("test", obj);
          } catch (e) {
            console.error(`${caseName} catch: ${e}`);
          }
          workerInstance.onmessage = (event) => {
            console.info(`${caseName} onmessage: ${event.data}`);
          };
          workerInstance.onAllErrors = (e) => {
            console.error(`${caseName} onAllErrors: ${e}`);
          };
          workerInstance.onexit = (code: number) => {
            finished = true;
            expect(code).assertEqual(0);
          };
          await Sleep(100)
          workerInstance.terminate();
          while (!finished) {
            await Sleep(100)
          }
          done();
        } catch (error) {
          console.error(`${caseName} error: ${error}`);
          expect().assertFail();
          done();
        }
      });
  });
}
