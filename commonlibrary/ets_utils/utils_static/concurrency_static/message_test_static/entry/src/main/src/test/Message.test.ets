/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import Utils from './Util.test';

class MessageObject {
  id: number

  constructor(id: number) {
    this.id = id;
  }
}

export const Sleep = (ms: int) => {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

type CB = () => void;

export default function MessageTest() {
  describe('MessageTest', (): void => {
    afterEach(async () => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0100
     * @tc.name MessageConstructor001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler);
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          expect(message.getWhat()).assertEqual(1);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0101
     * @tc.name MessageConstructor002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg1 = new concurrency.Message(0, handler);
          let msg2 = new concurrency.Message(1, handler);
          let msg3 = new concurrency.Message(-165535, handler);
          let msg4 = new concurrency.Message(-65536, handler);
          let msg5 = new concurrency.Message(Int.MAX_VALUE, handler);
          let msg6 = new concurrency.Message(Int.MIN_VALUE, handler);
          handler.sendMessage(msg1);
          handler.sendMessage(msg2);
          handler.sendMessage(msg3);
          handler.sendMessage(msg4);
          handler.sendMessage(msg5);
          handler.sendMessage(msg6);
          expect(msg1.getWhat()).assertEqual(0);
          expect(msg2.getWhat()).assertEqual(1);
          expect(msg3.getWhat()).assertEqual(-165535);
          expect(msg4.getWhat()).assertEqual(-65536);
          expect(msg5.getWhat()).assertEqual(Int.MAX_VALUE);
          expect(msg6.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0102
     * @tc.name MessageConstructor003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0103
     * @tc.name MessageConstructor004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor004';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(1, handler);
          handler.sendMessage(msg);
          expect(msg.getCallback()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0104
     * @tc.name MessageConstructor005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageConstructor005';
        console.info(`${TAG} test start`);
        let executed = false;
        const worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback()!;
            cb();
            await Sleep(1000);
            flag = true;
          }, worker);
          const msg = new concurrency.Message(() => {
            executed = true;
          }, m);
          msg.sendToTarget();
          await Sleep(200);
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(0);
          expect(msg.getObject()).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0105
     * @tc.name MessageConstructor006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'MessageConstructor006';
        console.info(`${TAG} test start`);
        let executed = false;
        const worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback()!;
            cb();
            await Sleep(1000);
            flag = true;
          }, worker);
          const asyncTask = () => {
            setTimeout(() => {
              executed = true;
            }, 1000);
          };
          const msg = new concurrency.Message(asyncTask, m);
          msg.sendToTarget();
          await Sleep(1100);
          expect(executed).assertTrue();
          expect(msg.getWhat()).assertEqual(0);
          expect(msg.getObject()).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0106
     * @tc.name MessageConstructor007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let callbackExecuted = false;
        let flag: boolean = false;
        worker.start();
        try {
          const m = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const cb = msg.getCallback();
            expect(cb).not().assertNull();
            cb!();
            callbackExecuted = true;
            flag = true;
          }, worker);
          const asyncCallback = () => {
            const end = Date.now() + 1000;
            while (Date.now() < end) {
            }
          };
          const message = new concurrency.Message(asyncCallback, m);
          message.sendToTarget();
          await Sleep(1200);
          expect(callbackExecuted).assertTrue();
          expect(message.getWhat()).assertEqual(0);
          expect(message.getObject()).assertUndefined();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0107
     * @tc.name MessageConstructor008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor008';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(handler);
          message.sendToTarget();
          expect(handler.hasMessages(0)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0108
     * @tc.name MessageConstructor009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor009';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.info('MessageConstructor009--00')
            await Sleep(1000);
            flag = true;
            console.info('MessageConstructor009--01', flag)
          }, worker);
          console.info('MessageConstructor009--0', handler)
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          console.info('MessageConstructor009--1', message.getWhat())
          expect(message.getWhat()).assertEqual(0);
          while (!flag) {
            await Utils.msSleep(100)
            console.info('MessageConstructor009--2', flag)
          }
          ;
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0109
     * @tc.name MessageConstructor010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor010';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          let handler: concurrency.MessageHandler;
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(0, handler);
          handler.sendMessage(message);
          expect(message.getObject()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
          ;
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0110
     * @tc.name MessageConstructor011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageConstructor011';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            await Sleep(1000);
            flag = true;
          }, worker);
          console.info('MessageConstructor011--0', handler)
          let msg = new concurrency.Message(0, handler);
          handler.sendMessage(msg);
          console.info('MessageConstructor011--1', msg.getCallback())
          expect(msg.getCallback()).assertEqual(undefined);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0111
     * @tc.name MessageHandlerConstructor001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandlerConstructor001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start();
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            expect(currentWorkerId).assertEqual(worker.getWorkerId());
          }, worker);
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0112
     * @tc.name MessageHandlerConstructor002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandlerConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandlerConstructor002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let workerId = EAWorker.main()!.getWorkerId()
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            console.log("worker one message");
            let currentWorkerId = EAWorker.current()!.getWorkerId();
            expect(currentWorkerId).assertEqual(workerId);
          }, EAWorker.main());
          let message = new concurrency.Message(1, "handler workerID", handler)
          handler.sendMessage(message);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0113
     * @tc.name HasCallbacks001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks001';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0114
     * @tc.name HasCallbacks002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks002';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.post(p);
          expect(handler.hasCallbacks(q)).assertEqual(false)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0115
     * @tc.name HasCallbacks003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks003';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          expect(handler.hasCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0116
     * @tc.name HasCallbacks004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks003';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0117
     * @tc.name HasCallbacks005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks004';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          handler.sendMessage(message1);
          expect(handler.hasCallbacks(q)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0118
     * @tc.name HasCallbacks006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks005';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0119
     * @tc.name HasCallbacks007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks006';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          message1.sendToTarget();
          expect(handler.hasCallbacks(q)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0120
     * @tc.name HasCallbacks008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasCallbacks008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasCallbacks007';
        console.info(`${TAG} test start`);
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        let p = () => {
          let a = 0;
        }
        let q = () => {
          let a = 0;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message1 = new concurrency.Message(p, handler)
          let message2 = new concurrency.Message(q, handler)
          expect(handler.hasCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0121
     * @tc.name RemoveMessages001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages001';
        console.info(`${TAG} test start`);
        let flag = false;
        let worker = new EAWorker();
        worker.start();
        let handler: concurrency.MessageHandler;
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          await Sleep(1500);
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0122
     * @tc.name RemoveMessages002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages002';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0123
     * @tc.name RemoveMessages003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(2000);
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          worker.join()
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0124
     * @tc.name RemoveMessages004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages004';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0125
     * @tc.name RemoveMessages005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages005';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(2000);
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0126
     * @tc.name RemoveMessages006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages006';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0127
     * @tc.name RemoveMessages007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages007';
        console.info(`${TAG} test start`);
        let messageObject = new MessageObject(10);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(2000);
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1)).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0128
     * @tc.name RemoveMessages008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages008';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          await Sleep(1200);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0129
     * @tc.name RemoveMessages009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages009';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(2000);
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1)).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0130
     * @tc.name RemoveMessages010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages010';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          await Utils.msSleep(1300);
          handler.removeMessages(1);
          expect(handler.removeMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0131
     * @tc.name RemoveMessages011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages011';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          expect(handler.removeMessages(0)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0132
     * @tc.name RemoveMessages012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages012';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0133
     * @tc.name RemoveMessages013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages013';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0134
     * @tc.name RemoveMessages014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages014';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0135
     * @tc.name RemoveMessages015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages015';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0136
     * @tc.name RemoveMessages016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages016';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0137
     * @tc.name RemoveMessages017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages017';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.removeMessages(1, messageObject)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0138
     * @tc.name RemoveMessages018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages018';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(5000);
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          handler.sendMessage(message);
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0139
     * @tc.name RemoveMessages019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages019';
        console.info(`${TAG} test start`);
        let flag = false;
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let messageObject = new MessageObject(10);
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          message.sendToTarget();
          expect(handler.removeMessages(1, messageObject)).assertEqual(true);
          expect(flag).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0140
     * @tc.name RemoveMessages020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveMessages020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'RemoveMessages020';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(5000);
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler);
          message.sendToTarget();
          handler.removeMessages(1, messageObject);
          expect(handler.removeMessages(1, messageObject)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0141
     * @tc.name HasMessages001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages001';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(handler);
          expect(handler.hasMessages(0)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0142
     * @tc.name HasMessages002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages002';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0143
     * @tc.name HasMessages003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages003';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0144
     * @tc.name HasMessages004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages004';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          handler.sendMessage(message);
          expect(handler.hasMessages(1)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0145
     * @tc.name HasMessages005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages005';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0146
     * @tc.name HasMessages006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages006';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0147
     * @tc.name HasMessages007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages007';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0148
     * @tc.name HasMessages008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages008';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(handler.hasMessages(1, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0149
     * @tc.name HasMessages009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages009';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0150
     * @tc.name HasMessages010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages010';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          handler.sendMessage(message);
          expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0151
     * @tc.name HasMessages011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages011';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(0, messageObject)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0152
     * @tc.name HasMessages012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('HasMessages012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'HasMessages012';
        console.info(`${TAG} test start`);
        let handler: concurrency.MessageHandler;
        let messageObject = new MessageObject(10);
        let worker = new EAWorker();
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let message = new concurrency.Message(1, messageObject, handler)
          message.sendToTarget();
          expect(handler.hasMessages(1, messageObject)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0153
     * @tc.name SendToTargetTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendToTargetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0154
     * @tc.name SendToTargetTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendToTargetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest002';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0155
     * @tc.name SendToTargetTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendToTargetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest003';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0156
     * @tc.name SendToTargetTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendToTargetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SendToTargetTest004';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let callback: CB;
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          message.sendToTarget();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0157
     * @tc.name GetWhatTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let message: concurrency.Message = new concurrency.Message(handler);
          handler.sendMessage(message);
          expect(message.getWhat()).assertEqual(0);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          eaw.quit();
          done();
        }
      });
  });
}