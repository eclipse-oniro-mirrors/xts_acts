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

import { ArkTSUtils, ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

workerPort.onmessage = async (e: MessageEvents) => {
  const CASE: string = 'ActsConditionTestConditionVariableThreadWorkerTerminate001';
  console.info(`${CASE} implementCVThreadWorker start`);
  let result = false;
  let conditionVariable: ArkTSUtils.locks.ConditionVariable = e.data;
  const threadWait = async () => {
    console.log(`${CASE} Thread Wait: Waiting...`);
    try {
      await conditionVariable.wait().then(() => {
        console.log(`${CASE} Thread Wait: Then continue...`);
        result = true;
      });
    } catch (err) {
      console.log(`${CASE} implementCVThreadWorker wait err: ` + err);
    }
    console.log(`${CASE} Thread Wait: Notified and continuing...`);
  };
  const threadNotify = async () => {
    await sleep(1000);
    console.log(`${CASE} Thread Notify: Notifying one thread...`);
    try {
      conditionVariable.notifyAll();
    } catch (err) {
      console.log(`${CASE} implementCVThreadWorker notify err: ` + err);
    }
  };
  await Promise.all([
    threadWait(),
    threadNotify()
  ]);
  await sleep(2000);
  workerPort.postMessage(result);
  console.info(`${CASE} implementCVThreadWorker end`);
}

workerPort.onmessageerror = (e: MessageEvents) => {
}

workerPort.onerror = (e: ErrorEvent) => {
}