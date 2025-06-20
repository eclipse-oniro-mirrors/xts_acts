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
import { describe, expect, it } from '@ohos/hypium';
import worker, { ErrorEvent, MessageEvents } from '@ohos.worker';
import { collections, lang } from '@kit.ArkTS';
import json from '@ohos.util.json';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

const expectAssertEqual: Function = (actualValue: number | string, expectValue: number | string): void => {
  try {
    expect(actualValue).assertEqual(expectValue);
  } catch (error) {
    console.info(`expectAssertEqual catch error: ${error}`);
  }
}

@Sendable
class MySendAbleClass {
  booleanItem: boolean
  numberItem: number
  stringItem: string
  constructor(booleanItem: boolean, numberItem: number, stringItem: string,) {
    this.booleanItem = booleanItem
    this.numberItem = numberItem
    this.stringItem = stringItem
    booleanItem = false
  }
  returnString() {
    return this.stringItem;
  }
}

@Sendable
class MySendAbleClassB {
  bigintItem: bigint
  constructor(bigintItem: bigint) {
    this.bigintItem = bigintItem
  }
}

@Sendable
class MySendAbleClassC {
  ArrayItem: collections.Array<number>
  constructor(ArrayItem: collections.Array<number>) {
    this.ArrayItem = ArrayItem
  }
}

@Sendable
class MySendAbleClassD {
  ArrayItem: collections.Array<string>
  constructor(ArrayItem: collections.Array<string>) {
    this.ArrayItem = ArrayItem
  }
}

@Sendable
class MySendAbleClass2 extends MySendAbleClass {
  constructor(booleanItem: boolean, numberItem: number, stringItem: string) {
    super(booleanItem, numberItem, stringItem)
  }
}

class A {
  stringItemA: string
  constructor(stringItemA: string) {
    this.stringItemA = stringItemA
  }
}

class B extends A {
  constructor(stringItemA: string) {
    super(stringItemA)
  }
}

class D {
  state: number = 0;
}

class E {
  mysendable: MySendAbleClass2 = new MySendAbleClass2(true,1,'2');
  constructor(mysendable: MySendAbleClass2) {
    this.mysendable = new MySendAbleClass2(false,2,'3');
  }
}

@Sendable
class SendableA {
  state: number = 0;
}

interface Light {
  stringItemB: string;
}

class Car implements Light {
  stringItemB: string = 'aaaa';
}

export default function workerTest() {
  describe('ActsWorkerTest', () => {

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0100
     * @tc.name       : testWorkerPostMessage001
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage001', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage001';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass2 = new MySendAbleClass2(false,1,'');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, '');
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0200
     * @tc.name       : testWorkerPostMessage002
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage002', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage002';
      console.info(`${caseName} test start`);
      let sendableObject: B = new B('');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItemA, '');
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0300
     * @tc.name       : testWorkerPostMessage003
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage003', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage003';
      console.info(`${caseName} test start`);
      let sendableObject: Car = new Car();
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItemB, 'aaaa');
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0400
     * @tc.name       : testWorkerPostMessage004
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage004', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage004';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(true,1,'');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, '');
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0500
     * @tc.name       : testWorkerPostMessage005
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage005', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage005';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(false,1,'bbbb');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.booleanItem, false);
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0600
     * @tc.name       : testWorkerPostMessage006
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage006', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage006';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(false,1,'bbbb');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.numberItem, 1);
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0700
     * @tc.name       : testWorkerPostMessage007
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage007', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage007';
      console.info(`${caseName} test start`);
      const anotherBigInt = BigInt("12345678912345678");
      let sendableObject: MySendAbleClassB = new MySendAbleClassB(anotherBigInt);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${e}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.bigintItem, BigInt(12345678912345678));
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0800
     * @tc.name       : testWorkerPostMessage008
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage008', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage008';
      console.info(`${caseName} test start`);
      let arr1: collections.Array<number> = new collections.Array<number>();
      let num: number = 1;
      arr1.push(num);
      let sendableObject: MySendAbleClassC = new MySendAbleClassC(arr1);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e.data)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.ArrayItem[0], 1);
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0900
     * @tc.name       : testWorkerPostMessage009
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage009', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage009';
      console.info(`${caseName} test start`);
      let arr1: collections.Array<string> = new collections.Array<string>();
      let num: string = 'aabb';
      arr1.push(num);
      let sendableObject: MySendAbleClassD = new MySendAbleClassD(arr1);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e.data)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.ArrayItem[0], 'aabb');
        }
        workerInstance_1.postMessage(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1000
     * @tc.name       : testWorkerPostMessage010
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage010', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage010';
      console.info(`${caseName} test start`);
      let a1: D = new SendableA() as D;
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(a1.state, 0);
        }
        workerInstance_1.postMessage(a1);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1100
     * @tc.name       : testWorkerPostMessage011
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessage011', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage011';
      console.info(`${caseName} test start`);
      const myMap: collections.Map<number, string> = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          console.info(`${caseName}: workerInstance_1.onmessage_value: ${JSON.stringify(myMap.entries().next().value)}`);
          flag_1 = true;
          expectAssertEqual(myMap.entries().next().value[0], 1);
        }
        workerInstance_1.postMessage(myMap.entries().next().value);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1200
     * @tc.name       : testWorkerPostMessageWithSharedSendable001
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable001', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable001';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass2 = new MySendAbleClass2(false,1,'');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, 'string message');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1300
     * @tc.name       : testWorkerPostMessageWithSharedSendable002
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable002', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable002';
      console.info(`${caseName} test start`);
      let sendableObject: B = new B('');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItemA, '');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1400
     * @tc.name       : testWorkerPostMessageWithSharedSendable003
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable003', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable003';
      console.info(`${caseName} test start`);
      let sendableObject: Car = new Car();
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItemB, 'aaaa');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1500
     * @tc.name       : testWorkerPostMessageWithSharedSendable004
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable004', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable004';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(true,1,'bbbb');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, 'aa');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1600
     * @tc.name       : testWorkerPostMessageWithSharedSendable005
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable005', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable005';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(false,1,'bbbb');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.booleanItem, true);
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1700
     * @tc.name       : testWorkerPostMessageWithSharedSendable006
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable006', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable006';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass = new MySendAbleClass(false,1,'bbbb');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.numberItem, 2);
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1800
     * @tc.name       : testWorkerPostMessageWithSharedSendable007
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable007', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable007';
      console.info(`${caseName} test start`);
      const anotherBigInt = BigInt("12345678912345678");
      let sendableObject: MySendAbleClassB = new MySendAbleClassB(anotherBigInt);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${e}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.bigintItem, BigInt("12345678912399999"));
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_1900
     * @tc.name       : testWorkerPostMessageWithSharedSendable008
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable008', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable008';
      console.info(`${caseName} test start`);
      let arr1: collections.Array<number> = new collections.Array<number>();
      let num: number = 1;
      arr1.push(num);
      let sendableObject: MySendAbleClassC = new MySendAbleClassC(arr1);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e.data)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.ArrayItem[0], 2);
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2000
     * @tc.name       : testWorkerPostMessageWithSharedSendable009
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable009', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable009';
      console.info(`${caseName} test start`);
      let arr1: collections.Array<string> = new collections.Array<string>();
      let num: string = 'aabb';
      arr1.push(num);
      let sendableObject: MySendAbleClassD = new MySendAbleClassD(arr1);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e.data)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.ArrayItem[0], 'bbbb');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2100
     * @tc.name       : testWorkerPostMessageWithSharedSendable010
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable010', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable010';
      console.info(`${caseName} test start`);
      let a1: D = new SendableA() as D;
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(a1.state, 1);
        }
        workerInstance_1.postMessageWithSharedSendable(a1);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2200
     * @tc.name       : testWorkerPostMessageWithSharedSendable011
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable011', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable011';
      console.info(`${caseName} test start`);
      const myMap: collections.Map<number, string> = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(myMap.entries().next().value[0], 1);
        }
        workerInstance_1.postMessageWithSharedSendable(myMap.entries().next().value);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2300
     * @tc.name       : testWorkerPostMessageWithSharedSendable012
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable012', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable012';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass2 = new MySendAbleClass2(false,1,'string message');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_instance2.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, 'kaishi');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(200);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(200);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2400
     * @tc.name       : testWorkerPostMessageWithSharedSendable013
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable013', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable013';
      console.info(`${caseName} test start`);
      let sendableObject: MySendAbleClass2 = new MySendAbleClass2(false,1,'string message');
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_instance3.ts');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.stringItem, 'kaishi2');
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(300);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(300);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2500
     * @tc.name       : testWorkerPostMessageWithSharedSendable014
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testWorkerPostMessageWithSharedSendable014', 0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessageWithSharedSendable014';
      console.info(`${caseName} test start`);
      let sendableObject: E = new E(new MySendAbleClass2(false,3,'4'));
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_012.ets');
        let flag_1: boolean = false;
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage_propoties: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(sendableObject.mysendable.numberItem, 2);
        }
        workerInstance_1.postMessageWithSharedSendable(sendableObject);
        while (!flag_1) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        while (!isTerminate_1) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

  });
}