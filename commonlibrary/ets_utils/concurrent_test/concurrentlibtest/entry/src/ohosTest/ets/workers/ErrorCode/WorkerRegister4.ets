/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

const workerPort = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  console.log('testThreadWorkerErrorCode0022 worker name', workerPort.name)
  try {
    let res: string = workerPort.callGlobalCallObjectMethod('myObj', 'getMessage', 0) as string;
    console.info('worker:', res) //worker: this is a message from TestObj with input: hello there!
  } catch (e) {
    //print 10200020
    console.log(`testThreadWorkerErrorCode0022 main onexit code: ` + JSON.stringify(e));
    workerPort.postMessage(e.code)
  }
}