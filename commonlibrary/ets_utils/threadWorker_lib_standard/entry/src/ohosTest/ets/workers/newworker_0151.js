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
import worker from "@ohos.worker"

const parentPort = worker.workerPort;

var ss = undefined;
var backValue = undefined;

parentPort.onmessage = function(e) {
  let data = e.data;
  switch(data.type) {
    case "new":
      ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_0152.js");
      ss.onexit = function() {
        parentPort.postMessage(backValue); // 16
      }
      ss.onmessage = function(ee) {
        backValue = ee.data;
        ss.terminate()
      }
      ss.postMessage(data.value + 2); // 13
      break;
    default:
      break;
  }
}