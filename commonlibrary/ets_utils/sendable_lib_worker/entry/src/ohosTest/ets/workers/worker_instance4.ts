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
import worker, { MessageEvents, ThreadWorkerGlobalScope } from '@ohos.worker';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

async function action(mes) {
  const workerInstance_3: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_instance_son4.ts');
  let flag_1: boolean = false;
  workerInstance_3.onexit = (): void => {
    console.info(`bb: workerInstance_1.onexit`);
  }
  workerInstance_3.onmessage = (e: MessageEvents): void => {
    console.info(`aa workerInstance_1.onmessage: ${JSON.stringify(e)}`);
    workerPort.postMessage(e.data)
  }
  workerInstance_3.postMessageWithSharedSendable(mes.data);
  while (!flag_1) {
    await asyncSleep(100);
  }
  workerInstance_3.terminate();
}

workerPort.onmessage = (e: MessageEvents) => {
  console.info(`worker: worker receive data ${e.data.stringItem}`);
  action(e);
}

