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

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from "@kit.ArkTS"
import { hilog } from '@kit.PerformanceAnalysisKit'

import lazy { numA } from "./LazyWorkerVariable"
import lazy { funcAdd } from "./LazyWorkerFunc"
import lazy { User } from "./LazyWorkerClass"

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  hilog.info(0x0000, 'testTag', 'workerPort.onmessage')
  workerPort.postMessage(e.data.toString() + "numA=" + numA + ",funcAdd=" + funcAdd(1, 2) + ",user.name=" + new User("worker",10))
}

workerPort.onmessageerror = (e: MessageEvents) => {}
workerPort.onerror = (e: ErrorEvent) => {}