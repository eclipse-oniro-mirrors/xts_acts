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
import { collections, taskpool } from '@kit.ArkTS';

@Concurrent
function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

@Concurrent
async function delay(ms: number): Promise<number> {
  const promise = await new Promise<number>(resolve => {
    setTimeout(() => resolve(ms), ms);
  });
  return promise;
}

@Concurrent
function printArgs(args: string): string {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
function getTaskStateByTaskName(taskpoolInfo: taskpool.TaskPoolInfo, taskName: string): number {
  let taskIS = Array.from(taskpoolInfo.taskInfos)
  let state: number = 0
  for (let taskInfo of taskIS) {
    if (taskInfo.name == taskName) {
      state = taskInfo.state
    }
  }
  return state
}

export { additionDelay, delay, printArgs, getTaskStateByTaskName }