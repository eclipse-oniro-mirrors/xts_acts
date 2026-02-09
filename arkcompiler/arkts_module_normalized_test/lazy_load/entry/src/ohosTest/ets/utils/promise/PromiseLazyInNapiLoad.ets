/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import lazy { MyLog } from "./MyLog"

export let msgInNapiLoad = new Array<string>();

export async function promiseLazyInNapiLoad() {
  msgInNapiLoad.push("promiseLazyInNapiLoad start taskTest 1");
  asyncFunc().then(() => {
    msgInNapiLoad.push("promiseLazyInNapiLoad asyncFunc then 4");
  })
  msgInNapiLoad.push("promiseLazyInNapiLoad asyncFunc end 3")
}

async function asyncFunc(): Promise<void> {
  MyLog.log("promiseLazyInNapiLoad");
  msgInNapiLoad.push("promiseLazyInNapiLoad start asyncFunc 2");
  return new Promise(resolve => {
    resolve();
  })
}