/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import worker from '@ohos.worker'
import { BusinessError } from '@ohos.base'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, sequenceRunnerPriorityTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, noUseConcurrentTest } from './testFunclist'
import { A, B, StrCat, printArgs } from './exportFunclist'
import HashMap from '@ohos.util.HashMap';

export default function TaskPoolTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.number    : TaskPoolTestClass001
     * @tc.name      : Async Function use taskpool and worker
     * @tc.desc      : Test Simultaneous use taskpool and worker
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass001', 0, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker.ts")
      let res:number = 0
      let flag:boolean = false
      ss.onexit = () => {
        flag = true
        res++
      }
      testTaskPool();
      ss.terminate();
      while (!flag) {
        await promiseCase()
      }
      expect(res).assertEqual(1)
      done();
    })

    it('TaskPoolTestClass002', 0, async (done: Function) => {
      let result = await taskpool.execute(Sum, 10, 20);
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass003', 0, async (done: Function) => {
      let result:boolean = await taskpool.execute(Add, true, true) as boolean;
      expect(result).assertEqual(true);
      done();
    })

    it('TaskPoolTestClass004', 0, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    it('TaskPoolTestClass005', 0, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      result = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    it('TaskPoolTestClass006', 0, async (done: Function) => {
      let result: string = await taskpool.execute(funcStrCat, "abc", "def", "hello") as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    it('TaskPoolTestClass007', 0, async (done: Function) => {
      let result: Array<number> = await taskpool.execute(arraySum, [1,2], [3,4]) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    it('TaskPoolTestClass008', 0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let result: A = await taskpool.execute(objectSum, aa, bb) as A;
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    it('TaskPoolTestClass009', 0, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    it('TaskPoolTestClass010', 0, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10, 20, 30) as number;
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass011', 0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 30, 40) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    it('TaskPoolTestClass012', 0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 10, 20) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass013', 0, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Multi, 10, 20) as number;
      let result3: number = await taskpool.execute(Sum, 10, 30) as number;
      let result4: number = await taskpool.execute(Multi, 20, 20) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    it('TaskPoolTestClass014', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass015', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true);
      let result: boolean = await taskpool.execute(task)  as boolean;
      expect(result).assertEqual(true);
      done();
    })

    it('TaskPoolTestClass016', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    it('TaskPoolTestClass017', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    it('TaskPoolTestClass018', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1,2], [3,4]);
      let result: Array<number> = await taskpool.execute(task) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    it('TaskPoolTestClass019', 0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
      let result: A = await taskpool.execute(task) as A;
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    it('TaskPoolTestClass020', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10);
      let result: number = await taskpool.execute(task) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    it('TaskPoolTestClass021', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20, 30);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass022', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task) as number;
      let result2: number = await taskpool.execute(task) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass023', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    it('TaskPoolTestClass024', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass025', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task1) as number;
      let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20);
      let result2: number = await taskpool.execute(task2) as number;
      let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30);
      let result3: number = await taskpool.execute(task3) as number;
      let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20);
      let result4: number = await taskpool.execute(task4) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    it('TaskPoolTestClass026', 0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass027', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true)
      let result: boolean = false;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as boolean;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    it('TaskPoolTestClass028', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def")
      let result: string = '';
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    it('TaskPoolTestClass029', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      let result: string = '';
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    it('TaskPoolTestClass030', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1,2], [3,4]);
      let isTerminate: boolean = false;
      let result: Array<number> = [];
      taskpool.execute(task).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    it('TaskPoolTestClass031', 0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let task: taskpool.Task = new taskpool.Task(objectSum, aa, bb);
      let result: A = aa;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as A;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    it('TaskPoolTestClass032', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10);
      let result: number = 0;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    it('TaskPoolTestClass033', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20, 30);
      let result: number = 0;
      let isTerminate: boolean = false;
      taskpool.execute(task).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass034', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = 0;
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })

      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    it('TaskPoolTestClass035', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })

      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      let result2: number = 0;
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass036', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(task).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass037', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let isTerminate4: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      taskpool.execute(task1).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      let task2: taskpool.Task = new taskpool.Task(Multi, 10, 20);
      taskpool.execute(task2).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      let task3: taskpool.Task = new taskpool.Task(Sum, 10, 30);
      taskpool.execute(task3).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      })
      let task4: taskpool.Task = new taskpool.Task(Multi, 20, 20);
      taskpool.execute(task4).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
        await promiseCase()
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    it('TaskPoolTestClass038', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass039', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: boolean = false;
      taskpool.execute(Add, true, true).then((ret) => {
        result = ret as boolean;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(true);
      done();
    })

    it('TaskPoolTestClass040', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: string = '';
      taskpool.execute(StrCat, "abc", "def").then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdef");
      done();
    })

    it('TaskPoolTestClass041', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: string = '';
      taskpool.execute(funcStrCat, "abc", "def", "hello").then((ret) => {
        result = ret as string;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual("abcdefhello");
      done();
    })

    it('TaskPoolTestClass042', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: Array<number> = [];
      taskpool.execute(arraySum, [1,2], [3,4]).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    it('TaskPoolTestClass043', 0, async (done: Function) => {
      let aa: A = new A();
      aa.a = 1;
      aa.b = 2;
      let bb: B = new B();
      bb.a = 3;
      bb.b = 4;
      let isTerminate: boolean = false;
      let result: A = aa;
      taskpool.execute(objectSum, aa, bb).then((ret) => {
        result = ret as A;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(JSON.stringify(result)).assertEqual("{\"a\":4,\"b\":6}");
      done();
    })

    it('TaskPoolTestClass044', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    it('TaskPoolTestClass045', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      taskpool.execute(Sum, 10, 20, 30).then((ret) => {
        result = ret as number;
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass046', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Sum, 30, 40).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    it('TaskPoolTestClass047', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Sum, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      while (!isTerminate1 || !isTerminate2) {
        await promiseCase()
      }
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    it('TaskPoolTestClass048', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let isTerminate4: boolean = false;
      let result1: number = 0;
      let result2: number = 0;
      let result3: number = 0;
      let result4: number = 0;

      taskpool.execute(Sum, 10, 20).then((ret1) => {
        result1 = ret1 as number;
        isTerminate1 = true;
      })
      taskpool.execute(Multi, 10, 20).then((ret2) => {
        result2 = ret2 as number;
        isTerminate2 = true;
      })
      taskpool.execute(Sum, 10, 30).then((ret3) => {
        result3 = ret3 as number;
        isTerminate3 = true;
      })
      taskpool.execute(Multi, 20, 20).then((ret4) => {
        result4 = ret4 as number;
        isTerminate4 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
        await promiseCase()
      }

      expect(result1).assertEqual(30);
      expect(result2).assertEqual(200);
      expect(result3).assertEqual(40);
      expect(result4).assertEqual(400);
      done();
    })

    it('TaskPoolTestClass049', 0, async (done: Function) => {
      try {
        await taskpool.execute(Sum) as number;
      } catch(e) {
        expect().assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0050
     * @tc.name      : TaskPoolTestClass050
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass050', 0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        finalString += 'a';
      });
      runner.execute(task2).then(() => {
        finalString += 'b';
      });
      runner.execute(task3).then(() => {
        finalString += 'c';
      });

      await runner.execute(task4);
      expect(finalString).assertEqual("abc");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0051
     * @tc.name      : TaskPoolTestClass051
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass051', 0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        runner.execute(task1).then(() => {
          finalString += 'a';
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0052
     * @tc.name      : TaskPoolTestClass052
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass052', 0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;

      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1).then(() => {
        finalString += "a";
        isTerminate1 = true;
      })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }
      expect(finalString).assertEqual("cba");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0053
     * @tc.name      : TaskPoolTestClass053
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass053', 0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;

      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      task1.removeDependency(task2);
      task2.removeDependency(task3);
      taskpool.execute(task1).then(() => {
        finalString += "a";
        isTerminate1 = true;
      })
      taskpool.execute(task2).then(() => {
        finalString += "b";
        isTerminate2 = true;
      })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      })
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }
      expect(finalString.charAt(2)).assertEqual("c");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0054
     * @tc.name      : TaskPoolTestClass054
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass054', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 300)
      let task4: taskpool.Task = new taskpool.Task(delaySum, 20, 20, 100)
      let task5: taskpool.Task = new taskpool.Task(delaySum, 40, 40, 200)
      let task6: taskpool.Task = new taskpool.Task(delaySum, 60, 60, 300)

      try {
        task1.addDependency(task2);
        task2.addDependency(task3);
        task3.addDependency(task4);
        task4.addDependency(task5);
        task5.addDependency(task6);
        task6.addDependency(task1);
        task1.addDependency(task3);
        task1.addDependency(task5);
        task3.addDependency(task6);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: There is a circular dependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0055
     * @tc.name      : TaskPoolTestClass055
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass055', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 300)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1).then(()=>{
        console.info("task1 success");
      })
      taskpool.execute(task2).then(()=>{
        console.info("task2 success");
      })
      taskpool.execute(task3).then(()=>{
        console.info("task3 success");
      })

      try {
        task2.removeDependency(task3);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The dependency does not exist, taskpool:: executedTask cannot removeDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0056
     * @tc.name      : TaskPoolTestClass056
     * @tc.desc      : executeDelayed for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass056', 0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(WaitforRunner, "a");
      let task2: taskpool.Task = new taskpool.Task(WaitforRunner, "b");
      let task3: taskpool.Task = new taskpool.Task(WaitforRunner, "c");

      taskpool.executeDelayed(500, task1).then(() => {
        finalString += 'a';
        isTerminate1 = true;
      });
      taskpool.executeDelayed(300, task2).then(() => {
        finalString += 'b';
        isTerminate2 = true;
      });
      taskpool.executeDelayed(100, task3).then(() => {
        finalString += 'c';
        isTerminate3 = true;
      });
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }

      expect(finalString).assertEqual("cba");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0057
     * @tc.name      : TaskPoolTestClass057
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass057', 0, async (done: Function) => {
      let totalDuration: number = 0;
      let cpuDuration: number = 0;
      let ioDuration: number = 0;

      let task: taskpool.Task = new taskpool.Task(testString, "hello");
      await taskpool.execute(task);
      totalDuration = task.totalDuration;
      cpuDuration = task.cpuDuration;
      ioDuration = task.ioDuration;
      expect(totalDuration != 0).assertTrue();
      expect(cpuDuration != -1).assertTrue();
      expect(ioDuration != 0).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0058
     * @tc.name      : TaskPoolTestClass058
     * @tc.desc      : concurrentFunc for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass058', 0, async (done: Function) => {
      let result: number = await taskpool.execute(printArgsFunc, Sum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass059
     * @tc.name      : Async Function about priority task
     * @tc.desc      : Execute priority tasks
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass059', 0, async (done: Function) => {

      let allCount = 100; // 100: test number
      let taskArray: Array<taskpool.Task> = [];
      let begin: number = Date.now();
      let highTime: number = 0;
      let mediumTime: number = 0;
      let lowTime: number = 0;

      for (let i: number = 0; i < allCount; i++) {
        let task1: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task1);
        let task2: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task2);
        let task3: taskpool.Task = new taskpool.Task(testTime);
        taskArray.push(task3);
      }

      for (let i: number = 0; i < allCount; i+=3) {
        let res1: number = await taskpool.execute(taskArray[i], taskpool.Priority.HIGH) as number;
        lowTime += (res1 - begin);
        let res2: number = await taskpool.execute(taskArray[i + 1], taskpool.Priority.LOW) as number;
        mediumTime += (res2 - begin);
        let res3: number = await taskpool.execute(taskArray[i + 2], taskpool.Priority.MEDIUM) as number;
        highTime += (res3 - begin);
      }

      expect(lowTime > mediumTime && mediumTime > highTime);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass060
     * @tc.name      : Async function execute task
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass060', 0, async (done: Function) => {
      let result: number = await taskpool.execute(asyncSum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass061
     * @tc.name      : Async function execute task
     * @tc.desc      : Execute async function task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass061', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(testNumber, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass062
     * @tc.name      : Async function execute taskGroup
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass062', 0, async (done: Function) => {
      let result: Array<number> = [];
      let isTerminate: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(printArgs, 10);
      taskGroup.addTask(printArgs, 20);
      taskGroup.addTask(printArgs, 30);
      taskpool.execute(taskGroup).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass063
     * @tc.name      : Async function execute taskGroup
     * @tc.desc      : Execute async function
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass063', 0, async (done: Function) => {
      let result: Array<number> = [];
      let isTerminate: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      taskpool.execute(taskGroup).then((ret) => {
        result = ret as Array<number>;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass064
     * @tc.name      : SetTransferList for task
     * @tc.desc      : Set transfer list for the task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass064', 0, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let view: Uint8Array = new Uint8Array(buffer);
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let view1: Uint8Array = new Uint8Array(buffer1);

      let task: taskpool.Task = new taskpool.Task(setTransferListTest, view, view1);
      task.setTransferList([view.buffer, view1.buffer]);
      taskpool.execute(task).then((ret)=>{
        result = ret as number;
        isTerminate = true;
      });
      while (!isTerminate) {
        await promiseCase()
      }
      expect(result).assertEqual(24);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass065
     * @tc.name      : Async Function GetTaskPoolInfo
     * @tc.desc      : Get the taskPoolInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass065', 0, async (done: Function) => {
      let highCount: number = 0;
      let mediumCount: number = 0;
      let lowCount: number = 0;
      let allCount: number = 100;
      for (let i: number = 0; i < allCount; i++) {
        let task1: taskpool.Task = new taskpool.Task(currentFun);
        let task2: taskpool.Task = new taskpool.Task(currentFun);
        let task3: taskpool.Task = new taskpool.Task(currentFun);
        taskpool.execute(task1, taskpool.Priority.LOW).then(() => {
          lowCount++;
        }).catch((e: BusinessError) => {
          console.error("low task error: " + e);
        })
        taskpool.execute(task2, taskpool.Priority.MEDIUM).then(() => {
          mediumCount++;
        }).catch((e: BusinessError) => {
          console.error("medium task error: " + e);
        })
        taskpool.execute(task3, taskpool.Priority.HIGH).then(() => {
          highCount++;
        }).catch((e: BusinessError) => {
          console.error("high task error: " + e);
        })
      }

      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 1000) {
        continue;
      }

      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let tid: number = 0;
      let taskIds: Array<number> = [];
      let priority: number = 0;
      let taskId: number = 0;
      let state: number = 0;
      let duration: number = 0;

      for (let threadInfo of taskpoolInfo.threadInfos) {
        tid += threadInfo.tid;
        if(threadInfo.taskIds != undefined) {
          taskIds.length += threadInfo.taskIds.length;
        }
        if(threadInfo.priority != undefined) {
          priority += threadInfo.priority;
        }
      }

      for (let taskInfo of taskpoolInfo.taskInfos) {
        taskId += Number(taskInfo.taskId);
        state += taskInfo.state;
        if(taskInfo.duration != undefined) {
          duration += taskInfo.duration;
        }
      }
      console.info("task duration is: " + duration);
      expect(tid != 0).assertTrue();
      expect(taskIds.length != -1).assertTrue();
      expect(priority != -1).assertTrue();
      expect(taskId != 0).assertTrue();
      expect(state != 0).assertTrue();
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass066
     * @tc.name      : exeute task at taskpool thread
     * @tc.desc      : exeute task at taskpool thread
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass066', 0, async (done: Function) => {
      let outerTask1 = new taskpool.Task(outerTaskFunc, "001")
      let res1: string = await taskpool.execute(outerTask1) as string;
      expect(res1).assertEqual("outerTaskRes-001");

      let outerTask2 = new taskpool.Task(outerTaskFunc, "002")
      let res2: string = await taskpool.execute(outerTask2) as string;
      expect(res2).assertEqual("outerTaskRes-002");

      let res3: string = await taskpool.execute(outerTaskFunc, "001") as string;
      expect(res3).assertEqual("outerTaskRes-001");

      let res4: string = await taskpool.execute(outerTaskFunc, "002") as string;
      expect(res4).assertEqual("outerTaskRes-002");
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass067
     * @tc.name      : SharedArrayBuffer with taskpool
     * @tc.desc      : transfer SharedArrayBuffer with taskpool
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass067', 0, async (done: Function) => {
      let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
      let int32 = new Uint32Array(sab);
      let task: taskpool.Task = new taskpool.Task(transferArrayBuffer, int32);
      taskpool.execute(task).then(()=> {
        let result = int32[0] + int32[1] + int32[2] + int32[3];
        expect(result).assertEqual(1000);
      });
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass068
     * @tc.name      : SharedArrayBuffer and Atomics  with taskpool
     * @tc.desc      : transfer SharedArrayBuffer and Atomics with taskpool
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass068', 0, async (done: Function) => {
      let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
      let int32 = new Int32Array(sab);

      let task: taskpool.Task = new taskpool.Task(transferAtomics, int32);
      taskpool.execute(task).then((res) => {
        expect(res).assertEqual("ok");
      });

      let t = Date.now()
      while ((Date.now() - t) < 1000) {
        continue;
      }
      Atomics.notify(int32, 0, 1);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0069
     * @tc.name      : TaskPoolTestClass069
     * @tc.desc      : sendData and onReceiveData for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass069', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 1, 3);
      task.onReceiveData(printArgs);
      taskpool.execute(task)
      try {
        taskpool.Task.sendData(4);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The function is not called in the TaskPool thread");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0070
     * @tc.name      : TaskPoolTestClass070
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass070', 0, async (done: Function) => {
      let taskname: string = "taskName";
      let task: taskpool.Task = new taskpool.Task(taskname, Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0071
     * @tc.name      : TaskPoolTestClass071
     * @tc.desc      : add name of taskGroup for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass071', 0, async (done: Function) => {
      let taskGroupName: string = "groupName";
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup(taskGroupName);
      taskGroup.addTask(printArgs, 10);
      taskGroup.addTask(printArgs, 20);
      taskGroup.addTask(printArgs, 30);

      taskpool.execute(taskGroup).then((res) => {
        expect(res[0]).assertEqual(10);
        expect(res[1]).assertEqual(20);
        expect(res[2]).assertEqual(30);
      });
      let name: string = taskGroup.name;
      expect(name).assertEqual("groupName");
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass072
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel tasks that have not been executed
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass072', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 1, 1, 1000);
      let task2: taskpool.Task = new taskpool.Task(delaySum, 2, 2, 1000);
      let task3: taskpool.Task = new taskpool.Task(delaySum, 3, 3, 1000);
      let task4: taskpool.Task = new taskpool.Task(delaySum, 4, 4, 1000);

      taskpool.execute(task1);
      taskpool.execute(task2);
      taskpool.execute(task3);
      taskpool.execute(task4);

      let t = Date.now()
      while ((Date.now() - t) < 500) {
        continue;
      }
      taskpool.cancel(task4);;
      expect(taskpool.Task.isCanceled() == false);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass073
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the task in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass073', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400);
        let task5: taskpool.Task = new taskpool.Task(printArgs, 500);
        let task6: taskpool.Task = new taskpool.Task(printArgs, 600);
        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.execute(task4);
        taskpool.execute(task5);
        taskpool.execute(task6);

        taskpool.execute(task1);
        taskpool.cancel(task1);
      } catch(e) {
        expect(e).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      expect(taskpool.Task.isCanceled() == false);
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass074
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel the executed task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass074', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);

        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 1000) {
          continue;
        }

        taskpool.cancel(task1);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass075
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel nonexistent task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass075', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);

        taskpool.cancel(task3);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass076
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Canceling unexecuted tasks multiple times
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass076', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);

        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 1000) {
          continue;
        }

        taskpool.cancel(task3);
        taskpool.cancel(task3);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass077
     * @tc.name      : Async Function Cancel task
     * @tc.desc      : Cancel all tasks in sequence
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass077', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);
        let task4: taskpool.Task = new taskpool.Task(printArgs, 400);
        let task5: taskpool.Task = new taskpool.Task(printArgs, 500);
        let task6: taskpool.Task = new taskpool.Task(printArgs, 600);

        taskpool.execute(task1);
        taskpool.execute(task2);
        taskpool.execute(task3);
        taskpool.execute(task4);
        taskpool.execute(task5);
        taskpool.execute(task6);

        let start: number = new Date().getTime();
        while (new Date().getTime() - start < 100) {
          continue;
        }

        taskpool.cancel(task6);
        taskpool.cancel(task5);
        taskpool.cancel(task4);
        taskpool.cancel(task3);
        taskpool.cancel(task2);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass078
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the taskGroup in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass078', 0, async (done: Function) => {
      let i: number = 10;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(AdditionDelay, 10);
      taskGroup1.addTask(AdditionDelay, 20);
      taskGroup1.addTask(AdditionDelay, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);
      taskpool.execute(taskGroup1).then(() => {
        ++i;
      });
      taskpool.execute(taskGroup2);

      taskpool.cancel(taskGroup1);
      expect(i).assertEqual(10)
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass079
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the taskGroup that have not been executed
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass079', 0, async (done: Function) => {
      let i: number = 10;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(AdditionDelay, 10);
      taskGroup1.addTask(AdditionDelay, 20);
      taskGroup1.addTask(AdditionDelay, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);
      taskpool.execute(taskGroup1);
      taskpool.execute(taskGroup2).then(() => {
        ++i;
      });

      taskpool.cancel(taskGroup2);
      expect(i).assertEqual(10)
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass080
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the non-existent taskGroup
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass080', 0, async (done: Function) => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskpool.cancel(taskGroup);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : TaskPoolTestClass081
     * @tc.name      : Async Function Cancel taskGroup
     * @tc.desc      : Cancel the executed taskGroup
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass081', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(printArgs, 10);
      taskGroup1.addTask(printArgs, 20);
      taskGroup1.addTask(printArgs, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);

      taskpool.execute(taskGroup1).then(() => {
        isTerminate = true;
      });;
      taskpool.execute(taskGroup2);

      while(!isTerminate) {
        await promiseCase();
      }

      try {
        taskpool.cancel(taskGroup1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0082
     * @tc.name      : TaskPoolTestClass082
     * @tc.desc      : add setclonelist of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass082', 0, async (done: Function) => {
      let arr: Array<number> = [1, 2, 3, 4];
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let arrayInt: Int32Array = new Int32Array(arrayBuffer);
      for (let i: number = 0; i < arr.length; i++) {
        arrayInt[i] = arr[i];
      }
      let task: taskpool.Task = new taskpool.Task(setCloneListTest, arrayInt);
      task.setCloneList([arrayBuffer]);
      taskpool.execute(task).then(() => {
        expect(arrayInt[0]).assertEqual(1);
      })
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0083
     * @tc.name      : TaskPoolTestClass083
     * @tc.desc      : taskGroup cannot add groupTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass083', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup2.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add groupTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0084
     * @tc.name      : TaskPoolTestClass084
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass084', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0085
     * @tc.name      : TaskPoolTestClass085
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass085', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0086
     * @tc.name      : TaskPoolTestClass086
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass086', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0087
     * @tc.name      : TaskPoolTestClass087
     * @tc.desc      : dependent task not allowed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass087', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        task1.addDependency(task2);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0088
     * @tc.name      : TaskPoolTestClass088
     * @tc.desc      : taskgroup
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass088', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task1);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[0]).assertEqual(100);
        });
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[1]).assertEqual(200);
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: executed taskGroup cannot addTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0089
     * @tc.name      : TaskPoolTestClass089
     * @tc.desc      : SequenceRunner cannot execute groupTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass089', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute groupTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0090
     * @tc.name      : TaskPoolTestClass090
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass090', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0091
     * @tc.name      : TaskPoolTestClass091
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass091', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0092
     * @tc.name      : TaskPoolTestClass092
     * @tc.desc      : dependent task not allowed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass092', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        task1.addDependency(task2);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0093
     * @tc.name      : TaskPoolTestClass093
     * @tc.desc      : SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass093', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner1.execute(task).then(() => {
        });
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner2.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0094
     * @tc.name      : TaskPoolTestClass094
     * @tc.desc      : groupTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass094', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task.addDependency(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0095
     * @tc.name      : TaskPoolTestClass095
     * @tc.desc      : groupTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass095', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task1.addDependency(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0096
     * @tc.name      : TaskPoolTestClass096
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass096', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task2);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0097
     * @tc.name      : TaskPoolTestClass097
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass097', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task2);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0098
     * @tc.name      : TaskPoolTestClass098
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass098', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task1);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0099
     * @tc.name      : TaskPoolTestClass099
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass099', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100,task1);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0100
     * @tc.name      : TaskPoolTestClass100
     * @tc.desc      : seqRunnerTask or executedTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass100', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task2).then(() => {
        });
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0101
     * @tc.name      : TaskPoolTestClass101
     * @tc.desc      : seqRunnerTask or executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass101', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0102
     * @tc.name      : TaskPoolTestClass102
     * @tc.desc      : groupTask cannot be relied on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass102', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task1.addDependency(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot be relied on");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0103
     * @tc.name      : TaskPoolTestClass103
     * @tc.desc      : groupTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass103', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        let task1: taskpool.Task = new taskpool.Task(printArgs, 200);
        task.addDependency(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0104
     * @tc.name      : TaskPoolTestClass104
     * @tc.desc      : seqRunnerTask cannot execute outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass104', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        taskpool.execute(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot execute outside");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0105
     * @tc.name      : TaskPoolTestClass105
     * @tc.desc      : groupTask cannot execute outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass105', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.execute(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot execute outside");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0106
     * @tc.name      : TaskPoolTestClass106
     * @tc.desc      : seqRunnerTask cannot executeDelayed outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass106', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner.execute(task1).then(() => {
        });
        taskpool.executeDelayed(100, task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot executeDelayed outside");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0107
     * @tc.name      : TaskPoolTestClass107
     * @tc.desc      : groupTask cannot executeDelayed outside
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass107', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup1.addTask(task);
        taskpool.executeDelayed(100, task)
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: groupTask cannot executeDelayed outside");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0108
     * @tc.name      : TaskPoolTestClass108
     * @tc.desc      : cancel the executeDelay task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass108', 0, async (done: Function) => {
      let result: number = 0;
      let task: taskpool.Task = new taskpool.Task(printArgs, 100);
      taskpool.executeDelayed(1000, task).then((ret)=>{
        result = ret as number;
      })
      let t = Date.now()
      while ((Date.now() - t) < 500) {
        continue;
      }
      taskpool.cancel(task)
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0109
     * @tc.name      : TaskPoolTestClass109
     * @tc.desc      : executedTask with dependency cannot executeDelayed again
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass109', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      task1.addDependency(task2);
      taskpool.execute(task1).then(()=>{
      })
      taskpool.execute(task2).then(()=>{
      })
      try {
        taskpool.execute(task1)
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: executedTask with dependency cannot execute again");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0110
     * @tc.name      : TaskPoolTestClass110
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass110', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      try {
        task.name = "taskName1";
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("TypeError: Cannot set property when setter is undefined");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0111
     * @tc.name      : TaskPoolTestClass111
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass111', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      expect(task.name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0112
     * @tc.name      : TaskPoolTestClass112
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass112', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("Sum");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0113
     * @tc.name      : TaskPoolTestClass113
     * @tc.desc      : get name from taskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass113', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20)
      taskpool.execute(task).then(()=>{
        console.info("task1 success");
      })
      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 500) {
        continue;
      }
      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let name = "";
      for (let taskInfo of taskpoolInfo.taskInfos) {
        name = taskInfo.name;
      }
      expect(name != "").assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0114
     * @tc.name      : TaskPoolTestClass114
     * @tc.desc      : get name from taskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass114', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20)
      taskpool.execute(task).then(()=>{
        console.info("task1 success");
      })
      let start: number = new Date().getTime();
      while (new Date().getTime() - start < 500) {
        continue;
      }
      let taskpoolInfo = taskpool.getTaskPoolInfo();
      let name = "";
      for (let taskInfo of taskpoolInfo.taskInfos) {
        name = taskInfo.name;
      }
      expect(name != "").assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0115
     * @tc.name      : TaskPoolTestClass115
     * @tc.desc      : Register a callback of onEnqueued
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass115', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs, 1);
      let onEnqueuedStr = "";
      task.onEnqueued(()=>{
        onEnqueuedStr = "onEnqueued";
      })

      let onStartExecutionStr = "";
      task.onStartExecution(()=>{
        onStartExecutionStr = "onStartExecution";
      })

      let onExecutionSucceededStr = "";
      task.onExecutionSucceeded(()=>{
        onExecutionSucceededStr = "onExecutionSucceeded";
      })

      taskpool.execute(task).then(()=> {
        isTerminate1 = true;
      });
      while (!isTerminate1) {
        await promiseCase()
      }
      expect(onEnqueuedStr).assertEqual("onEnqueued");
      expect(onStartExecutionStr).assertEqual("onStartExecution");
      expect(onExecutionSucceededStr).assertEqual("onExecutionSucceeded");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0116
     * @tc.name      : TaskPoolTestClass116
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass116', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(testCancelDelayed);
      let task2: taskpool.Task = new taskpool.Task(testCancelDelayed);
      try {
        taskpool.cancel(task1);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }

      taskpool.execute(task2).then(()=>{
      }).catch((e:BusinessError)=>{
        isTerminate1 = true;
        expect((e as BusinessError).toString()).assertEqual("BusinessError: taskpool:: task has been canceled");
      })
      taskpool.cancel(task2);
      while (!isTerminate1) {
        await promiseCase()
      }

      taskpool.execute(task2).then(()=>{
        isTerminate2 = true;
      })
      while (!isTerminate2) {
        await promiseCase()
      }
      try {
        taskpool.cancel(task2);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0117
     * @tc.name      : TaskPoolTestClass117
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass117', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs)
      taskpool.executeDelayed(1000, task).then(()=>{
      }).catch((e:BusinessError)=>{
        isTerminate1 = true;
        expect((e as BusinessError).toString()).assertEqual("BusinessError: taskpool:: task has been canceled");
      })
      taskpool.cancel(task);
      while (!isTerminate1) {
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0118
     * @tc.name      : TaskPoolTestClass118
     * @tc.desc      : Register a callback of onExecutionFailed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass118', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(hashMapTest, 1);
      task.onExecutionFailed((e: Error)=>{
        expect((e as BusinessError).toString()).assertEqual("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })

      taskpool.execute(task).then((res)=>{
      }).catch((e:BusinessError)=>{
        expect((e as BusinessError).toString()).assertEqual("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0119
     * @tc.name      : TaskPoolTestClass119
     * @tc.desc      : Register a callback of onEnqueued after execute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass119', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs, 1);

      taskpool.execute(task).then(()=> {
        isTerminate1 = true;
      });

      let onEnqueuedStr = "";
      try {
        task.onEnqueued(()=>{
          onEnqueuedStr = "onEnqueued";
        })
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The executed task does not support the registration of listeners.");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0120
     * @tc.name      : TaskPoolTestClass120
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass120', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(delay);
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      let terminate: boolean = false;
      taskpool.execute(task).then(()=>{
        terminate = true;
        expect(task.totalDuration > 0).assertTrue();
        expect(task.ioDuration).assertEqual(0);
        expect(task.totalDuration).assertEqual(task.cpuDuration);
      })

      let exeution: boolean = false;
      while (!terminate) {
        if (!exeution) {
          expect(task.totalDuration < 5).assertTrue();
          expect(task.ioDuration < 5).assertTrue();
          exeution = true;
        }
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0121
     * @tc.name      : TaskPoolTestClass121
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass121', 0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      task1.addDependency(task2);
      let runner = new taskpool.SequenceRunner();
      try {
        runner.execute(task1).then(() => {
          finalString += 'a';
        });
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
        expect(task1.totalDuration < 5).assertTrue();
        expect(task1.cpuDuration < 5).assertTrue();
        expect(task1.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0122
     * @tc.name      : TaskPoolTestClass122
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass122', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      taskpool.execute(task);
      let start = new Date().getTime();
      while (new Date().getTime() - start < 100) {
        continue;
      }
      taskpool.cancel(task);
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0123
     * @tc.name      : TaskPoolTestClass123
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass123', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(randomTest, 100);
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      let terminate: boolean = false;
      taskpool.execute(task).then(()=>{
        terminate = true;
        expect(task.totalDuration > 0).assertTrue();
        expect(task.ioDuration > 0).assertTrue();
        expect(task.cpuDuration > 0).assertTrue();
        expect(task.totalDuration == task.ioDuration + task.cpuDuration).assertTrue();
      })

      let exeution: boolean = false;
      while (!terminate) {
        if (!exeution) {
          expect(task.totalDuration < 5).assertTrue();
          expect(task.ioDuration < 5).assertTrue();
          exeution = true;
        }
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0124
     * @tc.name      : TaskPoolTestClass124
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass124', 0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      task1.addDependency(task2);
      let runner = new taskpool.SequenceRunner();
      try {
        runner.execute(task1).then(() => {
          finalString += 'a';
        });
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
        expect(task1.totalDuration < 5).assertTrue();
        expect(task1.cpuDuration < 5).assertTrue();
        expect(task1.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0125
     * @tc.name      : TaskPoolTestClass125
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass125', 0,  async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      taskpool.execute(task);
      let start = new Date().getTime();
      while (new Date().getTime() - start < 100) {
        continue;
      }
      taskpool.cancel(task);
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0126
     * @tc.name      : TaskPoolTestClass126
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass126', 0,  async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delay, 100);
      let task2: taskpool.Task = new taskpool.Task(delay, 200);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      expect(task1.totalDuration < 5).assertTrue();
      expect(task1.cpuDuration < 5).assertTrue();
      expect(task1.ioDuration < 5).assertTrue();

      let terminate: boolean = false;
      taskpool.execute(taskGroup).then((res) => {
        terminate = true;
        expect(task1.totalDuration > 0).assertTrue();
        expect(task1.ioDuration).assertEqual(0);
        expect(task1.totalDuration).assertEqual(task1.cpuDuration);
      });

      let exeution: boolean = false;
      while (!terminate) {
        if (!exeution) {
          expect(task1.totalDuration < 5).assertTrue();
          expect(task1.ioDuration < 5).assertTrue();
          exeution = true;
        }
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0127
     * @tc.name      : TaskPoolTestClass127
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass127', 0,  async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      try {
        taskGroup.addTask(task1);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[0]).assertEqual(100);
        });
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup).then((res) => {
          expect(res[1]).assertEqual(200);
        });
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: executed taskGroup cannot addTask");
        expect(task1.totalDuration < 5).assertTrue();
        expect(task1.cpuDuration < 5).assertTrue();
        expect(task1.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0128
     * @tc.name      : TaskPoolTestClass128
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass128', 0,  async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(randomTest, 100);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      let terminate: boolean = false;
      taskpool.execute(taskGroup).then(()=>{
        terminate = true;
        expect(task.totalDuration > 0).assertTrue();
        expect(task.ioDuration > 0).assertTrue();
        expect(task.cpuDuration > 0).assertTrue();
        expect(task.totalDuration == task.ioDuration + task.cpuDuration).assertTrue();
      })

      let exeution: boolean = false;
      while (!terminate) {
        if (!exeution) {
          expect(task.totalDuration < 5).assertTrue();
          expect(task.ioDuration < 5).assertTrue();
          exeution = true;
        }
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0129
     * @tc.name      : TaskPoolTestClass129
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass129', 0,  async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

      expect(task1.totalDuration < 5).assertTrue();
      expect(task1.cpuDuration < 5).assertTrue();
      expect(task1.ioDuration < 5).assertTrue();

      let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        finalString += 'a';
      });
      runner.execute(task2).then(() => {
        finalString += 'b';
      });
      runner.execute(task3).then(() => {
        finalString += 'c';
      });

      expect(task1.totalDuration < 5).assertTrue();
      expect(task1.cpuDuration < 5).assertTrue();
      expect(task1.ioDuration < 5).assertTrue();

      await runner.execute(task4);
      expect(finalString).assertEqual("abc");
      expect(task1.totalDuration > 0).assertTrue();
      expect(task1.ioDuration).assertEqual(0);
      expect(task1.totalDuration).assertEqual(task1.cpuDuration);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0130
     * @tc.name      : TaskPoolTestClass130
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass130', 0,  async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(randomTest, 500);
      let task2: taskpool.Task = new taskpool.Task(randomTest, 300);
      let task3: taskpool.Task = new taskpool.Task(randomTest, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

      expect(task1.totalDuration < 5).assertTrue();
      expect(task1.cpuDuration < 5).assertTrue();
      expect(task1.ioDuration < 5).assertTrue();

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        finalString += 'a';
      });
      runner.execute(task2).then(() => {
        finalString += 'b';
      });
      runner.execute(task3).then(() => {
        finalString += 'c';
      });

      expect(task1.totalDuration < 5).assertTrue();
      expect(task1.cpuDuration < 5).assertTrue();
      expect(task1.ioDuration < 5).assertTrue();

      await runner.execute(task4);
      expect(finalString).assertEqual("abc");
      expect(task1.totalDuration > 0).assertTrue();
      expect(task1.ioDuration > 0).assertTrue();
      expect(task1.cpuDuration > 0).assertTrue();
      expect(task1.totalDuration == task1.ioDuration + task1.cpuDuration).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0131
     * @tc.name      : TaskPoolTestClass131
     * @tc.desc      : duration for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass131', 0,  async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      expect(task.totalDuration < 5).assertTrue();
      expect(task.cpuDuration < 5).assertTrue();
      expect(task.ioDuration < 5).assertTrue();
      try {
        runner.execute(task).then((ret) => {
        });
        taskGroup.addTask(task);

      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
        expect(task.totalDuration < 5).assertTrue();
        expect(task.cpuDuration < 5).assertTrue();
        expect(task.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0132
     * @tc.name      : TaskPoolTestClass132
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass132', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      taskpool.executeDelayed(500, task1, taskpool.Priority.HIGH).then(() => {
        finalString += 'a';
        isTerminate1 = true;
      });
      taskpool.executeDelayed(1000, task1, taskpool.Priority.MEDIUM).then(() => {
        finalString += 'b';
        isTerminate2 = true;
      });
      taskpool.executeDelayed(1500, task1, taskpool.Priority.LOW).then(() => {
        finalString += 'c';
        isTerminate3 = true;
      });
      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase()
      }
      expect(finalString).assertEqual("abc");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0133
     * @tc.name      : TaskPoolTestClass133
     * @tc.desc      : handle cancel task error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass133', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let isTerminate4: boolean = false;
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(dependend, 1);
      let task2: taskpool.Task = new taskpool.Task(dependend, 2);
      let task3: taskpool.Task = new taskpool.Task(dependend, 3);
      let task4: taskpool.Task = new taskpool.Task(dependend, 4);
      task4.addDependency(task1, task2, task3);
      taskpool.execute(task1).then(() => {
        finalString += 'a';
        isTerminate1 = true;
      });
      taskpool.execute(task2).then(() => {
        finalString += 'b';
        isTerminate2 = true;
      });
      taskpool.execute(task3).then(() => {
        finalString += 'c';
        isTerminate3 = true;
      });
      taskpool.execute(task4).then(() => {
        finalString += 'd';
        isTerminate4 = true;
      });
      while (!isTerminate1 || !isTerminate2 || !isTerminate3 || !isTerminate4) {
        await promiseCase()
      }
      expect(finalString.charAt(3)).assertEqual("d");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0134
     * @tc.name      : TaskPoolTestClass134
     * @tc.desc      : execute long task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass134', 0, async (done: Function) => {
      let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10, 20);
      let result = await taskpool.execute(task);
      taskpool.terminateTask(task);
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0135
     * @tc.name      : TaskPoolTestClass135
     * @tc.desc      : the long task can only be executed once
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass135', 0, async (done: Function) => {
      let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10, 20);
      let result = await taskpool.execute(task);
      taskpool.terminateTask(task);
      try {
        taskpool.execute(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: The long task can only be executed once");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0136
     * @tc.name      : TaskPoolTestClass136
     * @tc.desc      : task group does not support the long task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass136', 0, async (done: Function) => {
      let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10, 20);
      let group = new taskpool.TaskGroup();
      try {
        group.addTask(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: The interface does not support the long task");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0137
     * @tc.name      : TaskPoolTestClass137
     * @tc.desc      : Supports judging whether it is concurrent function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass137', 0, async (done: Function) => {
      let ret : boolean = taskpool.isConcurrent(isConcurrentTest1)
      expect(ret).assertEqual(true);
      ret = taskpool.isConcurrent(isConcurrentTest2)
      expect(ret).assertEqual(false)
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0138
     * @tc.name      : TaskPoolTestClass138
     * @tc.desc      : taskpool support isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass138', 0, async (done: Function) => {
      let isFinish: boolean = false;
      let isDoneFlag: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);

      taskpool.execute(task1).then(()=>{
        isFinish = true;
      });
      while(!isFinish) {
        await promiseCase();
      }
      if(!task1.isDone()) {
        taskpool.cancel(task1);
        isDoneFlag = true;
      }
      expect(isDoneFlag).assertEqual(false);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0139
     * @tc.name      : TaskPoolTestClass139
     * @tc.desc      : taskpool support isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass139', 0, async (done: Function) => {
      let isDoneFlag: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(testCancelDelayed);
      taskpool.execute(task1);
      let t = Date.now()
      while ((Date.now() - t) < 1000) {
        continue;
      }
      taskpool.execute(task1);
      taskpool.execute(task1);
      if (!task1.isDone()) {
        taskpool.cancel(task1);
        isDoneFlag = true;
      }
      expect(isDoneFlag).assertEqual(true);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0140
     * @tc.name      : TaskPoolTestClass140
     * @tc.desc      : taskpool error test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass140', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(errorTest)
      taskpool.execute(task).then((res)=>{
        console.info("errTest res " + res)
      }).catch((e:BusinessError)=>{
        expect(e.message).assertContain("this is an error");
      })
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0141
     * @tc.name      : TaskPoolTestClass141
     * @tc.desc      : addDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass141', 0, async (done: Function) => {
      let finalString: string = "";
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;

      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1, taskpool.Priority.IDLE).then(() => {
        finalString += "a";
        isTerminate1 = true;
      })
      taskpool.execute(task2, taskpool.Priority.IDLE).then(() => {
        finalString += "b";
        isTerminate2 = true;
      })
      taskpool.execute(task3).then(() => {
        finalString += "c";
        isTerminate3 = true;
      })
      while (!isTerminate3) {
        await promiseCase()
      }
      expect(finalString.charAt(0)).assertEqual("c");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0142
     * @tc.name      : TaskPoolTestClass142
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass142', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 300)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 500)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1, taskpool.Priority.IDLE);
      taskpool.execute(task2, taskpool.Priority.IDLE);
      taskpool.execute(task3, taskpool.Priority.IDLE);
      taskpool.cancel(task1);
      try {
        task1.removeDependency(task2);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The dependency does not exist, taskpool:: executedTask cannot removeDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0143
     * @tc.name      : TaskPoolTestClass143
     * @tc.desc      : removeDependency for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass143', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(delaySum, 10, 20, 100)
      let task2: taskpool.Task = new taskpool.Task(delaySum, 30, 40, 200)
      let task3: taskpool.Task = new taskpool.Task(delaySum, 50, 60, 300)
      task1.addDependency(task2);
      task2.addDependency(task3);
      taskpool.execute(task1, taskpool.Priority.IDLE).then(()=>{
        console.info("task1 success");
      })
      taskpool.execute(task2, taskpool.Priority.IDLE).then(()=>{
        console.info("task2 success");
      })
      taskpool.execute(task3, taskpool.Priority.IDLE).then(()=>{
        console.info("task3 success");
      })

      try {
        task2.removeDependency(task3);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The dependency does not exist, taskpool:: executedTask cannot removeDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0144
     * @tc.name      : TaskPoolTestClass144
     * @tc.desc      : executedTask cannot addDependency
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass144', 0, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task1, taskpool.Priority.IDLE);
        task1.addDependency(task2);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask or executedTask cannot addDependency");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0145
     * @tc.name      : TaskPoolTestClass145
     * @tc.desc      : Cancel the executeDelayed for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass145', 0, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(printArgs)
      taskpool.executeDelayed(1000, task, taskpool.Priority.IDLE).then(()=>{
      }).catch((e:BusinessError)=>{
        isTerminate1 = true;
        expect((e as BusinessError).toString()).assertEqual("BusinessError: taskpool:: task has been canceled");
      })
      taskpool.cancel(task);
      while (!isTerminate1) {
        await promiseCase()
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0146
     * @tc.name      : TaskPoolTestClass146
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass146', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
        runner.execute(task);
        taskpool.executeDelayed(100, task, taskpool.Priority.IDLE);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot executeDelayed outside");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0147
     * @tc.name      : TaskPoolTestClass147
     * @tc.desc      : SequenceRunner for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass147', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
      try {
        runner.execute(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0148
     * @tc.name      : TaskPoolTestClass148
     * @tc.desc      : taskGroup cannot add seqRunnerTask or executedTask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass148', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
        runner.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0149
     * @tc.name      : TaskPoolTestClass149
     * @tc.desc      : taskGroup cannot addTask
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass149', 0, async (done: Function) => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 40);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 50);
      try {
        taskGroup.addTask(printArgs, 10);
        taskGroup.addTask(printArgs, 20);
        taskGroup.addTask(printArgs, 30);
        taskpool.execute(taskGroup, taskpool.Priority.IDLE);
        taskGroup.addTask(task1);
        taskGroup.addTask(task2);
        taskpool.execute(taskGroup, taskpool.Priority.IDLE);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: executed taskGroup cannot addTask");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0150
     * @tc.name      : TaskPoolTestClass150
     * @tc.desc      : Cancel the taskGroup in progress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass150', 0, async (done: Function) => {
      let i: number = 10;
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(AdditionDelay, 10);
      taskGroup1.addTask(AdditionDelay, 20);
      taskGroup1.addTask(AdditionDelay, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 200);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);
      taskpool.execute(taskGroup1, taskpool.Priority.IDLE).then(() => {
        ++i;
      });
      taskpool.execute(taskGroup2, taskpool.Priority.IDLE);

      taskpool.cancel(taskGroup1);
      expect(i).assertEqual(10)
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0151
     * @tc.name      : TaskPoolTestClass151
     * @tc.desc      : Cancel the executed taskGroup
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass151', 0, async (done: Function) => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup1.addTask(printArgs, 10);
      taskGroup1.addTask(printArgs, 20);
      taskGroup1.addTask(printArgs, 30);

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

      taskGroup2.addTask(task1);
      taskGroup2.addTask(task2);
      taskGroup2.addTask(task3);

      taskpool.execute(taskGroup1, taskpool.Priority.IDLE);
      taskpool.execute(taskGroup2, taskpool.Priority.IDLE);

      setTimeout(()=>{
        try {
          taskpool.cancel(taskGroup1);
        } catch(e) {
          expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
        }
      }, 3000);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0152
     * @tc.name      : TaskPoolTestClass152
     * @tc.desc      : SequenceRunner with name execute task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass152', 0, async (done: Function) => {
      let finalString = "";
      let t: Array<taskpool.Task> = []
      for (let i = 0; i <= 10; i++) {
        t[i] = new taskpool.Task(printArgs, i);
      }

      let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner1");
      for (let i = 0; i < 10; i++) {
        runner.execute(t[i]).then((d) => {
          finalString += d;
        })
      }
      await runner.execute(t[10]);
      expect(finalString).assertEqual("0123456789");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0153
     * @tc.name      : TaskPoolTestClass153
     * @tc.desc      : Multiple sequenceRunner with name execute task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass153', 0, async (done: Function) => {
      let finalString1 = "";
      let finalString2 = "";
      let finalString3 = "";
      let t: Array<taskpool.Task> = []
      for (let i = 0; i <= 20; i++) {
        t[i] = new taskpool.Task(printArgs, i);
      }
      let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner2", taskpool.Priority.LOW);
      let runner2:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner3", taskpool.Priority.MEDIUM);
      let runner3:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner4", taskpool.Priority.HIGH);
      for (let i = 0; i < 20; i++) {
        if (i % 3 == 0) {
          finalString1 += await runner.execute(t[i]) + ',';
        } else if (i % 3 == 1) {
          finalString2 += await runner2.execute(t[i]) + ',';
        } else {
          finalString3 += await runner3.execute(t[i]) + ',';
        }
      }
      expect(finalString1).assertEqual("0,3,6,9,12,15,18,");
      expect(finalString2).assertEqual("1,4,7,10,13,16,19,");
      expect(finalString3).assertEqual("2,5,8,11,14,17,");
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0154
     * @tc.name      : TaskPoolTestClass154
     * @tc.desc      : SequenceRunner repeating tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass154', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 1);

      let runner1:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner5");
      let runner2:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner6");
      try {
        runner1.execute(task);
        runner2.execute(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0155
     * @tc.name      : TaskPoolTestClass155
     * @tc.desc      : The task of the task group is executed in SequenceRunner
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass155', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 1);

      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner7", taskpool.Priority.LOW);
        runner1.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: taskGroup cannot add seqRunnerTask or executedTask");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0156
     * @tc.name      : TaskPoolTestClass156
     * @tc.desc      : Tasks with dependencies are executed in SequenceRunner
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass156', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 300);
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      task1.addDependency(task2);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner8", taskpool.Priority.LOW);
      try {
        runner.execute(task1);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: seqRunner:: dependent task not allowed.");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0157
     * @tc.name      : TaskPoolTestClass157
     * @tc.desc      : sequenceRunner with name execute delayed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass157', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner9");
        runner.execute(task).then(() => {
        });
        taskpool.executeDelayed(100, task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot executeDelayed outside");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0158
     * @tc.name      : TaskPoolTestClass158
     * @tc.desc      : sequenceRunner with name execute executed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass158', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.execute(task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner10");
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0159
     * @tc.name      : TaskPoolTestClass159
     * @tc.desc      : sequenceRunner with name execute delayed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass159', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(100, task);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner11");
        runner.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0160
     * @tc.name      : TaskPoolTestClass160
     * @tc.desc      : sequenceRunner with name and non-name execute delayed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass160', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
        runner1.execute(task).then(() => {
        });
        let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner12");
        runner2.execute(task).then(() => {
        });
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: SequenceRunner cannot execute seqRunnerTask or executedTask");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0161
     * @tc.name      : TaskPoolTestClass161
     * @tc.desc      : sequenceRunner with name execute executed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass161', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner13");
        runner.execute(task).then(() => {
        });
        taskpool.execute(task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot execute outside");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0162
     * @tc.name      : TaskPoolTestClass162
     * @tc.desc      : sequenceRunner with name execute delayed task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass162', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner("runner14");
        runner.execute(task).then(() => {
        });
        taskpool.executeDelayed(100, task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, taskpool:: seqRunnerTask cannot executeDelayed outside");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0163
     * @tc.name      : TaskPoolTestClass163
     * @tc.desc      : Repeat SequenceRunner execution on the same thread
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass163', 0, async (done: Function) => {
      try {
        let task1 = new taskpool.Task(printArgs, 111);
        let task2 = new taskpool.Task(printArgs, 222);
        let runner1:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner15");
        runner1.execute(task1).then((res) => {
        })
        let runner2:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner15");
        runner2.execute(task2).then((res) => {
        })
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters " +
            "are invalid, seqRunner:: the js gloableSeqRunner has been created in the current thread.");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0164
     * @tc.name      : TaskPoolTestClass164
     * @tc.desc      : Multi threaded execution of SequenceRunner
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass164', 0, async (done: Function) => {
      let mainFinalString = "";
      let childFinalString = "";
      let t: Array<taskpool.Task> = []
      for (let i = 0; i < 100; i++) {
        t[i] = new taskpool.Task(printArgs, i);
      }

      let runner:taskpool.SequenceRunner = new taskpool.SequenceRunner("runner16");
      for (let i = 0; i < 20; i++) {
        if (i % 2 == 0) {
          mainFinalString += await runner.execute(t[i]) + ',';
        }
      }

      let task1 = new taskpool.Task(sequenceRunnerTest);
      childFinalString = await taskpool.execute(task1) as string;

      expect(mainFinalString).assertEqual("0,2,4,6,8,10,12,14,16,18,");
      expect(childFinalString).assertEqual("1,3,5,7,9,11,13,15,17,19,");

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0165
     * @tc.name      : TaskPoolTestClass165
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass165', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        taskpool.execute(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot be executed again, taskpool:: the periodicTask cannot execute again");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0166
     * @tc.name      : TaskPoolTestClass166
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass166', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        taskpool.executeDelayed(100, task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot be executed again, taskpool:: the periodicTask cannot executeDelayed");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0167
     * @tc.name      : TaskPoolTestClass167
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass167', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        let task1 = new taskpool.Task(dependend, 300);
        task.addDependency(task1);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot have a dependency.");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0168
     * @tc.name      : TaskPoolTestClass168
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass168', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        let task1 = new taskpool.Task(dependend, 300);
        task1.addDependency(task);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot have a dependency.");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0169
     * @tc.name      : TaskPoolTestClass169
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass169', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        let taskGroup = new taskpool.TaskGroup();
        taskGroup.addTask(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot be executed again, taskpool:: The interface does not support the periodicTask");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0170
     * @tc.name      : TaskPoolTestClass170
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass170', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        let runner = new taskpool.SequenceRunner()
        runner.execute(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot be executed again, taskpool:: SequenceRunner cannot execute the periodicTask");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0171
     * @tc.name      : TaskPoolTestClass171
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass171', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        let runner = new taskpool.SequenceRunner()
        runner.execute(task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The periodic task cannot be executed again, taskpool:: SequenceRunner cannot execute the periodicTask");
      }
      taskpool.cancel(task);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0172
     * @tc.name      : TaskPoolTestClass172
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass172', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.executePeriodically(100, task)
      try {
        taskpool.executePeriodically(1000, task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }

      let t = Date.now();
      while ((Date.now() - t) < 3000) {
        continue;
      }
      taskpool.cancel(task)

      let time = Date.now();
      while ((Date.now() - time) < 2000) {
        continue;
      }
      try {
        taskpool.executePeriodically(1000, task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0173
     * @tc.name      : TaskPoolTestClass173
     * @tc.desc      : taskpool support executePeriodically interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass173', 0, async (done: Function) => {
      let task = new taskpool.Task(dependend, 200);
      taskpool.execute(task)
      try {
        taskpool.executePeriodically(100, task)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }

      let task1 = new taskpool.Task(dependend, 200);
      let taskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task1)
      try {
        taskpool.executePeriodically(100, task1)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }

      let task2 = new taskpool.Task(dependend, 200);
      let runner = new taskpool.SequenceRunner()
      runner.execute(task2)
      try {
        taskpool.executePeriodically(100, task2)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }

      let task3 = new taskpool.Task(dependend, 200);
      let task4 = new taskpool.Task(dependend, 200);
      task3.addDependency(task4)
      try {
        taskpool.executePeriodically(100, task3)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: the task with dependency cannot executePeriodically");
      }
      try {
        taskpool.executePeriodically(100, task4)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, " +
            "taskpool:: the task with dependency cannot executePeriodically");
      }

      let task5 = new taskpool.Task(dependend, 200);
      taskpool.executeDelayed(1000, task5)
      try {
        taskpool.executePeriodically(100, task5)
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The concurrent task has been executed and cannot be executed periodically.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0174
     * @tc.name      : TaskPoolTestClass174
     * @tc.desc      : taskpool repeatedly calling Cancel and ExecuteDelayed, only last task can execute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass174', 0, async (done: Function) => {
      let num = 100;
      let base1:CancelAndExecuteDelayed = new CancelAndExecuteDelayed(num);
      base1.postRequest();
      let i = 0;
      let time = setInterval(() => {
        base1.postRequest();
        i++;
      }, 500);
      setTimeout(() => {
        clearInterval(time);
      }, 2000);
      while (!base1.isTerminate) {
        await promiseCase()
      }
      expect(base1.i).assertEqual(1);
      expect(base1.res).assertEqual(num);
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0175
     * @tc.name      : TaskPoolTestClass175
     * @tc.desc      : taskpool calling callback which have errorManage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     it('TaskPoolTestClass175', 0, async (done: Function) => {
      let isTerminate: boolean = false;
      taskpool.execute(errorManageTest).then((ret) => {
        isTerminate = true;
        console.log("execute errorManageTest");
        expect(!ret).assertTrue();
      })
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0176
     * @tc.name      : TaskPoolTestClass176
     * @tc.desc      : taskpool executeDelayed failed to serialize result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass176', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(hashMapTest, 1);
      await taskpool.executeDelayed(500, task).catch((e: Error)=>{
        expect((e as BusinessError).toString()).assertEqual("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0177
     * @tc.name      : TaskPoolTestClass177
     * @tc.desc      : taskpool executeDelayed failed to serialize arguments
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass177', 0, async (done: Function) => {
      let hashMap:HashMap<string, number> = new HashMap();
      hashMap.set("b", 234);
      let task: taskpool.Task = new taskpool.Task(dealHashMapTest, hashMap);
      try {
        taskpool.executeDelayed(500, task)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      done();
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0178
     * @tc.name      : TaskPoolTestClass178
     * @tc.desc      : taskpool executeDelayed failed to task is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass178', 0, async (done: Function) => {
      try {
        taskpool.executeDelayed(500, null)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, the type of the second param must be object.");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0179
     * @tc.name      : TaskPoolTestClass179
     * @tc.desc      : taskpool executeDelayed failed to serialize function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass179', 0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(noUseConcurrentTest, "a");
      try {
        taskpool.executeDelayed(500, task)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The function is not marked as concurrent, taskpool: failed to serialize function.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0180
     * @tc.name      : TaskPoolTestClass180
     * @tc.desc      : taskpool executePeriodically failed to serialize arguments
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass180', 0, async (done: Function) => {
      try {
        let task = new taskpool.Task(printArgs, isConcurrentTest2);
        taskpool.executePeriodically(10, task, taskpool.Priority.HIGH)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      done();
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0181
     * @tc.name      : TaskPoolTestClass181
     * @tc.desc      : taskpool executeDelayed failed to serialize function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass181', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(isConcurrentTest2);
        taskpool.executePeriodically(10, task, taskpool.Priority.HIGH)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The function is not marked as concurrent, taskpool: failed to serialize function.");
      }

      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0182
     * @tc.name      : TaskPoolTestClass182
     * @tc.desc      : taskpool executeDelayed failed to serialize function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass182', 0, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executePeriodically(-10, task, taskpool.Priority.HIGH)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The period value is less than zero.");
      }
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0183
     * @tc.name      : TaskPoolTestClass183
     * @tc.desc      : taskpool isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass183', 0, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      let result1: number = await taskpool.execute(task1) as number;
      expect(task1.isDone()).assertTrue();

      let isFinish: boolean = false;
      let task2: taskpool.Task = new taskpool.Task(printArgs, 100);
      taskpool.execute(task2).then(()=>{
        isFinish = true;
        expect(task2.isDone()).assertTrue();
      });
      while(!isFinish) {
        await promiseCase();
      }
      expect(task2.isDone()).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0184
     * @tc.name      : TaskPoolTestClass184
     * @tc.desc      : taskpool isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass184', 0, async (done: Function) => {
      let finalString: string = "";
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task3: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
      let task4: taskpool.Task = new taskpool.Task(WaitforRunner, finalString);

      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1).then(() => {
        finalString += 'a';
        expect(task1.isDone()).assertTrue();
      });
      runner.execute(task2).then(() => {
        finalString += 'b';
        expect(task2.isDone()).assertTrue();
      });
      runner.execute(task3).then(() => {
        finalString += 'c';
        expect(task3.isDone()).assertTrue();
      });

      await runner.execute(task4);
      expect(task4.isDone()).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0185
     * @tc.name      : TaskPoolTestClass185
     * @tc.desc      : taskpool isDone interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('TaskPoolTestClass185', 0, async (done: Function) => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
      taskGroup1.addTask(task1);
      taskpool.execute(taskGroup1).then(() => {
        expect(task1.isDone()).assertTrue();
      });

      let taskGroup2: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
      taskGroup2.addTask(task2);
      await taskpool.execute(taskGroup2);
      expect(task2.isDone()).assertTrue();
      done();
    })
  })
}