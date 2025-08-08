/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { GCFull } from './GCFull';

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}
@Concurrent
async function threadWait(conditionVariable: ArkTSUtils.locks.ConditionVariable): Promise<boolean> {
  let result = false;
  console.log(`TaskPool Thread Wait: Waiting...`);
  await conditionVariable.wait().then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
    result = true;
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return result;
}

@Concurrent
async function threadWaitFor(conditionVariable: ArkTSUtils.locks.ConditionVariable, waitTime?: number): Promise<boolean> {
  let result = false;
  console.log(`TaskPool Thread Wait: Waiting...`);
  await conditionVariable.waitFor(waitTime != undefined ? waitTime : 1000).then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
    result = true;
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return result;
}


@Concurrent
function threadWaitNotAwait(conditionVariable: ArkTSUtils.locks.ConditionVariable): boolean {
  console.log(`TaskPool Thread Wait: Waiting...`);
  conditionVariable.wait().then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return true;
}

@Concurrent
function threadNotify(conditionVariable: ArkTSUtils.locks.ConditionVariable) {
  console.log(`TaskPool Thread Notify: start...`);
  conditionVariable.notifyAll();
  console.log(`TaskPool Thread Notify: Notifying one thread...`);
}

@Concurrent
async function threadGC(conditionVariable: ArkTSUtils.locks.ConditionVariable): Promise<boolean> {
  let result = false;
  {
    console.log(`threadGC Thread Wait: Waiting...`);
    conditionVariable.wait().then(() => {
      console.log(`threadGC Thread Wait: Then continue...`);
      result = true;
    });
    conditionVariable.notifyAll();
  }
  GCFull();
  await new Promise<number>(resolve => setTimeout(resolve, 3000));
  return result;
}

@Concurrent
function threadNotifyOne(conditionVariable: ArkTSUtils.locks.ConditionVariable) {
  console.log(`TaskPool Thread Notify: start...`);
  conditionVariable.notifyAll();
  console.log(`TaskPool Thread Notify: Notifying one thread...`);
}

export default function conditionVariableTest() {
  describe('ConditionVariableTest', () => {

    beforeEach(async () => {
      await sleep(1000);
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableWait001
     * @tc.name      : ActsLocksTestConditionVariableWait001
     * @tc.desc      : check wait use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWait001', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.wait();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWait002
     * @tc.name      : ActsLocksTestConditionVariableWait002
     * @tc.desc      : check create wait thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWait002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWait003
     * @tc.name      : ActsLocksTestConditionVariableWait003
     * @tc.desc      : check wait use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWait003', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait003';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = ArkTSUtils.locks.ConditionVariable.request("Test");
        conditionVariable.wait();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWait004
     * @tc.name      : ActsLocksTestConditionVariableWait004
     * @tc.desc      : check create wait thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWait004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor001
     * @tc.name      : ActsLocksTestConditionVariableWaitFor001
     * @tc.desc      : check waitFor use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor001', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor001';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.waitFor(waitTime);
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor002
     * @tc.name      : ActsLocksTestConditionVariableWaitFor002
     * @tc.desc      : check create waitFor greater than 0 thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor003
     * @tc.name      : ActsLocksTestConditionVariableWaitFor003
     * @tc.desc      : check create waitFor equal to 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor004
     * @tc.name      : ActsLocksTestConditionVariableWaitFor004
     * @tc.desc      : check create waitFor less than 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = -1;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor005
     * @tc.name      : ActsLocksTestConditionVariableWaitFor005
     * @tc.desc      : check create waitFor
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor005', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }
        await sleep(sleepTime);
        expect(result && threadExecutionTime >= 3000).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor006
     * @tc.name      : ActsLocksTestConditionVariableWaitFor006
     * @tc.desc      : check waitFor use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor006', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor006';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.waitFor(waitTime);
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor007
     * @tc.name      : ActsLocksTestConditionVariableWaitFor007
     * @tc.desc      : check create waitFor greater than 0 thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor007', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor007';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor008
     * @tc.name      : ActsLocksTestConditionVariableWaitFor008
     * @tc.desc      : check create waitFor equal to 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor008', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor008';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor009
     * @tc.name      : ActsLocksTestConditionVariableWaitFor009
     * @tc.desc      : check create waitFor less than 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor009', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor009';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = -1;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableWaitFor010
     * @tc.name      : ActsLocksTestConditionVariableWaitFor010
     * @tc.desc      : check create waitFor
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableWaitFor010', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor010';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }
        await sleep(sleepTime);
        expect(result && threadExecutionTime >= 3000).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify001
     * @tc.name      : ActsLocksTestConditionVariableNotify001
     * @tc.desc      : check notify use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify001', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.notifyAll();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify002
     * @tc.name      : ActsLocksTestConditionVariableNotify002
     * @tc.desc      : check create notify thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadNotify, conditionVariable).then(() => {
          result = true;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify003
     * @tc.name      : ActsLocksTestConditionVariableNotify003
     * @tc.desc      : check create wait notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify004
     * @tc.name      : ActsLocksTestConditionVariableNotify004
     * @tc.desc      : check create more wait one notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify004';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify005
     * @tc.name      : ActsLocksTestConditionVariableNotify005
     * @tc.desc      : check create waitFor notify operationTime less than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify005', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        await sleep(500);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify006
     * @tc.name      : ActsLocksTestConditionVariableNotify006
     * @tc.desc      : check create waitFor notify operationTime greater than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify006', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify006';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify007
     * @tc.name      : ActsLocksTestConditionVariableNotify007
     * @tc.desc      : check create waitFor operationTime greater than waitTime 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify007', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify007';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify008
     * @tc.name      : ActsLocksTestConditionVariableNotify008
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify008', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify008';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify009
     * @tc.name      : ActsLocksTestConditionVariableNotify009
     * @tc.desc      : check create more wait more notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify009', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify009';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        });
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        });
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify010
     * @tc.name      : ActsLocksTestConditionVariableNotify010
     * @tc.desc      : check create overlapping wait notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify010', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify010';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify011
     * @tc.name      : ActsLocksTestConditionVariableNotify011
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify011', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify011';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        taskpool.execute(threadWait, conditionVariable, 3000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify012
     * @tc.name      : ActsLocksTestConditionVariableNotify012
     * @tc.desc      : check notify use
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify012', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify012';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.notifyAll();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify013
     * @tc.name      : ActsLocksTestConditionVariableNotify013
     * @tc.desc      : check create notify thread
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify013', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify013';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadNotify, conditionVariable).then(() => {
          result = true;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify014
     * @tc.name      : ActsLocksTestConditionVariableNotify014
     * @tc.desc      : check create wait notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify014', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify014';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify015
     * @tc.name      : ActsLocksTestConditionVariableNotify015
     * @tc.desc      : check create more wait one notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify015', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify015';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify016
     * @tc.name      : ActsLocksTestConditionVariableNotify016
     * @tc.desc      : check create waitFor notify operationTime less than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify016', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify016';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        await sleep(500);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify017
     * @tc.name      : ActsLocksTestConditionVariableNotify017
     * @tc.desc      : check create waitFor notify operationTime greater than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify017', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify017';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify018
     * @tc.name      : ActsLocksTestConditionVariableNotify018
     * @tc.desc      : check create waitFor operationTime greater than waitTime 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify018', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify018';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify019
     * @tc.name      : ActsLocksTestConditionVariableNotify019
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify019', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify019';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify020
     * @tc.name      : ActsLocksTestConditionVariableNotify020
     * @tc.desc      : check create more wait more notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify020', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify020';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        });
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        });
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify021
     * @tc.name      : ActsLocksTestConditionVariableNotify021
     * @tc.desc      : check create overlapping wait notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify021', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify021';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotify022
     * @tc.name      : ActsLocksTestConditionVariableNotify022
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotify022', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify022';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        taskpool.execute(threadWait, conditionVariable, 3000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne001
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne001
     * @tc.desc      : check use notifyOne
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne001', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.notifyOne();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne002
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne002
     * @tc.desc      : check create notifyOne thread
     * @tc.level     : Level 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne002';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadNotifyOne, conditionVariable).then(() => {
          expect(true).assertTrue();
        });
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne003
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne003
     * @tc.desc      : check create wait notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne004
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne004
     * @tc.desc      : check create more wait one notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne004';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne005
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne005
     * @tc.desc      : check create waitFor notify operationTime less than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne005', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        await sleep(500);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne006
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne006
     * @tc.desc      : check create waitFor notifyOne operationTime greater than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne006', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne006';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne007
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne007
     * @tc.desc      : check create waitFor operationTime greater than waitTime 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne007', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne007';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne008
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne008
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne008', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne008';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(1000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne009
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne009
     * @tc.desc      : check create wait waitFor more notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne009', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne009';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        });
        taskpool.execute(threadWaitFor, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        });
        await sleep(1000);
        taskpool.execute(threadNotifyOne, conditionVariable);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne010
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne010
     * @tc.desc      : check create overlapping wait notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne010', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne010';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne011
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne011
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne011', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne011';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(5000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne012
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne012
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne012', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne012';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        taskpool.execute(threadWait, conditionVariable, 5000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne013
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne013
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne013', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne013';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        let resultFirst: boolean = false;
        let resultSecond: boolean = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        await sleep(1000);
        taskpool.execute(threadWait, conditionVariable, 8000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        resultFirst = resultThread1 && !resultThread2 && resultThread3 && !resultThread4
          && threadExecutionTime < 1000;
        if (resultFirst) {
          const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
          notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
          await sleep(2000);
          resultSecond = resultThread1 && resultThread2 && resultThread3 && resultThread4
            && threadExecutionTime < 1000;
          notifyThreadWorker.terminate();
          expect(resultSecond).assertTrue();
        } else {
          expect(resultFirst).assertTrue();
        }
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne014
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne014
     * @tc.desc      : check use notifyOne
     * @tc.level     : Level 2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne014', 0, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne014';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.notifyOne();
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne015
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne015
     * @tc.desc      : check create notifyOne thread
     * @tc.level     : Level 0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne015', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne015';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadNotifyOne, conditionVariable).then(() => {
          expect(true).assertTrue();
        });
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne016
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne016
     * @tc.desc      : check create wait notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne016', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne016';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne017
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne017
     * @tc.desc      : check create more wait one notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne017', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne017';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne018
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne018
     * @tc.desc      : check create waitFor notify operationTime less than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne018', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne018';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        await sleep(500);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne019
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne019
     * @tc.desc      : check create waitFor notifyOne operationTime greater than waitTime thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne019', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne019';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne020
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne020
     * @tc.desc      : check create waitFor operationTime greater than waitTime 0 thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne020', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne020';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne021
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne021
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne021', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne021';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        console.info(`${CASE} START 1`);

        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 2`);

        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 3`);

        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 4`);

        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
          console.info(`${CASE} START 5` + resultThread1);

        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
          console.info(`${CASE} START 6` + resultThread2);

        }
        await sleep(1000);
        console.info(`${CASE} START 7`);

        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne022
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne022
     * @tc.desc      : check create wait waitFor more notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne022', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne022';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        });
        taskpool.execute(threadWaitFor, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        });
        await sleep(1000);
        taskpool.execute(threadNotifyOne, conditionVariable);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne023
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne023
     * @tc.desc      : check create overlapping wait notifyOne thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne023', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne023';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne024
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne024
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne024', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne024';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(5000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne025
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne025
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne025', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne025';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        taskpool.execute(threadWait, conditionVariable, 5000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableNotifyOne026
     * @tc.name      : ActsLocksTestConditionVariableNotifyOne026
     * @tc.desc      : check create wait waitFor notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableNotifyOne026', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne026';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        let resultFirst: boolean = false;
        let resultSecond: boolean = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        });
        await sleep(1000);
        taskpool.execute(threadWait, conditionVariable, 8000).then((data) => {
          resultThread4 = data as boolean;
        });
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        resultFirst = resultThread1 && !resultThread2 && resultThread3 && !resultThread4
          && threadExecutionTime < 1000;
        if (resultFirst) {
          const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
          notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
          await sleep(2000);
          resultSecond = resultThread1 && resultThread2 && resultThread3 && resultThread4
            && threadExecutionTime < 1000;
          expect(resultSecond).assertTrue();
          notifyThreadWorker.terminate();
        } else {
          expect(resultFirst).assertTrue();
        }
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableTaskPool001
     * @tc.name      : ActsLocksTestConditionVariableTaskPool001
     * @tc.desc      : check create taskPool wait thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableTaskPool001', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool001';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        taskpool.execute(threadNotify, conditionVariable, CASE);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableTaskPool002
     * @tc.name      : ActsLocksTestConditionVariableTaskPool002
     * @tc.desc      : check create taskPool notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableTaskPool002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool002';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        taskpool.execute(threadWait, conditionVariable, CASE).then((data) => {
          result = data as boolean;
        });
        Promise.all([
          threadNotify(),
        ]);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });


    /**
     * @tc.number    : ActsLocksTestConditionVariableTaskPool003
     * @tc.name      : ActsLocksTestConditionVariableTaskPool003
     * @tc.desc      : check create taskPool wait thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableTaskPool003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool003';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        taskpool.execute(threadNotify, conditionVariable, CASE);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableTaskPool004
     * @tc.name      : ActsLocksTestConditionVariableTaskPool004
     * @tc.desc      : check create taskPool notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableTaskPool004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool004';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        taskpool.execute(threadWait, conditionVariable, CASE).then((data) => {
          result = data as boolean;
        });
        Promise.all([
          threadNotify(),
        ]);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorker001
     * @tc.name      : ActsLocksTestConditionVariableThreadWorker001
     * @tc.desc      : check create worker notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorker001', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker001';
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorker002
     * @tc.name      : ActsLocksTestConditionVariableThreadWorker002
     * @tc.desc      : check create worker wait thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorker002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker002';
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        Promise.all([
          threadNotify(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorker003
     * @tc.name      : ActsLocksTestConditionVariableThreadWorker003
     * @tc.desc      : check create worker notify thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorker003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker003';
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorker004
     * @tc.name      : ActsLocksTestConditionVariableThreadWorker004
     * @tc.desc      : check create worker wait thread
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorker004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker004';
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        Promise.all([
          threadNotify(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorkerTerminate001
     * @tc.name      : ActsLocksTestConditionVariableThreadWorkerTerminate001
     * @tc.desc      : check create worker wait notify thread use terminate
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorkerTerminate001', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorkerTerminate001';
      try {
        let result = false;
        const sleepTime: number = 5000;
        const createCVThreadWorker = new worker.ThreadWorker('../workers/workerCreateCV.ets');
        createCVThreadWorker.postMessage(CASE);
        createCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
          if (undefined != e.data) {
            const conditionVariable: ArkTSUtils.locks.ConditionVariable = e.data;
            const implementCVThreadWorker = new worker.ThreadWorker('../workers/workerImplementCV.ets');
            implementCVThreadWorker.postMessageWithSharedSendable(conditionVariable);
            await sleep(500);
            createCVThreadWorker.terminate();
            console.info(`${CASE} createCVThreadWorker terminate`);
            implementCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
              result = e.data;
              console.info(`${CASE} implementCVThreadWorker result: ` + result);
            }
          }
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableThreadWorkerTerminate002
     * @tc.name      : ActsLocksTestConditionVariableThreadWorkerTerminate002
     * @tc.desc      : check create worker wait notify thread use terminate
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableThreadWorkerTerminate002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorkerTerminate002';
      try {
        let result = false;
        const sleepTime: number = 5000;
        const createCVThreadWorker = new worker.ThreadWorker('../workers/workerCreateCVReq.ets');
        createCVThreadWorker.postMessage(CASE);
        createCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
          if (undefined != e.data) {
            const conditionVariable: ArkTSUtils.locks.ConditionVariable = e.data;
            const implementCVThreadWorker = new worker.ThreadWorker('../workers/workerImplementCV.ets');
            implementCVThreadWorker.postMessageWithSharedSendable(conditionVariable);
            await sleep(500);
            createCVThreadWorker.terminate();
            console.info(`${CASE} createCVThreadWorker terminate`);
            implementCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
              result = e.data;
              console.info(`${CASE} implementCVThreadWorker result: ` + result);
            }
          }
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.number    : ActsLocksTestConditionVariableGCFull001
     * @tc.name      : ActsLocksTestConditionVariableGCFull001
     * @tc.desc      : check create wait notify thread use GCFull
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableGCFull001', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull001';
      console.info(`${CASE} START`);
      try {
        {
          const conditionVariableGC: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
          console.log(`${CASE} threadGC Thread Wait: Waiting...`);
          conditionVariableGC.wait().then(() => {
             console.log(`${CASE} threadGC Thread Wait: Then continue...`);
          });
          conditionVariableGC.notifyAll();
        }
        GCFull();
        console.log(`${CASE} threadGC thread continuing...`);
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableGCFull002
     * @tc.name      : ActsLocksTestConditionVariableGCFull002
     * @tc.desc      : check create wait notify thread use GCFull
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableGCFull002', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadGC, conditionVariable).then((data) => {
          result = data as boolean;
        });
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableGCFull003
     * @tc.name      : ActsLocksTestConditionVariableGCFull003
     * @tc.desc      : check create wait notify thread use GCFull
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableGCFull003', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull003';
      console.info(`${CASE} START`);
      try {
        {
          const conditionVariableGC = ArkTSUtils.locks.ConditionVariable.request("Test");
          console.log(`${CASE} threadGC Thread Wait: Waiting...`);
          conditionVariableGC.wait().then(() => {
            console.log(`${CASE} threadGC Thread Wait: Then continue...`);
          });
          conditionVariableGC.notifyAll();
        }
        GCFull();
        console.log(`${CASE} threadGC thread continuing...`);
        expect(true).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number    : ActsLocksTestConditionVariableGCFull004
     * @tc.name      : ActsLocksTestConditionVariableGCFull004
     * @tc.desc      : check create wait notify thread use GCFull
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('ActsLocksTestConditionVariableGCFull004', 0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadGC, conditionVariable).then((data) => {
          result = data as boolean;
        });
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

  });
}