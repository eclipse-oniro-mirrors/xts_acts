/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BaseClass, CountClass, Event, SharedJob, sleep } from '../utils/Model';

export let concurrentNum = 1

export let currentWorker = EAWorker.current()

export default function CombLockTest() {
  describe('CombLockTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number CombLock_Test_0100
     * @tc.name CombLockTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest001';
        console.info(`${tag} test start`);
        let lock = new Mutex()
        let count: number = 0
        let funcA = () => {
          lock.lock()
          count++
          lock.unlock()
        }
        let funcB = () => {
          lock.lock()
          count++
          lock.unlock()
          funcA()
        }
        let funcC = () => {
          lock.lock()
          count++
          lock.unlock()
          funcB()
        }
        for (let i = 0; i < 100; i++) {
          funcC()
        }
        console.log(`TESTCASE ${tag} result: ` + count)
        expect(count).assertEqual(300)
        Done()
      });

    /**
     * @tc.number CombLock_Test_0200
     * @tc.name CombLockTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest002';
        console.info(`${tag} test start`);
        let lock = new Mutex()
        let count: number = 0
        let funcA = () => {
          lock.lock()
          count++
          lock.unlock()
        }
        let funcB = () => {
          funcA()
          lock.lock()
          count++
          lock.unlock()
        }
        let funcC = () => {
          funcB()
          lock.lock()
          count++
          lock.unlock()
        }
        let jobs: Job<void>[] = []
        for (let i = 0; i < 10; i++) {
          let eaw1 = new EAWorker()
          eaw1.start()
          jobs.push(eaw1.run<void>(() => {
            funcC()
            funcB()
            funcA()
            funcB()
            funcC()
          }))
          eaw1.join()
        }
        for (let i = 0; i < 10; i++) {
          funcC()
          funcB()
          funcA()
          funcB()
          funcC()
        }
        jobs.map((value: Job<void>, index: int, array: Array<Job<void>>): void =>
        value.Await()
        )
        console.log(`TESTCASE ${tag} result: ` + count)
        expect(count).assertEqual(220)
        Done()
      });

    /**
     * @tc.number CombLock_Test_0300
     * @tc.name CombLockTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest003';
        console.info(`${tag} test start`);
        let lock = new Mutex()
        let count: number = 0
        let result: string = ''
        let funcA = (value: string) => {
          lock.lock()
          result += value
          lock.unlock()
        }
        let funcB = (value: string) => {
          funcA(value)
          lock.lock()
          result += value
          lock.unlock()
        }
        let funcC = (value: string) => {
          funcB(value)
          lock.lock()
          result += value
          lock.unlock()
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        eaw1.run<void>(() => {
          funcC('C')
          funcB('B')
          funcA('A')
          funcA('A')
          funcB('B')
          funcC('C')
          funcA('A')
          funcB('B')
        }).Await()
        eaw1.join()
        console.log(`TESTCASE ${tag} result: ` + result)
        expect(result).assertEqual('CCCBBAABBCCCABB')
        Done()
      });

    /**
     * @tc.number CombLock_Test_0400
     * @tc.name CombLockTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest004';
        console.info(`${tag} test start`);
        let lock = new RWLock()
        let wLock = lock.writeLock()
        let count: number = 0
        let result: string = ''
        let funcA = (value: string) => {
          lock.writeLock().lock()
          result += value
          lock.writeLock().unlock()
        }
        let funcB = (value: string) => {
          lock.writeLock().lock()
          result += value
          lock.writeLock().unlock()
          funcA(value)
        }
        let funcC = (value: string) => {
          wLock.lock()
          result += value
          wLock.unlock()
          funcB(value)
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        eaw1.run<void>(() => {
          funcC('C')
          funcB('B')
          funcA('A')
          funcA('A')
          funcB('B')
          funcC('C')
          funcA('A')
          funcB('B')
        }).Await()
        eaw1.join()
        console.log(`TESTCASE ${tag} result: ` + result)
        expect(result).assertEqual('CCCBBAABBCCCABB')
        Done()
      });


    /**
     * @tc.number CombLock_Test_0500
     * @tc.name CombLockTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest005';
        console.info(`${tag} test start`);

        let lock = new RWLock()
        let wLock = lock.writeLock()
        let count: number = 0
        let funcA = () => {
          wLock.lock()
          count++
          wLock.unlock()
        }
        let funcB = () => {
          funcA()
          lock.writeLock().lock()
          count++
          lock.writeLock().unlock()
        }
        let funcC = () => {
          funcB()
          wLock.lock()
          count++
          wLock.unlock()
        }
        let jobs: Job<void>[] = []
        for (let i = 0; i < 10; i++) {
          let eaw1 = new EAWorker()
          eaw1.start()
          jobs.push(eaw1.run<void>(() => {
            funcC()
            funcB()
            funcA()
            funcC()
            funcB()
          }))
          eaw1.join()
        }
        jobs.map((value: Job<void>, index: int, array: Array<Job<void>>): void =>
        value.Await()
        )
        console.log(`TESTCASE ${tag} result: ` + count)
        expect(count).assertEqual(110)
        Done()
      });

    /**
     * @tc.number CombLock_Test_0600
     * @tc.name CombLockTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest006';
        console.info(`${tag} test start`);
        let lock = new RWLock()
        let wLock = lock.writeLock()
        let rLock = lock.readLock()
        let count: number = 0
        let result: string = ''
        let funcA = (value: string) => {
          lock.writeLock().lock()
          result += value
          lock.writeLock().unlock()
        }
        let funcB = (value: string) => {
          lock.readLock().lock()
          result += value
          lock.readLock().unlock()
          funcA(value)
        }
        let funcC = (value: string) => {
          wLock.lock()
          result += value
          wLock.unlock()
          funcB(value)
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        eaw1.run<void>(() => {
          funcC('C')
          funcB('B')
          funcA('A')
          funcA('A')
          funcB('B')
          funcC('C')
          funcA('A')
          funcB('B')
        }).Await()
        eaw1.join()
        console.log(`TESTCASE ${tag} result: ` + result)
        expect(result).assertEqual('CCCBBAABBCCCABB')
        Done()
      });

    /**
     * @tc.number CombLock_Test_0700
     * @tc.name CombLockTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest007';
        console.info(`${tag} test start`);
        let lock = new RWLock()
        let wLock = lock.writeLock()
        let rLock = lock.readLock()
        let count: number = 0
        let result: string = ''
        let funcA = (value: string) => {
          lock.writeLock().lock()
          result += value
          count++
          lock.writeLock().unlock()
        }
        let funcB = (value: string) => {
          funcA(value)
          lock.writeLock().lock()
          result += value
          count++
          lock.writeLock().unlock()
        }
        let funcC = (value: string) => {
          funcB(value)
          wLock.lock()
          result += value
          count++
          wLock.unlock()
        }
        for (let i = 0; i < 100; i++) {
          taskpool.execute(() => {
            funcA('A')
            funcB('B')
            funcC('C')
            funcB('B')
            funcA('A')
          })
        }
        let start = new Date().getTime()
        while (count < 900) {
          await sleep(100)
          console.log(`TESTCASE ${tag} result: ` + count)
        }
        console.log(`TESTCASE ${tag} result: ` + count)
        expect(count).assertEqual(900)
        Done()
      })


    /**
     * @tc.number CombLock_Test_0800
     * @tc.name CombLockTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest008';
        console.info(`${tag} test start`);
        let currentWorker = EAWorker.current()
        let results: Promise<int>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<int>((resolve, reject) => {
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.unlock()
              console.log(`${tag} main message cb id: ` + currentWorker?.getWorkerId())
              resolve(msg.getWhat())
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.unlock()
              data.lock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              let mutexLock = new Mutex();
              mutexLock.lock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, mutexLock, msgHandler))
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: number = 0
        await Promise.all(results).then((data: int[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data.length
          let check: int[] = data.filter((value: int) => value == 123)
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(result).assertEqual(concurrentNum)
        Done()
      });


    /**
     * @tc.number CombLock_Test_0900
     * @tc.name CombLockTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest009';
        console.info(`${tag} test start`);
        let currentWorker = EAWorker.current()
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let rwLock = new RWLock();
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as ReadLock
              data.unlock()
              res += '4'
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as WriteLock
              let readLock = rwLock.readLock();
              readLock.lock()
              res += '3'
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), readLock, currentHandler))
            }
            eaw.run<void>(() => {
              let writeLock = rwLock.writeLock();
              writeLock.lock()
              res += '1'
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              let writeLock = rwLock.writeLock();
              res += '2'
              writeLock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(result).assertEqual('1234')
        Done()
      })

    /**
     * @tc.number CombLock_Test_1000
     * @tc.name CombLockTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest010';
        console.info(`${tag} test start`);
        let results: Promise<int>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<int>((resolve, reject) => {
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.unlock()
              console.log(`${tag} main message cb id: ` + currentWorker?.getWorkerId())
              resolve(msg.getWhat())
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.unlock()
              data.lock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              let mutexLock = new Mutex();
              mutexLock.lock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, mutexLock, msgHandler))
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: int = 0
        await Promise.all(results).then((data: int[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          console.log(`${tag} result: ` + data[0])
          result = data[0]
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(result).assertEqual(123)
        Done()
      });


    /**
     * @tc.number CombLock_Test_1100
     * @tc.name CombLockTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest011';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let rwLock = new RWLock();
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as ReadLock
              data.unlock()
              res += '4'
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as WriteLock
              let readLock = rwLock.readLock();
              readLock.lock()
              res += '3'
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), readLock, currentHandler))
            }
            eaw.run<void>(() => {
              let writeLock = rwLock.writeLock();
              writeLock.lock()
              res += '1'
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              let writeLock = rwLock.writeLock();
              res += '2'
              writeLock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(result).assertEqual('1234')
        Done()
      });

    /**
     * @tc.number CombLock_Test_1200
     * @tc.name CombLockTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest012';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let rwLock = new RWLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as WriteLock
              data.lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as WriteLock
              data.lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              let writeLock = rwLock.writeLock();
              writeLock.lock()
              count.setCount(count.getCount() + 1)
              writeLock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              let writeLock = rwLock.writeLock();
              writeLock.lock()
              count.setCount(count.getCount() + 1)
              writeLock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertEqual(concurrentNum * 4)
        Done()
      });

    /**
     * @tc.number CombLock_Test_1300
     * @tc.name CombLockTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest013';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new Mutex();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              lock.lock()
              count.setCount(count.getCount() + 1)
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              lock.lock()
              count.setCount(count.getCount() + 1)
              lock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertEqual(concurrentNum * 4)
        Done()
      });

    /**
     * @tc.number CombLock_Test_1400
     * @tc.name CombLockTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest014';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new Mutex();
        let rwLock = new RWLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.readLock().lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              rwLock.readLock().unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.writeLock().lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              rwLock.writeLock().unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              rwLock.writeLock().lock()
              lock.lock()
              count.setCount(count.getCount() + 1)
              rwLock.writeLock().unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              lock.lock()
              rwLock.readLock().lock()
              count.setCount(count.getCount() + 1)
              rwLock.readLock().unlock()
              lock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertEqual(concurrentNum * 4)
        Done()
      });


    /**
     * @tc.number CombLock_Test_1500
     * @tc.name CombLockTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest015';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new Mutex();
        let rwLock = new RWLock();
        let count = new CountClass()
        let currentWorker = EAWorker.current()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.readLock().lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              rwLock.readLock().unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.writeLock().lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              rwLock.writeLock().unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              rwLock.writeLock().lock()
              lock.lock()
              count.setCount(count.getCount() + 1)
              rwLock.writeLock().unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              lock.lock()
              rwLock.readLock().lock()
              count.setCount(count.getCount() + 1)
              rwLock.readLock().unlock()
              lock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertEqual(concurrentNum * 4)
        Done()
      });

    /**
     * @tc.number CombLock_Test_1600
     * @tc.name CombLockTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest016';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new Mutex();
        let rwLock = new RWLock();
        let asyncLock = new AsyncLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              asyncLock.lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.SHARED)
              data.unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              asyncLock.lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.SHARED)
              data.unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              lock.lock()
              asyncLock.lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.SHARED)
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              lock.lock()
              asyncLock.lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.EXCLUSIVE)
              lock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertEqual(concurrentNum * 4)
        Done()
      });

    /**
     * @tc.number CombLock_Test_1700
     * @tc.name CombLockTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest017';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new Mutex();
        let rwLock = new RWLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve, reject) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.readLock().lock()
              AsyncLock.request(tag).lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.EXCLUSIVE)
              data.unlock()
              rwLock.readLock().unlock()
              resolve(res)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as Mutex
              data.lock()
              rwLock.writeLock().lock()
              count.setCount(count.getCount() + 1)
              data.unlock()
              rwLock.writeLock().unlock()
              let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
              currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
            }
            eaw.run<void>(() => {
              rwLock.writeLock().lock()
              lock.lock()
              AsyncLock.request(tag).lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.EXCLUSIVE)
              rwLock.writeLock().unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              lock.lock()
              rwLock.readLock().lock()
              count.setCount(count.getCount() + 1)
              rwLock.readLock().unlock()
              lock.unlock()
            })
            eaw.setUncaughtExceptionHandler((e: Error) => {
              console.log(`${tag} error: ` + e)
              reject(e)
              eaw.quit()
            })
          })
          results.push(workerPromise)
        }
        let result: string = ''
        await Promise.all(results).then((data: string[]): void => {
          console.log(`${tag} end: ` + data.length)
          console.log(`${tag} result: ` + data)
          result = data[0]
          let check: string[] = data.filter((value: string) => value == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.join().Await()
          } catch (e) {

          }
        })
        expect(count.getCount()).assertLessOrEqual(concurrentNum * 4)
        Done()
      })


    /**
     * @tc.number CombLock_Test_1800
     * @tc.name CombLockTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest018';
        console.info(`${tag} test start`);
        let mutexLock = new Mutex();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let jobs = new Array<Job<void>>(coroutines);
        let workers = new Array<EAWorker>(coroutines);

        for (let i = 0; i < coroutines; ++i) {
          const id = i;
          workers[i] = new EAWorker(`Worker-${id}`);
          workers[i].start();

          jobs[i] = workers[i].run<void>(() => {
            for (let j = 0; j < workload; ++j) {
              mutexLock.lock();
              // 临界区资源
              count++;
              mutexLock.unlock();
            }
          });
        }
        // 等待所有任务完成
        let sharedJob = new SharedJob<Job<void>>(jobs);
        sharedJob.Await();

        for (let worker of workers) {
          worker.quit();
        }
        console.log(`${tag} result: ` + count)
        expect(count).assertEqual(10000)
        Done()
      });


    /**
     * @tc.number CombLock_Test_1900
     * @tc.name CombLockTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest019';
        console.info(`${tag} test start`);
        let readLock = new RWLock().readLock();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let jobs = new Array<Job<void>>(coroutines);
        let workers = new Array<EAWorker>(coroutines);

        for (let i = 0; i < coroutines; ++i) {
          const id = i.toInt();
          workers[i] = new EAWorker(`Worker-${id}`);
          workers[i].start();

          jobs[id] = workers[i].run<void>(() => {
            for (let j = 0; j < workload; ++j) {
              readLock.lock();
              //临界区资源
              count++;
              readLock.unlock();
            }
          });
        }

        // 等待所有任务完成
        let sharedJob = new SharedJob<Job<void>>(jobs);
        sharedJob.Await();

        for (let worker of workers) {
          worker.quit();
        }
        console.log(`${tag} result: ` + count)
        expect(count <= 10000).assertEqual(true)
        Done()
      })

    /**
     * @tc.number CombLock_Test_2000
     * @tc.name CombLockTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest020';
        console.info(`${tag} test start`);
        let writeLock = new RWLock().writeLock();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let jobs = new Array<Job<void>>(coroutines);
        let workers = new Array<EAWorker>(coroutines);

        for (let i = 0; i < coroutines; ++i) {
          const id = i.toInt();
          workers[i] = new EAWorker(`Worker-${id}`);
          workers[i].start();

          jobs[id] = workers[i].run<void>(() => {
            for (let j = 0; j < workload; ++j) {
              writeLock.lock();
              //临界区资源
              count++;
              writeLock.unlock();
            }
          });
        }

        // 等待所有任务完成
        let sharedJob = new SharedJob<Job<void>>(jobs);
        sharedJob.Await();

        for (let worker of workers) {
          worker.quit();
        }
        console.log(`${tag} result: ` + count)
        expect(count).assertEqual(10000)
        Done()
      });
    /**
     * @tc.number CombLock_Test_2100
     * @tc.name CombLockTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest021';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_2200
     * @tc.name CombLockTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest022';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.execute(task1))
          pros.push(taskpool.execute(task2))
        }
        await Promise.all(pros)
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_2300
     * @tc.name CombLockTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest023';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.executeDelayed(10, task1))
          pros.push(taskpool.executeDelayed(10, task2))
        }
        await Promise.all(pros)
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_2400
     * @tc.name CombLockTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest024';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.AsyncRunner(tag, 20)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros)
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });


    /**
     * @tc.number CombLock_Test_2500
     * @tc.name CombLockTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest025';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let group = new taskpool.TaskGroup(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.writeLock().lock()
                count++
                lock.unlock()
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          group.addTask(task1)
          group.addTask(task2)
        }
        await taskpool.execute(group)
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_2600
     * @tc.name CombLockTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest026';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.writeLock().lock()
                count++
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_2700
     * @tc.name CombLockTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest027';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 10)
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.writeLock().lock()
                count++
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_2800
     * @tc.name CombLockTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest028';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.writeLock().lock()
                count++
                rwLock.writeLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.execute(task1))
          pros.push(taskpool.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_2900
     * @tc.name CombLockTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest029';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.execute(task1))
          pros.push(taskpool.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3000
     * @tc.name CombLockTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest030';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 10)
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3100
     * @tc.name CombLockTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest031';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3200
     * @tc.name CombLockTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest032';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3300
     * @tc.name CombLockTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest033';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 100)
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3400
     * @tc.name CombLockTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest034';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                rwLock.readLock().lock()
                count++
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.execute(task1))
          pros.push(taskpool.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3500
     * @tc.name CombLockTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest035';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(taskpool.execute(task1))
          pros.push(taskpool.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_3600
     * @tc.name CombLockTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest036';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 100)
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3700
     * @tc.name CombLockTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest037';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new Mutex()
        let rwLock = new RWLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(() => {
            for (let i = 0; i < 10; i++) {
              try {
                lock.lock()
                rwLock.readLock().lock()
                count++
                lock.unlock()
                rwLock.readLock().unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          pros.push(runner.execute(task1))
          pros.push(runner.execute(task2))
        }
        await Promise.all(pros).then((res: Any[]) => {
          res.forEach((data: Any) => {
            console.info(`${tag} result: ` + data);
          })
        })
        console.info(`${tag} test result: ${count}`);
        expect(count).assertEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_3800
     * @tc.name CombLockTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest038';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new RWLock();
        let pros: Promise<void>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          for (let i = 0; i < 100; i++) {
            let task1 = async () => {
              return await new Promise<void>((resolve) => {
                setTimeout(() => {
                  try {
                    rwLock.readLock().lock()
                    count++
                    rwLock.readLock().unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
            }
            let task2 = async () => {
              try {
                rwLock.writeLock().lock()
                count++
                rwLock.writeLock().unlock()
              } catch (e) {
                console.log(`${tag} catch2: ` + e)
              }
            }
            pros.push(task1())
            pros.push(task2())
          }
        }
        await Promise.all(pros)
        let start = new Date().getTime()
        while (count < 100 * concurrentNum) {
          await sleep(100)
          console.log(`TESTCASE ${tag} count: ` + count)
        }
        console.log(`TESTCASE ${tag} count: ` + count)
        expect(count).assertLessOrEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_3900
     * @tc.name CombLockTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest039';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new RWLock();
        let pros: Promise<void>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          for (let i = 0; i < 100; i++) {
            let task1 = async () => {
              return await new Promise<void>((resolve) => {
                setTimeout(() => {
                  try {
                    rwLock.writeLock().lock()
                    count++
                    rwLock.writeLock().unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
            }
            let task2 = async () => {
              try {
                rwLock.writeLock().lock()
                count++
                rwLock.writeLock().unlock()
              } catch (e) {
                console.log(`${tag} catch2: ` + e)
              }
            }
            pros.push(task1())
            pros.push(task2())
          }
        }
        await Promise.all(pros)
        let start = new Date().getTime()
        while (count < 100 * concurrentNum) {
          await sleep(100)
          console.log(`TESTCASE ${tag} count: ` + count)
        }
        console.log(`TESTCASE ${tag} count: ` + count)
        expect(count).assertLessOrEqual(200)
        Done()
      });

    /**
     * @tc.number CombLock_Test_4000
     * @tc.name CombLockTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest040';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new RWLock();
        let pros: Promise<Any>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              let pro = new Promise<void>((resolve) => {
                setTimeout(() => {
                  try {
                    rwLock.writeLock().lock()
                    count++
                    rwLock.writeLock().unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
              pro.then(() => {
                try {
                  rwLock.writeLock().lock()
                  count++
                  rwLock.writeLock().unlock()
                } catch (e) {
                  console.log(`${tag} catch2: ` + e)
                }
              })
            }
          })
          pros.push(taskpool.execute(task1))
        }
        await Promise.all(pros)
        let start = new Date().getTime()
        while (count < 100 * concurrentNum) {
          await sleep(100)
          console.log(`TESTCASE ${tag} count: ` + count)
        }
        console.log(`TESTCASE ${tag} count: ` + count)
        expect(count).assertLessOrEqual(200)
        Done()
      });
    /**
     * @tc.number CombLock_Test_4100
     * @tc.name CombLockTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('CombLockTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest041';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new RWLock();
        let pros: Promise<Any>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let task1 = new taskpool.Task(() => {
            for (let i = 0; i < 100; i++) {
              let pro = new Promise<void>((resolve) => {
                setTimeout(() => {
                  try {
                    rwLock.readLock().lock()
                    count++
                    rwLock.readLock().unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
              pro.then(() => {
                try {
                  rwLock.writeLock().lock()
                  count++
                  rwLock.writeLock().unlock()
                } catch (e) {
                  console.log(`${tag} catch2: ` + e)
                }
              })
            }
          })
          pros.push(taskpool.execute(task1))
        }
        await Promise.all(pros)
        let start = new Date().getTime()
        while (count < 100 * concurrentNum) {
          await sleep(100)
          console.log(`TESTCASE ${tag} count: ` + count)
        }
        console.log(`TESTCASE ${tag} count: ` + count)
        expect(count).assertLessOrEqual(200)
        Done()
      });

  })
}