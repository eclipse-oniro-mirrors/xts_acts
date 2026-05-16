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
import worker, { ErrorEvent, MessageEvents, ThreadWorkerPriority } from '@ohos.worker'

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

let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function workerPriTest() {
  describe('ActsWorkerPriTest', () => {

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
     * @tc.name   testWorkerError10100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_001
     * @tc.desc   test worker total amount limited with ThreadWorkerPriority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError10100';
      console.info(`${caseName} test start`);
      await sleep(4000);
      try {
        const workerInstancesONE: worker.ThreadWorker[] = [];
        for (let i: number = 0; i < 64; i++) {
          workerInstancesONE.push(new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH }));
        }
        try {
          const workerInstancesONE_9: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
          workerInstancesONE_9.terminate();
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200003);
          expectAssertContain(error.message, 'Worker initialization failed');
          console.info(`${caseName}: catch error: done`);
        }
        for (let i: number = 0; i < workerInstancesONE.length; i++) {
          workerInstancesONE[i].terminate();
        }
        console.info(`${caseName}: terminate: done`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testWorkerError10200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_002
     * @tc.desc   test worker error with type parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10200';
      console.info(`${caseName} test start`);
      await sleep(4000);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'module', name: 'first worker in Stage model', shared: false , priority: ThreadWorkerPriority.IDLE
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
     * @tc.name   testWorkerError10300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_003
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'classic', name: 'first worker in Stage model', shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
          );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_004
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          name: 'first worker in Stage model', shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_005
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_006
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_007
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', {
          priority: undefined , type: 'classic', name: 'first worker in Stage model', shared: false
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });



    /**
     * @tc.name   testWorkerError10800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_008
     * @tc.desc   test worker should not have error with random parameter sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });



    /**
     * @tc.name   testWorkerError10900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_009
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError11000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_010
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError11100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_011
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerError11200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_012
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerError11300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_013
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError11400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_014
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError11500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_015
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerError11600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_016
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerError11700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_017
     * @tc.desc   test worker EC 10200004- on interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError11800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_018
     * @tc.desc   test worker EC 10200004- once interface with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerError11900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_019
     * @tc.desc   test worker EC 10200004- off interface with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerError12000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_020
     * @tc.desc   test worker EC 10200004- registerGlobalCallObject interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError12000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError12100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_021
     * @tc.desc   test worker EC 10200004- unregisterGlobalCallObject interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError12100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError12200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_022
     * @tc.desc   test worker EC 10200004- terminate interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError12300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_023
     * @tc.desc   test worker EC 10200004- addEventListener interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError12400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_024
     * @tc.desc   test worker EC 10200004- removeEventListener interface with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerError12500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_025
     * @tc.desc   test worker EC 10200004- dispatchEvent interface with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerError12600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_026
     * @tc.desc   test worker EC 10200004- removeAllListener interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError12700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_027
     * @tc.desc   test worker EC 10200006- onmessage interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError12800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_028
     * @tc.desc   test worker EC 10200006- onmessage interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_012.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError12900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_029
     * @tc.desc   test worker EC 10200019 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_013.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError13000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_030
     * @tc.desc   test worker EC 10200020 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_014.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError13100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_031
     * @tc.desc   test worker EC 10200021 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_015.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError13200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_032
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerError13300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_033
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerError13400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_034
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerError13500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_035
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerConstructor1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_036
     * @tc.desc   test threadWorker constructor MEDIUM + IDLE communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerConstructor1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_037
     * @tc.desc   test threadWorker constructor LOW + HIGH communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerConstructor1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_038
     * @tc.desc   test threadWorker constructor HIGH + MEDIUM communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1', priority: ThreadWorkerPriority.HIGH
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
          name: 'workerInstance_2', priority: ThreadWorkerPriority.MEDIUM
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
     * @tc.name   testWorkerConstructor1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_039
     * @tc.desc   test threadWorker constructor LOW + IDLE communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1', priority: ThreadWorkerPriority.LOW
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
          name: 'workerInstance_2', priority: ThreadWorkerPriority.IDLE
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
     * @tc.name   testWorkerPostMessage1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_040
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerPostMessage1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_041
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerPostMessage1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_042
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerPostMessage1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_043
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerPostMessage1500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_044
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerPostMessage1600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_045
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerPostMessage1700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_046
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerPostMessage1800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_047
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerPostMessage1900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_048
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerPostMessage2000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_049
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerPostMessage2100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_050
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2100';
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerPostMessage2200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_051
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerPostMessage2300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_052
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2300';
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerPostMessage2400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_053
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerPostMessage2500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_054
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerPostMessage2600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_055
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2600';
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerPostMessage2700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_056
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2700';
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerPostMessage2800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_057
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerPostMessage2900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_058
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerPostMessage3000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_059
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage3000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerPostMessage3100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_060
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage3100';
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerOn1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_061
     * @tc.desc   test add an event listening to Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOn1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOn1100';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerOn1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_062
     * @tc.desc   test add an event listening to Worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOn1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOn1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerOnce1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_063
     * @tc.desc   test add an event listener to the Worker, which will be automatically deleted after only executing once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnce1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnce1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerOnce1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_064
     * @tc.desc   test add an event listener to the Worker, which will be automatically deleted after only executing once.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnce1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnce1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerOff1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_065
     * @tc.desc   test delete event listeners of type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOff1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOff1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerOff1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_066
     * @tc.desc   test delete event listeners of type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOff1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOff1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerRegisterGlobalCallObject1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_067
     * @tc.desc   test register an object on the ThreadWorker instance of the host thread, and the methods on this object can be called in the Worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRegisterGlobalCallObject1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRegisterGlobalCallObject1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerRegisterGlobalCallObject1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_068
     * @tc.desc   test register an object on the ThreadWorker instance of the host thread, and the methods on this object can be called in the Worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRegisterGlobalCallObject1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRegisterGlobalCallObject1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerUnregisterGlobalCallObject1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_069
     * @tc.desc   test canceling the object registered on the host thread ThreadWorker instance will release a strong reference to the object that matches the key in the ThreadWorker instance, and there will be no error when there is no matching object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerUnregisterGlobalCallObject1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerUnregisterGlobalCallObject1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.IDLE });
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'BusinessError: The globalCallObject is not registered');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerUnregisterGlobalCallObject1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_070
     * @tc.desc   test canceling the object registered on the host thread ThreadWorker instance will release a strong reference to the object that matches the key in the ThreadWorker instance, and there will be no error when there is no matching object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerUnregisterGlobalCallObject1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerUnregisterGlobalCallObject1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerTerminateAndOnexit1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_071
     * @tc.desc   test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerTerminateAndOnexit1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerTerminateAndOnexit1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_072
     * @tc.desc   test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerTerminateAndOnexit1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
          workerInstance_2.terminate();
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerTerminateAndOnexit1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_073
     * @tc.desc   test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerTerminateAndOnexit1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerTerminateAndOnexit1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_074
     * @tc.desc   test the event handler that is called when the Worker is destroyed is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerTerminateAndOnexit1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerTerminateAndOnexit1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerOnerror1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_075
     * @tc.desc   test the event handler that is called when a Worker encounters an exception during execution, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnerror1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnerror1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts', { priority: ThreadWorkerPriority.IDLE });
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
        }
        workerInstance_1.onerror = (err: ErrorEvent): void => {
          console.info(`${caseName}: workerInstance_1.onerror: ${JSON.stringify(err)}`);
          flag_1 = true;
          expectAssertEqual(err.message, 'Error: worker throw error');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerOnerror1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_076
     * @tc.desc   test the event handler that is called when a Worker encounters an exception during execution, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnerror1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnerror1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_005.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerOnmessage1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_077
     * @tc.desc   test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerOnmessage1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_078
     * @tc.desc   test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerOnmessage1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_079
     * @tc.desc   test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerOnmessage1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_080
     * @tc.desc   test the event handler that is called by the host thread when it receives a message sent by a Worker created by it through the workerPort. postMessage interface, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessage1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerOnmessageerror1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_081
     * @tc.desc   test the event handler that is called when a Worker object receives a message that cannot be serialized, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessageerror1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessageerror1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerOnmessageerror1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_082
     * @tc.desc   test the event handler that is called when a Worker object receives a message that cannot be serialized, and the handler is executed in the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerOnmessageerror1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerOnmessageerror1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerAddEventListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_083
     * @tc.desc   test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerAddEventListener1100';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerAddEventListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_084
     * @tc.desc   test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerAddEventListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerAddEventListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerRemoveEventListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_085
     * @tc.desc   test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveEventListener1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerRemoveEventListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_086
     * @tc.desc   test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveEventListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveEventListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerDispatchEvent1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_087
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEvent1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent1100';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerDispatchEvent1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_088
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEvent1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerDispatchEvent1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_089
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEvent1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent1300';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerDispatchEvent1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_090
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerDispatchEvent1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerDispatchEvent1400';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerRemoveAllListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_091
     * @tc.desc   test delete all event listeners for Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveAllListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveAllListener1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerRemoveAllListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_092
     * @tc.desc   test delete all event listeners for Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerRemoveAllListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerRemoveAllListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerWorkerEventTargetAddEventListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_093
     * @tc.desc   test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetAddEventListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetAddEventListener1100';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerWorkerEventTargetAddEventListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_094
     * @tc.desc   test add an event listener to the Worker, which has the same functionality as the on interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetAddEventListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetAddEventListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerWorkerEventTargetRemoveEventListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_095
     * @tc.desc   test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetRemoveEventListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveEventListener1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerWorkerEventTargetRemoveEventListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_096
     * @tc.desc   test delete Worker's event listening, this interface has the same functionality as the off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetRemoveEventListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveEventListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerWorkerEventTargetDispatchEvent1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_097
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetDispatchEvent1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent1100';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerWorkerEventTargetDispatchEvent1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_098
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetDispatchEvent1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerWorkerEventTargetDispatchEvent1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_099
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetDispatchEvent1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent1300';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerWorkerEventTargetDispatchEvent1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_100
     * @tc.desc   test distribute events defined in Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetDispatchEvent1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetDispatchEvent1400';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerWorkerEventTargetRemoveAllListener1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_101
     * @tc.desc   test delete all event listeners for Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetRemoveAllListener1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveAllListener1100';
      console.info(`${caseName} test start`);
      try {
        let count_1: number = 0;
        let count_2: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerWorkerEventTargetRemoveAllListener1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_102
     * @tc.desc   test delete all event listeners for Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerWorkerEventTargetRemoveAllListener1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerWorkerEventTargetRemoveAllListener1200';
      console.info(`${caseName} test start`);
      try {
        let count: number = 0;
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_103
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_104
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_105
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_106
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_107
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_029.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_108
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts', { priority: ThreadWorkerPriority.IDLE });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_109
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_030.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_110
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage1900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_111
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage1900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_006.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_112
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_113
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_028.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_114
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_115
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_027.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_116
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts', { priority: ThreadWorkerPriority.HIGH });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_117
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts', { priority: ThreadWorkerPriority.LOW });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_025.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_118
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts', { priority: ThreadWorkerPriority.IDLE });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_119
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_017.ts', { priority: ThreadWorkerPriority.LOW });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_120
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts', { priority: ThreadWorkerPriority.MEDIUM });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts', { priority: ThreadWorkerPriority.HIGH });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage2900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_121
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage2900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data.type, 'workerPort');
          workerInstance_2.postMessage({
            name: 'workerInstance_2',
            type: 'worker.ThreadWorker'
          });
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_007.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage3000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_122
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage3000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage3100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_123
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage3100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_011.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage3200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_124
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage3200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage3300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_125
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage3300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_009.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopePostMessage3400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_126
     * @tc.desc   test the Worker thread sends a message to the host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopePostMessage3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopePostMessage3400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
          if (typeof (e.data.message) === 'string') {
            expectAssertEqual(e.data.message, 'IsDetachedBuffer');
          }
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_008.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerCallGlobalCallObjectMethod1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_127
     * @tc.desc   test worker thread calls a specified method of an object registered on the host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerCallGlobalCallObjectMethod1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerCallGlobalCallObjectMethod1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'this is a message from TestObj');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerCallGlobalCallObjectMethod1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_128
     * @tc.desc   test worker thread calls a specified method of an object registered on the host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerCallGlobalCallObjectMethod1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerCallGlobalCallObjectMethod1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'this is a message from TestObj');
          workerInstance_2.postMessage('withParameters');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerClose1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_129
     * @tc.desc   test destroy Worker thread and terminate Worker receiving messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerClose1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerClose1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerClose1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_130
     * @tc.desc   test destroy Worker thread and terminate Worker receiving messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerClose1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerClose1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
        });
        let isTerminate_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
          workerInstance_2.postMessage('close');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_016.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessage1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_131
     * @tc.desc   test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Successfully received string message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessage1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_132
     * @tc.desc   test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Successfully received string message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_018.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessage1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_133
     * @tc.desc   test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Successfully received object message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessage1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_134
     * @tc.desc   test the event handler called by a Worker thread when it receives a message sent through the postMessage interface from its host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessage1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Successfully received object message sent by the main thread');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_019.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessageerror1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_135
     * @tc.desc   test the event handler that is called when a Worker object receives a message that cannot be deserialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessageerror1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessageerror1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerThreadWorkerGlobalScopeOnmessageerror1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_136
     * @tc.desc   test the event handler that is called when a Worker object receives a message that cannot be deserialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerThreadWorkerGlobalScopeOnmessageerror1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerThreadWorkerGlobalScopeOnmessageerror1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
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
          expectAssertEqual(e.data, 'Worker thread successfully processed error');
          workerInstance_2.postMessage('start');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_020.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerGlobalScopeOnerror1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_137
     * @tc.desc   test the oneerror property of GlobalScope represents the event handler that was called when a Worker encountered an exception during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerGlobalScopeOnerror1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeOnerror1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts', {
          priority: ThreadWorkerPriority.HIGH, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts', {
          priority: ThreadWorkerPriority.MEDIUM, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerGlobalScopeOnerror1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_138
     * @tc.desc   test the oneerror property of GlobalScope represents the event handler that was called when a Worker encountered an exception during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerGlobalScopeOnerror1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeOnerror1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_021.ts', {
          priority: ThreadWorkerPriority.LOW, type: 'classic', name: 'first worker in Stage model', shared: false
        });
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
     * @tc.name   testWorkerGlobalScopeAndErrorEvent1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_139
     * @tc.desc   test the globalScope and errorEvent properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerGlobalScopeAndErrorEvent1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeAndErrorEvent1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_026.ts', {
          name: 'workerInstance', priority: ThreadWorkerPriority.IDLE
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

    /**
     * @tc.name   testWorkerGlobalScopeAndErrorEvent1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_140
     * @tc.desc   test the globalScope and errorEvent properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerGlobalScopeAndErrorEvent1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerGlobalScopeAndErrorEvent1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_026.ts', {
          name: 'workerInstance', priority: ThreadWorkerPriority.HIGH
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

    /**
     * @tc.name   threadWorker_priority_test
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_141
     * @tc.desc   worker priority test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('threadWorker_priority_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let idleWorkerisTerminate = false;
        let lowWorkerisTerminate = false;
        let mediumWorkerisTerminate = false;
        let highWorkerisTerminate = false;
        let deadlineWorkerisTerminate = false;
        let vipWorkerisTerminate = false;

        let idleWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.IDLE});
        idleWorker.postMessage('idle');

        let lowWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.LOW});
        lowWorker.postMessage('low');

        let mediumWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.MEDIUM});
        mediumWorker.postMessage('medium');

        let highWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.HIGH});
        highWorker.postMessage('high');

        let deadlineWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.DEADLINE});
        deadlineWorker.postMessage('deadline');

        let vipWorker = new worker.ThreadWorker('../workers/prioWorker.ts', {priority: ThreadWorkerPriority.VIP});
        vipWorker.postMessage('vip');

        idleWorker.onmessage = (e) => {
            expect(e.data).assertEqual('idle worker');
            idleWorker.terminate();
        }

        idleWorker.onexit = () => {
            idleWorkerisTerminate = true;
            console.log('threadWorker_priority_test idleWorker onexit');
        }

        lowWorker.onmessage = (e) => {
            expect(e.data).assertEqual('low worker');
            lowWorker.terminate();
        }

        lowWorker.onexit = () => {
            lowWorkerisTerminate = true;
            console.log('threadWorker_priority_test lowWorker onexit');
        }

        mediumWorker.onmessage = (e) => {
            expect(e.data).assertEqual('medium worker');
            mediumWorker.terminate();
        }

        mediumWorker.onexit = () => {
            mediumWorkerisTerminate = true;
            console.log('threadWorker_priority_test mediumWorker onexit');
        }

        highWorker.onmessage = (e) => {
            expect(e.data).assertEqual('high worker');
            highWorker.terminate();
        }

        highWorker.onexit = () => {
            highWorkerisTerminate = true;
            console.log('threadWorker_priority_test highWorker onexit');
        }

        deadlineWorker.onmessage = (e) => {
            expect(e.data).assertEqual('deadline worker');
            deadlineWorker.terminate();
        }

        deadlineWorker.onexit = () => {
            deadlineWorkerisTerminate = true;
            console.log('threadWorker_priority_test deadlineWorker onexit');
        }

        vipWorker.onmessage = (e) => {
            expect(e.data).assertEqual('vip worker');
            vipWorker.terminate();
        }

        vipWorker.onexit = () => {
            vipWorkerisTerminate = true;
            console.log('threadWorker_priority_test vipWorker onexit');
        }

        while (!idleWorkerisTerminate || !lowWorkerisTerminate || !mediumWorkerisTerminate || !highWorkerisTerminate ||
            !deadlineWorkerisTerminate || !vipWorkerisTerminate) {
            await asyncSleep(100);
        }
        done();
    });
  });
}