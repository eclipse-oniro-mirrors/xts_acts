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
  console.log(`==============${index}`)
  try {
    // 使用 await new Promise
    await new Promise<number>((resolve) => {
      setTimeout(() => {
        console.log('await new promise 执行');
        resolve(index);
      });
    });

    // 使用 await Promise 并在 then 回调中调用动态导入中的计算函数
    const anotherPromise = new Promise<number>((resolve) => {
      import('../TaskPoolMethod').then((module) => {
        const calculationResult = module.calculate(index);
        resolve(calculationResult);
      });
    });

    const finalResult = await anotherPromise;
    console.log(`await promise 计算结果: ${finalResult}`);
    workerPort.postMessage(finalResult);


  } catch (error) {
    console.log(`worker.ets error: ${error.message}`);
    workerPort.postMessage({ error: error.message });
  }
};

workerPort.onmessageerror = (event: MessageEvents) => {
};


workerPort.onerror = (event: ErrorEvent) => {
  console.log(`worker.ets onerror: ${event.message}`);
};