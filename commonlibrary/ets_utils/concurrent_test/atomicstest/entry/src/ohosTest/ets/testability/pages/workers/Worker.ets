/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer.byteLength == 100){
    const sharedArray = new Uint8Array(buffer);
    for (let i = 0; i < 100; i++) {
      Atomics.and(sharedArray, i, 1);
    }
    workerPort.postMessage(sharedArray);
    workerPort.close();
  }
}


workerPort.onerror = (err: ErrorEvent) => {
  console.info('workerPort onerror err is: ', err.message);
}
