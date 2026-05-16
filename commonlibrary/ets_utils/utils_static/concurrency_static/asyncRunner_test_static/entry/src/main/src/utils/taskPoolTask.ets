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





// @Concurrent
function inspectStatus(arg: number): number {
  if (taskpool.Task.isCanceled()) {
    return arg + 2;
  }
  return arg + 1;
}

// @Concurrent
function additionDelay(delay: number): void {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
}



// @Concurrent
function printArgs(args: number): number {
  let t: number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  console.info('printArgs: ' + args);
  return args;
}

export {
  inspectStatus, additionDelay,  printArgs, }
