/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

workerPort.addEventListener("addEventTest", (event) => {
    workerPort.postMessage("123")
})

workerPort.addEventListener("onceTest", (event) => {
    workerPort.postMessage("456")
})

workerPort.addEventListener("message", (event) => {
    workerPort.dispatchEvent({type:"addEventTest", timeStamp:0})
    workerPort.dispatchEvent({type:"addEventTest", timeStamp:0})
    workerPort.removeEventListener("addEventTest");
    workerPort.dispatchEvent({type:"addEventTest", timeStamp:0})
    workerPort.dispatchEvent({type:"onceTest", timeStamp:0})
})