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

import { worker } from '@kit.ArkTS';

export class Calculator {
  static computeSync(index: number): number {
    return index * 2 + 1;
  }

  static async computeAsync1(index: number): Promise<number> {
    const res = await new Promise<number>(resolve => {
      setTimeout(() => resolve(Calculator.computeSync(index)), 50);
    });
    return res;
  }

  static async computeAsync2(index: number): Promise<number> {
    const res1 = await new Promise<number>(resolve => {
      setTimeout(() => resolve(Calculator.computeSync(index)), 50);
    });
    const res2 = await Promise.resolve(res1).then(baseValue => {
      return baseValue * 2;
    });
    return res2;
  }

  static async computeAsync3(index: number): Promise<number> {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (index % 2 === 0) {
          reject(new Error(`Index ${index} is even, throwing error.`));
        } else {
          resolve(index * 2);
        }
      }, 0);
    });
  }

  static async computePromise(index: number): Promise<number> {
    const res = Promise.resolve(index).then(baseValue => {
      return baseValue * 2;
    });
    return res;
  }
}

export class Worker {
  public worker: worker.ThreadWorker = new worker.ThreadWorker('../../workers/Worker.ets');
}

export class Worker1 {
  public worker: worker.ThreadWorker = new worker.ThreadWorker('../../workers/Worker1.ets');
}

export class Worker2 {
  public worker: worker.ThreadWorker;

  constructor() {
    this.worker = new worker.ThreadWorker('../../workers/Worker2.ets');
  }
}