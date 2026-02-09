/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export class Count1 {
  public static count: Number = 0
}

export class Count2 {
  public static count: Number = 0
}

export class Count3 {
  public static count: Number = 0
}

export class Count4 {
  public static count: Number = 0
}

export class AsyncLocks {
  private count_: Number = 0;

  async getCount(): Promise<Number> {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: Number) {
    let lock: AsyncLock = AsyncLock.request('lock_1');
    await lock.lockAsync(() => {
      this.count_ = count;
    })
    console.info('set count successfully')
  }
}