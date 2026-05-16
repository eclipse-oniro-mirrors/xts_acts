/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { common, contextConstant, sendableContextManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Sendable
export class SendableObject {
  constructor(sendableContext: sendableContextManager.SendableContext, contextName: string) {
    this.sendableContext = sendableContext;
    this.contextName = contextName;
  }
  public sendableContext: sendableContextManager.SendableContext;
  public contextName: string;
}

function areaDirTest(areaContext: Context) {
  let area: string = contextConstant.AreaMode[areaContext.area].toLowerCase();
  console.log('DisplayContextTest: ' + area);
  console.log(`DisplayContextTest Worker DisplayContext.cacheDir: ${areaContext.cacheDir}`);
  console.log(`DisplayContextTest Worker DisplayContext.tempDir: ${areaContext.tempDir}`);
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  let object: SendableObject = e.data;
  let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
  if (object.contextName == 'BaseContext') {
    hilog.info(0x0000, 'DisplayContextTest', '%{public}s', 'convert to context.');
    try {
      let context: common.Context = sendableContextManager.convertToContext(sendableContext);
      areaDirTest(context);
      console.log(`DisplayContextTest Worker DisplayDirTest end`);
    } catch (error) {
      hilog.error(0x0000, 'DisplayContextTest', 'convertToContext failed %{public}s', JSON.stringify(error));
    }
  }
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onmessageerror');
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onerror');
}