/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

workerPort.onmessage = async (event: MessageEvents): Promise<void> => {
  const index: number = event.data;

  try {
    // 使用await new promise调用动态导入中的async计算函数
    const result1 = await new Promise<number>((resolve) => {
      // 模拟动态导入
      import('../TaskPoolMethod').then((module) => {
        module.asyncCalculate1(index).then((res) => {
          resolve(res);
        });
      });
    });
    workerPort.postMessage(result1);
    // 使用promise回调
    new Promise<void>((resolve) => {
      setTimeout(() => {
        resolve();
      }, 100);
    });
  } catch (error) {
    console.log(`worker.ets error: ${error.message}`);
  }
};


workerPort.onmessageerror = (event: MessageEvents) => {
};


workerPort.onerror = (event: ErrorEvent) => {
  console.log(`worker.ets onerror: ${event.message}`);
};