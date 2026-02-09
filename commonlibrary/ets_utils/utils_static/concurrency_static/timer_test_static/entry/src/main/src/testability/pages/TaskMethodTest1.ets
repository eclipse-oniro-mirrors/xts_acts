/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export interface Timer {
  id: number;
  count: number;
}


export async function createTimer(interval: number, counter: number): Promise<Timer> {
  return await new Promise<Timer>((resolve) => {
    let count = 0;
    let timerId = 0.0;
    timerId = setInterval(() => {
      if (++count >= counter) {
        clearInterval(timerId as int);
        resolve({ id: timerId, count: count } as Timer);
      }
    }, interval as int);
  });
}


export function attemptClearTimer(timerId: number): void {
  try {
    clearInterval(timerId as int);
  } catch (err) {
    throw err as Error;
  }
}


export async function mainTimer(interval: number, counter: number): Promise<Timer> {
  return await new Promise<Timer>((resolve) => {
    let count = 0;
    let timerId = 0.0;
    timerId = setInterval(() => {
      if (++count >= counter) {
        resolve({ id: timerId, count: count } as Timer);
      }
    }, interval as int);
  });
}