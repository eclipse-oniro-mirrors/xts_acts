/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { worker } from '@kit.ArkTS';

const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export function harAbsolutePathLoadWorker(): Promise<boolean> {
  let path: string = '@har/ets/workers/worker.ets';
  return pathLoadWorker(path);
}

export function harRelativePathLoadWorker(): Promise<boolean> {
  let path: string = './workers/worker.ets';
  return pathLoadWorker(path);
}

async function pathLoadWorker(path: string): Promise<boolean> {
  let state: boolean = false;
  let workerLoadSuccess: boolean = false;
  try {
    let threadWorker = new worker.ThreadWorker(path);
    threadWorker.postMessage('test');
    threadWorker.onmessage = async (e) => {
      workerLoadSuccess = e.data as boolean;
      state = true;
    }
    while (!state) {
      await sleep(100);
    }
    threadWorker.terminate();
  } catch (e) {
    workerLoadSuccess = false;
  }
  return workerLoadSuccess;
}