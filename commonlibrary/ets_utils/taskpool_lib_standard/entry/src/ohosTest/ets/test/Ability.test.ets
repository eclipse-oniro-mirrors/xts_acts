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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { taskpool, collections, TreeSet, MessageEvents } from '@kit.ArkTS'
import worker from '@ohos.worker'
import { BusinessError } from '@ohos.base'
import { currentFun, transferArrayBuffer, transferAtomics, setCloneListTest, setTransferListTest,
  testString, testTime, testNumber, testTaskPool, promiseCase, asyncSum,
  printArgsFunc, Sum, delaySum, Add, funcStrCat, arraySum, objectSum, Multi, AdditionDelay, WaitforRunner,
  errorTest, testCancelDelayed, dependend, hashMapTest, delay, randomTest, outerTaskFunc,
  isConcurrentTest1, isConcurrentTest2, sequenceRunnerTest, sequenceRunnerPriorityTest, CancelAndExecuteDelayed,
  errorManageTest, dealHashMapTest, noUseConcurrentTest, sendDataTest, sendableClassTestFunc, Int8ArrayTestFunc,
  SetTestFunc, MapTestFunc, simpleSendableClassTestFunc, Uint8ClampedArrayTestFunc, testWithThreeParams, testWithArray,
  sendableFuncTest, sendableClassTest, promiseTest, measureTest, loop, returnError, longString, sendableClassArrFunc,
  promiseNumber, TreeSetTestFunc, getCreateTaskId, taskSendManyFunc, taskErrFunc } from './testFunclist'
import { A, B, StrCat, printArgs, printStrArgs, fun, cancelById, getLongString, getTaskResult } from './exportFunclist'
import { SendableClass, SimpleSendable, sendableFunc, SendableClassTest, TaskInfoClass } from './sendable';
import HashMap from '@ohos.util.HashMap';

export default function TaskPoolTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   TaskPoolTestClass001
     * @tc.number TaskPoolTestClass001
     * @tc.desc   Test Simultaneous use taskpool and worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass002
     * @tc.number TaskPoolTestClass002
     * @tc.desc   TaskPoolTestClass002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = await taskpool.execute(Sum, 10, 20);
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass003
     * @tc.number TaskPoolTestClass003
     * @tc.desc   TaskPoolTestClass003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:boolean = await taskpool.execute(Add, true, true) as boolean;
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass004
     * @tc.number TaskPoolTestClass004
     * @tc.desc   TaskPoolTestClass004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass005
     * @tc.number TaskPoolTestClass005
     * @tc.desc   TaskPoolTestClass005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: string = await taskpool.execute(StrCat, "abc", "def") as string;
      result = await taskpool.execute(StrCat, "abc", "def") as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass006
     * @tc.number TaskPoolTestClass006
     * @tc.desc   TaskPoolTestClass006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: string = await taskpool.execute(funcStrCat, "abc", "def", "hello") as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass007
     * @tc.number TaskPoolTestClass007
     * @tc.desc   TaskPoolTestClass007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Array<number> = await taskpool.execute(arraySum, [1,2], [3,4]) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass008
     * @tc.number TaskPoolTestClass008
     * @tc.desc   TaskPoolTestClass008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass009
     * @tc.number TaskPoolTestClass009
     * @tc.desc   TaskPoolTestClass009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass010
     * @tc.number TaskPoolTestClass010
     * @tc.desc   TaskPoolTestClass010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = await taskpool.execute(Sum, 10, 20, 30) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass011
     * @tc.number TaskPoolTestClass011
     * @tc.desc   TaskPoolTestClass011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 30, 40) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass012
     * @tc.number TaskPoolTestClass012
     * @tc.desc   TaskPoolTestClass012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result1: number = await taskpool.execute(Sum, 10, 20) as number;
      let result2: number = await taskpool.execute(Sum, 10, 20) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass013
     * @tc.number TaskPoolTestClass013
     * @tc.desc   TaskPoolTestClass013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass014
     * @tc.number TaskPoolTestClass014
     * @tc.desc   TaskPoolTestClass014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass015
     * @tc.number TaskPoolTestClass015
     * @tc.desc   TaskPoolTestClass015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Add, true, true);
      let result: boolean = await taskpool.execute(task)  as boolean;
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass016
     * @tc.number TaskPoolTestClass016
     * @tc.desc   TaskPoolTestClass016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(StrCat, "abc", "def");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdef");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass017
     * @tc.number TaskPoolTestClass017
     * @tc.desc   TaskPoolTestClass017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(funcStrCat, "abc", "def", "hello");
      let result: string = await taskpool.execute(task) as string;
      expect(result).assertEqual("abcdefhello");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass018
     * @tc.number TaskPoolTestClass018
     * @tc.desc   TaskPoolTestClass018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(arraySum, [1,2], [3,4]);
      let result: Array<number> = await taskpool.execute(task) as Array<number>;
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass019
     * @tc.number TaskPoolTestClass019
     * @tc.desc   TaskPoolTestClass019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass020
     * @tc.number TaskPoolTestClass020
     * @tc.desc   TaskPoolTestClass020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10);
      let result: number = await taskpool.execute(task) as number;
      expect(result.toString()).assertEqual("NaN");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass021
     * @tc.number TaskPoolTestClass021
     * @tc.desc   TaskPoolTestClass021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20, 30);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass022
     * @tc.number TaskPoolTestClass022
     * @tc.desc   TaskPoolTestClass022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task) as number;
      let result2: number = await taskpool.execute(task) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass023
     * @tc.number TaskPoolTestClass023
     * @tc.desc   TaskPoolTestClass023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 30, 40);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(70);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass024
     * @tc.number TaskPoolTestClass024
     * @tc.desc   TaskPoolTestClass024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task1: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let task2: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let result1: number = await taskpool.execute(task1) as number;
      let result2: number = await taskpool.execute(task2) as number;
      expect(result1).assertEqual(30);
      expect(result2).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass025
     * @tc.number TaskPoolTestClass025
     * @tc.desc   TaskPoolTestClass025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass026
     * @tc.number TaskPoolTestClass026
     * @tc.desc   TaskPoolTestClass026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass027
     * @tc.number TaskPoolTestClass027
     * @tc.desc   TaskPoolTestClass027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass028
     * @tc.number TaskPoolTestClass028
     * @tc.desc   TaskPoolTestClass028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass029
     * @tc.number TaskPoolTestClass029
     * @tc.desc   TaskPoolTestClass029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass030
     * @tc.number TaskPoolTestClass030
     * @tc.desc   TaskPoolTestClass030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass031
     * @tc.number TaskPoolTestClass031
     * @tc.desc   TaskPoolTestClass031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass032
     * @tc.number TaskPoolTestClass032
     * @tc.desc   TaskPoolTestClass032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass033
     * @tc.number TaskPoolTestClass033
     * @tc.desc   TaskPoolTestClass033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass034
     * @tc.number TaskPoolTestClass034
     * @tc.desc   TaskPoolTestClass034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass035
     * @tc.number TaskPoolTestClass035
     * @tc.desc   TaskPoolTestClass035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass036
     * @tc.number TaskPoolTestClass036
     * @tc.desc   TaskPoolTestClass036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass037
     * @tc.number TaskPoolTestClass037
     * @tc.desc   TaskPoolTestClass037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass038
     * @tc.number TaskPoolTestClass038
     * @tc.desc   TaskPoolTestClass038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass039
     * @tc.number TaskPoolTestClass039
     * @tc.desc   TaskPoolTestClass039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass040
     * @tc.number TaskPoolTestClass040
     * @tc.desc   TaskPoolTestClass040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass041
     * @tc.number TaskPoolTestClass041
     * @tc.desc   TaskPoolTestClass041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass042
     * @tc.number TaskPoolTestClass042
     * @tc.desc   TaskPoolTestClass042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass043
     * @tc.number TaskPoolTestClass043
     * @tc.desc   TaskPoolTestClass043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass044
     * @tc.number TaskPoolTestClass044
     * @tc.desc   TaskPoolTestClass044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass045
     * @tc.number TaskPoolTestClass045
     * @tc.desc   TaskPoolTestClass045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass046
     * @tc.number TaskPoolTestClass046
     * @tc.desc   TaskPoolTestClass046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass047
     * @tc.number TaskPoolTestClass047
     * @tc.desc   TaskPoolTestClass047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass048
     * @tc.number TaskPoolTestClass048
     * @tc.desc   TaskPoolTestClass048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass049
     * @tc.number TaskPoolTestClass049
     * @tc.desc   TaskPoolTestClass049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await taskpool.execute(Sum) as number;
      } catch(e) {
        expect().assertEqual("BusinessError: taskpool:: first param must be object when argc is one");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0050
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0051
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0052
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0053
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0054
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0055
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0056
     * @tc.desc   executeDelayed for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0057
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0058
     * @tc.desc   concurrentFunc for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(printArgsFunc, Sum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass059
     * @tc.number TaskPoolTestClass059
     * @tc.desc   Execute priority tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

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
     * @tc.name   TaskPoolTestClass060
     * @tc.number TaskPoolTestClass060
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = await taskpool.execute(asyncSum, 10, 20) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass061
     * @tc.number TaskPoolTestClass061
     * @tc.desc   Execute async function task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(testNumber, 10, 20);
      let result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass062
     * @tc.number TaskPoolTestClass062
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass063
     * @tc.number TaskPoolTestClass063
     * @tc.desc   Execute async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass064
     * @tc.number TaskPoolTestClass064
     * @tc.desc   Set transfer list for the task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskPoolTestClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass065
     * @tc.number TaskPoolTestClass065
     * @tc.desc   Get the taskPoolInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass066
     * @tc.number TaskPoolTestClass066
     * @tc.desc   exeute task at taskpool thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass067
     * @tc.number TaskPoolTestClass067
     * @tc.desc   transfer SharedArrayBuffer with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let sab: SharedArrayBuffer = new SharedArrayBuffer(20);
      let int32 = new Uint32Array(sab);
      let task: taskpool.Task = new taskpool.Task(transferArrayBuffer, int32);
      await taskpool.execute(task).then(()=> {
        let result = int32[0] + int32[1] + int32[2] + int32[3];
        expect(result).assertEqual(1000);
      });
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass068
     * @tc.number TaskPoolTestClass068
     * @tc.desc   transfer SharedArrayBuffer and Atomics with taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0069
     * @tc.desc   sendData and onReceiveData for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0070
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let taskname: string = "taskName";
      let task: taskpool.Task = new taskpool.Task(taskname, Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0071
     * @tc.desc   add name of taskGroup for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass072
     * @tc.number TaskPoolTestClass072
     * @tc.desc   Cancel tasks that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass073
     * @tc.number TaskPoolTestClass073
     * @tc.desc   Cancel the task in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass074
     * @tc.number TaskPoolTestClass074
     * @tc.desc   Cancel the executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        await taskpool.execute(task3);

        taskpool.cancel(task1);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass075
     * @tc.number TaskPoolTestClass075
     * @tc.desc   Cancel nonexistent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass076
     * @tc.number TaskPoolTestClass076
     * @tc.desc   Canceling unexecuted tasks multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let task2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let task3: taskpool.Task = new taskpool.Task(printArgs, 300);

        taskpool.execute(task1);
        taskpool.execute(task2);
        await taskpool.execute(task3);

        taskpool.cancel(task3);
      }
      catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass077
     * @tc.number TaskPoolTestClass077
     * @tc.desc   Cancel all tasks in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass078
     * @tc.number TaskPoolTestClass078
     * @tc.desc   Cancel the taskGroup in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass079
     * @tc.number TaskPoolTestClass079
     * @tc.desc   Cancel the taskGroup that have not been executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass080
     * @tc.number TaskPoolTestClass080
     * @tc.desc   Cancel the non-existent taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        taskpool.cancel(taskGroup);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task group to cancel does not exist, taskpool:: taskGroup is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass081
     * @tc.number TaskPoolTestClass081
     * @tc.desc   Cancel the executed taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0082
     * @tc.desc   add setclonelist of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr: Array<number> = [1, 2, 3, 4];
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let arrayInt: Int32Array = new Int32Array(arrayBuffer);
      for (let i: number = 0; i < arr.length; i++) {
        arrayInt[i] = arr[i];
      }
      let task: taskpool.Task = new taskpool.Task(setCloneListTest, arrayInt);
      task.setCloneList([arrayBuffer]);
      await taskpool.execute(task).then(() => {
        expect(arrayInt[0]).assertEqual(1);
      })
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0083
     * @tc.desc   taskGroup cannot add groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0084
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0085
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0086
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0087
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0088
     * @tc.desc   taskgroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0089
     * @tc.desc   SequenceRunner cannot execute groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0090
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0091
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0092
     * @tc.desc   dependent task not allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0093
     * @tc.desc   SequenceRunner cannot execute seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0094
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0095
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0096
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0097
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0098
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0099
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0100
     * @tc.desc   seqRunnerTask or executedTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0101
     * @tc.desc   seqRunnerTask or executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0102
     * @tc.desc   groupTask cannot be relied on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0103
     * @tc.desc   groupTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0104
     * @tc.desc   seqRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0105
     * @tc.desc   groupTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0106
     * @tc.desc   seqRunnerTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0107
     * @tc.desc   groupTask cannot executeDelayed outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0108
     * @tc.desc   cancel the executeDelay task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0109
     * @tc.desc   executedTask with dependency cannot executeDelayed again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0110
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      try {
        task.name = "taskName1";
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("TypeError: Cannot set property when setter is undefined");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0111
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task("taskName", Sum, 10, 20);
      expect(task.name).assertEqual("taskName");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0112
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(Sum, 10, 20);
      let name: string = task.name;
      expect(name).assertEqual("Sum");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0113
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0114
     * @tc.desc   get name from taskInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0115
     * @tc.desc   Register a callback of onEnqueued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0116
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0117
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0118
     * @tc.desc   Register a callback of onExecutionFailed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate1: boolean = false;
      let task: taskpool.Task = new taskpool.Task(hashMapTest, 1);
      task.onExecutionFailed((e: Error)=>{
        expect((e as BusinessError).toString()).assertContain("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })

      await taskpool.execute(task).then((res)=>{
      }).catch((e:BusinessError)=>{
        expect((e as BusinessError).toString()).assertContain("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0119
     * @tc.desc   Register a callback of onEnqueued after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0120
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0121
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0122
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0123
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0124
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0125
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass126
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0126
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass127
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0127
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
        expect(task2.totalDuration < 5).assertTrue();
        expect(task2.cpuDuration < 5).assertTrue();
        expect(task2.ioDuration < 5).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass128
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0128
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass129
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0129
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass130
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0130
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass131
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0131
     * @tc.desc   duration for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass132
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0132
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass133
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0133
     * @tc.desc   handle cancel task error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass134
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0134
     * @tc.desc   execute long task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.LongTask = new taskpool.LongTask(Sum, 10, 20);
      let result = await taskpool.execute(task);
      taskpool.terminateTask(task);
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass135
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0135
     * @tc.desc   the long task can only be executed once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass136
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0136
     * @tc.desc   task group does not support the long task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass137
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0137
     * @tc.desc   Supports judging whether it is concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret : boolean = taskpool.isConcurrent(isConcurrentTest1)
      expect(ret).assertEqual(true);
      ret = taskpool.isConcurrent(isConcurrentTest2)
      expect(ret).assertEqual(false)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass138
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0138
     * @tc.desc   taskpool support isDone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass139
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0139
     * @tc.desc   taskpool support isDone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass140
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0140
     * @tc.desc   taskpool error test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(errorTest)
      await taskpool.execute(task).then((res)=>{
        console.info("errTest res " + res)
      }).catch((e:BusinessError)=>{
        expect(e.message).assertContain("this is an error");
      })
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass141
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0141
     * @tc.desc   addDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass142
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0142
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass143
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0143
     * @tc.desc   removeDependency for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass144
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0144
     * @tc.desc   executedTask cannot addDependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass145
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0145
     * @tc.desc   Cancel the executeDelayed for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass146
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0146
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass147
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0147
     * @tc.desc   SequenceRunner for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass148
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0148
     * @tc.desc   taskGroup cannot add seqRunnerTask or executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass149
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0149
     * @tc.desc   taskGroup cannot addTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass150
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0150
     * @tc.desc   Cancel the taskGroup in progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass151
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0151
     * @tc.desc   Cancel the executed taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass152
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0152
     * @tc.desc   SequenceRunner with name execute task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass153
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0153
     * @tc.desc   Multiple sequenceRunner with name execute task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass154
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0154
     * @tc.desc   SequenceRunner repeating tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass155
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0155
     * @tc.desc   The task of the task group is executed in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass156
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0156
     * @tc.desc   Tasks with dependencies are executed in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass157
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0157
     * @tc.desc   sequenceRunner with name execute delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass158
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0158
     * @tc.desc   sequenceRunner with name execute executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass159
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0159
     * @tc.desc   sequenceRunner with name execute delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass160
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0160
     * @tc.desc   sequenceRunner with name and non-name execute delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass161
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0161
     * @tc.desc   sequenceRunner with name execute executed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass162
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0162
     * @tc.desc   sequenceRunner with name execute delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass163
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0163
     * @tc.desc   Repeat SequenceRunner execution on the same thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass164
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0164
     * @tc.desc   Multi threaded execution of SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass165
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0165
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass166
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0166
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass167
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0167
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass168
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0168
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass169
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0169
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass170
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0170
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass171
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0171
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass172
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0172
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass173
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0173
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass174
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0174
     * @tc.desc   taskpool repeatedly calling Cancel and ExecuteDelayed, only last task can execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
      * @tc.name   TaskPoolTestClass175
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0175
      * @tc.desc   taskpool calling callback which have errorManage
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('TaskPoolTestClass175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass176
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0176
     * @tc.desc   taskpool executeDelayed failed to serialize result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(hashMapTest, 1);
      await taskpool.executeDelayed(500, task).catch((e: Error)=>{
        expect((e as BusinessError).toString()).assertContain("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })

      done();
    })

    /**
     * @tc.name   TaskPoolTestClass177
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0177
     * @tc.desc   taskpool executeDelayed failed to serialize arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let hashMap:HashMap<string, number> = new HashMap();
      hashMap.set("b", 234);
      let task: taskpool.Task = new taskpool.Task(dealHashMapTest, hashMap);
      try {
        await taskpool.executeDelayed(500, task)
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("BusinessError: An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      done();
    })
    /**
     * @tc.name   TaskPoolTestClass178
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0178
     * @tc.desc   taskpool executeDelayed failed to task is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        taskpool.executeDelayed(500, null)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: Parameter error. The input parameters are invalid, the type of the second param must be object.");
      }

      done();
    })

    /**
     * @tc.name   TaskPoolTestClass180
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0180
     * @tc.desc   taskpool executePeriodically failed to serialize arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task = new taskpool.Task(printArgs, isConcurrentTest2);
        taskpool.executePeriodically(10, task, taskpool.Priority.HIGH)
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("BusinessError: An exception occurred during serialization, taskpool: failed to serialize arguments.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass182
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0182
     * @tc.desc   taskpool executeDelayed failed to serialize function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executePeriodically(-10, task, taskpool.Priority.HIGH)
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The period value is less than zero.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass183
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0183
     * @tc.desc   taskpool isDone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass184
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0184
     * @tc.desc   taskpool isDone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   TaskPoolTestClass185
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0185
     * @tc.desc   taskpool isDone interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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

    /**
     * @tc.name   TaskPoolTestClass186
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0186
     * @tc.desc   taskpool support executeDelayed interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task: taskpool.Task = new taskpool.Task(printArgs, 100);
        taskpool.executeDelayed(-100, task);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The delayTime is less than zero");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass187
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0187
     * @tc.desc   taskpool support executePeriodically interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let task = new taskpool.Task(dependend, 200);
        taskpool.executePeriodically(-100, task);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: The period value is less than zero.");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass188
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0188
     * @tc.desc   Set transfer list for the task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arrayBuffer: ArrayBuffer = new ArrayBuffer(16);
      let task: taskpool.Task = new taskpool.Task(setCloneListTest, arrayBuffer);
      task.setTransferList([arrayBuffer]);
      try {
        task.setCloneList([arrayBuffer]);
      } catch (e) {
        expect(e.toString()).assertEqual("BusinessError: An ArrayBuffer cannot be set as both a transfer list and a clone list");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass189
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0189
     * @tc.desc   taskpool support sendData and onReceiveData interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let res: number = 0;
      let task: taskpool.Task = new taskpool.Task(sendDataTest, 1);
      task.onReceiveData((data: number)=>{
        res = data;
      });
      await taskpool.execute(task);
      expect(res).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass190
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0190
     * @tc.desc   taskpool support SendableClass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testClass1 = new SendableClass(10);
      let testClass2 = new SendableClass(20);
      let task: taskpool.Task = new taskpool.Task(sendableClassTestFunc, testClass1, testClass2);
      let res = await taskpool.execute(task);
      expect(res).assertEqual(30);
      expect(testClass1.para).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass191
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0191
     * @tc.desc   taskpool support collections.Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let int8Buffer: collections.Int8Array = new collections.Int8Array(3);
      let task: taskpool.Task = new taskpool.Task(Int8ArrayTestFunc, int8Buffer);
      let res: collections.Int8Array = await taskpool.execute(task) as collections.Int8Array;
      expect(res.length).assertEqual(3);
      expect(res.at(1)).assertEqual(1);
      expect(res.at(2)).assertEqual(2);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass192
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0192
     * @tc.desc   taskpool support collections.Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set: collections.Set<number> = new collections.Set([1, 2, 3]);
      let task: taskpool.Task = new taskpool.Task(SetTestFunc, set);
      let res: collections.Set<number> = await taskpool.execute(task) as collections.Set<number>;
      expect(res.size).assertEqual(4);
      expect(res.has(4)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass193
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0193
     * @tc.desc   taskpool support collections.Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map: collections.Map<number, number> = new collections.Map([[1, 2], [3, 4]]);
      let task: taskpool.Task = new taskpool.Task(MapTestFunc, map);
      let res: collections.Map<number, number> = await taskpool.execute(task) as collections.Map<number, number>;
      expect(res.size).assertEqual(3);
      expect(res.get(5)).assertEqual(6);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass194
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0194
     * @tc.desc   taskpool support SendableClass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testClass1 = new SimpleSendable(10);
      let testClass2 = new SimpleSendable(20);
      let task: taskpool.Task = new taskpool.Task(simpleSendableClassTestFunc, testClass1, testClass2);
      let res = await taskpool.execute(task);
      expect(res).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass195
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0195
     * @tc.desc   taskpool support collections.Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arkTSTest : collections.Uint8ClampedArray = new collections.Uint8ClampedArray(3);
      let task: taskpool.Task = new taskpool.Task(Uint8ClampedArrayTestFunc, arkTSTest);
      let res: collections.Uint8ClampedArray = await taskpool.execute(task) as collections.Uint8ClampedArray;
      expect(res.length).assertEqual(3);
      expect(res.at(1)).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass196
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0196
     * @tc.desc   taskpool execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let ret1 = 0;
      let ret2 = "";
      let ret3 = "";
      taskpool.execute<[number], number>(printArgs, 100).then((value: number) => {
        isTerminate1 = true;
        ret1 = value;
      });
      taskpool.execute<[number, string, number], string>(testWithThreeParams, 100, "test", 100).then((value: string) => {
        isTerminate2 = true;
        ret2 = value;
      })
      taskpool.execute<[[number, string]], string>(testWithArray, [100, "test"]).then((value: string) => {
        isTerminate3 = true;
        ret3 = value;
      })

      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase();
      }

      expect(ret1).assertEqual(100);
      expect(ret2).assertEqual("result: test 200");
      expect(ret3).assertEqual("result:[100,\"test\"]");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass197
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0197
     * @tc.desc   taskpool GenericsTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let isTerminate3: boolean = false;
      let ret1 = 0;
      let ret2 = 0;
      let ret3 = 0;

      let task1: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs, 100); // 100: test number
      let task2: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs, 200); // 200: test number
      let task3: taskpool.Task = new taskpool.GenericsTask<[number], number>(printArgs, 300); // 300: test number
      taskpool.execute<[number], number>(task1, taskpool.Priority.LOW).then((value: number) => {
        isTerminate1 = true;
        ret1 = value;
      });
      taskpool.execute<[number], number>(task2, taskpool.Priority.MEDIUM).then((value: number) => {
        isTerminate2 = true;
        ret2 = value;
      });
      taskpool.execute<[number], number>(task3, taskpool.Priority.HIGH).then((value: number) => {
        isTerminate3 = true;
        ret3 = value;
      });

      while (!isTerminate1 || !isTerminate2 || !isTerminate3) {
        await promiseCase();
      }

      expect(ret1).assertEqual(100);
      expect(ret2).assertEqual(200);
      expect(ret3).assertEqual(300);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass198
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0198
     * @tc.desc   taskpool executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate1: boolean = false;
      let ret1 = "";
      let task: taskpool.Task = new taskpool.GenericsTask<[string], string>(printStrArgs, "test");
      taskpool.executeDelayed<[string], string>(1000, task).then((res: string) => {
        isTerminate1 = true;
        ret1 = res;
      }).catch((e: BusinessError) => {
        console.error(`TaskPoolTestClass198 execute: Code: ${e.code}, message: ${e.message}`);
      })
      while (!isTerminate1) {
        await promiseCase();
      }
      expect(ret1).assertEqual("test");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass199
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0199
     * @tc.desc   taskpool executePeriodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let res: number = 0;
      let periodicTask: taskpool.Task = new taskpool.GenericsTask<[number], void>(sendDataTest, 200);
      periodicTask.onReceiveData((data: number) => {
        res = data;
        console.info("TaskPoolTestClass199: data is: " + data);
      });
      taskpool.executePeriodically<[number], void>(500, periodicTask);
      while (!res) {
        await promiseCase();
      }
      expect(res).assertEqual(2000);
      taskpool.cancel(periodicTask)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0200
     * @tc.desc   taskpool executePeriodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let res: number = 0;
      let periodicTask: taskpool.Task = new taskpool.Task(sendDataTest, 200);
      periodicTask.onReceiveData((data: number) => {
        res = data;
        console.info("TaskPoolTestClass200: data is: " + data);
      });
      taskpool.executePeriodically(1000, periodicTask);
      while (!res) {
        await promiseCase();
      }
      expect(res).assertEqual(2000);
      taskpool.cancel(periodicTask)
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass201
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0201
     * @tc.desc   taskpool taskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task:taskpool.Task = new taskpool.Task(errorTest);
      let task2:taskpool.Task = new taskpool.Task(printArgs, 100);
      let taskGroup:taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task);
      taskGroup.addTask(task2);
      await taskpool.execute(taskGroup).catch((e: BusinessError) => {
        console.log(e.message)
        expect(e.message).assertContain("this is an error");
      })
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass202
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0202
     * @tc.desc   taskpool sendableFunc add sendableClass test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate1: boolean = false;
      let isTerminate2: boolean = false;
      let task1 = new taskpool.Task(sendableFuncTest, sendableFunc);
      taskpool.execute(task1).then((res) => {
        isTerminate1 = true;
        expect(res).assertEqual(500);
      })

      let classTest: SendableClassTest = new SendableClassTest(sendableFunc);
      let task2 = new taskpool.Task(sendableClassTest, classTest);
      taskpool.execute(task2).then((res) => {
        isTerminate2 = true;
        expect(res).assertEqual(600);
      })

      while (!isTerminate1 && !isTerminate2) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass203
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0203
     * @tc.desc   cancel executed task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(testString, "hello");
      await taskpool.execute(task);
      try {
        taskpool.cancel(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass204
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0204
     * @tc.desc   Register a callback of TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate: boolean = false;
      let result: number = 0;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(printArgs, 100); // 100: test number
      task1.onExecutionSucceeded(()=>{
        result += 100;
      })
      let task2: taskpool.Task = new taskpool.Task(printArgs, 200); // 200: test number
      task2.onExecutionSucceeded(()=>{
        result += 200;
      })
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskpool.execute(taskGroup).then((res) => {
        isTerminate = true;
        expect(res.includes(100)).assertTrue();
        expect(res.includes(200)).assertTrue();
      })
      while (!isTerminate) {
        await promiseCase();
      }
      expect(result).assertEqual(300);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass205
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0205
     * @tc.desc   Register a callback of TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let isTerminate: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(hashMapTest, 300); // 300: test number
      task1.onExecutionFailed((e:Error)=>{
        expect((e as BusinessError).toString()).assertContain("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })
      taskGroup.addTask(task1);
      taskpool.execute(taskGroup).then((res)=>{
      }).catch((e:BusinessError)=>{
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass206
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0206
     * @tc.desc   Register a callback of SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = 0;
      let isTerminate: boolean = false;
      let task1: taskpool.Task = new taskpool.Task(AdditionDelay, 500);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 300);
      let task3: taskpool.Task = new taskpool.Task(hashMapTest, 100);

      task1.onExecutionSucceeded(()=>{
        result += 500;
      })
      task2.onExecutionSucceeded(()=>{
        result += 300;
      })
      task3.onExecutionFailed((e:Error)=>{
        expect((e as BusinessError).toString()).assertContain("Error: An exception occurred during serialization, taskpool: failed to serialize result.");
      })
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      runner.execute(task1);
      runner.execute(task2);
      runner.execute(task3).then((res)=>{
      }).catch((e:BusinessError)=>{
        isTerminate = true;
      })
      while (!isTerminate) {
        await promiseCase();
      }
      expect(result).assertEqual(800);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass207
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0207
     * @tc.desc   Create AsyncRunner error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        new taskpool.AsyncRunner(0);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, RunningCapacity must be greater than zero.');
      }

      try {
        new taskpool.AsyncRunner("async207", 5, -1);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, WaitingCapacity must be greater than or equal zero.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass208
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0208
     * @tc.desc   Create AsyncRunner error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      new taskpool.AsyncRunner("async208", 5);
      try {
        new taskpool.AsyncRunner("async208", 4);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner runningCapacity can not changed.');
      }

      try {
        new taskpool.AsyncRunner("async208", 5, 10);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, AsyncRunner waitingCapacity can not changed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass209
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0209
     * @tc.desc   AsyncRunner execute error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async209", 5, 5);
      let task: taskpool.Task = new taskpool.Task("task209", printArgs, 100);
      try {
        asyncRunner.execute(task, 4);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: Parameter error. The input parameters are invalid, Priority value is error.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass210
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0210
     * @tc.desc   AsyncRunner cancel task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async210", 2);
      let num = 0;
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(AdditionDelay, 100);
        asyncRunner.execute(task).then(() => {
          num++;
        }).catch((e: BusinessError) => {
          num++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task has been canceled.');
        })
        if (i > 3) {
          taskpool.cancel(task);
        }
      }
      while (num < 5) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass211
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0211
     * @tc.desc   AsyncRunner cannot execute seqRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async211", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq211");
      seqRunner.execute(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass212
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0212
     * @tc.desc   AsyncRunner cannot execute groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async212", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup212");
      taskGroup.addTask(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute groupTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass213
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0213
     * @tc.desc   AsyncRunner cannot execute dependent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async213", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      task.addDependency(task2);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: AsyncRunner:: dependent task not allowed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass214
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0214
     * @tc.desc   AsyncRunner cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214", 2);
      let asyncRunner2: taskpool.AsyncRunner = new taskpool.AsyncRunner("async214-1", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        asyncRunner2.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass215
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0215
     * @tc.desc   AsyncRunner cannot execute executedTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async215", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      taskpool.execute(task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunner cannot execute seqRunnerTask or executedTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass216
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0216
     * @tc.desc   AsyncRunner cannot execute periodicTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async216", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      taskpool.executePeriodically(1000, task);
      try {
        asyncRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The periodic task cannot be executed again, AsyncRunner cannot execute the periodicTask.');
      }
      setTimeout(()=>{
        taskpool.cancel(task);
      }, 2000);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass217
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0217
     * @tc.desc   sequenceRunner cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async217", 2);
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner("seq217");
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        seqRunner.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, SequenceRunner cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass218
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0218
     * @tc.desc   taskGroup cannot execute asyncRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async218", 2);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup("taskGroup218");
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskGroup.addTask(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, TaskGroup cannot execute asyncRunnerTask.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass219
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0219
     * @tc.desc   asyncRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async219", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.execute(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot execute outside.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass220
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0220
     * @tc.desc   asyncRunnerTask cannot execute outside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async220", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      let task2: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        task2.addDependency(task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task has been executed by AsyncRunner.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass221
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0221
     * @tc.desc   asyncRunnerTask cannot executed periodically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async221", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.executePeriodically(1000, task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot executePeriodically.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass222
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0222
     * @tc.desc   asyncRunnerTask cannot executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async222", 2);
      let task: taskpool.Task = new taskpool.Task(AdditionDelay, 1000);
      asyncRunner.execute(task);
      try {
        taskpool.executeDelayed(1000, task);
      } catch (e) {
        expect(e.toString()).assertEqual('BusinessError: The task cannot be executed by two APIs, AsyncRunnerTask cannot executeDelayed.');
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass223
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0223
     * @tc.desc   asyncRunner task discarded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async223", 5, 2);
      let success = 0;
      let failure = 0;
      let size = 10;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task, taskpool.Priority.HIGH).then(() => {
          success++;
        }).catch((e: BusinessError) => {
          failure++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task is discarded.');
        });
      }
      while (success + failure < size) {
        await promiseCase();
      }
      expect(success >= 5).assertTrue();
      expect(success).assertLess(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass224
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0224
     * @tc.desc   asyncRunner task has been canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner("async224", 2);
      let success = 0;
      let failure = 0;
      let size = 5;
      let arr: Array<taskpool.Task> = [];
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).then(() => {
          success++;
        }).catch((e: BusinessError) => {
          failure++;
          expect((e as BusinessError).toString()).assertEqual('BusinessError: The asyncRunner task has been canceled.');
        });
        if (i > 3) {
          arr.push(task);
        }
      }
      for (let i = 0; i < arr.length; i++) {
        try {
          taskpool.cancel(arr[i]);
        } catch (e) {
        }
      }
      while (success + failure < size) {
        await promiseCase();
      }
      expect(failure).assertEqual(arr.length);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass225
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0225
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      setTimeout(() => {
        taskpool.cancel(task.taskId);
      }, 1000);

      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })


    /**
     * @tc.name   TaskPoolTestClass226
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0226
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.execute(task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      let cancelTask = new taskpool.Task(cancelById, task.taskId);
      taskpool.execute(cancelTask);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass227
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0227
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        taskpool.cancel(task1.taskId);
      } catch(e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass228
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0228
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      let terminate = false;
      taskpool.executeDelayed(2000, task).catch(() => {
        str = 'cancel success';
        terminate = true;
      });
      let cancelTask = new taskpool.Task(cancelById, task.taskId);
      taskpool.execute(cancelTask);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass229
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0229
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str = 'test';
      let task = new taskpool.Task(fun, str);
      try {
        taskpool.cancel(task.taskId);
      } catch (e) {
        expect((e as BusinessError).toString()).assertEqual("BusinessError: The task to cancel does not exist, taskpool:: task is not executed or has been executed");
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass230
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0230
     * @tc.desc   cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str = 'test';
      let task1 = new taskpool.Task(printArgs, 100);
      let task2 = new taskpool.Task(printArgs, 100);
      let task3 = new taskpool.Task(fun, str);
      let taskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      taskGroup.addTask(task3);
      let terminate = false;
      taskpool.execute(taskGroup).then(() => {
        str = 'finish success';
        terminate = true;
      }).catch(() => {
        terminate = true;
        str = 'cancel success';
      });
      setTimeout(() => {
        taskpool.cancel(task3.taskId);
      }, 1000);
      while (!terminate) {
        await promiseCase();
      }
      expect(str).assertEqual('cancel success');
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass231
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0231
     * @tc.desc   test microjob in the taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let value: number = 500;
      let task: taskpool.Task = new taskpool.Task(promiseTest, value);
      let result = await taskpool.execute(task);
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass232
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0232
     * @tc.desc   Test the ContainerScope and Measure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(measureTest);
      let result = await taskpool.execute(task);
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass234
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0234
     * @tc.desc   Test asyncRunnerTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let cancelNum = 0;
      let catchCount = 0;
      let asyncRunner:taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let size = 30;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 10200055) {
            cancelNum++;
          }
        })
        taskpool.cancel(task);
      }
      while (catchCount < size) {
        await promiseCase();
      }
      expect(cancelNum).assertEqual(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass235
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0235
     * @tc.desc   Test task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let cancelNum = 0;
      let catchCount = 0;
      let size = 20;
      for (let i = 0; i < size; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        taskpool.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 0) {
            cancelNum++;
          }
        })
        taskpool.cancel(task);
      }
      let asyncRunner:taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let asyncSize = 10;
      let asyncCatchNum = 0;
      for (let i = 0; i < asyncSize; i++) {
        let task: taskpool.Task = new taskpool.Task(printArgs, i);
        asyncRunner.execute(task).catch((e: BusinessError) => {
          catchCount++;
          if (e.code == 10200055) {
            asyncCatchNum++;
          }
        })
        taskpool.cancel(task);
      }
      while (catchCount < (size+asyncSize)) {
        await promiseCase();
      }
      expect(cancelNum).assertEqual(size);
      expect(asyncCatchNum).assertEqual(asyncSize);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass236
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0236
     * @tc.desc   Test waiting task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(1000, task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 500);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass237
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0237
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass238
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0238
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass239
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0239
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:string = "";
      let task = new taskpool.Task(returnError, 1000);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = (e.data.result as object).toString();
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 500);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual("Error: this is return error");
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass240
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0240
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(0);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass241
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0241
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass242
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0242
     * @tc.desc   Test waiting asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let task2 = new taskpool.Task(loop);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task);
      runner.execute(task2).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task2.taskId);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(undefined);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass243
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0243
     * @tc.desc   Test running asyncTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(delaySum, 10, 20, 500);
      let runner = new taskpool.AsyncRunner(1,1);
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("The asyncRunner task has been canceled.");
      expect(result).assertEqual(30);
      expect(code).assertEqual(10200055);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass244
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0244
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass245
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0245
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass246
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0246
     * @tc.desc   Test running sequenceTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(delaySum, 10, 20, 1000);
      let runner = new taskpool.SequenceRunner();
      runner.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(30);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass247
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0247
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass248
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0248
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.Task(loop);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 1300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass249
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0249
     * @tc.desc   Test running delayTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let code:number = 0;
      let result:object | undefined = undefined;
      let task = new taskpool.Task(longString, 500);
      taskpool.executeDelayed(500, task).catch((e:BusinessError<taskpool.TaskResult>) => {
        code = e.code;
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(getLongString());
      expect(code).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass250
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0250
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1);
      }, 200);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass251
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0251
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(delaySum, 10, 10, 300);
      let task2 = new taskpool.Task(delaySum, 20, 10, 800);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(group);
      }, 200);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass252
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0252
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(loop);
      let task2 = new taskpool.Task(loop);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass253
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0253
     * @tc.desc   Test running groupTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task1 = new taskpool.Task(longString, 1000);
      let task2 = new taskpool.Task(longString, 2000);
      let group = new taskpool.TaskGroup();
      group.addTask(task1);
      group.addTask(task2);
      taskpool.execute(group).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task1.taskId);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(getLongString());
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass254
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0254
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(delaySum, 10, 10, 1000);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 500);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass255
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0255
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 300);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass256
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0256
     * @tc.desc   Test running longTask cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:object | undefined = undefined;
      let task = new taskpool.LongTask(loop);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as object;
          }
          taskpool.terminateTask(task);
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("Error: this is loop error");
      expect(result).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass257
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0257
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let size = 1024;
      let arr = new collections.Array<SendableClass>()
      for (let i = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            let res = e.data.result as collections.Array<SendableClass>;
            result = res.length;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 400);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(size);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass258
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0258
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let size = 1024;
      let arr = new collections.Array<SendableClass>()
      for (let i = 0; i < size; i++) {
        arr.push(new SendableClass(i));
      }
      let task: taskpool.Task = new taskpool.Task(sendableClassArrFunc, arr);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            let res = e.data.result as collections.Array<SendableClass>;
            result = res.length;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass259
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0259
     * @tc.desc   Test running task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      let error:string = "";
      let result:number = -1;
      let value: number = 500;
      let task: taskpool.Task = new taskpool.Task(promiseNumber, value);
      taskpool.execute(task).catch((e:BusinessError<taskpool.TaskResult>) => {
        if (e.data !== undefined) {
          error = (e.data.error as Error).toString();
          if (e.data.result!== undefined) {
            result = e.data.result as number;
          }
        }
        terminate = true;
      })
      setTimeout(() => {
        taskpool.cancel(task);
      }, 800);

      while (!terminate) {
        await promiseCase();
      }
      expect(error).assertEqual("taskpool:: task has been canceled");
      expect(result).assertEqual(value);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass260
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0260
     * @tc.desc   taskpool support TreeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let treeSet = new TreeSet<number>();
      treeSet.add(5);
      treeSet.add(1);
      treeSet.add(2);
      let task: taskpool.Task = new taskpool.Task(TreeSetTestFunc, treeSet);
      let res: TreeSet<number> = await taskpool.execute(task) as TreeSet<number>;
      expect(res.length).assertEqual(4);
      expect(res.has(4)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass261
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0261
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        taskpool.getTask(null);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }
      try {
        taskpool.getTask(undefined);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }

      let task: taskpool.Task |undefined = taskpool.getTask(0);
      expect(task).assertEqual(undefined);

      let task2: taskpool.Task |undefined = taskpool.getTask(-1);
      expect(task2).assertEqual(undefined);

      let task3: taskpool.Task |undefined = taskpool.getTask(1.1);
      expect(task3).assertEqual(undefined);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass262
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0262
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 1000);
      try {
        taskpool.getTask(task.taskId, null);
      } catch (e) {
        expect((e as BusinessError).toString()).assertContain("Parameter error");
      }

      let task2: taskpool.Task |undefined = taskpool.getTask(task.taskId, "");
      expect(task2).assertEqual(undefined);

      let task3: taskpool.Task |undefined = taskpool.getTask(task.taskId, "default");
      expect(task3).assertEqual(undefined);

      let task4: taskpool.Task |undefined = taskpool.getTask(task.taskId, "PromiseNumber");
      expect(task4).assertEqual(undefined);

      let task5: taskpool.Task |undefined = taskpool.getTask(task.taskId, "promiseNumber");
      expect(task5).assertEqual(task);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass263
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0263
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      let terminate = false;
      taskpool.execute(getTaskResult, task.taskId).then((res) => {
        terminate = true;
        expect(res).assertFalse();
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass264
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0264
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let terminate = false;
      taskpool.execute(getCreateTaskId).then((res) =>{
        terminate = true;
        let task: taskpool.Task | undefined = taskpool.getTask(res as number);
        expect(task).assertEqual(undefined);
      })
      while (!terminate) {
        await promiseCase();
      }
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass265
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0265
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker1.ets")
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      ss.postMessage(task.taskId);
      let flag:boolean = false;
      let result:boolean = true;
      ss.onmessage = (e: MessageEvents) => {
        flag = true
        ss.terminate();
        result = e.data;
      }
      while (!flag) {
        await promiseCase()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass266
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0266
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ss: worker.ThreadWorker = new worker.ThreadWorker("../workers/worker2.ets")
      ss.postMessage("hello");
      let flag:boolean = false;
      let result:boolean = true;
      ss.onmessage = (e: MessageEvents) => {
        flag = true
        ss.terminate();
        result = e.data;
      }
      while (!flag) {
        await promiseCase()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass267
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0267
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task: taskpool.Task = new taskpool.Task(promiseNumber, 10);
      let task1: taskpool.Task | undefined = taskpool.getTask(task.taskId, task.name);
      expect(task1!.taskId).assertEqual(task.taskId);
      expect(task1!.name).assertEqual(task.name);
      expect(task1!.function).assertEqual(task.function);
      expect(task1!.arguments).assertEqual(task.arguments);
      expect(task1!.totalDuration).assertEqual(task.totalDuration);
      expect(task1!.ioDuration).assertEqual(task.ioDuration);
      expect(task1!.cpuDuration).assertEqual(task.cpuDuration);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass268
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0268
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
      taskpool.execute(task).then(() => {
        class1.increaseCount();
      })
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onReceiveData(() => {
        class1.increaseOnReceicve();
      })
      expect(task2!.isDone()).assertEqual(false);
      while (await class1.getCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getOnReceicve()).assertEqual(20);
      expect(task2!.isDone()).assertEqual(true);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass269
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0269
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskSendManyFunc, 10, 20);
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onExecutionSucceeded(() => {
        class1.increaseExecuteSuccess();
      })
      task2?.onEnqueued(() => {
        class1.increaseEnqueue();
      })
      task2?.onStartExecution(() => {
        class1.increaseStartExecute();
      })
      task2?.onReceiveData(() => {
        class1.increaseOnReceicve();
      })
      taskpool.execute(task2).then(() => {
        class1.increaseCount();
      }).catch(() => {
        class1.increaseErrCount()
      })

      while (await class1.getCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getEnqueue()).assertEqual(1);
      expect(await class1.getStartExecute()).assertEqual(1);
      expect(await class1.getExecuteSuccess()).assertEqual(1);
      expect(await class1.getOnReceicve()).assertEqual(20);
      done();
    })

    /**
     * @tc.name   TaskPoolTestClass270
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0270
     * @tc.desc   taskpool support getTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolTestClass270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let class1 = new TaskInfoClass();
      let task: taskpool.Task = new taskpool.Task(taskErrFunc, 50);
      let task2: taskpool.Task | undefined = taskpool.getTask(task.taskId);
      task2?.onExecutionFailed(() => {
        class1.increaseExecuteFailed();
      })
      task2?.onEnqueued(() => {
        class1.increaseEnqueue();
      })
      task2?.onStartExecution(() => {
        class1.increaseStartExecute();
      })
      taskpool.execute(task2).then(() => {
        class1.increaseCount();
      }).catch(() => {
        class1.increaseErrCount()
      })

      while (await class1.getErrCount() < 1) {
        await promiseCase()
      }
      expect(await class1.getEnqueue()).assertEqual(1);
      expect(await class1.getStartExecute()).assertEqual(1);
      expect(await class1.getExecuteFailed()).assertEqual(1);
      done();
    })
  })
}