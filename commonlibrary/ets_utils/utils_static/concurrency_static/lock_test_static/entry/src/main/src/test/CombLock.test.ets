/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

export let concurrentNum: number = 1

export let currentWorker: EAWorker | undefined = EAWorker.current()

function normalizePhaseResult(result: string): string {
  return result.split('').sort().join('')
}

function hasAllPhases(result: string): boolean {
  return result.indexOf('1') >= 0 &&
    result.indexOf('2') >= 0 &&
    result.indexOf('3') >= 0 &&
    result.indexOf('4') >= 0
}

export default function CombLockTest(): void {
  describe('CombLockTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number CombLock_Test_0100
     * @tc.name CombLockTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('CombLockTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest001';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncMutex()
        let count: number = 0
        let funcA = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        let funcB = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
          await funcA()
        }
        let funcC = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
          await funcB()
        }
        for (let i = 0; i < 100; i++) {
          await funcC()
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
     * @tc.level Level 1
     */
    it('CombLockTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest002';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncMutex()
        let count: number = 0
        let funcA = async (): Promise<void> => {
          await lock.lock()
          count++
          lock.unlock()
        }
        let funcB = async (): Promise<void> => {
          await funcA()
          await lock.lock()
          count++
          lock.unlock()
        }
        let funcC = async (): Promise<void> => {
          await funcB()
          await lock.lock()
          count++
          lock.unlock()
        }
        for (let i = 0; i < 10; i++) {
          let eaw1 = new EAWorker()
          eaw1.start()
          await eaw1.run<Promise<void>>(async (): Promise<void> => {
            await funcC()
            await funcB()
            await funcA()
            await funcB()
            await funcC()
          })
          eaw1.join()
        }
        for (let i = 0; i < 10; i++) {
          await funcC()
          await funcB()
          await funcA()
          await funcB()
          await funcC()
        }
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
     * @tc.level Level 1
     */
    it('CombLockTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest003';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncMutex()
        let count: number = 0
        let result: string = ''
        let funcA = async (value: string): Promise<void> => {
          await lock.lock()
          result += value
          lock.unlock()
        }
        let funcB = async (value: string): Promise<void> => {
          await funcA(value)
          await lock.lock()
          result += value
          lock.unlock()
        }
        let funcC = async (value: string): Promise<void> => {
          await funcB(value)
          await lock.lock()
          result += value
          lock.unlock()
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        await eaw1.run<Promise<void>>(async (): Promise<void> => {
          await funcC('C')
          await funcB('B')
          await funcA('A')
          await funcA('A')
          await funcB('B')
          await funcC('C')
          await funcA('A')
          await funcB('B')
        })
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
     * @tc.level Level .
     */
    it('CombLockTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest004';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let wLock = lock.writeLock()
        let count: number = 0
        let result: string = ''
        let funcA = async (value: string): Promise<void> => {
          let writeLock = lock.writeLock()
          await writeLock.lock()
          result += value
          writeLock.unlock()
        }
        let funcB = async (value: string): Promise<void> => {
          let writeLock = lock.writeLock()
          await writeLock.lock()
          result += value
          writeLock.unlock()
          await funcA(value)
        }
        let funcC = async (value: string): Promise<void> => {
          await wLock.lock()
          result += value
          wLock.unlock()
          await funcB(value)
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        await eaw1.run<Promise<void>>(async (): Promise<void> => {
          await funcC('C')
          await funcB('B')
          await funcA('A')
          await funcA('A')
          await funcB('B')
          await funcC('C')
          await funcA('A')
          await funcB('B')
        })
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
     * @tc.level Level 2
     */
    it('CombLockTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest005';
        console.info(`${tag} test start`);

        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let wLock = lock.writeLock()
        let count: number = 0
        let funcA = async (): Promise<void> => {
          await wLock.lock()
          count++
          wLock.unlock()
        }
        let funcB = async (): Promise<void> => {
          let writeLock = lock.writeLock()
          await funcA()
          await writeLock.lock()
          count++
          writeLock.unlock()
        }
        let funcC = async (): Promise<void> => {
          await funcB()
          await wLock.lock()
          count++
          wLock.unlock()
        }
        for (let i = 0; i < 10; i++) {
          let eaw1 = new EAWorker()
          eaw1.start()
          await eaw1.run<Promise<void>>(async (): Promise<void> => {
            await funcC()
            await funcB()
            await funcA()
            await funcC()
            await funcB()
          })
          eaw1.join()
        }
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
     * @tc.level Level 2
     */
    it('CombLockTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest006';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let wLock = lock.writeLock()
        let rLock = lock.readLock()
        let count: number = 0
        let result: string = ''
        let funcA = async (value: string): Promise<void> => {
          let writeLock = lock.writeLock()
          await writeLock.lock()
          result += value
          writeLock.unlock()
        }
        let funcB = async (value: string): Promise<void> => {
          let readLock = lock.readLock()
          await readLock.lock()
          result += value
          readLock.unlock()
          await funcA(value)
        }
        let funcC = async (value: string): Promise<void> => {
          await wLock.lock()
          result += value
          wLock.unlock()
          await funcB(value)
        }
        let eaw1 = new EAWorker()
        eaw1.start()
        await eaw1.run<Promise<void>>(async (): Promise<void> => {
          await funcC('C')
          await funcB('B')
          await funcA('A')
          await funcA('A')
          await funcB('B')
          await funcC('C')
          await funcA('A')
          await funcB('B')
        })
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
     * @tc.level Level 2
     */
    it('CombLockTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest007';
        console.info(`${tag} test start`);
        let lock = new concurrency.stackless.AsyncReadWriteLock()
        let wLock = lock.writeLock()
        let rLock = lock.readLock()
        let count: number = 0
        let result: string = ''
        let funcA = async (value: string): Promise<void> => {
          let writeLock = lock.writeLock()
          await writeLock.lock()
          result += value
          count++
          writeLock.unlock()
        }
        let funcB = async (value: string): Promise<void> => {
          let writeLock = lock.writeLock()
          await funcA(value)
          await writeLock.lock()
          result += value
          count++
          writeLock.unlock()
        }
        let funcC = async (value: string): Promise<void> => {
          await funcB(value)
          await wLock.lock()
          result += value
          count++
          wLock.unlock()
        }
        for (let i = 0; i < 100; i++) {
          taskpool.execute(async () => {
            await funcA('A')
            await funcB('B')
            await funcC('C')
            await funcB('B')
            await funcA('A')
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
     * @tc.level Level 2
     */
    it('CombLockTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest008';
        console.info(`${tag} test start`);
        let currentWorker = EAWorker.current()
        let results: Promise<int>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<int>((resolve: (value: int | PromiseLike<int>) => void,
            reject: (reason: Error) => void) => {
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              data.unlock()
              console.log(`${tag} main message cb id: ` + currentWorker?.getWorkerId())
              resolve(msg.getWhat())
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              data.unlock();
              (async (): Promise<void> => {
                await data.lock()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let mutexLock = new concurrency.stackless.AsyncMutex();
              await mutexLock.lock()
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
          result = data.length.toDouble()
          let check: int[] = data.filter((value: int) => value == 123)
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.quit()
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
     * @tc.level Level 2
     */
    it('CombLockTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest009';
        console.info(`${tag} test start`);
        let currentWorker = EAWorker.current()
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let rwLock = new concurrency.stackless.AsyncReadWriteLock();
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let isResolved = false
            let stage1Ready = false
            let tryResolve = (): void => {
              if (!isResolved && hasAllPhases(res)) {
                isResolved = true
                resolve(res)
              }
            }
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncReadLock
              data.unlock()
              res += '4'
              tryResolve()
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncWriteLock
              data.unlock();
              (async (): Promise<void> => {
                let readLock = rwLock.readLock();
                await readLock.lock()
                res += '3'
                tryResolve()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), readLock, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock();
              await writeLock.lock()
              res += '1'
              stage1Ready = true
              tryResolve()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                while (!stage1Ready) {
                  await sleep(10)
                }
                let writeLock = rwLock.writeLock();
                await writeLock.lock()
                writeLock.unlock()
                res += '2'
                tryResolve()
              })().catch(reject)
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
          let check: string[] = data.filter((value: string) => normalizePhaseResult(value) == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.quit()
          } catch (e) {

          }
        })
        expect(normalizePhaseResult(result)).assertEqual('1234')
        Done()
      })

    /**
     * @tc.number CombLock_Test_1000
     * @tc.name CombLockTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CombLockTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest010';
        console.info(`${tag} test start`);
        let results: Promise<int>[] = []
        let workers: EAWorker[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<int>((resolve: (value: int | PromiseLike<int>) => void,
            reject: (reason: Error) => void) => {
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              data.unlock()
              console.log(`${tag} main message cb id: ` + currentWorker?.getWorkerId())
              resolve(msg.getWhat())
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              data.unlock();
              (async (): Promise<void> => {
                await data.lock()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let mutexLock = new concurrency.stackless.AsyncMutex();
              await mutexLock.lock()
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
            eaw.quit()
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
     * @tc.level Level 1
     */
    it('CombLockTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest011';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let isResolved = false
            let stage1Ready = false
            let tryResolve = (): void => {
              if (!isResolved && hasAllPhases(res)) {
                isResolved = true
                resolve(res)
              }
            }
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncReadLock
              data.unlock()
              res += '4'
              tryResolve()
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncWriteLock
              data.unlock();
              (async (): Promise<void> => {
                let readLock = rwLock.readLock();
                await readLock.lock()
                res += '3'
                tryResolve()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), readLock, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock();
              await writeLock.lock()
              res += '1'
              stage1Ready = true
              tryResolve()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                while (!stage1Ready) {
                  await sleep(10)
                }
                let writeLock = rwLock.writeLock();
                await writeLock.lock()
                writeLock.unlock()
                res += '2'
                tryResolve()
              })().catch(reject)
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
          let check: string[] = data.filter((value: string) => normalizePhaseResult(value) == '1234')
          console.log(`${tag} result: ` + (check.length == concurrentNum) ? 'success' : 'failed')
        }).catch((e) => {
          console.log(`${tag} error: ` + e)
        })
        workers.forEach((eaw) => {
          try {
            eaw.quit()
          } catch (e) {

          }
        })
        expect(normalizePhaseResult(result)).assertEqual('1234')
        Done()
      });

    /**
     * @tc.number CombLock_Test_1200
     * @tc.name CombLockTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('CombLockTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest012';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncWriteLock
              (async (): Promise<void> => {
                await data.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncWriteLock
              (async (): Promise<void> => {
                await data.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock();
              await writeLock.lock()
              count.setCount(count.getCount() + 1)
              writeLock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, writeLock, msgHandler))
            })
            eaw.postTask(() => {
              let writeLock = rwLock.writeLock();
              (async (): Promise<void> => {
                await writeLock.lock()
                count.setCount(count.getCount() + 1)
                writeLock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 1
     */
    it('CombLockTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest013';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new concurrency.stackless.AsyncMutex();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                await data.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                await data.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              await lock.lock()
              count.setCount(count.getCount() + 1)
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                await lock.lock()
                count.setCount(count.getCount() + 1)
                lock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 2
     */
    it('CombLockTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest014';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new concurrency.stackless.AsyncMutex();
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await data.lock()
                await readLock.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                readLock.unlock()
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let writeLock = rwLock.writeLock()
                await data.lock()
                await writeLock.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                writeLock.unlock()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock()
              await writeLock.lock()
              await lock.lock()
              count.setCount(count.getCount() + 1)
              writeLock.unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await lock.lock()
                await readLock.lock()
                count.setCount(count.getCount() + 1)
                readLock.unlock()
                lock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 2
     */
    it('CombLockTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest015';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new concurrency.stackless.AsyncMutex();
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let count = new CountClass()
        let currentWorker = EAWorker.current()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let eaw = new EAWorker()
            eaw.start()
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await data.lock()
                await readLock.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                readLock.unlock()
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let writeLock = rwLock.writeLock()
                await data.lock()
                await writeLock.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                writeLock.unlock()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock()
              await writeLock.lock()
              await lock.lock()
              count.setCount(count.getCount() + 1)
              writeLock.unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await lock.lock()
                await readLock.lock()
                count.setCount(count.getCount() + 1)
                readLock.unlock()
                lock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 2
     */
    it('CombLockTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest016';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new concurrency.stackless.AsyncMutex();
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let asyncLock = new AsyncLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                await data.lock()
                asyncLock.lockAsync(() => {
                  count.setCount(count.getCount() + 1)
                }, AsyncLockMode.SHARED)
                data.unlock();
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                await data.lock()
                asyncLock.lockAsync(() => {
                  count.setCount(count.getCount() + 1)
                }, AsyncLockMode.SHARED)
                data.unlock();
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              await lock.lock()
              asyncLock.lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.SHARED)
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                await lock.lock()
                asyncLock.lockAsync(() => {
                  count.setCount(count.getCount() + 1)
                }, AsyncLockMode.EXCLUSIVE)
                lock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 2
     */
    it('CombLockTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest017';
        console.info(`${tag} test start`);
        let results: Promise<string>[] = []
        let workers: EAWorker[] = []
        let lock = new concurrency.stackless.AsyncMutex();
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let count = new CountClass()
        for (let i = 0; i < concurrentNum; i++) {
          let workerPromise = new Promise<string>((resolve: (value: string | PromiseLike<string>) => void,
            reject: (reason: Error) => void) => {
            let res = ''
            let currentWorker = new EAWorker()
            currentWorker.start()
            let eaw = new EAWorker()
            eaw.start()
            workers.push(currentWorker)
            workers.push(eaw)
            let id = eaw.getWorkerId()
            let currentCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await data.lock()
                await readLock.lock()
                AsyncLock.request(tag).lockAsync(() => {
                  count.setCount(count.getCount() + 1)
                }, AsyncLockMode.EXCLUSIVE)
                data.unlock();
                readLock.unlock()
                resolve(res)
              })().catch(reject)
            }
            let workerCB = (msg: concurrency.Message) => {
              let data = msg.getObject() as concurrency.stackless.AsyncMutex
              (async (): Promise<void> => {
                let writeLock = rwLock.writeLock()
                await data.lock()
                await writeLock.lock()
                count.setCount(count.getCount() + 1)
                data.unlock();
                writeLock.unlock()
                let currentHandler = new concurrency.MessageHandler(currentCB, currentWorker)
                currentHandler.sendMessage(new concurrency.Message(msg.getWhat(), data, currentHandler))
              })().catch(reject)
            }
            eaw.run<Promise<void>>(async (): Promise<void> => {
              let writeLock = rwLock.writeLock()
              await writeLock.lock()
              await lock.lock()
              AsyncLock.request(tag).lockAsync(() => {
                count.setCount(count.getCount() + 1)
              }, AsyncLockMode.EXCLUSIVE)
              writeLock.unlock()
              lock.unlock()
              let msgHandler = new concurrency.MessageHandler(workerCB, eaw)
              msgHandler.sendMessage(new concurrency.Message(123, lock, msgHandler))
            })
            eaw.postTask(() => {
              (async (): Promise<void> => {
                let readLock = rwLock.readLock()
                await lock.lock()
                await readLock.lock()
                count.setCount(count.getCount() + 1)
                readLock.unlock()
                lock.unlock()
              })().catch(reject)
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
            eaw.quit()
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
     * @tc.level Level 1
     */
    it('CombLockTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest018';
        console.info(`${tag} test start`);
        let mutexLock = new concurrency.stackless.AsyncMutex();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let pros = new Array<Promise<void>>();

        for (let i = 0; i < coroutines; ++i) {
          pros.push((async (): Promise<void> => {
            for (let j = 0; j < workload; ++j) {
              await mutexLock.lock();
              try {
                // 临界区资源
                count++;
              } finally {
                mutexLock.unlock();
              }
            }
          })());
        }

        await Promise.all(pros)
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
     * @tc.level Level 1
     */
    it('CombLockTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest019';
        console.info(`${tag} test start`);
        let readLock = new concurrency.stackless.AsyncReadWriteLock().readLock();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let jobs = new Array<Promise<Promise<void>>>();
        let workers = new Array<EAWorker>(coroutines, (i: int) => new EAWorker(`Worker-${i}`));

        for (let i = 0; i < coroutines; ++i) {
          workers[i].start();

          jobs.push(workers[i].run<Promise<void>>(async (): Promise<void> => {
            for (let j = 0; j < workload; ++j) {
              await readLock.lock();
              //临界区资源
              count++;
              readLock.unlock();
            }
          }));
        }

        // 等待所有任务完成
        let sharedJob = new SharedJob<Promise<Promise<void>>>(jobs);
        await sharedJob.Await();

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
     * @tc.level Level 1
     */
    it('CombLockTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest020';
        console.info(`${tag} test start`);
        let writeLock = new concurrency.stackless.AsyncReadWriteLock().writeLock();
        const coroutines = 10;
        const workload = 1000;

        let count = 0;
        let jobs = new Array<Promise<void>>();
        let workers = new Array<EAWorker>(coroutines, (i: int) => new EAWorker(`Worker-${i}`));

        for (let i = 0; i < coroutines; ++i) {
          jobs.push((async (): Promise<void> => {
            for (let j = 0; j < workload; ++j) {
              await writeLock.lock();
              try {
                //临界区资源
                count++;
              } finally {
                writeLock.unlock();
              }
            }
          })());
        }

        // 等待所有任务完成
        let sharedJob = new SharedJob<Promise<void>>(jobs);
        await sharedJob.Await();

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
     * @tc.level Level 1
     */
    it('CombLockTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest021';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest022';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest023';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest024';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.AsyncRunner(tag, 20)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest025';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let group = new taskpool.TaskGroup(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await writeLock.lock()
                count++
                lock.unlock()
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest026';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await writeLock.lock()
                count++
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest027';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 10)
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await writeLock.lock()
                count++
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest028';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let writeLock = rwLock.writeLock()
            for (let i = 0; i < 10; i++) {
              try {
                await writeLock.lock()
                count++
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest029';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
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
     * @tc.level Level 1
     */
    it('CombLockTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest030';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 10)
          let task1 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
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
     * @tc.level Level 1
     */
    it('CombLockTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest031';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                count++
                lock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
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
     * @tc.level Level 1
     */
    it('CombLockTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest032';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest033';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 100)
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest034';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await readLock.lock()
                count++
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest035';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest036';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        for (let i = 0; i < 10; i++) {
          let runner = new taskpool.AsyncRunner(tag, 100)
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest037';
        console.info(`${tag} test start`);
        let count = 0
        let lock = new concurrency.stackless.AsyncMutex()
        let rwLock = new concurrency.stackless.AsyncReadWriteLock()
        let pros: Promise<Any>[] = []
        let runner = new taskpool.SequenceRunner(tag)
        for (let i = 0; i < 10; i++) {
          let task1 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
              } catch (e) {
                console.info(`${tag} task1 error: ` + e);
              }
            }
          })
          let task2 = new taskpool.Task(async () => {
            let readLock = rwLock.readLock()
            for (let i = 0; i < 10; i++) {
              try {
                await lock.lock()
                await readLock.lock()
                count++
                lock.unlock()
                readLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest038';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let pros: Promise<void>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          for (let i = 0; i < 100; i++) {
            let task1 = async () => {
              return await new Promise<void>((resolve) => {
                setTimeout(async () => {
                  try {
                    let readLock = rwLock.readLock()
                    await readLock.lock()
                    count++
                    readLock.unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
            }
            let task2 = async () => {
              try {
                let writeLock = rwLock.writeLock()
                await writeLock.lock()
                count++
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest039';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let pros: Promise<void>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          for (let i = 0; i < 100; i++) {
            let task1 = async () => {
              return await new Promise<void>((resolve) => {
                setTimeout(async () => {
                  try {
                    let writeLock = rwLock.writeLock()
                    await writeLock.lock()
                    count++
                    writeLock.unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
            }
            let task2 = async () => {
              try {
                let writeLock = rwLock.writeLock()
                await writeLock.lock()
                count++
                writeLock.unlock()
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
     * @tc.level Level 1
     */
    it('CombLockTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest040';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let pros: Promise<Any>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let task1 = new taskpool.Task(async () => {
            let innerPros: Promise<void>[] = []
            for (let i = 0; i < 100; i++) {
              let pro = new Promise<void>((resolve) => {
                setTimeout(async () => {
                  try {
                    let writeLock = rwLock.writeLock()
                    await writeLock.lock()
                    count++
                    writeLock.unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
              innerPros.push(pro.then(async () => {
                try {
                  let writeLock = rwLock.writeLock()
                  await writeLock.lock()
                  count++
                  writeLock.unlock()
                } catch (e) {
                  console.log(`${tag} catch2: ` + e)
                }
              }))
            }
            await Promise.all(innerPros)
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
     * @tc.level Level 1
     */
    it('CombLockTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const tag: string = 'CombLockTest041';
        console.info(`${tag} test start`);
        let count = 0
        let rwLock = new concurrency.stackless.AsyncReadWriteLock();
        let pros: Promise<Any>[] = []
        for (let i = 0; i < concurrentNum; i++) {
          let task1 = new taskpool.Task(async () => {
            let innerPros: Promise<void>[] = []
            for (let i = 0; i < 100; i++) {
              let pro = new Promise<void>((resolve) => {
                setTimeout(async () => {
                  try {
                    let readLock = rwLock.readLock()
                    await readLock.lock()
                    count++
                    readLock.unlock()
                  } catch (e) {
                    console.log(`${tag} catch1: ` + e)
                  }
                  resolve(undefined)
                }, 10)
              })
              innerPros.push(pro.then(async () => {
                try {
                  let writeLock = rwLock.writeLock()
                  await writeLock.lock()
                  count++
                  writeLock.unlock()
                } catch (e) {
                  console.log(`${tag} catch2: ` + e)
                }
              }))
            }
            await Promise.all(innerPros)
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
