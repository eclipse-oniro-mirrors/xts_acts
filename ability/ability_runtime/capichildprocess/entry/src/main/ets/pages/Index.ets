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

import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { taskpool } from '@kit.ArkTS'

@Concurrent
async function taskpoolFunc(): Promise<void> {
  for(let i = 0; i < 26; i++) {
    testNapi.startNativeChildProcess('libentry.so');
  }
}

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Button('StartNativeChildProcess')
          .onClick(() => {
            testNapi.startNativeChildProcess('libentry.so');
          })
        Button('TestChildProcessAdd')
          .margin({ top : 5 })
          .onClick(() => {
            testNapi.childProcessAdd(11, 23);
          })
        Button('ExitChildProcess')
          .margin({ top : 5 })
          .onClick(() => {
            testNapi.requestExitChildProcess();
          })

        Button('StartNativeChildProcess_50')
          .margin({ top : 5 })
          .onClick(() => {
            for(let i = 0; i < 50; i++) {
              testNapi.startNativeChildProcess('libentry.so');
            }
          })

        Button('ExitChildProcess_50')
          .margin({ top : 5 })
          .onClick(() => {
            for(let i = 0; i < 50; i++) {
              testNapi.requestExitChildProcess();
            }
          })

        Button('mainFunc')
          .margin({ top : 5 })
          .onClick(async () => {
            let task1: taskpool.Task = new taskpool.Task(taskpoolFunc);
            await taskpool.execute(task1);
            let task2: taskpool.Task = new taskpool.Task(taskpoolFunc);
            await taskpool.execute(task2);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
