/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

function TSleep(delay:int):void {
  for(let t = Date.now(); Date.now() - t <= delay;);
}

export const Sleep = (ms: int) => {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

type CB = () => void;

export default function MessageTest2() {
  describe('MessageTest2', (): void => {
    afterEach(async () => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0158
     * @tc.name GetWhatTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest002';
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
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }

          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0159
     * @tc.name GetWhatTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest003';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);

          let message0: concurrency.Message = new concurrency.Message(0, handler);
          handler.sendMessage(message0);
          expect(message0.getWhat()).assertEqual(0);

          let message1: concurrency.Message = new concurrency.Message(1, handler);
          handler.sendMessage(message1);
          expect(message1.getWhat()).assertEqual(1);

          let message_1: concurrency.Message = new concurrency.Message(-1, handler);
          handler.sendMessage(message_1);
          expect(message_1.getWhat()).assertEqual(-1);

          let message65535: concurrency.Message = new concurrency.Message(65535, handler);
          handler.sendMessage(message65535);
          expect(message65535.getWhat()).assertEqual(65535);

          let message_65535: concurrency.Message = new concurrency.Message(-65535, handler);
          handler.sendMessage(message_65535);
          expect(message_65535.getWhat()).assertEqual(-65535);

          let messageMax: concurrency.Message = new concurrency.Message(Int.MAX_VALUE, handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(Int.MAX_VALUE);

          let messageMin: concurrency.Message = new concurrency.Message(Int.MIN_VALUE, handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0160
     * @tc.name GetWhatTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWhatTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWhatTest004';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);

          let message0: concurrency.Message = new concurrency.Message(0, 'obj', handler);
          handler.sendMessage(message0);
          expect(message0.getWhat()).assertEqual(0);

          let message1: concurrency.Message = new concurrency.Message(1, 'obj', handler);
          handler.sendMessage(message1);
          expect(message1.getWhat()).assertEqual(1);

          let message_1: concurrency.Message = new concurrency.Message(-1, 'obj', handler);
          handler.sendMessage(message_1);
          expect(message_1.getWhat()).assertEqual(-1);

          let message65535: concurrency.Message = new concurrency.Message(65535, 'obj', handler);
          handler.sendMessage(message65535);
          expect(message65535.getWhat()).assertEqual(65535);

          let message_65535: concurrency.Message = new concurrency.Message(-65535, 'obj', handler);
          handler.sendMessage(message_65535);
          expect(message_65535.getWhat()).assertEqual(-65535);

          let messageMax: concurrency.Message = new concurrency.Message(Int.MAX_VALUE, 'obj', handler);
          handler.sendMessage(messageMax);
          expect(messageMax.getWhat()).assertEqual(Int.MAX_VALUE);

          let messageMin: concurrency.Message = new concurrency.Message(Int.MIN_VALUE, 'obj', handler);
          handler.sendMessage(messageMin);
          expect(messageMin.getWhat()).assertEqual(Int.MIN_VALUE);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0161
     * @tc.name GetCallbackTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetCallbackTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest001';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0162
     * @tc.name GetCallbackTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetCallbackTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest002';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0163
     * @tc.name GetCallbackTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetCallbackTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest003';
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
          let callback: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback === undefined).assertTrue();
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0164
     * @tc.name GetCallbackTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetCallbackTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetCallbackTest004';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        let flag: boolean = false;
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message: concurrency.Message = new concurrency.Message(callback, handler);
          let callback1: CB | undefined = message.getCallback();
          handler.sendMessage(message);
          expect(callback1).assertEqual(callback);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0165
     * @tc.name GetTargetTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetTargetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest001';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0166
     * @tc.name GetTargetTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetTargetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest002';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0167
     * @tc.name GetTargetTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetTargetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest003';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0168
     * @tc.name GetTargetTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetTargetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetTargetTest004';
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
          let handler1: concurrency.MessageHandler = message.getTarget();
          handler.sendMessage(message);
          expect(handler1).assertEqual(handler);
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0169
     * @tc.name MessageScenarioTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest001';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
            result.push(msg);
          }, eaw);
          let messages: concurrency.Message[] = [];
          let message0 = new concurrency.Message(handler);
          handler.sendMessage(message0);
          messages.push(message0);
          let message1: concurrency.Message = new concurrency.Message(1, handler);
          handler.sendMessage(message1);
          messages.push(message1);
          let message2: concurrency.Message = new concurrency.Message(10, handler);
          handler.sendMessage(message2);
          messages.push(message2);
          let message3: concurrency.Message = new concurrency.Message(-1, handler);
          handler.sendMessage(message3);
          messages.push(message3);
          let message4: concurrency.Message = new concurrency.Message(1, "msg4", handler);
          handler.sendMessage(message4);
          messages.push(message4);
          let callback: CB = () => {
            console.log(`concurrency.Message callback！`);
          };
          let message5 = new concurrency.Message(callback, handler);
          handler.sendMessage(message5);
          messages.push(message5);
          while (true) {
            await Sleep(10);
            if (result.length == 6) {
              break;
            }
          }
          console.info(`resulr length: ${result.length}  ${messages.length}`);
          if (result.length == messages.length) {
            result.forEach((msg, index) => {
              console.error(`equals`);
              expect(msg.equals(messages[index.toInt()])).assertTrue();
            });
          } else {
            expect().assertFail();
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0170
     * @tc.name MessageScenarioTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest002';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let result: concurrency.Message[] = [];
          let i: int = 0;
          let messages: concurrency.Message[] = [];
          let handlers: concurrency.MessageHandler[] = [];
          while (i < 5) {
            handlers.push(new concurrency.MessageHandler((msg: concurrency.Message) => {
              await Sleep(1000);
              result.push(msg)
              flag = true;
            }, eaw));
            messages.push(new concurrency.Message(i, handlers[i]));
            handlers[i].sendMessage(messages[i]);
            i++;
          }
          while (true) {
            await Sleep(10);
            if (result.length == 5) {
              break;
            }
          }
          if (result.length == messages.length) {
            result.forEach((msg, index) => {
              expect(msg.equals(messages[index.toInt()])).assertTrue();
            });
          } else {
            expect().assertFail();
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0171
     * @tc.name MessageScenarioTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest003';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let workNum: int = 0;
        let works: EAWorker[] = [];
        try {
          let lock = new AsyncLock();
          let result: concurrency.Message[] = [];
          let handlerNum: int = 0;
          let messageNum: int = 0;
          while (workNum < 3) {
            works.push(new EAWorker());
            works[workNum].start();
            while (handlerNum < 2) {
              let handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
                await lock.lockAsync(() => {
                  result.push(msg);
                  console.info(`push msg`);
                })
                await Sleep(1000);
                flag = true;
              }, works[workNum]);
              while (messageNum < 5) {
                let message = new concurrency.Message(messageNum, handler);
                handler.sendMessage(message);
                messageNum++;
              }
              messageNum = 0;
              handlerNum++;
            }
            handlerNum = 0;
            workNum++;
          }
          while (true) {
            await Sleep(10);
            console.info(`result.length ${result.length}`);
            if (result.length == 30) {
              break;
            }
          }
          expect(result.length == 30).assertTrue();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          while (workNum > 0) {
            try {
              works[--workNum].quit();
            } catch (error) {
              console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            }
          }
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0172
     * @tc.name MessageScenarioTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest004';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        try {
          let eaw = new EAWorker();
          eaw.start();
          let result: concurrency.Message[] = [];
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            TSleep(1000);
            result.push(msg);
            console.info(`push msg`);
            flag = true;
          }, eaw);

          setTimeout(() => {
            console.info(`quit!`);
            eaw.quit();
          }, 2000);

          let message = new concurrency.Message(handler);
          let i: int = 5;
          while (i > 0) {
            handler.sendMessage(message);
            i--;
          }

          while (true) {
            await Sleep(200);
            console.info(`sleep 200 ${result.length}  ${eaw.isAlive()}`);
            if (result.length == 2 && !eaw.isAlive()) {
              break;
            }
          }
          expect(result.length == 2).assertTrue();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0173
     * @tc.name MessageScenarioTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageScenarioTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioTest005';
        let flag: boolean = false;
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, eaw);
          let messageObj = new concurrency.Message(1, "messageObj", handler);
          let message1 = new concurrency.Message(1, handler);
          handler.sendMessage(messageObj);
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.removeMessages(1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          handler.sendMessage(message1);
          expect(handler.hasMessages(1)).assertTrue();
          expect(handler.hasMessages(0)).assertFalse();
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0174
     * @tc.name GetWorkerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWorkerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWorkerTest001';
        console.info(`${TAG} test start`);
        let eaw = new EAWorker();
        try {
          eaw.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw);
          expect(handler.getWorker()).assertEqual(eaw);
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0175
     * @tc.name GetWorkerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetWorkerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetWorkerTest002';
        console.info(`${TAG} test start`);
        let eaw1 = new EAWorker();
        let eaw2 = new EAWorker();
        try {
          eaw1.start();
          eaw2.start();
          let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, eaw1);
          expect(handler.getWorker() != eaw2).assertTrue();
        } catch (error) {
          console.error(`error.message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`)
          try {
            eaw1.quit();
            eaw2.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0176
     * @tc.name SendEmptyMessageTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendEmptyMessageTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendEmptyMessageTest001';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler(() => {
            await Sleep(1000)
            doneFlag = true;
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} Messages in queue: ${handler.hasMessages(1)}`);
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          expect(handler.hasMessages(1)).assertTrue();
          while (!doneFlag) {
            await Utils.msSleep(100)
          }
          console.info(`${TAG} Messages in queue 2: ${handler.hasMessages(1)}`);
          expect(doneFlag).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0177
     * @tc.name SendEmptyMessageTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendEmptyMessageTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendEmptyMessageTest002';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          let receivedWhat = -1;
          const handler = new concurrency.MessageHandler((msg) => {
            receivedWhat = msg.getWhat();
            await Sleep(1000)
            doneFlag = true;
          }, worker);
          const ok = handler.sendEmptyMessage(1);
          console.info(`${TAG} sendEmptyMessage(1) returned: ${ok}`);
          expect(ok).assertTrue();
          console.info(`${TAG} doneFlag: ${doneFlag}`);
          while (!doneFlag) {
            await Utils.msSleep(100)
          }
          console.info(`${TAG} receivedWhat: ${receivedWhat}`);
          expect(doneFlag).assertTrue();
          expect(receivedWhat).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0178
     * @tc.name SendMessageTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest001';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(h2);
          const sendOk = h1.sendMessage(msg);
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0179
     * @tc.name SendMessageTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest002';
        console.info(`${TAG} test start`);
        let received = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            received = true;
          }, worker);
          const msg = new concurrency.Message(h);
          expect(h.sendMessage(msg)).assertTrue();
          await Sleep(100);
          expect(received).assertTrue();
          while (!received) {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0180
     * @tc.name SendMessageTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest003';
        console.info(`${TAG} test start`);
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        let h1Received = false;
        let h2Received = false;
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(() => {
            h1Received = true;
          }, h1);
          const sendOk = h2.sendMessage(msg);
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0181
     * @tc.name SendMessageTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest004';
        console.info(`${TAG} test start`);
        let received = false;
        let received2 = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            received = true;
          }, worker);
          const msg = new concurrency.Message(() => {
            received2 = true;
          }, h);
          expect(h.sendMessage(msg)).assertTrue();
          await Sleep(2000);
          console.info(`${TAG} received: ${received}`);
          console.info(`${TAG} received2: ${received2}`);
          expect(received).assertTrue();
          expect(received2).assertFalse();
          while (!received) {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0182
     * @tc.name SendMessageTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest005';
        console.info(`${TAG} test start`);
        let executed = false;
        let received = false;
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler((msg) => {
            const cb = msg.getCallback()!;
            if (cb) {
              cb();
            }
            received = true;
          }, worker);
          const msg = new concurrency.Message(() => {
            executed = true;
          }, h);
          expect(h.sendMessage(msg)).assertTrue();
          await Sleep(200);
          expect(executed).assertTrue();
          while (!received) {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0183
     * @tc.name SendMessageTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest006';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const msg = new concurrency.Message(999, h1);
          const sendOk = h2.sendMessage(msg);
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0184
     * @tc.name SendMessageTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest007';
        console.info(`${TAG} test start`);
        let flag = false;
        const worker = new EAWorker();
        worker.start();
        const testValues: int[] = [0, 1, -1, 65535, -65536];
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          for (const val of testValues) {
            const msg = new concurrency.Message(val, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getWhat()).assertEqual(val);
          }
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0185
     * @tc.name SendMessageTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest008';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const data = new Map<string, number>();
          data.set('x', 1);
          const msg = new concurrency.Message(123, data, h1);
          const sendOk = h2.sendMessage(msg);
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_Test_0186
     * @tc.name SendMessageTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SendMessageTest009';
        console.info(`${TAG} test start`);
        let flag = false;
        const worker = new EAWorker();
        worker.start();
        const testValues: int[] = [0, 1, -1, 65535, -65536];
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          const data = new Map<string, number>();
          data.set('any', 1);
          for (const val of testValues) {
            const msg = new concurrency.Message(val, data, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getWhat()).assertEqual(val);
          }
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0187
     * @tc.name SendMessageTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest010';
        console.info(`${TAG} test start`);
        let flag = false;
        const samples: Object[] = [
          2000,
          3.14,
          255,
          true,
          'hello',
          [1, 2, 3],
          new Map<string, string>([['k', 'v']])
        ];
        const worker = new EAWorker();
        worker.start();
        try {
          const h = new concurrency.MessageHandler(() => {
            flag = true;
          }, worker);
          for (const obj of samples) {
            const msg = new concurrency.Message(0, obj, h);
            expect(h.sendMessage(msg)).assertTrue();
            expect(msg.getObject()).assertEqual(obj);
          }
          while (!flag) {
            await Utils.msSleep(100)
          }
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
          ;
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
     *
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0188
     * @tc.name SendMessageTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SendMessageTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const TAG = 'SendMessageTest011';
        console.info(`${TAG} test start`);
        let h1Received = false;
        let h2Received = false;
        const worker1 = new EAWorker();
        worker1.start();
        const worker2 = new EAWorker();
        worker2.start();
        try {
          const h1 = new concurrency.MessageHandler(() => {
            h1Received = true;
          }, worker1);
          const h2 = new concurrency.MessageHandler(() => {
            h2Received = true;
          }, worker2);
          const m1 = new concurrency.Message(h1);
          const sendOk = h2.sendMessage(m1);
          await Sleep(100);
          expect(sendOk).assertFalse();
          expect(h1Received).assertFalse();
          expect(h2Received).assertFalse();
        } catch (err) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.join();
            worker2.join();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0189
     * @tc.name MessageHandler001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest001';
        let worker1 = new EAWorker("worker one");
        let flag: boolean = false;
        worker1.start();
        try {
          let handler1: concurrency.MessageHandler;
          handler1 = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker1);
          let message1 = new concurrency.Message(1, 1, handler1);
          message1.sendToTarget();
          expect(message1.getWhat()).assertEqual(1)
          expect(message1.getObject()).assertEqual(1)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} catch error: message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0190
     * @tc.name MessageHandler002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg1 = new concurrency.Message(0, 1, handler);
          let msg2 = new concurrency.Message(1, 1, handler);
          let msg3 = new concurrency.Message(-165535, 1, handler);
          let msg4 = new concurrency.Message(-65535, 1, handler);
          let msg5 = new concurrency.Message(Int.MAX_VALUE, 1, handler);
          let msg6 = new concurrency.Message(Int.MIN_VALUE, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getWhat()).assertEqual(0);
          expect(msg2.getWhat()).assertEqual(1);
          expect(msg3.getWhat()).assertEqual(-165535);
          expect(msg4.getWhat()).assertEqual(-65535);
          expect(msg5.getWhat()).assertEqual(Int.MAX_VALUE);
          expect(msg6.getWhat()).assertEqual(Int.MIN_VALUE);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0191
     * @tc.name MessageHandler003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, 1 as int, handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0192
     * @tc.name MessageHandler004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0193
     * @tc.name MessageHandler005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, 1 as short, handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual(1);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0194
     * @tc.name MessageHandler006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, true, handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual(true);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0195
     * @tc.name MessageHandler007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, '1', handler);
          handler.sendMessage(msg);
          expect(msg.getObject()).assertEqual('1');
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0196
     * @tc.name MessageHandler008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, [1, 2], handler);
          handler.sendMessage(msg);
          expect(msg.getObject()!.toString()).assertEqual('1,2');
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0197
     * @tc.name MessageHandler009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler003';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let obj = new MessageObject(10)
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(1, obj, handler);
          handler.sendMessage(msg);
          expect((msg.getObject() as MessageObject)!.id).assertEqual(10);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0198
     * @tc.name MessageHandler010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('MessageHandler010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageHandler004';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        try {
          worker.start();
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg1 = new concurrency.Message(1, 1, handler);
          handler.sendMessage(msg1);
          expect(msg1.getCallback()).assertEqual(undefined);
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0199
     * @tc.name PostTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(() => {
            })
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0200
     * @tc.name PostTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let time: number = 0
        worker.start();
        let p = () => {
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(p)
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0201
     * @tc.name PostTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0;
        let flag: boolean = false;
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            let handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0202
     * @tc.name PostTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let time: number = 0
        let handlerValue: boolean = false;
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker)
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            time++;
            expect(handlerValue).assertTrue();
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0203
     * @tc.name PostTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let handler: concurrency.MessageHandler;
        let time: number = 0
        let flag: boolean = false;
        let handlerValue: boolean = false;
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        try {
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            await func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0204
     * @tc.name PostTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(p)
            resolve(1);
          });
        };
        try {
          worker.start();
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0205
     * @tc.name PostTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0206
     * @tc.name PostTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let time: number = 0;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let func: () => Promise<number> = () => {
          return new Promise<number>((resolve) => {
            handlerValue = handler.post(() => {
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
            resolve(1);
          });
        };
        let p = () => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
        }
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          for (let i = 0; i < 10; i++) {
            await func();
            time++;
            expect(handlerValue).assertTrue()
          }
          expect(time).assertEqual(10)
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0207
     * @tc.name RemoveCallbacksTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("RemoveCallbacksTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let timeOut = () => {
            const end = Date.now() + 1000;
            while (Date.now() < end) {
            }
          }
          let headMsg = new concurrency.Message(timeOut, handler)
          handler.sendMessage(headMsg);
          expect(handler.removeCallbacks(p)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0208
     * @tc.name RemoveCallbacksTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        const TAG: string = 'MessageTest061';
        let flag: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker);
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          expect(handler.removeCallbacks(p)).assertEqual(false);
          expect(handler.removeCallbacks(p)).assertEqual(false);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0209
     * @tc.name RemoveCallbacksTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        const TAG: string = 'MessageTest062';
        let flag: boolean = false;
        let handler: concurrency.MessageHandler;
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          expect(handler.removeCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0210
     * @tc.name RemoveCallbacksTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let worker = new EAWorker();
        worker.start();
        const TAG: string = 'MessageTest063';
        let handler: concurrency.MessageHandler;
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          await Utils.msSleep(1300);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0211
     * @tc.name RemoveCallbacksTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest064';
        let handler: concurrency.MessageHandler;
        let flag: boolean = false;
        let worker = new EAWorker();
        let p = () => {
          let a = 1;
        }
        worker.start();
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
            flag = true;
          }, worker);
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.post(p);
          handler.post(p);
          expect(handler.removeCallbacks(p)).assertEqual(true);
          while (!flag) {
            await Utils.msSleep(100);
          }
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0212
     * @tc.name RemoveCallbacksTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest065';
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
          }, worker);
          handler.post(p);
          handler.post(p);
          await Utils.msSleep(1300);
          expect(handler.removeCallbacks(p)).assertEqual(false);
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
          let msg = new concurrency.Message(handler)
          handler.sendMessage(msg);
          handler.hasCallbacks(p);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0213
     * @tc.name RemoveCallbacksTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest002';
        let worker = new EAWorker();
        let flag: boolean = false;
        let handlerValue: boolean = false;
        let removeFlag: boolean = false;
        let handler: concurrency.MessageHandler = new concurrency.MessageHandler((msg: concurrency.Message) => {
          await Sleep(1000);
          flag = true;
        }, worker)
        let p = () => {
        }
        worker.start();
        try {
          let headMsg = new concurrency.Message(p, handler)
          handler.sendMessage(headMsg);
          removeFlag = handler.removeCallbacks(p)
          expect(removeFlag).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_MessageHandler_TEST_0214
     * @tc.name RemoveCallbacksTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RemoveCallbacksTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageTest067';
        let handler: concurrency.MessageHandler;
        let worker = new EAWorker();
        worker.start();
        let p = () => {
          let a = 1;
        }
        try {
          handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            await Sleep(1000);
          }, worker);
          handler.sendMessage(new concurrency.Message(p, handler));
          await Utils.msSleep(1300);
          expect(handler.removeCallbacks(p)).assertEqual(false);
        } catch (error) {
          console.error(`${TAG} error.message => ${error.message}`);
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });
  });
}