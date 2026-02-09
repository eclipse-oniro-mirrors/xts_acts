/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

let parentPort = worker.parentPort;
var printLog = 'SUB_AA_AMS_Stage_StageContextSupportsWorker_0800 '
parentPort.onmessage = function(message) {
    console.info(printLog + "onmessage: " + JSON.stringify(message));
    let context = message.data
    let ctx = context.applicationInfo.name
    let ctx1 = context.stageMode
    console.info(printLog + "ctx: " + ctx + ";ctx1: " + ctx1);
    let expectValue = false
    let status1 = typeof ctx == 'string'
    let status2 = ctx == 'com.example.workercontexttest'
    let status3 = typeof ctx1 == 'boolean'
    let status4 = ctx1 == true
    console.info(printLog + "status1: " + status1 + ";status2: " + status2 + ";status3: " + status3 + ";status4: " + status4);
    if(status1 && status2 && status3 && status4) {
        expectValue = true
    }
    parentPort.postMessage(expectValue)
}

parentPort.onmessageerror = function(messageerror) {
    console.info(printLog + "onmessageerror: " + JSON.stringify(messageerror));
}

parentPort.onerror = function(error) {
    console.info(printLog + "onerror: " + JSON.stringify(error));
}