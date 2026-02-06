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
    case 'testRegCtr0001': {
      const re: RegExp = new RegExp('abc', 'i');
      const result: boolean = re.test('ABC');
      worker.workerPort.postMessage({ 're': re, 'result': result });
    }

    case 'testRegCtr0002': {
      const re1: RegExp = /foo/gi;
      const re2: RegExp = new RegExp(re1);
      const result: boolean = re2.test('FOO');
      worker.workerPort.postMessage({
        're2': re2,
        'result': result
      });
    }

    default:
      console.error(`Unknown test case: ${event.type}`);
      break;
  }
};