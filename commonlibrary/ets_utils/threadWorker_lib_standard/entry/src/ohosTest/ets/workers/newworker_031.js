/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
  let res1 = "";
  let res2 = "";
  let res3 = "";
  try {
    res1 = workerPort.callGlobalCallObjectMethod("obj1", "getMessage", 0);
    res2 = workerPort.callGlobalCallObjectMethod("obj1", "getMessageWithInput", 0, "WithInput");
    res3 = workerPort.callGlobalCallObjectMethod("obj1", "executeForThreeSeconds", 0);
  } catch (error) {
    console.error(error);
    workerPort.postMessage("failed")
  }
  if (res1 == "TestObj" && res2 == "TestObjWithInput" && res3 == "done") {
    workerPort.postMessage("success")
  } else {
    workerPort.postMessage("failed")
  }
}