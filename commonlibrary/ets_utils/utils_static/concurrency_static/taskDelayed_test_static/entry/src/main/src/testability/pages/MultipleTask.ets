/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import {
  sleep, test2 } from './Utils'
import {
  printArgs1,
} from './TaskMethodTest'


export async function multipleTask4(): Promise<void> {

  for (let i = 0; i < 100; i++) {
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    task.onExecutionSucceeded(() => {
      1 + 1
    })
    await taskpool.execute(task)
  }

}
