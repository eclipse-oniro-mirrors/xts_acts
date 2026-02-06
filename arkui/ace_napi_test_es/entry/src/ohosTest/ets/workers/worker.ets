/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import utils from '@arkts.utils';
import worker, { ThreadWorkerGlobalScope, MessageEvents } from '@ohos.worker';
import napitest from 'libnapitest.so'
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  console.info(`worker:: worker thread worker data is ${e.data}`);
  if (e.data === 'call napi_stop_event_loop') {
    let result = napitest.stopEventLoop(2);
    console.info('worker:: worker thread runEventLoop result is ' + JSON.stringify(result))
    if (result === 0) {
      workerPort.postMessage('success');
    } else {
      workerPort.postMessage('failure');
    }
  }
  if (e.data === 'call napi_define_sendable_class') {
    let result = napitest.NapiDefineSendableClass();
    console.info('worker:: worker thread NapiDefineSendableClass result is ' + JSON.stringify(result))
    if (napitest.NapiIsSendable(result)) {
      workerPort.postMessage('success');
    } else {
      workerPort.postMessage('failure');
    }
  }
  if (e.data == 'callLockAsyncAfterRunCleanupTest') {
    napitest.callLockAsyncAfterRunCleanupTest(() => {
      let lock = utils.locks.AsyncLock.request('lock');
      lock.lockAsync(() => {});
    })
    workerPort.close();
  }
}
