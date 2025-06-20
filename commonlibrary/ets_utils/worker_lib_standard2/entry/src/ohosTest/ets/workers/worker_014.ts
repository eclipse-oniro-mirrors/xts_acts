/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  console.info(`worker: worker receive data ${e.data}`);
  try {
    let res: Object = workerPort.callGlobalCallObjectMethod('myObj', 'testAsyncFunc', 0);
    console.info(`worker: testAsyncFunc result is ${res}`)
    if (res !== null) {
      workerPort.postMessage(res);
    }
  } catch (error) {
    console.info(`worker: catch error: code => ${error.code} message => ${error.message}`);
    workerPort.postMessage({ code: error.code, message: error.message });
  }
}