/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (event: MessageEvents) => {
  switch (event.type) {
    case 'testRegMatch0001': {
      const str = 'apple banana apple';
      const regex = /apple/g;
      const result = str.match(regex);
      worker.workerPort.postMessage({ result });
      break;
    }

    case 'testRegMatch0002': {
      const str = 'apple banana apple';
      const regex = /apple/;
      const result = str.match(regex);
      worker.workerPort.postMessage({ result });
      break;
    }

    default:
      console.error(`Unknown test case: ${event.type}`);
      break;
  }
}