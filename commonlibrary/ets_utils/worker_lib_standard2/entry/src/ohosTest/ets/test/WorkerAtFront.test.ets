/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level} from '@ohos/hypium'
import { worker, MessageEvents } from '@kit.ArkTS'
import { Person } from '../utils/WorkerSendable';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

export default function WorkerAtFrontTest() {
  describe('WorkerAtFrontTest', () => {

    /**
     * @tc.name   workerAtFrontTestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0100
     * @tc.desc   Task set timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass001';
      console.info(`${caseName} test start`);
      try {
        let workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_001.ets");
        let str: string = '';
        let count: number = 0;
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.postMessage('start');
        workerInstance.onmessage = (e: MessageEvents) => {
          let res: string = e.data as string;
          str += res;
          count++;
        }
        while (count < 5) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        expect(str).assertContain('b');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   workerAtFrontTestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0200
     * @tc.desc   postMessageAtFront message is null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_002.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          if (e.data === 'null_done') {
            flag = true;
          }
        }
        workerInstance.postMessage('testNull');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        expect(flag).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   workerAtFrontTestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0300
     * @tc.desc   postMessageAtFront message is undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_002.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          if (e.data === 'undefined_done') {
            flag = true;
          }
        }
        workerInstance.postMessage('testUndefined');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        expect(flag).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   workerAtFrontTestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0400
     * @tc.desc   postMessageAtFront message is non-serializable test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass004';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_003.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data.code).assertEqual(10200006);
        }
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
    })

    /**
     * @tc.name   workerAtFrontTestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0500
     * @tc.desc   postMessageAtFront priority is undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass005';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_004.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data.code).assertEqual(401);
        }
        workerInstance.postMessage('testPriorityUndefined');
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
    })

    /**
     * @tc.name   workerAtFrontTestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0600
     * @tc.desc   postMessageAtFront priority is 0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass006';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_004.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data.code).assertEqual(401);
        }
        workerInstance.postMessage('testPriorityZero');
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
    })

    /**
     * @tc.name   workerAtFrontTestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0700
     * @tc.desc   postMessageAtFront priority is null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass007';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_004.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data.code).assertEqual(401);
        }
        workerInstance.postMessage('testPriorityNull');
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
    })

    /**
     * @tc.name   workerAtFrontTestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0800
     * @tc.desc   postMessageAtFront transfer is null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass008';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_005.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data.code).assertEqual(401);
        }
        workerInstance.postMessage('testTransferNull');
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
    })

    /**
     * @tc.name   workerAtFrontTestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_0900
     * @tc.desc   postMessageAtFront transfer is empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass009';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_006.ets");
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e.data)}`);
          flag = true;
          expect(e.data).assertEqual('empty_array_ok');
        }
        workerInstance.postMessage('empty_array_ok');
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
    })

    /**
     * @tc.name   workerAtFrontTestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_1000
     * @tc.desc   postMessageAtFront same priority insertion order test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass010';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_007.ets");
        let isTerminate: boolean = false;
        let count: number = 0;
        let str: string = '';
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          const res: string = e.data as string;
          str += res;
          count++;
          console.info(`${caseName}: result is ${res}`);
        }
        workerInstance.postMessage('start');
        while (count < 3) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        expect(str).assertContain('c');
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   workerAtFrontTestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_WORKERATFRONT_1100
     * @tc.desc   postMessageAtFront sendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('workerAtFrontTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'workerAtFrontTestClass011';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker("../workers/workerAtFront_008.ets");
        let isTerminate: boolean = false;
        let str: string = '';
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          const res: Person = e.data as Person;
          str = res.getName()
          console.info(`${caseName}: result is ${str}`);
          workerInstance.terminate();
        }

        workerInstance.postMessage(caseName);

        while (!isTerminate) {
          await asyncSleep(100);
        }
        expect(str).assertContain(caseName);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })
  })
}