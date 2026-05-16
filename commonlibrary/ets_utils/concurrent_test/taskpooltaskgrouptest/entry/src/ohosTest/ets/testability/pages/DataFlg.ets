/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { ArkTSUtils, worker } from '@kit.ArkTS';

export class Count1 {
  public static count: number = 0
}

export class Count2 {
  public static count: number = 0
}

export class Count3 {
  public static count: number = 0
}

export class Count4 {
  public static count: number = 0
}

export class Worker1 {
  public worker1: worker.ThreadWorker = new worker.ThreadWorker('../../workers/Worker.ets');
}

export class Worker2 {
  public worker2: worker.ThreadWorker = new worker.ThreadWorker('../../workers/Worker.ets');
}

@Sendable
export class AsyncLock {
  private count_: number = 0;

  async getCount(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  async setCount(count: number) {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
    await lock.lockAsync(() => {
      this.count_ = count;
    })
    console.info('set count successfully')
  }
}