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
import { describe, expect, it, TestType, Size, Level} from '@ohos/hypium'
import worker, { ErrorEvent, MessageEvents } from '@ohos.worker'

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

const expectAssertTrue: Function = (actualValue: boolean): void => {
  try {
    expect(actualValue).assertTrue();
  } catch (error) {
    console.info(`expectAssertTrue catch error: ${error}`);
  }
}

const expectAssertContain: Function = (actualValue: string, expectValue: string): void => {
  try {
    expect(actualValue).assertContain(expectValue);
  } catch (error) {
    console.info(`expectAssertContain catch error: ${error}`);
  }
}

type ActualValueType = number | Date | string | RegExp | Array<string | number> | Map<string, string> | Set<number> | Object | ArrayBuffer | Int8Array;
const expectAssertInstanceOf: Function = (actualValue: ActualValueType, expectValue: string): void => {
  try {
    expect(actualValue).assertInstanceOf(expectValue);
  } catch (error) {
    console.info(`expectAssertInstanceOf catch error: ${error}`);
  }
}

export default function workerTest() {
  describe('ActsWorkerTest', () => {

    class TestObj {
      private message: string = 'this is a message from TestObj';

      public getMessage(): string {
        return this.message;
      }

      public getMessageWithInput(str: string): string {
        return `${this.message} with input: ${str}`;
      }
    }

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10100
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate: boolean = false;
        let flag: boolean = false;
        const workerInstances: worker.ThreadWorker[] = [];
        for (let i: number = 0; i < 64; i++) {
          workerInstances.push(new worker.ThreadWorker('../workers/worker.ts'));
        }
        try {
          const workerInstance_9: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
          workerInstance_9.terminate();
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          flag = true;
          expectAssertEqual(error.code, 10200003);
          expectAssertContain(error.message, 'Worker initialization failed');
        }
        for (let i: number = 0; i < workerInstances.length; i++) {
          workerInstances[i].terminate();
        }
        workerInstances[7].onexit = (): void => {
          isTerminate = true;
        };
        while (!(isTerminate && flag)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10200
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'module', name: 'first worker in Stage model', shared: false
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the type must be ' +
            'classic, unsupport others now.');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10300
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.postMessage({
          name: 'workerInstance',
          type: 'worker.ThreadWorker'
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10400
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const func: Function = (): string => {
          return 'func';
        }
        try {
          workerInstance.postMessage(func);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10500
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.on('workerInstance_on', () => {
          console.info(`${caseName}: workerInstance_on listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10600
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.once('workerInstance_once', () => {
          console.info(`${caseName}: workerInstance_once listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10700
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.on('workerInstance_on', () => {
          console.info(`${caseName}: workerInstance_on listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.off('workerInstance_on');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10800
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        let registerObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', registerObj);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10900
     * @tc.name       : testWorkerError001
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        let registerObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', registerObj);
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.unregisterGlobalCallObject('myObj');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11000
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11100
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11200
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.removeEventListener('workerInstance_addEventListener');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11300
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11400
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        workerInstance.addEventListener('workerInstance_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_addEventListener2 listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.removeAllListener();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11500
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200006);
          expectAssertContain(e.data.message, 'An exception occurred during serialization');
        }
        workerInstance.postMessage('message');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11600
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_012.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200006);
          expectAssertContain(e.data.message, 'An exception occurred during serialization');
        }

        class TestFuncObj {
          public getFunction(): Function {
            const add = (num1: number, num2: number): number => {
              return num1 + num2;
            }
            return add;
          }
        }

        const testObj: TestFuncObj = new TestFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11700
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_013.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200019);
          expectAssertContain(e.data.message, 'The globalCallObject is not registered');
        }
        const testObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.unregisterGlobalCallObject('myObj');
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11800
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_014.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200020);
          expect(e.data.message)
            .assertContain('The method to be called is not callable or is an async method or a generator');
        }

        class TestAsyncFuncObj {
          public async testAsyncFunc(): Promise<Object> {
            return new Promise(resolve => setTimeout(resolve, 1000));
          }
        }

        const testObj: TestAsyncFuncObj = new TestAsyncFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('TestAsyncFuncObj');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_11900
     * @tc.name       : testWorkerError002
     * @tc.desc       : test worker error
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_015.ts');
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          if (e.data == 'host thread executes 2000ms') {
            let t = Date.now();
            while (Date.now() - t < 2000) {}
          } else {
            flag = true;
            expectAssertEqual(e.data.code, 10200021);
            expectAssertContain(e.data.message, 'Waiting for a global call timed out');
          }
        }

        class TestTimeoutFuncObj {
          public testTimeoutFunc(): number {
            let sum: number = 0;
            for (let i: number = 0; i < 1000000; i++) {
              sum += i;
            }
            return sum;
          }
        }

        const testObj: TestTimeoutFuncObj = new TestTimeoutFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0100
     * @tc.name       : testWorkerConstructor001
     * @tc.desc       : test threadWorker constructor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance');
          workerInstance_2.postMessage(e.data);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello workerInstance');
        }
        workerInstance_1.postMessage('workerInstance');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0200
     * @tc.name       : testWorkerConstructor002
     * @tc.desc       : test threadWorker constructor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1'
        });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_2'
        });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'workerInstance_2');
        }
        workerInstance_1.postMessage('getWorkerInstance_1Name');
        workerInstance_2.postMessage('getWorkerInstance_2Name');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerConstructor003
     * @tc.desc       : test threadWorker constructor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts');
        expect().assertFail();
        workerInstance.terminate();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200007);
        expectAssertContain(error.message, 'The worker file path is invalid');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_0400
     * @tc.name       : testWorkerPostMessage001
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWorkerPostMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello string message');
        }
        workerInstance_1.postMessage('string message');
        workerInstance_2.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage002
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'string message');
          workerInstance_2.postMessage('string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello string message');
        }
        workerInstance_1.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage003
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100002);
        }
        workerInstance_1.postMessage(100001);
        workerInstance_2.postMessage(100002);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage004
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage004';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
          workerInstance_2.postMessage(100002);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100002);
        }
        workerInstance_1.postMessage(100001);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage005
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage005';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const date1: Date = new Date();
        workerInstance_1.postMessage(date1);
        const date2: Date = new Date();
        workerInstance_2.postMessage(date2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage006
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage006';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
          const date2: Date = new Date();
          workerInstance_2.postMessage(date2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const date1: Date = new Date();
        workerInstance_1.postMessage(date1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage007
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage007';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const re1: RegExp = new RegExp('worker1');
        workerInstance_1.postMessage(re1);
        const re2: RegExp = new RegExp('worker2');
        workerInstance_2.postMessage(re2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage008
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage008';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
          const re2: RegExp = new RegExp('worker2');
          workerInstance_2.postMessage(re2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const re1: RegExp = new RegExp('worker1');
        workerInstance_1.postMessage(re1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage009
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage009';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const arr1: Array<number> = new Array(1, 2, 3);
        workerInstance_1.postMessage(arr1);
        const arr2: Array<number> = Array(4, 5, 6);
        workerInstance_2.postMessage(arr2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage010
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage010';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
          const arr2: Array<number> = Array(4, 5, 6);
          workerInstance_2.postMessage(arr2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const arr1: Array<number> = new Array(1, 2, 3);
        workerInstance_1.postMessage(arr1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage011
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage011';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const map1: Map<string, string> = new Map([['name', 'worker1']]);
        workerInstance_1.postMessage(map1);
        const map2: Map<string, string> = new Map([['name', 'worker2']]);
        workerInstance_2.postMessage(map2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage012
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage012';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
          const map2: Map<string, string> = new Map([['name', 'worker2']]);
          workerInstance_2.postMessage(map2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const map1: Map<string, string> = new Map([['name', 'worker1']]);
        workerInstance_1.postMessage(map1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage013
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage013';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const set1: Set<number> = new Set([1, 2, 3]);
        workerInstance_1.postMessage(set1);
        const set2: Set<number> = new Set([4, 5, 6]);
        workerInstance_2.postMessage(set2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage014
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage014';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
          const set2: Set<number> = new Set([4, 5, 6]);
          workerInstance_2.postMessage(set2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const set1: Set<number> = new Set([1, 2, 3]);
        workerInstance_1.postMessage(set1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage015
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage015';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.name, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.name, 'workerInstance_2');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        workerInstance_2.postMessage({
          name: 'workerInstance_2',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage016
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage016';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.name, 'workerInstance_1');
          workerInstance_2.postMessage({
            name: 'workerInstance_2',
            type: 'worker.ThreadWorker'
          });
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.name, 'workerInstance_2');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage017
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage017';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        const buff1: ArrayBuffer = new ArrayBuffer(8);
        workerInstance_1.postMessage(buff1);
        const buff2: ArrayBuffer = new ArrayBuffer(16);
        workerInstance_2.postMessage(buff2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2100
     * @tc.name       : testWorkerPostMessage018
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage018';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
          const buff2: ArrayBuffer = new ArrayBuffer(16);
          workerInstance_2.postMessage(buff2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        const buff1: ArrayBuffer = new ArrayBuffer(8);
        workerInstance_1.postMessage(buff1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage019
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage019';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        const intArr1: Int8Array = new Int8Array([1, 2, 3]);
        workerInstance_1.postMessage(intArr1);
        const intArr2: Int8Array = new Int8Array([4, 5, 6]);
        workerInstance_2.postMessage(intArr2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.name       : testWorkerPostMessage020
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage020';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
          const intArr2: Int8Array = new Int8Array([4, 5, 6]);
          workerInstance_2.postMessage(intArr2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        const intArr1: Int8Array = new Int8Array([1, 2, 3]);
        workerInstance_1.postMessage(intArr1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2400
     * @tc.name       : testWorkerPostMessage021
     * @tc.desc       : test host threads send messages to worker threads
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerPostMessage021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage021';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
        }
        let buffer_1: ArrayBuffer = new ArrayBuffer(8);
        workerInstance_1.postMessage(buffer_1, [buffer_1]);
        try {
          let length: number = buffer_1.byteLength;
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.message, 'IsDetachedBuffer');
        }
        let buffer_2: ArrayBuffer = new ArrayBuffer(8);
        workerInstance_2.postMessage(buffer_2, [buffer_2]);
        try {
          let length: number = buffer_2.byteLength;
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.message, 'IsDetachedBuffer');
        }
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2500
     * @tc.name       : testWorkerOn001
     * @tc.desc       : test add an event listening to Worker
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOn001';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.off('workerInstance_1_on');
        workerInstance_2.off('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2600
     * @tc.name       : testWorkerOn002
     * @tc.desc       : test add an event listening to Worker
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOn002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_on', timeStamp: 0
          });
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.off('workerInstance_1_on');
        workerInstance_2.off('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2700
     * @tc.name       : testWorkerOnce001
     * @tc.desc       : test add an event listener to the Worker, which will be automatically deleted after only executing once.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnce001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.once('workerInstance_1_once', () => {
          console.info(`${caseName}: workerInstance_1_once listener callback`);
          flag_1 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.once('workerInstance_2_once', () => {
          console.info(`${caseName}: workerInstance_2_once listener callback`);
          flag_2 = true;
          count_2++;
        });
        for (let i: number = 0; i < 3; i++) {
          workerInstance_1.dispatchEvent({
            type: 'workerInstance_1_once', timeStamp: 0
          });
          workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_once', timeStamp: 0
          });
        }
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2800
     * @tc.name       : testWorkerOnce002
     * @tc.desc       : test add an event listener to the Worker, which will be automatically deleted after only executing once.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnce002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.once('workerInstance_1_once', () => {
          console.info(`${caseName}: workerInstance_1_once listener callback`);
          flag_1 = true;
          workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_once', timeStamp: 0
          });
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.once('workerInstance_2_once', () => {
          console.info(`${caseName}: workerInstance_2_once listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_once', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_once', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_once', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_2900
     * @tc.name       : testWorkerOff001
     * @tc.desc       : test delete event listeners of type
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOff001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count_2++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.off('workerInstance_1_on');
        workerInstance_2.off('workerInstance_2_on');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3000
     * @tc.name       : testWorkerOff002
     * @tc.desc       : test delete event listeners of type
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOff002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          count++;
          workerInstance_2.off('workerInstance_2_on');
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        while (!flag_1) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.off('workerInstance_1_on');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3100
     * @tc.name       : testWorkerRegisterGlobalCallObject001
     * @tc.desc       : test register an object on the ThreadWorker instance of the host thread, and the methods on this object can be called in the Worker thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRegisterGlobalCallObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRegisterGlobalCallObject001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj with input: hello there!');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        let registerObj_2: TestObj = new TestObj();
        workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
        workerInstance_1.postMessage('noParameters');
        workerInstance_2.postMessage('withParameters');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3200
     * @tc.name       : testWorkerRegisterGlobalCallObject002
     * @tc.desc       : test register an object on the ThreadWorker instance of the host thread, and the methods on this object can be called in the Worker thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRegisterGlobalCallObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRegisterGlobalCallObject002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj');
          let registerObj_2: TestObj = new TestObj();
          workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
          workerInstance_2.postMessage('withParameters');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj with input: hello there!');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        workerInstance_1.postMessage('noParameters');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3300
     * @tc.name       : testWorkerUnregisterGlobalCallObject001
     * @tc.desc       : test canceling the object registered on the host thread ThreadWorker instance will release a strong reference to the object that matches the key in the ThreadWorker instance, and there will be no error when there is no matching object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerUnregisterGlobalCallObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerUnregisterGlobalCallObject001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'BusinessError: The globalCallObject is not registered');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
          flag_2 = true;
          expectAssertEqual(err.message, 'BusinessError: The globalCallObject is not registered');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        let registerObj_2: TestObj = new TestObj();
        workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
        workerInstance_1.unregisterGlobalCallObject('myObj');
        workerInstance_2.unregisterGlobalCallObject('myObj');
        workerInstance_1.postMessage('noParameters');
        workerInstance_2.postMessage('withParameters');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3400
     * @tc.name       : testWorkerUnregisterGlobalCallObject002
     * @tc.desc       : test canceling the object registered on the host thread ThreadWorker instance will release a strong reference to the object that matches the key in the ThreadWorker instance, and there will be no error when there is no matching object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerUnregisterGlobalCallObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerUnregisterGlobalCallObject002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'BusinessError: The globalCallObject is not registered');
          workerInstance_2.unregisterGlobalCallObject('myObj');
          workerInstance_2.postMessage('withParameters');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
          flag_2 = true;
          expectAssertEqual(err.message, 'BusinessError: The globalCallObject is not registered');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        let registerObj_2: TestObj = new TestObj();
        workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
        workerInstance_1.unregisterGlobalCallObject('myObj');
        workerInstance_1.postMessage('noParameters');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3500
     * @tc.name       : testWorkerTerminateAndOnexit001
     * @tc.desc       : test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerTerminateAndOnexit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(isTerminate_1);
        expectAssertTrue(isTerminate_2);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3600
     * @tc.name       : testWorkerTerminateAndOnexit002
     * @tc.desc       : test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerTerminateAndOnexit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
          workerInstance_2.terminate();
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_1.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(isTerminate_1);
        expectAssertTrue(isTerminate_2);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3700
     * @tc.name       : testWorkerTerminateAndOnexit003
     * @tc.desc       : test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerTerminateAndOnexit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        workerInstance.onexit = (code: number) => {
          console.info(`${caseName}: workerInstance.onexit`);
          expectAssertEqual(code, 0);
          done();
        }
        workerInstance.terminate();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3800
     * @tc.name       : testWorkerTerminateAndOnexit004
     * @tc.desc       : test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerTerminateAndOnexit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit004';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        workerInstance.onexit = (code: number) => {
          console.info(`${caseName}: workerInstance.onexit`);
          expectAssertEqual(code, 1);
          done();
        }
        workerInstance.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance.onerror: ${JSON.stringify(err)}`);
        }
        workerInstance.postMessage('error');
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_3900
     * @tc.name       : testWorkerOnerror001
     * @tc.desc       : test the event handler that is called when a Worker encounters an exception during execution, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnerror001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'Error: worker throw error');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
          flag_2 = true;
          expectAssertEqual(err.message, 'Error: worker throw error');
        }
        workerInstance_1.postMessage('error');
        workerInstance_2.postMessage('error');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4000
     * @tc.name       : testWorkerOnerror002
     * @tc.desc       : test the event handler that is called when a Worker encounters an exception during execution, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnerror002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnerror002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'Error: worker throw error');
          workerInstance_2.postMessage('error');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
          flag_2 = true;
          expectAssertEqual(err.message, 'Error: worker throw error');
        }
        workerInstance_1.postMessage('error');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4100
     * @tc.name       : testWorkerOnmessage001
     * @tc.desc       : test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello string message');
        }
        workerInstance_1.postMessage('string message');
        workerInstance_2.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4200
     * @tc.name       : testWorkerOnmessage002
     * @tc.desc       : test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnmessage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.name, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.name, 'workerInstance_2');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        workerInstance_2.postMessage({
          name: 'workerInstance_2',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4300
     * @tc.name       : testWorkerOnmessageerror001
     * @tc.desc       : test the event handler that is called when a Worker object receives a message that cannot be serialized, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnmessageerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessageerror001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessageerror = (err: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessageerror: ${JSON.stringify(err)}`);
          flag_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessageerror = (err: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessageerror: ${JSON.stringify(err)}`);
          flag_2 = true;
        }
        const func_1 = () => {
          return 'func_1';
        }
        const func_2 = () => {
          return 'func_2';
        }
        try {
          workerInstance_1.postMessage(func_1);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        try {
          workerInstance_2.postMessage(func_2);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(flag_1);
        expectAssertTrue(flag_2);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4400
     * @tc.name       : testWorkerOnmessageerror002
     * @tc.desc       : test the event handler that is called when a Worker object receives a message that cannot be serialized, and the handler is executed in the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerOnmessageerror002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessageerror002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessageerror = (err: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessageerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          try {
            workerInstance_2.postMessage(func_2);
          } catch (error) {
            console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
            expectAssertEqual(error.code, 10200006);
            expectAssertContain(error.message, 'An exception occurred during serialization');
          }
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessageerror = (err: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessageerror: ${JSON.stringify(err)}`);
          flag_2 = true;
        }
        const func_1 = () => {
          return 'func_1';
        }
        const func_2 = () => {
          return 'func_2';
        }
        try {
          workerInstance_1.postMessage(func_1);
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(flag_1);
        expectAssertTrue(flag_2);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4500
     * @tc.name       : testWorkerAddEventListener001
     * @tc.desc       : test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerAddEventListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerAddEventListener001';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4600
     * @tc.name       : testWorkerAddEventListener002
     * @tc.desc       : test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerAddEventListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerAddEventListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_addEventListener', timeStamp: 0
          });
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4700
     * @tc.name       : testWorkerRemoveEventListener001
     * @tc.desc       : test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRemoveEventListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveEventListener001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count_2++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4800
     * @tc.name       : testWorkerRemoveEventListener002
     * @tc.desc       : test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRemoveEventListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveEventListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
          workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        while (!flag_1) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_4900
     * @tc.name       : testWorkerDispatchEvent001
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerDispatchEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent001';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
        expectAssertTrue(dispatchEventSuccess_2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5000
     * @tc.name       : testWorkerDispatchEvent002
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerDispatchEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_addEventListener', timeStamp: 0
          });
          console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
          expectAssertTrue(dispatchEventSuccess_2);
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5100
     * @tc.name       : testWorkerDispatchEvent003
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerDispatchEvent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent003';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
        expectAssertTrue(dispatchEventSuccess_2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_on');
        workerInstance_2.removeEventListener('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5200
     * @tc.name       : testWorkerDispatchEvent004
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerDispatchEvent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent004';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_on', timeStamp: 0
          });
          console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
          expectAssertTrue(dispatchEventSuccess_2);
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_on');
        workerInstance_2.removeEventListener('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5300
     * @tc.name       : testWorkerRemoveAllListener001
     * @tc.desc       : test delete all event listeners for Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRemoveAllListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveAllListener001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        let flag_1_2: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count_1++;
        });
        workerInstance_1.addEventListener('workerInstance_1_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener2 listener callback`);
          flag_1_2 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        let flag_2_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count_2++;
        });
        workerInstance_2.addEventListener('workerInstance_2_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener2 listener callback`);
          flag_2_2 = true;
          count_2++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        while (!(flag_1 && flag_1_2 && flag_2 && flag_2_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 2);
        expectAssertEqual(count_2, 2);
        workerInstance_1.removeAllListener();
        workerInstance_2.removeAllListener();
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count_1, 2);
        expectAssertEqual(count_2, 2);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5400
     * @tc.name       : testWorkerRemoveAllListener002
     * @tc.desc       : test delete all event listeners for Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerRemoveAllListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveAllListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        let flag_1_2: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        workerInstance_1.addEventListener('workerInstance_1_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener2 listener callback`);
          flag_1_2 = true;
          count++;
          workerInstance_2.removeAllListener();
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          count++;
        });
        workerInstance_2.addEventListener('workerInstance_2_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener2 listener callback`);
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        while (!flag_1 && flag_1_2) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 4);
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 4);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5500
     * @tc.name       : testWorkerWorkerEventTargetAddEventListener001
     * @tc.desc       : test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetAddEventListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetAddEventListener001';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5600
     * @tc.name       : testWorkerWorkerEventTargetAddEventListener002
     * @tc.desc       : test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetAddEventListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetAddEventListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_addEventListener', timeStamp: 0
          });
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5700
     * @tc.name       : testWorkerWorkerEventTargetRemoveEventListener001
     * @tc.desc       : test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetRemoveEventListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveEventListener001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count_2++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count_1, 1);
        expectAssertEqual(count_2, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5800
     * @tc.name       : testWorkerWorkerEventTargetRemoveEventListener002
     * @tc.desc       : test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetRemoveEventListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveEventListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
          workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        while (!flag_1) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 1);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_5900
     * @tc.name       : testWorkerWorkerEventTargetDispatchEvent001
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetDispatchEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent001';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
        expectAssertTrue(dispatchEventSuccess_2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6000
     * @tc.name       : testWorkerWorkerEventTargetDispatchEvent002
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetDispatchEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_addEventListener', timeStamp: 0
          });
          console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
          expectAssertTrue(dispatchEventSuccess_2);
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_addEventListener');
        workerInstance_2.removeEventListener('workerInstance_2_addEventListener');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6100
     * @tc.name       : testWorkerWorkerEventTargetDispatchEvent003
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetDispatchEvent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent003';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          count++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
        expectAssertTrue(dispatchEventSuccess_2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeEventListener('workerInstance_1_on');
        workerInstance_2.removeEventListener('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6200
     * @tc.name       : testWorkerWorkerEventTargetDispatchEvent004
     * @tc.desc       : test distribute events defined in Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetDispatchEvent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent004';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.on('workerInstance_1_on', () => {
          console.info(`${caseName}: workerInstance_1_on listener callback`);
          flag_1 = true;
          const dispatchEventSuccess_2 = workerInstance_2.dispatchEvent({
            type: 'workerInstance_2_on', timeStamp: 0
          });
          console.info(`${caseName}: dispatchEventSuccess_2 = ${dispatchEventSuccess_2}`);
          expectAssertTrue(dispatchEventSuccess_2);
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.on('workerInstance_2_on', () => {
          console.info(`${caseName}: workerInstance_2_on listener callback`);
          flag_2 = true;
          count++;
        });
        const dispatchEventSuccess_1 = workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_on', timeStamp: 0
        });
        console.info(`${caseName}: dispatchEventSuccess_1 = ${dispatchEventSuccess_1}`);
        expectAssertTrue(dispatchEventSuccess_1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 1);
        workerInstance_1.removeEventListener('workerInstance_1_on');
        workerInstance_2.removeEventListener('workerInstance_2_on');
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6300
     * @tc.name       : testWorkerWorkerEventTargetRemoveAllListener001
     * @tc.desc       : test delete all event listeners for Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetRemoveAllListener001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveAllListener001';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        let flag_1_2: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count_1++;
        });
        workerInstance_1.addEventListener('workerInstance_1_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener2 listener callback`);
          flag_1_2 = true;
          count_1++;
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        let flag_2_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          flag_2 = true;
          count_2++;
        });
        workerInstance_2.addEventListener('workerInstance_2_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener2 listener callback`);
          flag_2_2 = true;
          count_2++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        while (!(flag_1 && flag_1_2 && flag_2 && flag_2_2)) {
          await asyncSleep(100);
        }
        expectAssertEqual(count_1, 2);
        expectAssertEqual(count_2, 2);
        workerInstance_1.removeAllListener();
        workerInstance_2.removeAllListener();
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count_1, 2);
        expectAssertEqual(count_2, 2);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6400
     * @tc.name       : testWorkerWorkerEventTargetRemoveAllListener002
     * @tc.desc       : test delete all event listeners for Worker.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerWorkerEventTargetRemoveAllListener002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveAllListener002';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        let flag_1_2: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.addEventListener('workerInstance_1_addEventListener', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener listener callback`);
          flag_1 = true;
          count++;
        });
        workerInstance_1.addEventListener('workerInstance_1_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_1_addEventListener2 listener callback`);
          flag_1_2 = true;
          count++;
          workerInstance_2.removeAllListener();
        });
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.addEventListener('workerInstance_2_addEventListener', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener listener callback`);
          count++;
        });
        workerInstance_2.addEventListener('workerInstance_2_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_2_addEventListener2 listener callback`);
          count++;
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        while (!flag_1 && flag_1_2) {
          await asyncSleep(100);
        }
        expectAssertEqual(count, 2);
        workerInstance_1.removeAllListener();
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        workerInstance_1.dispatchEvent({
          type: 'workerInstance_1_addEventListener2', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener', timeStamp: 0
        });
        workerInstance_2.dispatchEvent({
          type: 'workerInstance_2_addEventListener2', timeStamp: 0
        });
        await asyncSleep(1000);
        expectAssertEqual(count, 2);
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6500
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage001
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100001);
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6600
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage002
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100001);
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6700
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage003
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6800
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage004
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage004';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_6900
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage005
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage005';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'receive data from worker_006');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'receive data from worker_006');
        }
        workerInstance_1.postMessage('message');
        workerInstance_2.postMessage('message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7000
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage006
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage006';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'receive data from worker_006');
          workerInstance_2.postMessage('message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'receive data from worker_006');
        }
        workerInstance_1.postMessage('message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7100
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage007
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage007';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7200
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage008
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage008';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7300
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage009
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage009';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7400
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage010
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage010';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7500
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage011
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage011';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7600
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage012
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage012';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7700
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage013
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage013';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7800
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage014
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage014';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_7900
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage015
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage015';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.type, 'workerPort');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.type, 'workerPort');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        workerInstance_2.postMessage({
          name: 'workerInstance_2',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8000
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage016
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage016';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.type, 'workerPort');
          workerInstance_2.postMessage({
            name: 'workerInstance_2',
            type: 'worker.ThreadWorker'
          });
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.type, 'workerPort');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8100
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage017
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage017';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8200
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage018
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage018';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8300
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage019
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage019';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8400
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage020
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage020';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Int8Array');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8500
     * @tc.name       : testWorkerThreadWorkerGlobalScopePostMessage021
     * @tc.desc       : test the Worker thread sends a message to the host thread.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage021';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          if (typeof (e.data.message) === 'string') {
            expectAssertEqual(e.data.message, 'IsDetachedBuffer');
          }
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          if (typeof (e.data.message) === 'string') {
            expectAssertEqual(e.data.message, 'IsDetachedBuffer');
          }
        }
        workerInstance_1.postMessage('message');
        workerInstance_2.postMessage('message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8600
     * @tc.name       : testWorkerCallGlobalCallObjectMethod001
     * @tc.desc       : test worker thread calls a specified method of an object registered on the host thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerCallGlobalCallObjectMethod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerCallGlobalCallObjectMethod001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj with input: hello there!');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        let registerObj_2: TestObj = new TestObj();
        workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
        workerInstance_1.postMessage('noParameters');
        workerInstance_2.postMessage('withParameters');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8700
     * @tc.name       : testWorkerCallGlobalCallObjectMethod002
     * @tc.desc       : test worker thread calls a specified method of an object registered on the host thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerCallGlobalCallObjectMethod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerCallGlobalCallObjectMethod002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj');
          workerInstance_2.postMessage('withParameters');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'this is a message from TestObj with input: hello there!');
        }
        let registerObj_1: TestObj = new TestObj();
        workerInstance_1.registerGlobalCallObject('myObj', registerObj_1);
        let registerObj_2: TestObj = new TestObj();
        workerInstance_2.registerGlobalCallObject('myObj', registerObj_2);
        workerInstance_1.postMessage('noParameters');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8800
     * @tc.name       : testWorkerClose001
     * @tc.desc       : test destroy Worker thread and terminate Worker receiving messages
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerClose001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts');
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_1.postMessage('close');
        workerInstance_2.postMessage('close');
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(isTerminate_1);
        expectAssertTrue(isTerminate_2);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_8900
     * @tc.name       : testWorkerClose002
     * @tc.desc       : test destroy Worker thread and terminate Worker receiving messages
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerClose002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts');
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
          workerInstance_2.postMessage('close');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts');
        let isTerminate_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_1.postMessage('close');
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        expectAssertTrue(isTerminate_1);
        expectAssertTrue(isTerminate_2);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9000
     * @tc.name       : testWorkerThreadWorkerGlobalScopeOnmessage001
     * @tc.desc       : test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'Successfully received string message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Successfully received string message sent by the main thread');
        }
        workerInstance_1.postMessage('string message');
        workerInstance_2.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9100
     * @tc.name       : testWorkerThreadWorkerGlobalScopeOnmessage002
     * @tc.desc       : test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'Successfully received object message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Successfully received object message sent by the main thread');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        workerInstance_2.postMessage({
          name: 'workerInstance_2',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9200
     * @tc.name       : testWorkerThreadWorkerGlobalScopeOnmessageerror001
     * @tc.desc       : test the event handler that is called when a Worker object receives a message that cannot be deserialized
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessageerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessageerror001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
        }
        workerInstance_1.postMessage('start');
        workerInstance_2.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9300
     * @tc.name       : testWorkerThreadWorkerGlobalScopeOnmessageerror002
     * @tc.desc       : test the event handler that is called when a Worker object receives a message that cannot be deserialized
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessageerror002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessageerror002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
        }
        workerInstance_1.postMessage('start');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9400
     * @tc.name       : testWorkerGlobalScopeOnerror001
     * @tc.desc       : test the oneerror property of GlobalScope represents the event handler that was called when a Worker encountered an exception during execution
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerGlobalScopeOnerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeOnerror001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerPort.onerror Successfully processed');
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'workerPort.onerror Successfully processed');
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
        }
        workerInstance_1.postMessage('error');
        workerInstance_2.postMessage('error');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_9500
     * @tc.name       : testWorkerGlobalScopeOnerror002
     * @tc.desc       : test the oneerror property of GlobalScope represents the event handler that was called when a Worker encountered an exception during execution
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWorkerGlobalScopeOnerror002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeOnerror002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts');
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerPort.onerror Successfully processed');
          workerInstance_2.postMessage('error');
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts');
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'workerPort.onerror Successfully processed');
        }
        workerInstance_2.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_2.onerror: ${JSON.stringify(err)}`);
        }
        workerInstance_1.postMessage('error');
        while (!(flag_1 && flag_2)) {
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
     * @tc.number     : SUB_Runtime_Language_Backend_WorkerConcurrency_10000
     * @tc.name       : testWorkerGlobalScopeAndErrorEvent001
     * @tc.desc       : test the globalScope and errorEvent properties
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testWorkerGlobalScopeAndErrorEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeAndErrorEvent001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_026.ts', {
          name: 'workerInstance'
        });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertTrue(e.data);
        }
        workerInstance.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance.onerror: err.message => ${err.message} err.filename => ${err.filename} err.lineno => ${err.lineno} type => ${typeof err.lineno} err.colno => ${err.colno} type => ${typeof err.colno} err.error => ${err.error}`);
          expect(err.message)
            .assertContain('BusinessError: An exception occurred during serialization, failed to serialize message.');
          expectAssertContain(err.filename, 'workers/worker_026');
          expectAssertEqual(typeof err.lineno, 'number');
          expectAssertEqual(typeof err.colno, 'number');
          expect(err.error.toString())
            .assertContain('Error: An exception occurred during serialization, failed to serialize message.');
        }
        workerInstance.postMessage('GlobalScope');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.postMessage('ErrorEvent');
        while (!isTerminate) {
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