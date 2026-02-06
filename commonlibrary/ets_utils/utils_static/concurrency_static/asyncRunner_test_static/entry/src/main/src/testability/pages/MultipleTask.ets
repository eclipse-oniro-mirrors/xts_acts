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
// import { Contexts, sleep, test2, testUI, testUI1 } from './Utils'
import { Contexts, sleep, test2 } from './Utils'
import fs from '@ohos.file.fs'
// import { taskpool, worker } from '@kit.ArkTS'
// import { asyncLockWork, printArgs1 } from './TaskMethodTest'
import { printArgs1 } from './TaskMethodTest'
// import { MeasureText } from '@kit.ArkUI'






//@Concurrent
export async function multipleTask4() {

  for (let i = 0; i < 100; i++) {
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    task.onExecutionSucceeded(() => {
      1 + 1
    })
    await taskpool.execute(task)
  }

}






