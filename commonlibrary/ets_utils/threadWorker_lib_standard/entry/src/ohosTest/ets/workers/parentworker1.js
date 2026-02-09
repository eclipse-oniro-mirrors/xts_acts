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

import worker from '@ohos.worker';

const workerPort = worker.workerPort;

workerPort.onmessage = function(e) {
    console.info('parentworker recv main thread message is: ' + e.data);

    workerPort.close();

    let childworker = new worker.ThreadWorker('entry_test/ets/workers/childworker1.ets');

    childworker.onmessage = function(e) {
      console.info('parentworker recv childworker message is: ' + e.data);
    };

    childworker.onexit = function() {
      console.info('childworker exit');
      workerPort.postMessage('parentworker send message to childworker');
    };

    childworker.onerror = function(err) {
      console.info('childworker error is: ' + err);
    };

    childworker.postMessage('parentworker send message to childworker');
};