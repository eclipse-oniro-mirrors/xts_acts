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
import hilog from '@ohos.hilog'

export class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

interface User {
  username: string;
}

export default function ProcessTest() {
  describe("ProcessTest", (): void => {
    afterEach(async () => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_PROCESS_TEST_0100
     * @tc.name ProcessTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest001';
        console.info(`${TAG} test start`);
        try {
          const currentUid = StdProcess.uid();
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.isAppUid(currentUid);
          expect(isApp).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0200
     * @tc.name ProcessTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest002';
        console.info(`${TAG} test start`);
        try {
          const uidNumber = 4;
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.isAppUid(uidNumber);
          expect(isApp).assertEqual(false);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0300
     * @tc.name ProcessTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest003';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const processManager = new StdProcess.ProcessManager();
            const isApp = processManager.isAppUid(22);
            expect(isApp).assertEqual(false);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0400
     * @tc.name ProcessTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest004';
        console.info(`${TAG} test start`);
        let count: int = 0;
        try {
          await taskpool.execute(new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              const currentUid = StdProcess.uid();
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.isAppUid(currentUid);
              count++;
            }
          }))
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0500
     * @tc.name ProcessTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest005';
        console.info(`${TAG} test start`);
        let worker = new EAWorker()
        worker.start()
        worker.run(() => {
          try {
            for (let i = 0; i < 100; i++) {
              const currentUid = StdProcess.uid();
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.isAppUid(currentUid);
              expect(typeof currentUid).assertEqual('int');
              expect(isApp).assertEqual(true);
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        })
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0600
     * @tc.name ProcessTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest006';
        console.info(`${TAG} test start`);
        try {
          const forName = '';
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.getUidForName(forName);
          // 移除对未定义变量 currentUid 的检查
          const expres : int = -1;
          expect(isApp).assertEqual(expres);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_0700
     * @tc.name ProcessTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest007';
        console.info(`${TAG} test start`);
        try {
          const forName = 'null';
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.getUidForName(forName);
          expect(isApp).assertEqual(-1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_0800
     * @tc.name ProcessTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest008';
        console.info(`${TAG} test start`);
        try {
          const forName = 'undefined';
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.getUidForName(forName);
          expect(isApp).assertEqual(-1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_0900
     * @tc.name ProcessTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest009';
        console.info(`${TAG} test start`);
        try {
          const uidForName = 'root';
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.getUidForName(uidForName);
          expect(isApp).assertEqual(0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_1000
     * @tc.name ProcessTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest010';
        console.info(`${TAG} test start`);
        try {
          const uidForName = 's';
          const processManager = new StdProcess.ProcessManager();
          const isApp = processManager.getUidForName(uidForName);
          expect(isApp).assertEqual(-1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_1100
     * @tc.name ProcessTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest011';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const uidForName = 'g';
            const processManager = new StdProcess.ProcessManager();
            const isApp = processManager.getUidForName(uidForName);
            expect(isApp).assertEqual(-1);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1200
     * @tc.name ProcessTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest012';
        const results: number[] = [];
        try {
          await taskpool.execute(new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              const uidForName = 'getUidForName';
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.getUidForName(uidForName);
              results.push(isApp);
            }
            return results;
          })).then((value: Any): void => {
            const res = value as Array<number>;
            res.forEach(item => expect(item).assertEqual(-1));
          });
        } catch (err) {
          err = err as Error;
          expect(false).assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1300
     * @tc.name ProcessTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest013';
        console.info(`${TAG} test start`);
        let worker = new EAWorker()
        worker.start()
        worker.run(() => {
          try {
            for (let i = 0; i < 100; i++) {
              const uidForName = 'g';
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.getUidForName(uidForName);
              expect(isApp).assertEqual(-1);
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        })
        worker.join();
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1400
     * @tc.name ProcessTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest014';
        console.info(`${TAG} test start`);
        let count: Number = 0;
        try {
          await taskpool.execute(new taskpool.Task(() => {
            const tid = StdProcess.tid();
            for (let i = 0; i < 100; i++) {
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.getThreadPriority(tid);
              count++;
            }
            return count;
          }), taskpool.Priority.LOW).then((value: Any): void => {
            const res = value as Number;
            expect(res).assertEqual(100);
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_1500
     * @tc.name ProcessTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest015';
        console.info(`${TAG} test start`);
        const worker1 = new EAWorker();
        worker1.start()
        const worker2 = new EAWorker();
        worker2.start()
        let count = 0
        try {
          worker1.run<void>(() => {
            for (let i = 0; i < 100; i++) {
              const tid = StdProcess.tid();
              const processManager = new StdProcess.ProcessManager();
              const isApp = processManager.getThreadPriority(tid);
              count++;
            }
          }).Await();
          worker2.run<void>(() => {
            for (let i = 0; i < 100; i++) {
              const tid1 = StdProcess.tid();
              const processManager = new StdProcess.ProcessManager();
              const isApp1 = processManager.getThreadPriority(tid1);
              count++;
            }
          }).Await();
          worker1.join();
          worker2.join();
          expect(count).assertEqual(200);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`)
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_1600
     * @tc.name ProcessTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest016';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const tid = StdProcess.tid();
            const processManager = new StdProcess.ProcessManager();
            const isApp = processManager.getThreadPriority(tid);
            expect(String(isApp)).assertEqual('-20');
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1700
     * @tc.name ProcessTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest017';
        console.info(`${TAG} test start`);
        try {
          let _SC_ARG_MAX = 0;
          let processManager = new StdProcess.ProcessManager();
          let pres = processManager.getSystemConfig(0);
          expect(pres != -1).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1800
     * @tc.name ProcessTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest018';
        console.info(`${TAG} test start`);
        try {
          let _SC_ARG_MAX = 5;
          let processManager = new StdProcess.ProcessManager();
          let pres = processManager.getSystemConfig(_SC_ARG_MAX);
          expect(pres).assertEqual(-1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_1900
     * @tc.name ProcessTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest019';
        console.info(`${TAG} test start`);
        let count: number = 0;
        try {
          await taskpool.execute(new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              const _SC_ARG_MAX = 0;
              let processManager = new StdProcess.ProcessManager();
              let pres = processManager.getSystemConfig(_SC_ARG_MAX);
              count++;
            }
          }))
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_2000
     * @tc.name ProcessTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest020';
        console.info(`${TAG} test start`);
        try {
          const worker = new EAWorker();
          worker.start()
          worker.run(() => {
            try {
              for (let i = 0; i < 100; i++) {
                const _SC_ARG_MAX = 0;
                const processManager = new StdProcess.ProcessManager();
                const pres = processManager.getSystemConfig(_SC_ARG_MAX);
                expect(pres != -1).assertEqual(true);
              }
            } catch (err) {
              err = err as Error;
              expect(false).assertFail();
            }
          });
          worker.join()
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2100
     * @tc.name ProcessTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest021';
        console.info(`${TAG} test start`);
        try {
          const pathName = "PATH";
          const processManager = new StdProcess.ProcessManager();
          const pres = processManager.getEnvironmentVar(pathName);
          expect(pres).assertContain("/data/app/bin:/data/service/hnp/bin:/data/app/bin:/data/service/hnp/bin:");
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_PROCESS_TEST_2200
     * @tc.name ProcessTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest022';
        console.info(`${TAG} test start`);
        try {
          const pathName = "1";
          const processManager = new StdProcess.ProcessManager();
          const pres = processManager.getEnvironmentVar(pathName);
          expect(pres).assertEqual('');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2300
     * @tc.name ProcessTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ProcessTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest023';
        console.info(`${TAG} test start`);
        let count: number = 0;
        try {
          let pres = '';
          await taskpool.execute(new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              const pathName = "PATH";
              const processManager = new StdProcess.ProcessManager();
              pres = processManager.getEnvironmentVar(pathName);
              count++;
            }
          }))
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2400
     * @tc.name ProcessTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const TAG: string = 'ProcessTest024';
        console.info(`${TAG} test start`);
        try {
          const worker = new EAWorker();
          worker.start()
          worker.run(() => {
            for (let i = 0; i < 100; i++) {
              const pathName = "PATH";
              const processManager = new StdProcess.ProcessManager();
              const pres = processManager.getEnvironmentVar(pathName);
              expect(pres).assertContain("/data/app/bin:/data/service/hnp/bin:/data/app/bin:/data/service/hnp/bin:");
            }
            worker.join()
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2500
     * @tc.name ProcessTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest025';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const uid = StdProcess.uid();
            expect(typeof uid).assertEqual('int')
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2600
     * @tc.name ProcessTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest026';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const testFunction = (): void => {
          try {
            for (let i = 0; i < 100; i++) {
              const uid = StdProcess.uid();
              count++;
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        };
        try {
          await taskpool.execute(testFunction);
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2700
     * @tc.name ProcessTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest027';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        let job = worker.run<void>((): void => {
          const workerTag = 'ProcessTest0103_Worker';
          try {
            for (let i = 0; i < 100; i++) {
              const uid = StdProcess.uid();
              count++;
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        });
        try {
          job.Await()
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2800
     * @tc.name ProcessTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest028';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const pid = StdProcess.pid();
            expect(typeof pid).assertEqual('int')
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_2900
     * @tc.name ProcessTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest029';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const testFunction = (): void => {
          try {
            for (let i = 0; i < 100; i++) {
              const pid = StdProcess.pid();
              count++;
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        };
        try {
          await taskpool.execute(testFunction);
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3000
     * @tc.name ProcessTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest030';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        let job = worker.run<void>((): void => {
          const workerTag = 'ProcessTest0107_Worker';
          try {
            for (let i = 0; i < 100; i++) {
              const pid = StdProcess.pid();
              count++;
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        });
        try {
          job.Await();
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3100
     * @tc.name ProcessTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest031';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 100; i++) {
            const tid = StdProcess.tid();
            expect(typeof tid).assertEqual('int')
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3200
     * @tc.name ProcessTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest032';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const testFunction = (): void => {
          try {
            for (let i = 0; i < 100; i++) {
              const tid = StdProcess.tid();
              count++;
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        };
        try {
          await taskpool.execute(testFunction);
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3300
     * @tc.name ProcessTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest033';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        let job = worker.run<void>((): void => {
          const workerTag = 'ProcessTest0107_Worker';
          try {
            for (let i = 0; i < 100; i++) {
              const tid = StdProcess.tid();
              count++
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail();
          }
        });
        try {
          job.Await();
          expect(count).assertEqual(100)
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3400
     * @tc.name ProcessTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest034';
        console.info(`${TAG} test start`);
        let count: number = 0;
        try {
          for (let i = 0; i < 100; i++) {
            const isIsolated = StdProcess.isIsolatedProcess();
            count++
          }
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_PROCESS_TEST_3500
     * @tc.name ProcessTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest035';
        console.info(`${TAG} test start`);
        let isIsolated: boolean = false;
        let count: number = 0;
        const testFunction = (): void => {
          for (let i = 0; i < 100; i++) {
            isIsolated = StdProcess.isIsolatedProcess();
            count++
          }
        };
        try {
          await taskpool.execute(testFunction);
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3600
     * @tc.name ProcessTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest036';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        try {
          let job = worker.run<void>((): void => {
            const workerTag = 'ProcessTest0107_Worker';
            for (let i = 0; i < 100; i++) {
              const isIsolated = StdProcess.isIsolatedProcess();
              count++
            }
          });
          job.Await();
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3700
     * @tc.name ProcessTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest037';
        console.info(`${TAG} test start`);
        try {
          const isIsolated = StdProcess.is64Bit();
          if (isIsolated) {
            expect(isIsolated).assertEqual(true);
          } else {
            expect(isIsolated).assertEqual(false);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3800
     * @tc.name ProcessTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest038';
        console.info(`${TAG} test start`);
        let isIsolated: boolean = false;
        const testFunction = (): void => {
          try {
            isIsolated = StdProcess.is64Bit();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          }
        };
        try {
          await taskpool.execute(testFunction);
          if (isIsolated) {
            expect(isIsolated).assertEqual(true);
          } else {
            expect(isIsolated).assertEqual(false);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_3900
     * @tc.name ProcessTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest039';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        try {
          let job = worker.run<void>((): void => {
            const workerTag = 'ProcessTest0107_Worker';
            for (let i = 0; i < 100; i++) {
              const isIsolated = StdProcess.is64Bit();
              console.info(`Call ${i + 1}: is64Bit() = ${isIsolated}`);
              count++;
            }
          });
          job.Await();
          expect(count).assertEqual(100);
          worker.join();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4000
     * @tc.name ProcessTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest040';
        console.info(`${TAG} test start`);
        try {
          const initialTime = StdProcess.getStartRealtime();
          expect(typeof initialTime).assertEqual('long');
          for (let i = 0; i < 100; i++) {
            const currentTime = StdProcess.getStartRealtime();
            expect(typeof currentTime).assertEqual('long');
            expect(currentTime).assertEqual(initialTime);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4100
     * @tc.name ProcessTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest041';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const testFunction = (): void => {
          try {
            const initialTime = StdProcess.getStartRealtime();
            expect(typeof initialTime).assertEqual('long');
            for (let i = 0; i < 100; i++) {
              const currentTime = StdProcess.getStartRealtime();
              count++;
              expect(typeof currentTime).assertEqual('long');
              expect(currentTime).assertEqual(initialTime);
            }
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            throw err;
          }
        };
        try {
          await taskpool.execute(testFunction);
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4200
     * @tc.name ProcessTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest042';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let count: number = 0;
        try {
          let job = worker.run<void>((): void => {
            const workerTag = 'ProcessTest0119_work';
            const initialTime = StdProcess.getStartRealtime();
            for (let i = 0; i < 100; i++) {
              const currentTime = StdProcess.getStartRealtime();
              count++;
              expect(typeof currentTime).assertEqual('long');
              expect(currentTime).assertEqual(initialTime);
            }
          });
          job.Await();
          expect(count).assertEqual(100)
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4300
     * @tc.name ProcessTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest043';
        console.info(`${TAG} test start`);
        try {
          let previousTime = StdProcess.getPastCpuTime();
          expect(typeof previousTime).assertEqual('long');
          for (let i = 0; i < 100; i++) {
            const currentTime = StdProcess.getPastCpuTime();
            expect(typeof currentTime).assertEqual('long');
            expect(currentTime >= previousTime).assertEqual(true);
            previousTime = currentTime;
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4400
     * @tc.name ProcessTest044
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest044';
        console.info(`${TAG} test start`);
        let count: number = 0;
        try {
          await taskpool.execute((): void => {
            let previousTime = StdProcess.getPastCpuTime();
            expect(typeof previousTime).assertEqual('long');
            for (let i = 0; i < 100; i++) {
              const currentTime = StdProcess.getPastCpuTime();
              count++;
              expect(typeof currentTime).assertEqual('long');
              expect(currentTime >= previousTime).assertEqual(true);
              previousTime = currentTime;
            }
          });
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4500
     * @tc.name ProcessTest045
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest045';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let previousCpuTime: long = 0;
        let currentCpuTime: long = 0;
        try {
          let job = worker.run<void>((): void => {
            const workerTag = 'ProcessTest0122_work';
            previousCpuTime = StdProcess.getPastCpuTime();
            if (typeof previousCpuTime !== 'long') {
              throw new Error('getPastCpuTime() did not return a number');
            }
            for (let i = 0; i < 100; i++) {
              let sum = 0;
              for (let j = 0; j < 1000; j++) {
                sum += Math.sqrt(j) * Math.random();
              }
              currentCpuTime = StdProcess.getPastCpuTime();
            }
          });
          job.Await();
          expect(typeof currentCpuTime).assertEqual('long');
          expect(currentCpuTime >= previousCpuTime).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4600
     * @tc.name ProcessTest046
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest046';
        console.info(`${TAG} test start`);
        try {
          let previousTime = StdProcess.uptime();
          expect(typeof previousTime).assertEqual('long');
          for (let i = 0; i < 100; i++) {
            const currentTime = StdProcess.uptime();
            expect(typeof currentTime).assertEqual('long');
            expect(currentTime >= previousTime).assertEqual(true);
            previousTime = currentTime;
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_PROCESS_TEST_4700
     * @tc.name ProcessTest047
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest047';
        console.info(`${TAG} test start`);
        let count: number = 0;
        try {
          await taskpool.execute((): void => {
            let previousTime = StdProcess.uptime();
            expect(typeof previousTime).assertEqual('long');
            for (let i = 0; i < 100; i++) {
              const currentTime = StdProcess.uptime();
              expect(typeof currentTime).assertEqual('long');
              expect(currentTime >= previousTime).assertEqual(true);
              previousTime = currentTime;
              count++
            }
          });
          expect(count).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_PROCESS_TEST_4800
     * @tc.name ProcessTest048
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ProcessTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest048';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let previousCpuTime: long = 0;
        let currentCpuTime: long = 0;
        try {
          let job = worker.run<void>((): void => {
            const workerTag = 'ProcessTest0122_work';
            previousCpuTime = StdProcess.uptime();
            if (typeof previousCpuTime !== 'long') {
              throw new Error('getPastCpuTime() did not return a number');
            }
            for (let i = 0; i < 100; i++) {
              let sum = 0;
              for (let j = 0; j < 1000; j++) {
                sum += Math.sqrt(j) * Math.random();
              }
              currentCpuTime = StdProcess.uptime();
            }

          });
          job.Await();
          expect(typeof currentCpuTime).assertEqual('long');
          expect(currentCpuTime >= previousCpuTime).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
        }
        console.info(`${TAG} test end`);
        done();
      });
  })
}
