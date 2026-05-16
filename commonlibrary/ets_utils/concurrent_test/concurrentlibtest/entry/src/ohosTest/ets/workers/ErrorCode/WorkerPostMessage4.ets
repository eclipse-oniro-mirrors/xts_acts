/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { taskpool } from '@kit.ArkTS';
import { printNum } from '../../test/worker/WorkerErrorCode.test';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

let task: taskpool.Task = new taskpool.Task(printNum, 10)

workerPort.onmessage = (e: MessageEvents): void => {
  try {
    workerPort.postMessage(task);
  } catch (e) {
    //print 10200006
    console.log(`testThreadWorkerErrorCode0014 main onexit code: ` + JSON.stringify(e));
    workerPort.postMessage(e.code);
  }
}