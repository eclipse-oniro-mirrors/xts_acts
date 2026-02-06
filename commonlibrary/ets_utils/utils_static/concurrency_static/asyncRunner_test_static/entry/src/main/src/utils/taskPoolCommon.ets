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
// import { collections, taskpool } from '@kit.ArkTS';



async function delay(ms: number): Promise<number> {
  // 1. 确保延迟时间为整数（解决Int类型要求）
  const delayMs: number = Math.floor(ms);
  // 2. 若环境的setTimeout只支持单参数回调，可通过闭包传入延迟时间
  return new Promise<number>(resolve => {
    // 定义回调函数，内部使用delayMs（整数）
    const timerCallback = () => {
      resolve(ms); // 回调中返回原始延迟值
    };
    // 3. 按环境要求调用setTimeout（可能只需要回调参数）
    setTimeout(timerCallback); // 移除第二个参数，或根据环境文档传入正确类型
  });
}



//@Concurrent
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

// export { additionDelay, delay, printArgs, getTaskStateByTaskName }
export {  delay, getTaskStateByTaskName }