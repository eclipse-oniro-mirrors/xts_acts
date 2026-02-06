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

export let msgFinally = new Array<string>();

export async function promiseFinallyLazy() {
  msgFinally.push("promiseFinallyLazy start taskTest 1");
  asyncFunc().then(() => {
    msgFinally.push("promiseFinallyLazy asyncFunc then 4");
  }).catch(() => {
    msgFinally.push("promiseFinallyLazy asyncFunc catch 4");
  }).finally(() => {
    MyLog.log("promiseFinallyLazy");
    msgFinally.push("promiseFinallyLazy asyncFunc finally 5");
  })
  msgFinally.push("promiseFinallyLazy asyncFunc end 3")
}

async function asyncFunc(): Promise<void> {
  msgFinally.push("promiseFinallyLazy start asyncFunc 2");
  return new Promise((resolve, reject) => {
    reject();
  })
}