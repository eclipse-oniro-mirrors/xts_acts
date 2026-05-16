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
import { Calculator } from '../testability/pages/Calculator'

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (e: MessageEvents): Promise<void> => {
  const index: number = e.data;
  console.log(`Worker received index: ${index}`);
  try {
    const result = await new Promise<number>(async (resolve, reject) => {
      try {
        const res = await Calculator.computeAsync1(index);
        console.log(`Worker computeAsync1 result: ${res}`);
        resolve(res);
      } catch (error) {
        console.log(`Worker computeAsync1 error: ${error.message}`);
        reject(error);
      } finally {
        console.log('Worker computeAsync1 finally');
      }
    });
    console.log('Worker 计算结果:', result);
    workerPort.postMessage(result);
  } catch (error) {
    console.log(`worker.ets error: ${error.message}`);
    workerPort.postMessage(0);
  } finally {
    workerPort.close();
  }
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
};