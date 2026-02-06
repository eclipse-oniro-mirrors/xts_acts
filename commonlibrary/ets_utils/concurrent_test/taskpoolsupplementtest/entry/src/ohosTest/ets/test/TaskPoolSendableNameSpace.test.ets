/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  MyNamespace,
  MyNamespace1,
  MyNamespace10,
  MyNamespace11,
  MyNamespace12,
  MyNamespace13,
  MyNamespace14,
  MyNamespace15,
  MyNamespace16,
  MyNamespace17,
  MyNamespace18,
  MyNamespace19,
  MyNamespace2,
  MyNamespace20,
  MyNamespace4,
  MyNamespace5,
  MyNamespace6,
  MyNamespace7,
  MyNamespace8,
  MyNamespace9,
  sendableFunction,
  sendableFunction10,
  sendableFunction11,
  sendableFunction12,
  sendableFunction13,
  sendableFunction14,
  sendableFunction15,
  sendableFunction16,
  sendableFunction17,
  sendableFunction18,
  sendableFunction19,
  sendableFunction2,
  sendableFunction20,
  sendableFunction3,
  sendableFunction4,
  sendableFunction5,
  sendableFunction6,
  sendableFunction7,
  sendableFunction8,
  sendableFunction9,
  TypeA,
  TypeB
} from '../testability/pages/SendableTest1';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import {
  sleep,
  TaskFunc1,
  TaskFunc10,
  TaskFunc11,
  TaskFunc12,
  TaskFunc13,
  TaskFunc14,
  TaskFunc15,
  TaskFunc16,
  TaskFunc17,
  TaskFunc18,
  TaskFunc19,
  TaskFunc2,
  TaskFunc20,
  TaskFunc3,
  TaskFunc4,
  TaskFunc5,
  TaskFunc6,
  TaskFunc7,
  TaskFunc8,
  TaskFunc9
} from '../testability/pages/TaskMethodTest';


export default function TaskPoolSendableNameSpaceTest() {
  describe('TaskPoolSendableNameSpaceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0100
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0100';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace.MyEnum = MyNamespace.MyEnum.Value2;
        const instance: MyNamespace.MyInstance = MyNamespace.myInstance;
        const result2 = sendableFunction(arg, instance);
        console.info(result2);
        await taskpool.execute(TaskFunc1).then((result) => {
          console.info(JSON.stringify(result));
          result1 = JSON.stringify(result).toString();
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(JSON.stringify('value1')).assertEqual(result1);
        expect('value2').assertEqual(result2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0200
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0200';
        console.log(`${caseName} test start`);
        let result1 = 0;
        const arg: MyNamespace1.MyEnum = MyNamespace1.MyEnum.Value2;
        const instance: MyNamespace1.MyInstance = MyNamespace1.myInstance;
        const result2 = sendableFunction2(arg, instance);
        console.info(`${result2}`)
        await taskpool.execute(TaskFunc2).then((result) => {
          console.info(JSON.stringify(result));
          result1 = Number(JSON.stringify(result));
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(1).assertEqual(result1);
        expect(2).assertEqual(result2);
        console.log(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0300
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0300';
        console.log(`${caseName} test start`);
        let result1 = 0;
        const arg: MyNamespace2.MyEnum = MyNamespace2.MyEnum.FalseValue;
        const instance: MyNamespace2.MyInstance = MyNamespace2.myInstance;
        const result2 = Boolean(sendableFunction3(arg, instance));
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc3).then((result) => {
          console.info(JSON.stringify(result));
          result1 = Number(JSON.stringify(result));
        })
       new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(true).assertEqual(Boolean(result1));
        expect(false).assertEqual(result2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0400
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0400';
        console.log(`${caseName} test start`);
        let result1 = 0;
        const arg: MyNamespace4.MyConstEnum = MyNamespace4.MyConstEnum.Value2;
        const instance: MyNamespace4.MyInstance = MyNamespace4.myInstance;
        const result2 = sendableFunction4(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc4).then((result) => {
          console.info(JSON.stringify(result));
          result1 = Number(JSON.stringify(result));
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(1).assertEqual(result1);
        expect(2).assertEqual(result2);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0500
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0500';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg = new MyNamespace5.SendableClass('hello');
        const instance = MyNamespace5.myInstance;
        const result2 = sendableFunction5(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc5).then((result) => {
          console.info(JSON.stringify(result));
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(JSON.stringify({
          'data': 'Taskpool Data'
        })).assertEqual(result1);
        expect(JSON.stringify({
          'data': 'hello'
        })).assertEqual(JSON.stringify(result2));
        console.log(`${caseName} test end`);
        Done()
      })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0600
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0600';
        console.log(`${caseName} test start`);
        let result1 = 0;
        const arg: MyNamespace6.MyType = 20;
        const instance = MyNamespace6.myInstance;
        const result2 = sendableFunction6(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc6).then((result) => {
          console.info(JSON.stringify(result))
          result1 = Number(JSON.stringify(result));
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(result1).assertEqual(result2);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0700
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0700';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg = new MyNamespace7.CustomData(10, 'MainThread Data');
        const instance = MyNamespace7.myInstance;
        const result2 = sendableFunction7(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc7).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(JSON.stringify({
          'data1': 10, 'data2': 'MainThread Data'
        })).assertEqual(JSON.stringify(result2));
        expect(JSON.stringify({
          'data1': 10, 'data2': 'TaskPool Data'
        })).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0800
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0800';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace8.ExportedBoolean = false;
        const instance = MyNamespace8.myInstance;
        const result2 = sendableFunction8(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc8).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(false).assertEqual(result2);
        expect(true).assertEqual(Boolean(result1));
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest0900
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest0900';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace9.ExportedNumber = 5;
        const instance = MyNamespace9.myInstance;
        const result2 = sendableFunction9(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc9).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(5).assertEqual(result2);
        expect(5).assertEqual(Number(result1));
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1000
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1000';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace10.ExportedString = 'hello';
        const instance = MyNamespace10.myInstance;
        const result2 = sendableFunction10(arg, instance);
        console.info(`${result2}`);
        await  taskpool.execute(TaskFunc10).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect('hello').assertEqual(result2);
        expect(JSON.stringify('hello')).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1200
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1200';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace12.ExportedNull = null;
        const instance = MyNamespace12.myInstance;
        const result2 = sendableFunction12(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc12).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(null).assertEqual(result2);
        expect(JSON.stringify(null)).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1300
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1300';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace13.ExportedUndefined = undefined;
        const instance = MyNamespace13.myInstance;
        const result2 = sendableFunction13(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc13).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(undefined).assertEqual(result2);
        expect(JSON.stringify(undefined)).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1400
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1400';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace14.ExportedCollectionsArray = new collections.Array<number>();
        arg.push(40);
        arg.push(50);
        arg.push(60);
        const instance = MyNamespace14.myInstance;
        const result2 = sendableFunction14(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc14).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(3).assertEqual(result2.length);
        expect(JSON.stringify([10, 20, 30])).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1500
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1500';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace15.ExportedReadonlyArray = [40, 50, 60];
        const instance = MyNamespace15.myInstance;
        const result2 = sendableFunction15(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc15).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(3).assertEqual(result2.length);
        expect(JSON.stringify([1, 2, 3])).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1600
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1600';
        console.log(`${caseName} test start`);
        let result1 = '';
        const myMap: MyNamespace16.ExportedCollectionsMap = new collections.Map<string, number>();
        myMap.set('key3', 30);
        myMap.set('key4', 40);
        const instance = MyNamespace16.myInstance;
        const result2 = sendableFunction16(myMap, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc16).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(2).assertEqual(result2.size);
        expect(JSON.stringify({})).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })

    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1700
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1700';
        console.log(`${caseName} test start`);
        let result1 = '';
        const mySet: MyNamespace17.ExportedCollectionsSet = new collections.Set<number>();
        mySet.add(30);
        mySet.add(40);
        const instance = MyNamespace17.myInstance;
        const result2 = sendableFunction17(mySet, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc17).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(2).assertEqual(result2.size);
        expect(JSON.stringify({})).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1800
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1800';
        console.log(`${caseName} test start`);
        let result1 = '';
        const arg: MyNamespace18.ExportedCollectionsInt8Array = new collections.Int8Array([3, 4, 5]);
        const instance = MyNamespace18.myInstance;
        const result2 = sendableFunction18(arg, instance);
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc18).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(3).assertEqual(result2.length);
        expect(JSON.stringify({})).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest1900
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest1900';
        console.log(`${caseName} test start`);
        let result1 = 0;
        const arg: MyNamespace19.ExportedAsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
        ;
        const instance = MyNamespace19.myInstance;
        let result2 = 0;
        sendableFunction19(arg, instance).then((result) => {
          result2 = result
        })

        await taskpool.execute(TaskFunc19).then((result) => {
          console.info(JSON.stringify(result))
          result1 = Number(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 1000));
        console.info(`${result2}`);
        expect(0).assertEqual(result2);
        expect(0).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })


    /**
     * @tc.name   TaskPoolSendableNameSpaceTest2000
     * @tc.number SUB_TASKPOOL_SENDABLE_NAMESPACE_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskPoolSendableNameSpaceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskPoolSendableNameSpaceTest2000';
        console.log(`${caseName} test start`);
        let result1 = '';
        const data: MyNamespace20.UnionSendableType[] = [
          new TypeA('Hello'),
          new TypeB(42)
        ];
        const instance = MyNamespace20.myInstance;
        const result2 = sendableFunction20(data, instance)
        console.info(`${result2}`);
        await taskpool.execute(TaskFunc20).then((result) => {
          console.info(JSON.stringify(result))
          result1 = JSON.stringify(result);
        })
        new Promise<void>((resolve) => setTimeout(resolve, 500));
        expect(2).assertEqual(result2.length);
        expect(JSON.stringify([{
          'data': 'Hello'
        }, {
          'value': 42
        }])).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done()
      })
  })
}