/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import worker from '@ohos.worker';
const parentPort = worker.parentPort;

parentPort.onmessage = function(e) {
    let begTime = new Date().getTime();
    var int32 = e.data;
    parentPort.postMessage("success");
    console.info("wait expect 'timed-out' : " + Atomics.wait(int32, 1, 0, 3000));
    let endTime = new Date().getTime();
    if(endTime - begTime < 3000) {
        parentPort.postMessage("end1");
    } else {
        parentPort.postMessage("end2");
    }
}
