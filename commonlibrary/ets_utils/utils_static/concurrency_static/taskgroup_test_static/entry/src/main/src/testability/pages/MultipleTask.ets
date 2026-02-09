/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
  sleep,
  test2,
  testUI,
  testUI1
} from './Utils'
import {
  printArgs1,
} from './TaskMethodTest'


export async function multipleTask1() {
  setTimeout(() => {
    1 + 1
  }, 100)
  test2()
  await sleep(500)
}

export async function multipleTask4() {

  for (let i = 0; i < 100; i++) {
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    task.onExecutionSucceeded(() => {
      1 + 1
    })
    await taskpool.execute(task)
  }

}

export async function multipleUITask1() {
  await testUI()
}

export async function multipleUITask2() {
  await testUI1()
}

export async function multipleUITask3() {
  for (let i = 0; i < 100; i++) {
    await testUI()
  }
}

export async function multipleUITask4() {
  for (let i = 0; i < 100; i++) {
    await testUI1()
  }
}

export async function testUISec(): Promise<string> {
  return new Promise<string>((re, je) => {
    re('')
  })
}

export function testUISec1(): Promise<string> {
  return new Promise<string>((re, je) => {
    re('')
  })
}