/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { ArkTSUtils, ErrorEvent, MessageEvents, taskpool, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import {
  test9,
  test11,
  test12,
  test13,
  test14,
  test15,
  test16, test1, test22,
  test23,
  test26,
} from 'library1/src/main/ets/components/ConcurrencyModularImportAndExportTest';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
type parafunc = () => Promise<number>;
/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {
  let func:parafunc = event.data;
  let q = await func();
  workerPort.postMessage(q);
  workerPort.close();
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