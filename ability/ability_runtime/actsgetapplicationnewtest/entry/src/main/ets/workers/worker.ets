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
import worker, { ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@ohos.worker';
import errorManager from '@ohos.app.ability.errorManager';
import application from '@ohos.app.ability.application';
import hilog from '@ohos.hilog';
import { bundleManager } from '@kit.AbilityKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

const TAG = 'WorkerTest';

interface MessageInfo {
  applicationInfo: bundleManager.ApplicationInfo;
  cacheDir: string;
  tempDir: string;
  filesDir: string;
  databaseDir: string;
  preferencesDir: string;
  bundleCodeDir: string;
  distributedFilesDir: string;
  resourceDir: string;
  cloudFileDir: string;
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.log(TAG, 'received from main thread: ', e.data);
  try {
    console.log(TAG, 'trying to unregister UnhandledRejectionObserver in worker');
    errorManager.off('unhandledRejection');
    let context1 = application.getApplicationContext();
    hilog.info(0x0000, TAG, 'context1: %{public}s', JSON.stringify(context1));
    let data: MessageInfo = {
      applicationInfo: context1.applicationInfo,
      cacheDir: context1.cacheDir,
      tempDir: context1.tempDir,
      filesDir: context1.filesDir,
      databaseDir: context1.databaseDir,
      preferencesDir: context1.preferencesDir,
      bundleCodeDir: context1.bundleCodeDir,
      distributedFilesDir: context1.distributedFilesDir,
      resourceDir: context1.resourceDir,
      cloudFileDir: context1.cloudFileDir
    }
    workerPort.postMessage(data);
  } catch (e) {
    console.log(TAG, 'catch unregister exception: ', JSON.stringify(e));
    workerPort.postMessage('unhandledRejection unregister error');
  }
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
  console.log(TAG, 'worker error: ', e.message, e.filename, e.lineno, e.colno, e.type)
}