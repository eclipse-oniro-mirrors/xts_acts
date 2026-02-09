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
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll
} from "../../../hypium/index";
import Utils from './Util.test';
import {quitErrorMsg} from './Util.test';

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

export default function NewEAWorkerTest() {
  describe('NewEAWorkerTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0100
     * @tc.name getWorkerIdTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0101
     * @tc.name getWorkerIdTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest002';
        console.info(`${TAG} test start`);
        let worker = new EAWorker('123');
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test start`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0102
     * @tc.name getWorkerIdTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest003';
        console.info(`${TAG} test start`);
        let worker = new EAWorker(() => {
        });
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0103
     * @tc.name getWorkerIdTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest004';
        console.info(`${TAG} test start`);
        let worker = new EAWorker('testName', () => {
        });
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0104
     * @tc.name getWorkerIdTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('getWorkerIdTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest005';
        console.info(`${TAG} test start`);
        let worker1 = new EAWorker();
        let w: boolean = false;
        try {
          worker1.start();
          let result = worker1.run<boolean>((): boolean => {
            let worker2 = new EAWorker();
            worker2.start();
            let workerId1 = worker1.getWorkerId();
            let workerId2 = worker2.getWorkerId();
            worker2.join();
            if (workerId1 != workerId2) {
              w = true;
            }
            return w;
          }).Await();
          expect(w).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0105
     * @tc.name getWorkerIdTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest006';
        console.info(`${TAG} test start`);
        try {
          let workerId1 = EAWorker.main().getWorkerId();
          expect(workerId1).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0106
     * @tc.name getWorkerIdTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('getWorkerIdTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest007';
        console.info(`${TAG} test start`);
        let worker: EAWorker | null = null;
        let workerId: int | undefined = undefined;
        try {
          const task = new taskpool.Task(() => {
            worker = new EAWorker();
            worker!.start();
            workerId = worker!.getWorkerId();
          });
          await taskpool.execute(task);
          expect(typeof workerId).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker!.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0107
     * @tc.name getWorkerIdTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest008';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start();
        try {
          worker.quit();
          let workerId1: int | undefined = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0108
     * @tc.name getWorkerIdTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest009';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start();
        try {
          worker.quit();
          let workerId1: int | undefined = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0109
     * @tc.name getWorkerIdTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest010';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          worker.join();
          let workerId1: int | undefined = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0110
     * @tc.name getWorkerIdTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest011';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          let workerId2 = StdProcess.tid();
          expect(typeof workerId1).assertEqual('int');
          expect(typeof workerId2).assertEqual('int');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0111
     * @tc.name GetNameTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest001';
        console.info(`${TAG} test start`);
        const worker = new EAWorker('');
        try {
          let workName1 = worker.getName();
          expect(workName1).assertEqual('');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0112
     * @tc.name GetNameTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest002';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          let workName1 = worker.getName();
          expect(workName1).assertEqual('EAWorker');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0113
     * @tc.name GetNameTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest003';
        console.info(`${TAG} test start`);
        const worker = new EAWorker('testName');
        try {
          let workName1 = worker.getName();
          expect(workName1).assertEqual('testName');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0114
     * @tc.name GetNameTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest004';
        console.info(`${TAG} test start`);
        const testValue =
          '!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEF GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~' +
            '!!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~\\\\b\\0\\💇\\开\\x24\\v\\t\\r\\n\\f\\b💇 === \\ud83d\\udc87' +
            '!!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~\\\\b\\0\\💇\\开\\x24\\v\\t\\r\\n\\f\\b' +
            '%20!%22#$%25&\'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~' +
            '%20!%22%23%24%25%26\'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D' +
            ' !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEF GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~' +
            '!!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~\\\\b\\0\\💇\\开\\x24\\v\\t\\r\\n\\f\\b💇 === \\ud83d\\udc87' +
            '!!\"\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~\\\\b\\0\\💇\\开\\x24\\v\\t\\r\\n\\f\\b' +
            '%20!%22#$%25&\'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abq';
        const worker =
          new EAWorker(testValue);
        try {
          let workName1 = worker.getName();
          expect(workName1)
            .assertEqual(testValue);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0115
     * @tc.name GetNameTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest005';
        console.info(`${TAG} test start`);
        const worker = new EAWorker(() => {
        });
        try {
          let workName1 = worker.getName();
          expect(workName1).assertEqual('EAWorker');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0116
     * @tc.name GetNameTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest006';
        console.info(`${TAG} test start`);
        const worker = new EAWorker('testName', () => {
        });
        try {
          let workName1 = worker.getName();
          expect(workName1).assertEqual('testName');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0117
     * @tc.name GetNameTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest007';
        console.info(`${TAG} test start`);
        try {
          let workName1 = EAWorker.main().getName();
          expect(workName1).assertEqual('main');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0118
     * @tc.name GetNameTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest008';
        console.info(`${TAG} test start`);
        const worker = new EAWorker('testName');
        worker.start();
        try {
          worker.quit();
          let workName1 = worker.getName();
          expect(workName1).assertEqual('testName');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0119
     * @tc.name GetNameTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("GetNameTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetNameTest009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker('testName');
        worker.start();
        try {
          worker.quit();
          let workName1 = worker.getName();
          expect(workName1).assertEqual('testName');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0120
     * @tc.name StartTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest001';
        console.info(`${TAG} test start`);
        try {
          EAWorker.main().start();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Main worker cannot be started');
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0121
     * @tc.name StartTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest002';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        const TEST_COUNT = 10;
        try {
          for (let i = 0; i < TEST_COUNT; i++) {
            worker.start();
          }
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Worker already started');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0122
     * @tc.name StartTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest003';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.quit();
          worker.start();
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Cannot stop worker before start');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0123
     * @tc.name StartTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest004';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.quit();
          worker.start();
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Cannot stop worker before start');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0124
     * @tc.name StartTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest005';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.join();
          worker.start();
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Cannot stop worker before start');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0125
     * @tc.name StartTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest006';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.run<number>((): number => {
            return 123;
          }).Await();
          worker.start();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Can not run task when worker is not started');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0126
     * @tc.name StartTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.run<number>((): number => {
            worker.start();
            return 123;
          }).Await();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Can not run task when worker is not started');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0127
     * @tc.name StartTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('StartTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest008';
        console.info(`${TAG} test start`);
        let worker: EAWorker = new EAWorker();
        try {
          let task = (): void => {
            worker.start()
          }
          worker.postTask(task)
          expect(false).assertFail()
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Can not post task when worker is not started');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0128
     * @tc.name StartTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive() == false).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0129
     * @tc.name StartTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest010';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive() == false).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0130
     * @tc.name StartTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("StartTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'StartTest011';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.join();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive() == false).assertTrue();
          console.info('StartTest011--1', worker.isAlive());
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0131
     * @tc.name IsAlive001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive001';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          let workAlive = worker.isAlive();
          expect(workAlive).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0132
     * @tc.name IsAlive002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive002';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          let workAlive = worker.isAlive();
          expect(workAlive).assertEqual(true);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0133
     * @tc.name IsAlive003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive003';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.run<boolean>((): boolean => {
            return true;
          });
          let workAlive = worker.isAlive();
          expect(workAlive).assertEqual(true);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0134
     * @tc.name IsAlive004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive004';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          worker.quit();
          let workAlive = worker.isAlive();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0135
     * @tc.name IsAlive005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive005';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0136
     * @tc.name IsAlive006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive006';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          worker.join();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0137
     * @tc.name IsAlive007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0138
     * @tc.name IsAlive008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive008';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.run<boolean>((): boolean => {
            return true;
          });
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0139
     * @tc.name IsAlive009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        try {
          worker.start();
          worker.join();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertEqual(false);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0140
     * @tc.name IsAlive010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("IsAlive010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive010';
        console.info(`${TAG} test start`);
        try {
          EAWorker.main().isAlive();
          expect(EAWorker.main().isAlive() == true).assertTrue();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0141
     * @tc.name IsAlive011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('IsAlive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive011';
        console.info(`${TAG} test start`);
        let worker: EAWorker | null = null;
        let taskExecuted = false;
        let isWorkerAlive = false;
        try {
          const task = (): void => {
            isWorkerAlive = worker!.isAlive();
            taskExecuted = true;
          }
          worker = new EAWorker(task);
          worker!.start();
          while(!taskExecuted){
            await Utils.msSleep(100);
          }
          expect(taskExecuted).assertTrue();
          expect(isWorkerAlive).assertFalse();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker!.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0142
     * @tc.name IsAlive012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('IsAlive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive012';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        try {
          worker.start();
          let result = worker.run<boolean>((): boolean => {
            return worker.isAlive()
          }).Await();
          expect(result).assertEqual(true);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0143
     * @tc.name IsAlive013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('IsAlive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'IsAlive013';
        console.info(`${TAG} test start`);
        let worker: EAWorker = new EAWorker();
        let taskExecuted = false;
        let isWorkerAlive = false;
        worker.start();
        try {
          let task = (): void => {
            isWorkerAlive = worker!.isAlive();
            taskExecuted = true;
          }
          worker.postTask(task)
          while(!taskExecuted){
            await Utils.msSleep(100);
          }
          expect(taskExecuted).assertTrue();
          expect(isWorkerAlive).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0144
     * @tc.name GetPriorityTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetPriorityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): Promise<void> => {
        const TAG: string = 'GetPriorityTest001';
        console.info(`${TAG} test start`);
        const priorities = [
          WorkerPriority.PRIORITY_IDLE,
          WorkerPriority.PRIORITY_LOW,
          WorkerPriority.PRIORITY_DEFAULT,
          WorkerPriority.PRIORITY_HIGH
        ];
        const worker = new EAWorker();
        worker.start();
        try {
          for (const p of priorities) {
            worker.setPriority(p);
            const priority = worker.getPriority();
            console.info(`${TAG} value of priorities:${p} priority: ${priority}`);
            expect(priority).assertEqual(p);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0145
     * @tc.name GetPriorityTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetPriorityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetPriorityTest002';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          const priority = worker.getPriority();
          console.info(`${TAG} priority: ${priority}`);
          expect(priority).assertEqual(WorkerPriority.PRIORITY_DEFAULT);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0146
     * @tc.name GetPriorityTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('GetPriorityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'GetPriorityTest003';
        console.info(`${TAG} test start`);
        try {
          const priority = EAWorker.main().getPriority();
          console.info(`${TAG} priority: ${priority}`);
          expect(priority).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0147
     * @tc.name SetPriorityTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SetPriorityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SetPriorityTest001';
        console.info(`${TAG} test start`);
        const priorities = [
          WorkerPriority.PRIORITY_IDLE,
          WorkerPriority.PRIORITY_LOW,
          WorkerPriority.PRIORITY_DEFAULT,
          WorkerPriority.PRIORITY_HIGH
        ];
        const worker = new EAWorker();
        worker.start();
        try {
          for (const p of priorities) {
            worker.setPriority(p);
            const priority = worker.getPriority();
            console.info(`${TAG} value of priorities:${p} priority: ${priority}`);
            expect(priority).assertEqual(p);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0148
     * @tc.name SetPriorityTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SetPriorityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SetPriorityTest002';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          const list = [
            WorkerPriority.PRIORITY_IDLE,
            WorkerPriority.PRIORITY_LOW,
            WorkerPriority.PRIORITY_DEFAULT,
            WorkerPriority.PRIORITY_HIGH,
            WorkerPriority.PRIORITY_IDLE,
            WorkerPriority.PRIORITY_LOW,
            WorkerPriority.PRIORITY_DEFAULT,
            WorkerPriority.PRIORITY_HIGH,
            WorkerPriority.PRIORITY_IDLE,
            WorkerPriority.PRIORITY_LOW
          ];
          for (const p of list) {
            worker.setPriority(p);
            console.info(`${TAG} value of list:${p}`);
            const value = worker.getPriority();
            expect(value).assertEqual(p);
          }
          const priority = worker.getPriority();
          console.info(`${TAG} priority: ${priority}`);
          expect(priority).assertEqual(WorkerPriority.PRIORITY_LOW);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0149
     * @tc.name SetPriorityTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SetPriorityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'SetPriorityTest003';
        console.info(`${TAG} test start`);
        try {
          EAWorker.main().setPriority(WorkerPriority.PRIORITY_DEFAULT);
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Main worker cannot set priority');
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0150
     * @tc.name QuitTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest001';
        console.info(`${TAG} test start`);
        try {
          EAWorker.main().quit();
          expect(false).assertFail();
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(error.message).assertContain('Main worker cannot be stopped');
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0151
     * @tc.name QuitTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest002';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const worker = new EAWorker();
        worker.start();
        try {
          for (let i = 0; i < 10; i++) {
            worker.postTask(() => {
              count++;
              const end = Date.now() + 100;
              while (Date.now() < end) {
              }
            });
          }
          worker.quit();
          while(count<10){
            await Utils.msSleep(100);
          }
          console.info(`${TAG} counter：${count}`);
          expect(count).assertEqual(10);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0152
     * @tc.name QuitTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest003';
        console.info(`${TAG} test start`);
        let fired: boolean = false;
        const worker = new EAWorker();
        worker.start();
        try {
          worker.postTask(() => {
            setTimeout(() => {
              fired = true;
            }, 100);
          });
          worker.quit();
          while(!fired){
            await Utils.msSleep(100);
          }
          expect(fired).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0153
     * @tc.name QuitTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest004';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker: EAWorker = new EAWorker(TAG, () => {
          setTimeout(() => {
            doneFlag = true;
          }, 1000)
        });
        worker.start();
        try {
          worker.quit();
          while(!doneFlag){
            await Utils.msSleep(100);
          }
          expect(doneFlag).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0154
     * @tc.name QuitTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest005';
        console.info(`${TAG} test start`);
        let fired: boolean = false;
        const worker: EAWorker = new EAWorker(TAG, () => {
          setTimeout(() => {
            fired = true;
          }, 200)
        });
        worker.start();
        try {
          let doneFlag: boolean = false;
          const job = worker.run<void>(() => {
            doneFlag = true;
          });
          await Utils.msSleep(1000);
          console.info(`${TAG} job: ${JSON.stringify(job, null, 2)}`);
          worker.quit();
          try {
            job.Await();
            console.info(`${TAG} doneFlag: ${doneFlag}`);
            console.info(`${TAG} fired: ${doneFlag}`);
            await Utils.msSleep(1000);
            console.info(`${TAG} doneFlag2: ${doneFlag}`);
            console.info(`${TAG} fired2: ${doneFlag}`);
            expect(doneFlag).assertTrue();
            expect(fired).assertTrue();
          } catch (error) {
            console.error(`${TAG} catch job.Await error: code =>  message => ${error.message}`);
            expect(false).assertFail();
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
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0155
     * @tc.name QuitTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest006';
        console.info(`${TAG} test start`);
        let doneFlag: boolean = false;
        const worker = new EAWorker(TAG, () => {
          new Promise<string>((resolve) => {
            setTimeout(() => {
              doneFlag = true;
            }, 100);
            resolve('done');
          })
        });
        worker.start();
        try {
          while(!doneFlag){
            await Utils.msSleep(100);
          }
          console.info(`${TAG} doneFlag：${doneFlag}`);
          expect(doneFlag).assertTrue();
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
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0156
     * @tc.name QuitTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest007';
        console.info(`${TAG} test start`);
        let quitCalledInside = false;
        let worker: EAWorker | null = null;
        try {
          worker = new EAWorker(TAG, (): void => {
            worker!.quit();
            quitCalledInside = true;
          });
          worker!.start();
          await Utils.msSleep(1000);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(error.message).assertEqual('Unable to launch coroutine: no suitable worker was found')
        } finally {
          try {
            worker!.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0157
     * @tc.name QuitTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest008';
        console.info(`${TAG} test start`);
        let caught: boolean = false;
        const worker: EAWorker = new EAWorker();
        worker.start();
        try {
          worker.run<void>(() => {
            worker.quit();
            caught = true;
          }).Await();
          expect(caught).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0158
     * @tc.name QuitTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'QuitTest009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        try {
          let doneFlag = false;
          worker.run<void>((): void => {
            doneFlag = true;
          }).Await();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
          expect(doneFlag).assertTrue();
          worker.quit();
        } catch (error) {
          expect(error.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0159
     * @tc.name QuitTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest010';
        console.info(`${TAG} test start`);
        const worker: EAWorker = new EAWorker();
        worker.start();
        try {
          expect(worker.isAlive()).assertTrue();
          let doneFlag = false;
          worker.run<void>((): void => {
            doneFlag = true;
          }).Await();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
          expect(doneFlag).assertTrue();
          worker.quit();
        } catch (error) {
          expect(error.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0160
     * @tc.name QuitTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest011';
        console.info(`${TAG} test start`);
        const worker: EAWorker = new EAWorker();
        worker.start();
        try {
          let doneFlag = false;
          worker.run<void>((): void => {
            doneFlag = true;
          }).Await();
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
          worker.quit();
        } catch (error) {
          expect(error.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0161
     * @tc.name QuitTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QuitTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'QuitTest012';
        console.info(`${TAG} test start`);
        const worker: EAWorker = new EAWorker();
        worker.start();
        try {
          expect(worker.isAlive()).assertTrue();
          let doneFlag = false;
          worker.run<void>((): void => {
            doneFlag = true;
          }).Await();
          worker.join();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
          expect(doneFlag).assertTrue();
          worker.quit();
        } catch (error) {
          expect(error.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
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
  });
}
