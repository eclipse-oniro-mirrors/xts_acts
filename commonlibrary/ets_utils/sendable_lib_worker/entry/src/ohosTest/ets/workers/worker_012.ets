/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import worker, { MessageEvents, ThreadWorkerGlobalScope } from '@ohos.worker';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

@Sendable
class MySendAbleClass {
  booleanItem: boolean
  numberItem: number
  stringItem: string
  constructor(booleanItem: boolean, numberItem: number, stringItem: string,) {
    this.booleanItem = booleanItem
    this.numberItem = numberItem
    this.stringItem = stringItem
    booleanItem = false
  }
  returnString() {
    return this.stringItem;
  }
}
@Sendable
class MySendAbleClass2 extends MySendAbleClass {
  constructor(booleanItem: boolean, numberItem: number, stringItem: string) {
    super(booleanItem, numberItem, stringItem)
  }
}

workerPort.onmessage = (e: MessageEvents) => {
  console.info(`worker: worker receive data ${e.data.mysendable}`);
  e.data.mysendable = new MySendAbleClass2(false,2,'3');
  workerPort.postMessage(e.data.stringItemA);
}