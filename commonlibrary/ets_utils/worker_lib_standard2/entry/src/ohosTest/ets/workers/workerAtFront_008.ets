/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { worker, MessageEvents } from '@kit.ArkTS';
import { Priority } from '@ohos.worker';
import { Person } from '../utils/WorkerSendable';

const workerPort = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  let data: string = e.data as string;
  let person: Person = new Person(data);
  workerPort.postMessageAtFront?.(person, Priority.HIGH);
}
