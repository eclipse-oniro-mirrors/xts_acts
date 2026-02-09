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

export default function NewEAWorkerTes2() {
  describe('NewEAWorkerTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0173
     * @tc.name FunctionalTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('FunctionalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'FunctionalTest001';
        console.info(`${TAG} test start`);
        let executed: boolean = false;
        let doneFlag: boolean = false;
        const worker = new EAWorker(TAG, () => {
          executed = true;
        });
        worker.start();
        try {
          expect(worker.isAlive()).assertTrue();
          worker.run<void>((): void => {
            doneFlag = true;
          }).Await();
          worker.quit();
          await Utils.msSleep(1000);
          console.info(`${TAG} isAlive：${worker.isAlive()}`);
          expect(worker.isAlive()).assertFalse();
          expect(executed).assertTrue();
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0174
     * @tc.name FunctionalTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('FunctionalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'FunctionalTest002';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const worker = new EAWorker();
        worker.start();
        try {
          expect(worker.isAlive()).assertTrue();
          for (let i = 0; i < 10; i++) {
            worker.postTask((): void => {
              count++;
            });
          }
          await Utils.msSleep(3000);
          worker.quit();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
          console.info(`${TAG} count: ${count}`);
          expect(count).assertEqual(10);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          if (worker.isAlive()) {
            try {
              worker.quit();
            } catch (error) {
              console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
            }
          }
          console.info(`${TAG} test end`);
          done();
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0175
     * @tc.name FunctionalTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('FunctionalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'FunctionalTest003';
        console.info(`${TAG} test start`);
        let count: number = 0;
        const worker = new EAWorker();
        worker.start();
        try {
          const jobs: Array<Job<void>> = [];
          for (let i = 0; i < 5; i++) {
            const job = worker.run<void>((): void => {
              count++;
            });
            jobs.push(job);
          }
          jobs.forEach(j => j.Await());
          expect(count).assertEqual(5);
          worker.join();
          while(worker.isAlive()){
              await Sleep(10);
          }
          expect(worker.isAlive()).assertFalse();
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0176
     * @tc.name FunctionalTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('FunctionalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'FunctionalTest004';
        console.info(`${TAG} test start`);
        const list = [
          WorkerPriority.PRIORITY_IDLE,
          WorkerPriority.PRIORITY_LOW,
          WorkerPriority.PRIORITY_DEFAULT,
          WorkerPriority.PRIORITY_HIGH,
          WorkerPriority.PRIORITY_HIGH,
          WorkerPriority.PRIORITY_LOW,
          WorkerPriority.PRIORITY_DEFAULT,
          WorkerPriority.PRIORITY_HIGH,
          WorkerPriority.PRIORITY_IDLE,
          WorkerPriority.PRIORITY_LOW
        ];
        let count = 0
        try {
          const result: number[] = [];
          const workers = list.map((p, idx: int): EAWorker => {
            const worker = new EAWorker(`${TAG} p-${idx}`);
            worker.start();
            worker.setPriority(p);
            worker.postTask(() => {
              console.info(`${TAG} idx: ${idx} priority：${p}`);
              result.push(idx)
              count++
            });
            return worker;
          });
        
          console.info(`${TAG} workers: ${workers}`);
          console.info(`${TAG} result.length: ${result.length}`);
          while (count < 10) {
            await Sleep(10);
          }
          expect(result.length).assertEqual(10);
          workers.forEach(worker => {
            worker.join()
          });
        } catch (error) {
          expect(error.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_NEW_TEST_0177
     * @tc.name FunctionalTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('FunctionalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'FunctionalTest005';
        console.info(`${TAG} test start`);
        try {
          for (let i = 0; i < 10; i++) {
            const worker = new EAWorker(`${TAG} loop-${i}`);
            worker.start();
            expect(worker.isAlive()).assertTrue();
            worker.run(() => {
              console.info(`${TAG} run-${i}`);
            });
            worker.quit();
            while(worker.isAlive()){
              await Sleep(10);
            }
            expect(worker.isAlive()).assertFalse();
          }
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0178
     * @tc.name setUncaughtExceptionHandlerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          EAWorker.main().setUncaughtExceptionHandler((e: Error) => {
          });
          expect(false).assertFail();
        } catch (error) {
          expect(error.message).assertContain('EAWorker:: Main worker cannot have uncaught exception handler');
        } finally {
          console.info('test end');
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0179
     * @tc.name setUncaughtExceptionHandlerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          EAWorker.main().setUncaughtExceptionHandler(() => {
            new Promise<number>((resolve, reject) => {
              throw new Error('This is an uncaught exception!');
              resolve(1)
            })
          }
          )
          expect(false).assertFail();
        } catch (error) {
          expect(error.message).assertContain('EAWorker:: Main worker cannot have uncaught exception handler');
        } finally {
          console.info('test end');
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0180
     * @tc.name setUncaughtExceptionHandlerTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let errMessage = '';
        let eaw1 = new EAWorker(() => {
          const end = Date.now() + 1000;
          while (Date.now() < end) {
          }
          throw new Error("This is an uncaught exception!");
        });
        try {
          eaw1.start();
          eaw1.setUncaughtExceptionHandler((e: Error) => {
            errMessage = e.message;
          });
          await Utils.msSleep(2500);
          expect(errMessage).assertContain('This is an uncaught exception!')
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            eaw1.quit();
          } catch (error) {
            console.warn(`setUncaughtExceptionHandlerTest003 catch quit error: code =>  message => ${error.message}`);
          }
          console.info('test end');
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0181
     * @tc.name setUncaughtExceptionHandlerTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const eaw2 = new EAWorker();
        let errMessage = '';
        eaw2.start();
        try {
          eaw2.setUncaughtExceptionHandler((e: Error) => {
            errMessage = e.message;
          });
          eaw2.postTask(() => {
            throw new Error('This is an uncaught exception!');
          });
          await Utils.msSleep(2000);
          expect(errMessage).assertContain('This is an uncaught exception!')
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            eaw2.quit();
          } catch (error) {
            console.warn(`setUncaughtExceptionHandlerTest004 catch quit error: code =>  message => ${error.message}`);
          }
          console.info('test end');
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0182
     * @tc.name setUncaughtExceptionHandlerTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const eaw3 = new EAWorker();
        eaw3.start();
        try {
          eaw3.run<void>(() => {
            throw new Error('This is an uncaught exception!');
          }).Await();
          expect(false).assertFail();
        } catch (error) {
          expect(error.message).assertContain('This is an uncaught exception!');
        } finally {
          try {
            eaw3.quit();
          } catch (error) {
            console.warn(`setUncaughtExceptionHandlerTest005 catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0183
     * @tc.name setUncaughtExceptionHandlerTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const eaw4 = new EAWorker();
        try {
          eaw4.start();
          setTimeout(() => {
          }, 1000)
          eaw4.setUncaughtExceptionHandler((error: Error) => {
          });
          await new Promise<void>((resolve, reject) => {
            try {
              eaw4.postTask(() => {
                throw new Error("1111")
              })
              // 加个resolve
              resolve(undefined);
            } catch (error) {
              reject(error);
            }
          })
        } catch (error) {
          expect(error.message).assertContain('Worker function exception');
        } finally {
          try {
            eaw4.quit();
          } catch (error) {
            console.warn(`setUncaughtExceptionHandlerTest006 catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0184
     * @tc.name setUncaughtExceptionHandlerTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setUncaughtExceptionHandlerTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const eaw5 = new EAWorker();
        try {
          eaw5.start();
          eaw5.setUncaughtExceptionHandler((error: Error) => {
          });
          eaw5.postTask(() => {
            setTimeout(() => {
              try {
                throw new Error('This is an uncaught exception!');
              } catch (error) {
                console.log('setUncaughtExceptionHandler_007--set-err', error.message)
              }
            }, 500)
          });
        } catch (error) {
          expect(error.message).assertContain('Worker function exception');
        } finally {
          try {
            eaw5.quit();
          } catch (error) {
            console.warn(`setUncaughtExceptionHandlerTest007 catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0185
     * @tc.name getUncaughtExceptionHandlerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getUncaughtExceptionHandlerTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let getValue: ((error: Error) => void) | undefined;
        const getUnCaught1 = new EAWorker();
        let doneFlag = false;
        getUnCaught1.start();
        try {
          getUnCaught1.setUncaughtExceptionHandler(() => {
            doneFlag = true;
          });
          getValue = getUnCaught1.getUncaughtExceptionHandler();
          getValue!.unsafeCall();
          expect(doneFlag).assertTrue();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            getUnCaught1.quit();
          } catch (error) {
            console.warn(`getUncaughtExceptionHandlerTest001 catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0186
     * @tc.name getUncaughtExceptionHandlerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getUncaughtExceptionHandlerTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          EAWorker.main().postTask(() => {
            throw new Error("Uncaught exception in main thread");
          })
          let getValue2 = EAWorker.main().getUncaughtExceptionHandler();
          expect(getValue2).assertUndefined();
        } catch (error) {
          expect(error.message).assertContain('EAWorker:: Main worker cannot have uncaught exception handler');
          expect(false).assertFail();
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0187
     * @tc.name getUncaughtExceptionHandlerTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getUncaughtExceptionHandlerTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const getUnCaught3 = new EAWorker();
        getUnCaught3.start();
        try {
          getUnCaught3.setUncaughtExceptionHandler((error: Error) => {
          });
          let getValue3 = getUnCaught3.getUncaughtExceptionHandler();
          getUnCaught3.postTask(() => {
            throw new Error("Uncaught exception in main thread");
          });
          expect(typeof getValue3).assertEqual('function');
        } catch (error) {
          console.error(`catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            getUnCaught3.quit();
          } catch (error) {
            console.warn(`getUncaughtExceptionHandlerTest003 catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0188
     * @tc.name MainTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        EAWorker.main().start();
        expect(false).assertFail();
      } catch (error) {
        expect(error.message).assertContain('EAWorker:: Main worker cannot be started');
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0189
     * @tc.name MainTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: boolean = false;
      try {
        EAWorker.main().run<void>(() => {
          flag = true;
        }).Await();
        expect(flag).assertTrue()
      } catch (error) {
        expect(false).assertFail();
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0190
     * @tc.name MainTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let getValue = EAWorker.main().getName()
        expect(getValue).assertEqual('main')
      } catch (error) {
        expect(false).assertFail();
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0191
     * @tc.name MainTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let getValue = EAWorker.main().getWorkerId()
        expect(getValue).assertEqual(0)
      } catch (error) {
        expect(false).assertFail();
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0192
     * @tc.name MainTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let getValue = EAWorker.main().getPriority()
        expect(getValue).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
      } catch (error) {
        expect(false).assertFail();
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0193
     * @tc.name MainTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        EAWorker.main().setUncaughtExceptionHandler((error: Error) => {
        });
      } catch (error) {
        expect(error.message).assertContain('EAWorker:: Main worker cannot have uncaught exception handler');
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0194
     * @tc.name MainTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let getValue: WorkerPriority | undefined;
      try {
        await taskpool.execute(() => {
          getValue = EAWorker.main().getPriority()
        })
        expect(getValue!).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
      } catch (error) {
        expect(false).assertFail()
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0195
     * @tc.name MainTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("MainTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await taskpool.execute(() => {
          EAWorker.main().setUncaughtExceptionHandler((error: Error) => {
          });
          EAWorker.main().postTask(() => {
            throw new Error("This is an uncaught exception!");
          });
        })
        expect(false).assertFail();
      } catch (error) {
        expect(error.message).assertContain('EAWorker:: Main worker cannot have uncaught exception handler');
      } finally {
        console.info(`test end`);
        done();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0196
     * @tc.name CurrentTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          let currentId = current!.getWorkerId()
          expect(typeof currentId).assertEqual('int')
          current!.join();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0197
     * @tc.name CurrentTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          let currentValue = current!.getName()
          console.info(`CurrentTest002 currentValue: ${currentValue}`);
          expect(currentValue).assertEqual('EAWorker');
          current!.join();
        } catch (error) {
          console.error(`CurrentTest002 error.message => ${error.message}`);
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0198
     * @tc.name CurrentTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          let currentValue = current!.getWorkerId();
          let workerValue = worker!.getWorkerId();
          expect(currentValue == workerValue).assertTrue();
          current!.join();
        } catch (error) {
          console.error(`catch error: code =>  message => ${error.message}`);
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0199
     * @tc.name CurrentTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          const end = Date.now() + 100;
          while (Date.now() < end) {
          }
          let currentValue = current!.getPriority()
          expect(currentValue).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
          current!.join();
        } catch (error) {
          console.error(`catch error: code =>  message => ${error.message}`);
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0200
     * @tc.name CurrentTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          current!.setPriority(WorkerPriority.PRIORITY_HIGH)
          let priority = current!.getPriority();
          expect(priority).assertEqual(WorkerPriority.PRIORITY_HIGH)
          current!.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0201
     * @tc.name CurrentTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          let currentValue = current!.isAlive()
          expect(currentValue).assertTrue();
          current!.join();
        } catch (error) {
          console.error(`catch error: code =>  message => ${error.message}`);
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0202
     * @tc.name CurrentTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          let errMessage = '';
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(1000);
          current!.setUncaughtExceptionHandler((error: Error) => {
            errMessage = error.message;
          })
          current!.postTask(() => {
            throw new Error("This is an uncaught exception!");
          });
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('This is an uncaught exception!')
          current!.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0203
     * @tc.name CurrentTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(200);
          let getValue = current!.getPriority()
          expect(getValue).assertEqual(WorkerPriority.PRIORITY_DEFAULT)
          current!.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0204
     * @tc.name CurrentTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let current: EAWorker | undefined = undefined;
        try {
          const worker = new EAWorker(() => {
            current = EAWorker.current()
          });
          worker.start();
          await Utils.msSleep(200);
          current!.run<void>(() => {
            current!.start()
          }).Await()
          expect(false).assertFail();
          current!.join();
        } catch (error) {
          expect(error.message).assertContain('EAWorker:: Worker already started or quit');
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0205
     * @tc.name CurrentTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("CurrentTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let errMessage = '';
        try {
          await taskpool.execute(() => {
            try {
              EAWorker.current()
            } catch (error) {
              errMessage = error.message;
            }
          })
          expect(errMessage).assertContain('EAWorker:: Cannot get current worker in taskpool');
        } catch (error) {
          expect(false).assertFail()
        } finally {
          console.info(`test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0206
     * @tc.name PostTaskTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        let errMessage = '';
        try {
          EAWorker.main().postTask(() => {
            try {
              throw new Error("Worker function exception")
            } catch (error) {
              errMessage = error.message;
            }
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0207
     * @tc.name PostTaskTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        let errMessage = '';
        try {
          EAWorker.main().postTask(() => {
            new Promise<void>(() => {
              throw new Error('Worker function exception');
            }).catch((error: Error) => {
              errMessage = error.message;
            })
          });
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0208
     * @tc.name PostTaskTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        try {
          EAWorker.main().postTask(() => {
            try {
              new Promise<number>((resolve) => {
                resolve(1)
              })
                .then(() => {
                  flag = true;
                })
            } catch (error) {
            }
          });
          await Utils.msSleep(1000);
          expect(flag).assertTrue()
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0209
     * @tc.name PostTaskTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        let errMessage = '';
        try {
          EAWorker.main().postTask(() => {
            try {
              new Promise<number>((resolve) => {
                resolve(1);
              })
                .then(() => {
                  new Promise<void>(() => {
                    throw new Error('Worker function exception');
                  }).catch((error: Error) => {
                    errMessage = error.message;
                  })
                })
              await Utils.msSleep(1000);
              expect(errMessage).assertContain('Worker function exception')
            } catch (error) {
              expect(false).assertFail()
            }
          });
        } catch (error) {
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0210
     * @tc.name PostTaskTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        let errMessage = '';
        try {
          await taskpool.execute(() => {
            EAWorker.main().postTask(() => {
              new Promise<void>(() => {
                throw new Error('Worker function exception');
              })
                .catch((error: Error) => {
                  errMessage = error.message;
                })
            });
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0211
     * @tc.name PostTaskTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        let errMessage = '';
        try {
          await taskpool.execute(() => {
            EAWorker.main().postTask(() => {
              new Promise<number>((resolve) => {
                resolve(1);
              })
                .then(() => {
                  throw new Error('Worker function exception');
                })
                .catch((error: Error) => {
                  errMessage = error.message;
                })
            });
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0212
     * @tc.name PostTaskTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        try {
          await taskpool.execute(() => {
            EAWorker.main().postTask(() => {
              new Promise<number>((resolve) => {
                resolve(1);
              }).then(() => {
                flag = true;
              })
            })
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue()
        } catch (error) {
          expect(false).assertFail()
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0213
     * @tc.name PostTaskTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        let errMessage = '';
        try {
          EAWorker.main().postTask(() => {
            worker.start();
            worker.setUncaughtExceptionHandler((error: Error) => {
              errMessage = error.message;
            })
            worker.run<void>(() => {
              throw new Error('Worker function exception');
            }).Await();
            await Utils.msSleep(1000);
            expect(errMessage).assertContain('Worker function exception')
            worker.join();
          })
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest008 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0214
     * @tc.name PostTaskTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        try {
          EAWorker.main().postTask(() => {
            worker.start();
            worker.run<void>(() => {
              flag = true;
            }).Await();
            await Utils.msSleep(1000);
            expect(flag).assertTrue();
            worker.join();
          })
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest009 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0216
     * @tc.name PostTaskTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        try {
          EAWorker.main().postTask(() => {
            setTimeout(() => {
              flag = true;
            }, 1000)
          })
          await Utils.msSleep(3000);
          expect(flag).assertTrue()
        } catch (error) {
          expect(false).assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0217
     * @tc.name PostTaskTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        let errMessage = '';
        try {
          worker.start();
          worker.postTask(() => {
            try {
              throw new Error("Worker function exception")
            } catch (error) {
              errMessage = error.message;
            }
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest012 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0218
     * @tc.name PostTaskTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        let errMessage = '';
        const worker = new EAWorker();
        worker.start();
        try {
          worker.postTask(() => {
            new Promise<void>(() => {
              throw new Error('Worker function exception');
            }).catch((error: Error) => {
              errMessage = error.message;
            })
          });
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest013 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0219
     * @tc.name PostTaskTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        worker.start();
        try {
          worker.postTask(() => {
            new Promise<number>((resolve) => {
              resolve(1)
            })
              .then(() => {
                flag = true;
              })
          });
          await Utils.msSleep(1000);
          expect(flag).assertTrue()
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest014 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0220
     * @tc.name PostTaskTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        let errMessage = '';
        try {
          worker.start();
          worker.postTask(() => {
            try {
              new Promise<number>((resolve) => {
                resolve(1)
              })
                .then(() => {
                  new Promise<void>(() => {
                    throw new Error('Worker function exception');
                  }).catch((error: Error) => {
                    errMessage = error.message;
                  })
                })
            } catch (error) {
              expect(false).assertFail()
            }
          });
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest015 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0221
     * @tc.name PostTaskTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        let errMessage = '';
        const worker = new EAWorker();
        try {
          await taskpool.execute(() => {
            worker.start();
            worker.setUncaughtExceptionHandler((error: Error) => {
              errMessage = error.message;
            });
            worker.postTask(() => {
              throw new Error('Worker function exception');
            });
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest016 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0222
     * @tc.name PostTaskTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        let errMessage = '';
        const worker = new EAWorker();
        try {
          await taskpool.execute(() => {
            worker.start();
            worker.postTask(() => {
              new Promise<number>((resolve) => {
                resolve(1);
              })
                .then(() => {
                  throw new Error('Worker function exception');
                })
                .catch((error: Error) => {
                  errMessage = error.message;
                })
            });
          })
          await Utils.msSleep(1000);
          expect(errMessage).assertContain('Worker function exception')
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest017 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0223
     * @tc.name PostTaskTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        try {
          await taskpool.execute(() => {
            worker.start();
            worker.postTask(() => {
              new Promise<number>((resolve) => {
                resolve(1);
              })
                .then(() => {
                  flag = true;
                })
            })
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue();
          worker.join();
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest018 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0224
     * @tc.name PostTaskTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        let value: string = '';
        const worker = new EAWorker();
        try {
          worker.start();
          worker.postTask(() => {
            worker.setUncaughtExceptionHandler((error: Error) => {
              value = error.message
            })
            worker.run<void>(() => {
              throw new Error('Worker function exception');
            });
            const end = Date.now() + 1000;
            while (Date.now() < end) {
            }
            flag = true;
          })
          while (!flag) {
            await Utils.msSleep(100);
          }
          expect(value).assertContain('Worker function exception') //assertCon
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest019 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0225
     * @tc.name PostTaskTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        try {
          await new Promise<number>((resolve) => {
            worker.start();
            resolve(1)
          }).then(() => {
            worker.postTask(() => {
              worker.setUncaughtExceptionHandler((error: Error) => {
              });
              worker.run<void>(() => {
                flag = true;
                expect(flag).assertTrue();
              }).Await();
              const end = Date.now() + 1000;
              while (Date.now() < end) {
              }
            })
          })
        } catch (error) {
          expect(false).assertFail()
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest020 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0227
     * @tc.name PostTaskTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker();
        try {
          worker.start();
          worker.postTask(() => {
            setTimeout(() => {
              flag = true;
            }, 1000)
          })
          await Utils.msSleep(2000);
          expect(flag).assertTrue();
          worker.join();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest022 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0228
     * @tc.name PostTaskTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        try {
          EAWorker.main().postTask(() => {
            flag = true;
          })
          EAWorker.main().postTask(() => {
            flag = false;
          })
          EAWorker.main().postTask(() => {
            flag = true;
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue()
        } catch (error) {
          expect(false).assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0229
     * @tc.name PostTaskTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker(() => {
        });
        worker.start();
        try {
          worker.postTask(() => {
            flag = true;
          })
          worker.postTask(() => {
            flag = false;
          })
          worker.postTask(() => {
            flag = true;
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest024 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0230
     * @tc.name PostTaskTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker(() => {
        });
        try {
          worker.start();
          worker.postTask(() => {
            flag = true;
          })
          worker.run<void>(() => {
            flag = false;
          })
          worker.postTask(() => {
            flag = true;
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue()
          worker.join();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest025 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0231
     * @tc.name PostTaskTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: string = ''
        const worker = new EAWorker(() => {
        });
        try {
          worker.start();
          worker.postTask(() => {
            flag += '0';
          })
          worker.postTask(() => {
            flag += '1';
          })
          worker.postTask(() => {
            flag += '2';
          })
          worker.postTask(() => {
            flag += '3';
          })
          worker.postTask(() => {
            flag += '4';
          })
          worker.postTask(() => {
            flag += '5';
          })
          worker.postTask(() => {
            flag += '6';
          })
          worker.postTask(() => {
            flag += '7';
          })
          worker.postTask(() => {
            flag += '8';
          })
          worker.postTask(() => {
            flag += '9';
          })
          await Utils.msSleep(1000);
          expect(flag == '0123456789').assertTrue();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest026 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0232
     * @tc.name PostTaskTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("PostTaskTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag: boolean = false
        const worker = new EAWorker(() => {
        });
        try {
          worker.start();
          worker.postTask(() => {
            worker.postTask(() => {
              worker.postTask(() => {
                flag = true;
              })
            })
          })
          await Utils.msSleep(1000);
          expect(flag).assertTrue();
        } catch (error) {
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`PostTaskTest026 catch quit error: code =>  message => ${error.message}`);
          }
          done();
        }
      });
  });
}
