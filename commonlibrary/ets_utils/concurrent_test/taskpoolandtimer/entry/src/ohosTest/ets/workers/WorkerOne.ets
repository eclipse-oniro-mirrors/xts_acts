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
import { Calculator } from '../testability/pages/CalculateIndex'

const workerPort = worker.workerPort
workerPort.onmessage = async (e: MessageEvents): Promise<void> => {
  console.log('e.data' + e.data);
  let data: number = e.data;
  const res2 = await Promise.resolve(data).then(baseValue => {
    console.log('computeSync' + Calculator.computeSync(data));
    return Calculator.computeSync(data);

  });
  workerPort.postMessage(res2);
  console.log('res2' + res2);

}
workerPort.onerror = (err: ErrorEvent) => {
  console.log('worker.ets onerror' + err.message);

}