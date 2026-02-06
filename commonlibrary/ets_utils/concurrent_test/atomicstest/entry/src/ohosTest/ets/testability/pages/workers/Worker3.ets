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


interface WorkerData {
  sharedArrayBuffer: SharedArrayBuffer;
  targetIndex: number;
  newValue: bigint;
  statusIndex: number;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const receivedData: WorkerData = e.data;
  const sharedArrayBuffer = receivedData.sharedArrayBuffer;
  const targetIndex = receivedData.targetIndex;
  const newValue = receivedData.newValue;
  const statusIndex = receivedData.statusIndex;
  const arr: BigInt64Array = new BigInt64Array(sharedArrayBuffer);

  console.info(`Worker received data. Will modify index ${targetIndex} to ${newValue} after 3 seconds.`);

  // 延迟3秒
  setTimeout(() => {
    // 修改目标位置的值
    Atomics.store(arr, targetIndex, newValue);
    console.info(`Worker updated index ${targetIndex} to ${newValue}`);

    // 更新状态标志
    Atomics.store(arr, statusIndex, 1n);
    console.info(`Worker set status to 1`);

    // 通知等待的线程
    Atomics.notify(arr, statusIndex);

    // 关闭Worker
    workerPort.close();
  }, 3000);
}
