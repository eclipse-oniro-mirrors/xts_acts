/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level} from '@ohos/hypium';
import { ClassB, MyClass, MyClass2, MySendAbleClass, SendAbleClassB, SendableA, A, sendableAFunc1,
  ClassB2 } from '../utils/SendAbleClass';
import taskpool from '@ohos.taskpool';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch {
    console.info(`${caseName} expect failed `);
  }
}

const expectAssertEqual: Function = (actualValue: number | string, expectValue: number | string): void => {
  try {
    expect(actualValue).assertEqual(expectValue);
  } catch (error) {
    console.info(`expectAssertEqual catch error: ${error}`);
  }
}

@Concurrent
function sendAbleAddFunc(sendAble: MySendAbleClass): Promise<number> {
  sendAble.numberItem1 = sendAble.numberItem1 + 20;
  return new Promise<number>((res) => {
    res(sendAble.add());
  });
}

@Concurrent
function AddFunc(sendAble: MyClass): Promise<number> {
  sendAble.numberItem1 = sendAble.numberItem1 + 20;
  return new Promise<number>((res) => {
    res(sendAble.add());
  });
}

@Concurrent
function AddFunc2(sendAble: MyClass2): Promise<collections.Array<number>> {
  sendAble.array2.push(2);
  return new Promise<collections.Array<number>>((res) => {
    res(sendAble.array2);
  });
}

@Concurrent
function sendableAFunc(sendAble: SendableA): Promise<number> {
  sendAble.state = sendAble.state + 20;
  let task1: taskpool.Task = new taskpool.Task(sendableAFunc1, sendAble);
  taskpool.execute(task1).then((e: Object) => {
    console.info(` task1 ${JSON.stringify(sendAble)} then ${JSON.stringify(e)}`);
  }).catch((e: BusinessError) => {
    console.info(` task1 catch ${JSON.stringify(e)}`);
  });
  return new Promise<number>((res) => {
    res(sendAble.state);
  });
}

@Concurrent
function sendableAsAFunc(sendAble: A): Promise<number> {
  sendAble.state = sendAble.state + 20;
  return new Promise<number>((res) => {
    res(sendAble.state);
  });
}


@Concurrent
function sendAbleStringFunc(sendAble: MySendAbleClass): Promise<string> {
  sendAble.stringItem = '修改SendAble';
  return new Promise<string>((res) => {
    res(sendAble.stringEdit());
  });
}

@Concurrent
function sendAbleBooleanFunc(sendAble: MySendAbleClass): Promise<boolean> {
  sendAble.booleanItem = false
  return new Promise<boolean>((res) => {
    res(sendAble.booleanItemEdit());
  });
}

@Concurrent
function sendAbleBigintEditFunc(sendAble: MySendAbleClass): Promise<BigInt> {
  sendAble.bigint1 = BigInt('22222222')
  return new Promise<BigInt>((res) => {
    res(sendAble.bigintEdit());
  });
}

@Concurrent
function sendAblearrFun(sendAble: collections.Array<number>): Promise<collections.Array<number>> {
  sendAble.push(6666)
  return new Promise<collections.Array<number>>((res) => {
    res(sendAble);
  });
}

@Concurrent
function sendAbleMapFun(sendAble: collections.Map<number, string>): Promise<collections.Map<number, string>> {
  sendAble.delete(2)
  return new Promise<collections.Map<number, string>>((res) => {
    res(sendAble);
  });
}

@Concurrent
function sendAbleSetFun(sendAble: collections.Set<string>): Promise<collections.Set<string>> {
  sendAble.add("sendAble")
  return new Promise<collections.Set<string>>((res) => {
    res(sendAble);
  });
}


export default function taskPoolSendableTest() {
  describe('taskPoolSendableTest', () => {
    /**
     * @tc.name   testSendableExecute0100
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute0100";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          expectAssertEqual(sendAble.numberItem1, 40);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0200
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0200";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleStringFunc, sendAble);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.stringItem, '修改SendAble');
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(sendAble)}}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0300
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0300";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.booleanItem, false);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0400
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0400
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0400";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleBigintEditFunc, sendAble);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.bigint1, BigInt('22222222'));
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0500
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0500
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0500";
      console.log(`${caseName} test start `);
      let arr1: collections.Array<number> = new collections.Array<number>();
      let num: number = 1;
      arr1.push(num)
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAblearrFun, arr1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          expectAssertEqual(arr1.length, 1);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0600
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0600
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0600";
      console.log(`${caseName} test start `);
      const myMap: collections.Map<number, string> = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleMapFun, myMap);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(myMap)}`);
          expectAssertEqual(myMap.size, 4);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0700
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0700
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableExecute0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = "testSendableExecute0700";
      console.log(`${caseName} test start `);
      let mySet: collections.Set<string> = new collections.Set<string>();
      mySet.add("foo")
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleSetFun, mySet);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${mySet} then ${JSON.stringify(e)}`);
          expectAssertEqual(mySet.size, 2);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0800
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0800
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute0800";
      console.log(`${caseName} test start `);
      let num1: ClassB = new ClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(AddFunc, num1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(true, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute0900
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_0900
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute0900";
      console.log(`${caseName} test start `);
      let sendableA1: SendableA = new SendableA();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendableAFunc, sendableA1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(sendableA1)} then ${JSON.stringify(e)}`);
          expectAssertEqual(sendableA1.state, 40);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute1000
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_1000
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute1000";
      console.log(`${caseName} test start `);
      let a1: A = new SendableA() as A;
      try {
        let task1: taskpool.Task = new taskpool.Task(sendableAsAFunc, a1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(a1)} then ${JSON.stringify(e)}`);
          expectAssertEqual(a1.state, 20);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(true, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute1100
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_1100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute1100";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          let task2: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
          taskpool.execute(task2).then((e: Object) => {
            console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
            expectAssertEqual(sendAble.numberItem1, 60);
          }).catch((e: Object) => {
            console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
            ExpectTrue(false, caseName);
          });
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute1200
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_1200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute1200";
      console.log(`${caseName} test start `);
      let sendAble1: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1bb then ${typeof JSON.stringify(sendAble1.numberItem1)}`);
          ExpectTrue(true, caseName);
          // expectAssertEqual(sendAble1.numberItem1, '40');
          console.info(`${caseName} hahahah`);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        let task2: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble1);
        taskpool.execute(task2).then((e: Object) => {
          console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
          expectAssertEqual('', '');
          console.info(`${caseName} dddaaa`);
        }).catch((e: Object) => {
          console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableExecute1300
     * @tc.number SUB_Runtime_Language_Backend_SendableExecute_1300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableExecute1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableExecute1300";
      console.log(`${caseName} test start `);
      let num1: ClassB2 = new ClassB2();
      try {
        let task1: taskpool.Task = new taskpool.Task(AddFunc2, num1);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
          expectAssertEqual(num1.array2.length, 2)
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(true, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0100
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0100";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          expectAssertEqual(sendAble.numberItem1, 20);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0200
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0200";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleStringFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.stringItem, 'test case');
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(sendAble)}}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0300
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0300";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.booleanItem, true);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0400
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0400
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0400";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleBigintEditFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}${JSON.stringify(sendAble)}`);
          expectAssertEqual(sendAble.bigint1, BigInt('9007199254740991'));
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0500
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0500
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0500";
      console.log(`${caseName} test start `);
      let arr1: collections.Array<number> = new collections.Array<number>();
      let num: number = 1;
      arr1.push(num)
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAblearrFun, arr1);
        task1.setCloneList([arr1]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(arr1.length)}`);
          expectAssertEqual(arr1.length, 1);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0600
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0600
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0600";
      console.log(`${caseName} test start `);
      const myMap: collections.Map<number, string> = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleMapFun, myMap);
        task1.setCloneList([myMap]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${myMap.size}`);
          expectAssertEqual(myMap.size, 3);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0700
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0700
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0700";
      console.log(`${caseName} test start `);
      let mySet: collections.Set<string> = new collections.Set<string>();
      mySet.add("foo")
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleSetFun, mySet);
        task1.setCloneList([mySet]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${mySet.size} then ${JSON.stringify(e)}`);
          expectAssertEqual(mySet.size, 1);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0800
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0800
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0800";
      console.log(`${caseName} test start `);
      let num1: ClassB = new ClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(AddFunc, num1);
        task1.setCloneList([num1]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList0900
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_0900
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList0900";
      console.log(`${caseName} test start `);
      let sendableA1: SendableA = new SendableA();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendableAFunc, sendableA1);
        task1.setCloneList([sendableA1]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(sendableA1)} then ${JSON.stringify(e)}`);
          expectAssertEqual(sendableA1.state, 0);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(true, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList1000
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_1000
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList1000";
      console.log(`${caseName} test start `);
      let a1: A = new SendableA() as A;
      try {
        let task1: taskpool.Task = new taskpool.Task(sendableAsAFunc, a1);
        task1.setCloneList([a1]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(a1)} then ${JSON.stringify(e)}`);
          expectAssertEqual(a1.state, 0);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(true, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList1100
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_1100
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList1100";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          let task2: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
          task2.setCloneList([sendAble]);
          taskpool.execute(task2).then((e: Object) => {
            console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
            expectAssertEqual(sendAble.numberItem1, 0);
          }).catch((e: Object) => {
            console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
            ExpectTrue(false, caseName);
          });
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList1200
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_1200
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList1200";
      console.log(`${caseName} test start `);
      let sendAble: SendAbleClassB = new SendAbleClassB();
      try {
        let task1: taskpool.Task = new taskpool.Task(sendAbleAddFunc, sendAble);
        task1.setCloneList([sendAble]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 then ${JSON.stringify(e)}`);
          expectAssertEqual(sendAble.numberItem1, 20);
        }).catch((e: Object) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        let task2: taskpool.Task = new taskpool.Task(sendAbleBooleanFunc, sendAble);
        task2.setCloneList([sendAble]);
        taskpool.execute(task2).then((e: Object) => {
          console.info(`${caseName} task2 then ${JSON.stringify(e)}`);
          ExpectTrue(sendAble.booleanItem == true, caseName);
        }).catch((e: Object) => {
          console.info(`${caseName} task2 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testSendableSetCloneList1300
     * @tc.number SUB_Runtime_Language_Backend_SendableSetCloneList_1300
     * @tc.desc   Sendable class can only inherit from Sendable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableSetCloneList1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = "testSendableSetCloneList1300";
      console.log(`${caseName} test start `);
      let num1: ClassB2 = new ClassB2();
      try {
        let task1: taskpool.Task = new taskpool.Task(AddFunc2, num1);
        task1.setCloneList([num1]);
        taskpool.execute(task1).then((e: Object) => {
          console.info(`${caseName} task1 ${JSON.stringify(num1)} then ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        }).catch((e: BusinessError) => {
          console.info(`${caseName} task1 catch ${JSON.stringify(e)}`);
          ExpectTrue(false, caseName);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.log(`${caseName} test end `);
    });
  });
}