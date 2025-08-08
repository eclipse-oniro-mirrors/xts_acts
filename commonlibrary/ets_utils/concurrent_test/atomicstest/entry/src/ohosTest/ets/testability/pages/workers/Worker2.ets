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


import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer instanceof SharedArrayBuffer) {
    const sharedArray = new BigUint64Array(buffer);
    const arrayLength = sharedArray.length;
    for (let i = 0; i < 100; i++) {
      if (i < arrayLength) {
        const index = i % arrayLength;
        if (i % 3 === 0) {
          Atomics.add(sharedArray, index, 1n);
        } else if (i % 3 === 1) {
          Atomics.sub(sharedArray, index, 1n);
        } else {
          Atomics.xor(sharedArray, index, 2n);
        }
      } else {
        console.error(`索引 ${i} 超出数组长度 ${arrayLength}，跳过操作`);
      }
    }
    workerPort.postMessage(sharedArray.buffer);
    workerPort.close();
  }

}
