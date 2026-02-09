'use static'
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

import { MyLog } from './MyLog'

export let msgThen:string[] = [];

export async function promiseThenLazy() {
  msgThen.push('promiseThenLazy start taskTest 1');
  asyncFunc().then(() => {
    MyLog.log('promiseThenLazy');
    msgThen.push('promiseThenLazy asyncFunc then 4');
  })
  msgThen.push('promiseThenLazy asyncFunc end 3')
}

async function asyncFunc(): Promise<void> {
  msgThen.push('promiseThenLazy start asyncFunc 2');
  return new Promise<void>((resolve) => {
    resolve(undefined);
  })
}