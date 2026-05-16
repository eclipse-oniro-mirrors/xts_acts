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
import { ArkTools, Contexts, sleep, test2, testUI, testUI1 } from './Utils'
import fs from '@ohos.file.fs'
import { taskpool, worker } from '@kit.ArkTS'
import { Driver } from '@kit.TestKit'
import { asyncLockWork, printArgs1, setTimeOutWork } from './TaskMethodTest'
import { MeasureText } from '@kit.ArkUI'


@Concurrent
export async function multipleTask1() {
  setTimeout(() => {
    1 + 1
  }, 100)

  test2()

  let time = Date.now().toString()
  let path = Contexts.path + '/' + time + '.txt'
  fs.open(path, fs.OpenMode.READ_ONLY | fs.OpenMode.CREATE).then((data: fs.File) => {
    fs.close(data)
    fs.unlink(path)
  })
  await sleep(500)
  let work = new worker.ThreadWorker('./workers/WorkerTaskGroup.ets');
  work.postMessage('')
  work.terminate()
}

@Concurrent
export async function multipleTask2() {
  await sleep(500)
  let work = new worker.ThreadWorker('./workers/WorkerTaskGroup1.ets');
  work.postMessage('')
  work.terminate()
}

@Concurrent
export async function multipleTask3() {
  let task1: taskpool.Task = new taskpool.Task(asyncLockWork);
  await taskpool.execute(task1)
}

@Concurrent
export async function multipleTask4() {

  for (let i = 0; i < 100; i++) {
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    task.onExecutionSucceeded(() => {
      1 + 1
    })
    await taskpool.execute(task)
  }

}

@Concurrent
export async function multipleTask5() {
  sleep(500).then(() => {
    let work = new worker.ThreadWorker('./workers/WorkerTaskGroup4.ets');
    work.postMessage('')
    work.terminate()
  })
}

@Concurrent
export async function multipleUITask1() {
  await testUI()
  MeasureText.measureText({ 'textContent': 'asyncTask' })
}

@Concurrent
export async function multipleUITask2() {
  await testUI1()
  MeasureText.measureText({ 'textContent': 'asyncTask' })
}

@Concurrent
export async function multipleUITask3() {
  for (let i = 0; i < 100; i++) {
    await testUI()
    MeasureText.measureText({ 'textContent': 'asyncTask' })
  }

}

@Concurrent
export async function multipleUITask4() {
  for (let i = 0; i < 100; i++) {
    await testUI1()
    MeasureText.measureText({ 'textContent': 'asyncTask' })
  }
}

export function testUISec(): Promise<string> {
  return new Promise((re, je) => {
    re('')
  })
}

export function testUISec1(): Promise<string> {
  return new Promise((re, je) => {
    re('')
  })
}