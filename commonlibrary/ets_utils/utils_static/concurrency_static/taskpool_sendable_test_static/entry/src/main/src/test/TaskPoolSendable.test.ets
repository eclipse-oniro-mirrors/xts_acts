/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {
  ClassB,
  MyClass,
  MyClass2,
  MySendAbleClass,
  SendAbleClassB,
  SendableA,
  A,
  sendableAFunc1,
  ClassB2
} from '../utils/SendAbleClass';
import { BusinessError } from '@ohos.base';
import ArrayList from '@ohos.util.ArrayList';
import Deque from '@ohos.util.Deque';
import HashMap from '@ohos.util.HashMap';
import HashSet from '@ohos.util.HashSet';
import LightWeightMap from '@ohos.util.LightWeightMap';
import LightWeightSet from '@ohos.util.LightWeightSet';
import LinkedList from '@ohos.util.LinkedList';
import List from '@ohos.util.List';
import PlainArray from '@ohos.util.PlainArray';
import Queue from '@ohos.util.Queue';
import Stack from '@ohos.util.Stack';
import TreeMap from '@ohos.util.TreeMap';
import TreeSet from '@ohos.util.TreeSet';
import util from '@ohos.util';
import hilog from '@ohos.hilog';

function sendAbleAddFunc(sendAble: MySendAbleClass): Promise<Number> {
  sendAble.numberItem1 = sendAble.numberItem1 + 20;
  return new Promise<Number>((res) => {
    res(sendAble.add());
  });
}

function AddFunc(sendAble: MyClass): Promise<Number> {
  sendAble.numberItem1 = sendAble.numberItem1 + 20;
  return new Promise<Number>((res) => {
    res(sendAble.add());
  });
}

function AddFunc2(sendAble: MyClass2): Promise<Array<Number>> {
  sendAble.array2.push(2);
  return new Promise<Array<Number>>((res) => {
    res(sendAble.array2);
  });
}

async function sendableAFunc(sendAble: SendableA): Promise<Number> {
  sendAble.state = sendAble.state + 20;
  let task1: taskpool.Task = new taskpool.Task(sendableAFunc1, sendAble);
  try {
    const result = await taskpool.execute(task1);
    console.info(`task1 result: ${JSON.stringify(result)}`);
  } catch (e) {
    console.info(`task1 error: ${JSON.stringify(e)}`);
  }
  return new Promise<Number>((res) => {
    res(sendAble.state);
  });
}

function sendableAsAFunc(sendAble: A): Promise<Number> {
  sendAble.state = sendAble.state + 20;
  return new Promise<Number>((res) => {
    res(sendAble.state);
  });
}


function sendAbleStringFunc(sendAble: MySendAbleClass): Promise<string> {
  sendAble.stringItem = '修改SendAble';
  return new Promise<string>((res) => {
    res(sendAble.stringEdit());
  });
}

function sendAbleBooleanFunc(sendAble: MySendAbleClass): Promise<boolean> {
  sendAble.booleanItem = false
  return new Promise<boolean>((res) => {
    res(sendAble.booleanItemEdit());
  });
}

function sendAbleBigintEditFunc(sendAble: MySendAbleClass): Promise<BigInt> {
  sendAble.bigint1 = BigInt('22222222')
  return new Promise<BigInt>((res) => {
    res(sendAble.bigintEdit());
  });
}

function sendAblearrFun(sendAble: Array<Number>): Promise<Array<Number>> {
  sendAble.push(Number(6666))
  return new Promise<Array<Number>>((res) => {
    res(sendAble);
  });
}

function sendAbleMapFun(sendAble: Map<Number, string>): Promise<Map<Number, string>> {
  sendAble.delete(Number(2))
  return new Promise<Map<Number, string>>((res) => {
    res(sendAble);
  });
}

function sendAbleSetFun(sendAble: Set<string>): Promise<Set<string>> {
  sendAble.add("sendAble")
  return new Promise<Set<string>>((res) => {
    res(sendAble);
  });
}

export default function taskPoolSendableTest() {
  describe('taskPoolSendableTest', (): void => {
    /**
     * @tc.name   testSendableExecute_static_0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0100";
        console.log(`${caseName} test start `);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
            expect(String(sendAble.numberItem1)).assertEqual(String('40'));
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });


    /**
     * @tc.name   testSendableExecute_static_0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0200";
        console.log(`${caseName} test start `);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleStringFunc, sendAble);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 then ${JSON.stringify(sendAble)}`);
            expect(String(sendAble.stringItem)).assertEqual(String('修改SendAble'));
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(sendAble)}}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0300";
        console.log(`${caseName} test start `);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
            expect(String(sendAble.booleanItem)).assertEqual(String('false'));
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0400
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0400";
        console.log(`${caseName} test start `);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleBigintEditFunc, sendAble);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
            expect(String(sendAble.bigint1)).assertEqual(String(BigInt('22222222')));
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0500
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0500";
        console.log(`${caseName} test start `);
        let arr1: Array<Number> = new Array<Number>();
        let num: number = 1;
        arr1.push(num)
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAblearrFun, arr1);
          taskpool.execute(task1).then((e: Any) => {
            expect(arr1.length).assertEqual(2);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0600
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0600";
        console.log(`${caseName} test start `);
        const myMap: Map<Number, string> = new Map<Number, string>([
          [1, "one"],
          [2, "two"],
          [3, "three"],
        ]);
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleMapFun, myMap);
          taskpool.execute(task1).then((e: Any) => {
            hilog.info(0x0000, caseName, '%{public}s', `========${myMap.size}`);
            expect(myMap.size).assertEqual(2);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            hilog.info(0x0000, caseName, '%{public}s', `e========${e}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          hilog.info(0x0000, caseName, '%{public}s', `error========${error}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0700
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0700";
        console.log(`${caseName} test start `);
        let mySet: Set<string> = new Set<string>();
        mySet.add("foo")
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleSetFun, mySet);
          taskpool.execute(task1).then((e: Any) => {
            // console.info(`${caseName} task1 ${mySet} then ${JSON.stringify(e)}`);
            hilog.info(0x0000, caseName, '%{public}s', `========${mySet.size}`);
            expect(mySet.size).assertEqual(2);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            hilog.info(0x0000, caseName, '%{public}s', `e========${e}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          hilog.info(0x0000, caseName, '%{public}s', `error========${error}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0800
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0800";
        console.log(`${caseName} test start `);
        let num1: ClassB = new ClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(AddFunc, num1);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_0900
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_0900";
        console.log(`${caseName} test start `);
        let sendableA1: SendableA = new SendableA();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendableAFunc, sendableA1);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 ${JSON.stringify(sendableA1)} then ${JSON.stringify(e)}`);
            expect(sendableA1.state).assertEqual(40);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_1000
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_1000";
        console.log(`${caseName} test start `);
        let a1: A = new A();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendableAsAFunc, a1);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 ${JSON.stringify(a1)} then ${JSON.stringify(e)}`);
            expect(a1.state).assertEqual(20);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_1100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_1100";
        console.log(`${caseName} test start `);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
            let task2: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
            taskpool.execute(task2).then((e: Any) => {
              console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
              expect(sendAble.numberItem1).assertEqual(60);
            }).catch((e: Any) => {
              console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
              expect(false).assertTrue();
            });
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_1200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_1200";
        console.log(`${caseName} test start `);
        let sendAble1: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble1);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1bb then ${typeof JSON.stringify(sendAble1.numberItem1)}`);
            // expectAssertEqual(sendAble1.numberItem1, '40');
            console.info(`${caseName} hahahah`);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          let task2: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble1);
          taskpool.execute(task2).then((e: Any) => {
            console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
          }).catch((e: Any) => {
            console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

    /**
     * @tc.name   testSendableExecute_static_1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_CONCURRENT_TASKPOOL_SendableExecute_1300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testSendableExecute_static_1300";
        console.log(`${caseName} test start `);
        let num1: ClassB2 = new ClassB2();
        try {
          let task1: taskpool.Task = new taskpool.Task(AddFunc2, num1);
          taskpool.execute(task1).then((e: Any) => {
            console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
            expect(num1.array2.length).assertEqual(3);
          }).catch((e: Any) => {
            console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
            expect(false).assertTrue();
          });
          done();
        } catch (error) {
          console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
          expect(false).assertTrue();
          done();
        }
        console.log(`${caseName} test end `);
      });

  });

}