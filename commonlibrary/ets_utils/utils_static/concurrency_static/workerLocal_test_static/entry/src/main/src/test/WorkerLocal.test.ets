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

type funcType = (num: number) => number

function testFunc(num: number): number {
  return num
}

class TestObject {
  constructor(a1: string, a2: number) {
    this.a1 = a1
    this.a2 = a2
  }

  constructor() {
  }

  public a1: string = 'a1'
  public a2: number = 1.0
}

export default function workerLocalTest() {
  describe('workerLocalTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_WorkerLocal_Test_0100
     * @tc.name workerLocalTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest001';
        console.info(`${TAG} test start`);
        let str = 'init'
        let wl = new WorkerLocal<string>(() => str)
        expect(wl.get()).assertEqual('init')
        wl.set('main')
        expect(wl.get()).assertEqual('main')
        await taskpool.execute(() => {
          expect(wl.get()).assertEqual('init')
          wl.set('taskpool')
          expect(wl.get()).assertEqual('taskpool')
          wl.delete()
          expect(wl.get()).assertEqual('init')
          wl.set('taskpool')
          expect(wl.get()).assertEqual('taskpool')
        })
        expect(wl.get()).assertEqual('main')
        wl.delete()
        expect(wl.get()).assertEqual('init')
        Done()
      });

    /**
     * @tc.number SUB_WorkerLocal_Test_0200
     * @tc.name workerLocalTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest002';
        console.info(`${TAG} test start`);
        let str = 'init'
        let wl = new WorkerLocal<funcType>()
        try {
          wl.get()
        } catch (e) {
          expect(e.message).assertContain('not initialized')
        }
        wl.set(testFunc)
        expect(wl.get()(1)).assertEqual(1)
        await taskpool.execute(() => {
          try {
            wl.get()
          } catch (e) {
            expect(e.message).assertContain('not initialized')
          }
          wl.set(testFunc)
          expect(wl.get()(2)).assertEqual(2)
          wl.delete()
          try {
            wl.get()
          } catch (e) {
            expect(e.message).assertContain('not initialized')
          }
        })
        expect(wl.get()(1)).assertEqual(1)
        Done()
      });

    /**
     * @tc.number SUB_WorkerLocal_Test_0300
     * @tc.name workerLocalTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest003';
        console.info(`${TAG} test start`);
        let str = 'init'
        let wl = new WorkerLocal<int>()
        try {
          wl.get()
        } catch (e) {
          expect(e.message).assertContain('not initialized')
        }
        wl.set(1)
        expect(wl.get()).assertEqual(1)
        wl.set(wl.get() + 1)
        expect(wl.get()).assertEqual(2)
        await taskpool.execute(() => {
          try {
            wl.get()
          } catch (e) {
            expect(e.message).assertContain('not initialized')
          }
          wl.set(1)
          expect(wl.get()).assertEqual(1)
          wl.set(wl.get() + 1)
          expect(wl.get()).assertEqual(2)
          wl.delete()
          try {
            wl.get()
          } catch (e) {
            expect(e.message).assertContain('not initialized')
          }
          wl.set(3)
          expect(wl.get()).assertEqual(3)
        })
        expect(wl.get()).assertEqual(2)
        Done()
      });

    /**
     * @tc.number SUB_WorkerLocal_Test_0400
     * @tc.name workerLocalTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest004';
        console.info(`${TAG} test start`);
        let str = 'init'
        let wl = new WorkerLocal<TestObject>(() => new TestObject())
        expect(wl.get().a1).assertEqual('a1')
        expect(wl.get().a2).assertEqual(1.0)
        wl.get().a1 = 'a2'
        expect(wl.get().a1).assertEqual('a2')
        wl.set(new TestObject('a3', 3.0))
        expect(wl.get().a1).assertEqual('a3')
        expect(wl.get().a2).assertEqual(3.0)
        await taskpool.execute(() => {
          expect(wl.get().a1).assertEqual('a1')
          expect(wl.get().a2).assertEqual(1.0)
          wl.set(new TestObject('a4', 4.0))
          expect(wl.get().a1).assertEqual('a4')
          expect(wl.get().a2).assertEqual(4.0)
          wl.delete()
          expect(wl.get().a1).assertEqual('a1')
          expect(wl.get().a2).assertEqual(1.0)
          wl.get().a1 = 'a5'
        })
        expect(wl.get().a1).assertEqual('a3')
        expect(wl.get().a2).assertEqual(3.0)
        Done()
      });


    /**
     * @tc.number SUB_WorkerLocal_Test_0500
     * @tc.name workerLocalTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest005';
        console.info(`${TAG} test start`);
        let value = 'init'
        let wl = new WorkerLocal<Promise<string>>(() => new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve(value)
          }, 10)
        }))
        expect(await wl.get()).assertEqual('init')
        value = 'new'
        expect(await wl.get()).assertEqual('init')
        wl.set(Promise.resolve('resolve'))
        expect(await wl.get()).assertEqual('resolve')
        await taskpool.execute(() => {
          await wl.get().then((res: string) => {
            expect(res).assertEqual('new')
          })
          value = 'taskpool'
          expect(await wl.get()).assertEqual('new')
          wl.set(new Promise<string>((resolve) => {
            setTimeout(() => {
              resolve(value)
            }, 10)
          }))
          expect(await wl.get()).assertEqual('taskpool')
          wl.delete()
          expect(await wl.get()).assertEqual('taskpool')
        })
        expect(await wl.get()).assertEqual('resolve')
        Done()
      });

    /**
     * @tc.number SUB_WorkerLocal_Test_0600
     * @tc.name workerLocalTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest006';
        console.info(`${TAG} test start`);
        let getArr = (start: number, end: number):Array<number> => {
          let arr = new Array<number>()
          for (let i = start; i < end; i++) {
            arr.push(i)
          }
          return arr
        }
        let wl = new WorkerLocal<Array<number>>(() => new Array<number>)
        expect(wl.get().length).assertEqual(0)
        for (let i = 0; i < 1000; i++) {
          wl.get().push(i)
        }
        expect(wl.get().length).assertEqual(1000)
        expect(wl.get()[999]).assertEqual(999)
        let pro = new Promise<int>((resolve) => {
          taskpool.execute(() => {
            expect(wl.get().length).assertEqual(0)
            wl.set(getArr(1000, 2000))
            expect(wl.get().length).assertEqual(1000)
            expect(wl.get()[999]).assertEqual(1999)
          }).then(() => {
            resolve(0)
          })
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          expect(wl.get().length).assertEqual(0)
          wl.set(getArr(2000, 3000))
          expect(wl.get().length).assertEqual(1000)
          expect(wl.get()[999]).assertEqual(2999)
        }).Await()
        eaw.join()
        await pro
        expect(wl.get()[999]).assertEqual(999)
        Done()
      });

    /**
     * @tc.number SUB_WorkerLocal_Test_0700
     * @tc.name workerLocalTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest007';
        console.info(`${TAG} test start`);
        let wl = new WorkerLocal<int>(() => 0)
        expect(wl.get()).assertEqual(0)
        for (let i = 0; i < 1000; i++) {
          wl.set(wl.get() + 1)
        }
        expect(wl.get()).assertEqual(1000)
        let pro = new Promise<int>((resolve, reject) => {
          taskpool.execute(() => {
            expect(wl.get()).assertEqual(0)
            for (let i = 0; i < 1000; i++) {
              wl.set(wl.get() + 1)
            }
            expect(wl.get()).assertEqual(1000)
            wl.delete()
            expect(wl.get()).assertEqual(0)
          }).then(() => {
            resolve(0)
          }).catch(() => {
            reject(Error('err'))
          })
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          expect(wl.get()).assertEqual(0)
          for (let i = 0; i < 1000; i++) {
            wl.set(wl.get() + 1)
          }
          expect(wl.get()).assertEqual(1000)
          wl.delete()
          expect(wl.get()).assertEqual(0)
        }).Await()
        eaw.join()
        await pro
        expect(wl.get()).assertEqual(1000)
        Done()
      })


    /**
     * @tc.number SUB_WorkerLocal_Test_0800
     * @tc.name workerLocalTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest008';
        console.info(`${TAG} test start`);
        let wl = new WorkerLocal<int>(() => 0)
        expect(wl.get()).assertEqual(0)
        for (let i = 0; i < 100; i++) {
          wl.delete()
          expect(wl.get()).assertEqual(0)
          wl.set(wl.get() + 1)
          expect(wl.get()).assertEqual(1)
        }
        expect(wl.get()).assertEqual(1)
        let pro = new Promise<int>((resolve, reject) => {
          taskpool.execute(() => {
            expect(wl.get()).assertEqual(0)
            for (let i = 0; i < 100; i++) {
              wl.delete()
            }
            for (let i = 0; i < 100; i++) {
              expect(wl.get()).assertEqual(0)
              wl.set(wl.get() + 1)
              expect(wl.get()).assertEqual(1)
              wl.delete()
            }
            expect(wl.get()).assertEqual(0)
          }).then(() => {
            resolve(0)
          }).catch(() => {
            reject(Error('err'))
          })
        })
        let eaw = new EAWorker()
        eaw.start()
        eaw.run<void>(() => {
          expect(wl.get()).assertEqual(0)
          for (let i = 0; i < 100; i++) {
            wl.set(i)
            expect(wl.get()).assertEqual(i)
            wl.delete()
            expect(wl.get()).assertEqual(0)
          }
          expect(wl.get()).assertEqual(0)
        }).Await()
        eaw.join()
        await pro
        expect(wl.get()).assertEqual(1)
        Done()
      });


    /**
     * @tc.number SUB_WorkerLocal_Test_0900
     * @tc.name workerLocalTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest009';
        console.info(`${TAG} test start`);
        let init = new TestObject()
        let wl = new WorkerLocal<TestObject>(() => init)
        expect(wl.get().a1).assertEqual('a1')
        expect(wl.get().a2).assertEqual(1.0)
        for (let i = 0; i < 100; i++) {
          wl.set(new TestObject('a' + i, i))
          expect(wl.get().a1).assertEqual('a' + i)
          expect(wl.get().a2).assertEqual(i)
        }
        let group = new taskpool.TaskGroup()
        let jobs: Job<void>[] = []
        for (let i = 0; i < 10; i++) {
          group.addTask(() => {
            let eaw = new EAWorker()
            eaw.start()
            let job = eaw.run<void>(() => {
              expect(wl.get().a1).assertEqual('a1')
              expect(wl.get().a2).assertEqual(1.0)
              for (let i = 0; i < 100; i++) {
                wl.set(new TestObject('a' + i, i))
                expect(wl.get().a1).assertEqual('a' + i)
                expect(wl.get().a2).assertEqual(i)
                wl.delete()
              }
              expect(wl.get().a1).assertEqual('a1')
              expect(wl.get().a2).assertEqual(1.0)
            })
            jobs.push(job)
            eaw.join()
          })
        }
        let pro = new Promise<int>((resolve, reject) => {
          taskpool.execute(() => {
            expect(wl.get().a1).assertEqual('a1')
            expect(wl.get().a2).assertEqual(1.0)
            for (let i = 0; i < 100; i++) {
              wl.set(new TestObject('a' + i, i))
              expect(wl.get().a1).assertEqual('a' + i)
              expect(wl.get().a2).assertEqual(i)
              wl.delete()
            }
            expect(wl.get().a1).assertEqual('a1')
            expect(wl.get().a2).assertEqual(1.0)
          }).then(() => {
            resolve(0)
          }).catch(() => {
            reject(Error('err'))
          })
        })
        let eaw = new EAWorker()
        eaw.start()
        let job = eaw.run<void>(() => {
          expect(wl.get().a1).assertEqual('a1')
          expect(wl.get().a2).assertEqual(1.0)
          for (let i = 0; i < 100; i++) {
            wl.set(new TestObject('a' + i, i))
            expect(wl.get().a1).assertEqual('a' + i)
            expect(wl.get().a2).assertEqual(i)
            wl.delete()
          }
          expect(wl.get().a1).assertEqual('a1')
          expect(wl.get().a2).assertEqual(1.0)
        })
        eaw.join()
        await pro
        jobs.forEach(job => job.Await())
        expect(wl.get().a1).assertEqual('a99')
        expect(wl.get().a2).assertEqual(99)
        Done()
      })
    /**
     * @tc.number SUB_WorkerLocal_Test_1000
     * @tc.name workerLocalTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('workerLocalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'workerLocalTest010';
        console.info(`${TAG} test start`);
        let wl = new WorkerLocal<string>(() => 'init')
        let task = new taskpool.Task(()=>{
          expect(wl.get()).assertEqual('init')
          for (let i = 0; i < 100; i++) {
            wl.set(wl.get() + i)
            expect(wl.get()).assertEqual('init' + i)
            wl.delete()
          }
        })

        let pros: Promise<Any>[] = []
        let jobs: Job<void>[] = []
        let eaw = new EAWorker()
        eaw.start()
        jobs.push(eaw.run<void>(() => {
          pros.push(taskpool.execute(task))
          let eaw1 = new EAWorker()
          eaw1.start()
          jobs.push(eaw1.run<void>(()=>{
            expect(wl.get()).assertEqual('init')
            for (let i = 0; i < 100; i++) {
              wl.set(wl.get() + i)
              expect(wl.get()).assertEqual('init' + i)
              wl.delete()
            }
            let eaw2 = new EAWorker()
            eaw2.start()
            jobs.push(eaw2.run<void>(()=>{
              expect(wl.get()).assertEqual('init')
              for (let i = 0; i < 100; i++) {
                wl.set(wl.get() + i)
                expect(wl.get()).assertEqual('init' + i)
                wl.delete()
              }
            }))
            eaw2.join()
          }))
          eaw1.join()
        }))
        eaw.join()
        jobs.forEach(job => job.Await())
        await Promise.all(pros)
        expect(wl.get()).assertEqual('init')
        Done()
      })
  })
}