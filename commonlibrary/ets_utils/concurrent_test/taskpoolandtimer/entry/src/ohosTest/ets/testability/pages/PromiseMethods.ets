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
export function asyncTask(id: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(`Async task ${id} completed`);
    }, 100);
  });
}

export function task(name: string, delay: number): void {
  console.log(`Start executing${name}...`);
  setTimeout(() => {
    console.log(`${name}finish！`);
  }, delay);
}

export function logTime(message: string): void {
  const now = new Date();
  console.log(`${now.toISOString()} - ${message}`);
}

export async function task2(name: string, delay: number): Promise<void> {
  logTime(`${name} begin`);
  return new Promise((resolve) => {
    setTimeout(() => {
      logTime(`${name} finish`);
      resolve();
    }, delay);
  });
}

