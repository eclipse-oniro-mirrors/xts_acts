/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

export default function tripleInheritanceWorkerTest() {

  describe('ActsTripleInheritanceWorkerTest', () => {
    /**
     * @tc.name   testTripleInheritanceWorker0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_WORKER_0100
     * @tc.desc   Test tripleInheritanceWorker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTripleInheritanceWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testTripleInheritanceWorker0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage('testTripleInheritanceWorker0001');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.name   testTripleInheritanceWorker0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_WORKER_0200
     * @tc.desc   Test setting a top-level instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTripleInheritanceWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testTripleInheritanceWorker0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTripleInheritanceWorker0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_WORKER_0300
     * @tc.desc   Test setting an enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTripleInheritanceWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testTripleInheritanceWorker0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTripleInheritanceWorker0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_WORKER_0400
     * @tc.desc   Test setting an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTripleInheritanceWorker0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testTripleInheritanceWorker0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testTripleInheritanceWorker0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_WORKER_0500
     * @tc.desc   Test setting an async lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTripleInheritanceWorker0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testTripleInheritanceWorker0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testSendableFourAttributeClassWorker0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_CLASS_WORKER_0100
     * @tc.desc   Test setting a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFourAttributeClassWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClassWorker0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testSendableFourAttributeClassWorker0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_CLASS_WORKER_0200
     * @tc.desc   Test setting an enum value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFourAttributeClassWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClassWorker0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testSendableFourAttributeClassWorker0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_CLASS_WORKER_0300
     * @tc.desc   Test setting an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFourAttributeClassWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClassWorker0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testSendableFourAttributeClassWorker0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_CLASS_WORKER_0400
     * @tc.desc   Test setting an async lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFourAttributeClassWorker0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClassWorker0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testSendableFourAttributeClassWorker0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_CLASS_WORKER_0500
     * @tc.desc   Test setting an inherited class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableFourAttributeClassWorker0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClassWorker0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0100
     * @tc.desc   Test toString method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0200
     * @tc.desc   Test setting a number with an offset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0300
     * @tc.desc   Test setting an enum without parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0400
     * @tc.desc   Test setting an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0500
     * @tc.desc   Test setting an async lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testFourthLevelSendableClassOverWorker0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_WORKER_0600
     * @tc.desc   Test setting an inherited class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFourthLevelSendableClassOverWorker0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOverWorker0006';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/Worker.ets');
        myWorker.postMessage(caseName);
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
  })
}