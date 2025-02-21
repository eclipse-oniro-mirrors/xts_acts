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

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

let flag: boolean = true;

workerPort.onmessage = async (e: MessageEvents) => {
  console.info(`worker_020: worker: worker receive data ${e.data}`);
  try {
    const func: Function = (): string => {
      return 'func';
    }
    workerPort.postMessage(func);
  } catch (error) {
    console.info(`worker_020: worker: catch error: code => ${error.code} message => ${error.message}`);
    if (error.code != 10200006 && error.message != 'An exception occurred during serialization, failed to serialize message.') {
      flag = false;
    }
  }
}

workerPort.onmessageerror = (err: MessageEvents) => {
  console.info(`worker_020: worker: onmessageerror ${err}`);
  if (flag) {
    workerPort.postMessage('Worker thread successfully processed error');
  } else {
    workerPort.postMessage('Worker thread failed to process error');
  }
}