/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { ArkTSUtils, worker } from '@kit.ArkTS';

@Concurrent
export async function addNum(a:number){
  return a+5;
}


export const sampleData = 1;

export let sharedData = 0;


export function incrementSharedData() {
  sharedData++;
  return sharedData;
}

export function addNumbers(a: number, b: number): number {
  return a + b;
}

export const sampleMessage = 'hello';


interface Config {
  delayTime: number;
  message: string;
}

export const config: Config = {
  delayTime: 1000,
  message: 'hello'
};



export function nativeFunction(): string {
  return 'result';
}


interface NativeData {
  message: string;
}

export const nativeData: NativeData = {
  message: 'this is from nativeModule data'
};


export let args = 42;

@Concurrent
export function taskFunction(a:number) {
  return new Promise<number>((resolve, reject) => {
    const asyncLock = ArkTSUtils.locks.AsyncLock.request('taskLock');
    asyncLock.lockAsync(() => {
      setTimeout(() => {
        a = a+1;
        resolve(a);
      }, 100);
    })
  });
}

