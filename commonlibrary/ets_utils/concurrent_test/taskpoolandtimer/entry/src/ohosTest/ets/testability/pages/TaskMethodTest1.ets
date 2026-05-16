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
export interface Timer {
  id: number;
  count: number;
}

@Concurrent
export async function createTimer(interval: number, counter: number): Promise<Timer> {
  return await new Promise((resolve) => {
    let count = 0;
    const timerId = setInterval(() => {
      if (++count >= counter) {
        clearInterval(timerId);
        resolve({ id: timerId, count: count });
      }
    }, interval);
  });
}

@Concurrent
export function attemptClearTimer(timerId: number): void {
  try {
    clearInterval(timerId);
  } catch (err) {
    throw new Error(err);
  }
}

@Concurrent
export async function mainTimer(interval: number, counter: number): Promise<Timer> {
  return await new Promise((resolve) => {
    let count = 0;
    const timerId = setInterval(() => {
      if (++count >= counter) {
        resolve({ id: timerId, count: count });
      }
    }, interval);
  });
}