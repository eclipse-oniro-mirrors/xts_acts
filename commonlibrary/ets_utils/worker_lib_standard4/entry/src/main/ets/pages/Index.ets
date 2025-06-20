/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so';
import worker  from '@ohos.worker'
import { expect } from '@ohos/hypium';

const expectAssertEqual: Function = (actualValue: number | string, expectValue: number | string): void => {
  try {
    expect(actualValue).assertEqual(expectValue);
  } catch (error) {
    console.info(`expectAssertEqual catch error: ${error}`);
  }
}
export function expectEqual(exp: string | number | boolean, assert: string | number | boolean,
  info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

const expectAssertContain: Function = (actualValue: string, expectValue: string): void => {
  try {
    expect(actualValue).assertContain(expectValue);
  } catch (error) {
    console.info(`expectAssertContain catch error: ${error}`);
  }
}
let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};
function shouldBeEqual(arg1: number, arg2: number): boolean {
  return arg1 === arg2;
}


@Entry
@Component
struct Index {
  build() {
    Scroll() {
      Column() {
        Button("Mix_Create_Delete_threads_100")
          .align(Alignment.Center)
          .fontSize(20)
          .margin({top:5,left:10,right:10,bottom:5})
          .onClick(async () => {
            const caseName: string = 'testWorkerMix001';
            console.info(`${caseName} test start`);
            let arkInstance:number [] = [];
            let arkInstance2: number = 0;
            try {
              for (let i: number = 1; i < 17; i++) {
                arkInstance.push(testNapi.AddArkRuntime(100000+i))
              }
              console.info(`${caseName}: ${arkInstance}`);
              console.info(`${caseName}: ${arkInstance.length}`);
              const compareValue = shouldBeEqual(arkInstance.length, 16);
              console.info(`${caseName}: ${compareValue}`);
              console.info(`${caseName}: 16 NAPI threads were created, done`);
              const workerInstanceONE: worker.ThreadWorker[] = [];
              for (let i: number = 1; i < 65; i++) {
                workerInstanceONE.push(new worker.ThreadWorker('../worker/worker.ts', { name: JSON.stringify(i)}));
              }
              console.info(`${caseName}: 64 worker threads were created, done`);
              await sleep(100);
              try {
                const workerInstanceTWO: worker.ThreadWorker = new worker.ThreadWorker('../worker/worker.ts', { name: '65' });
                workerInstanceTWO.terminate();
                expect().assertFail();
              } catch (error) {
                console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
                expectAssertEqual(error.code, 10200003);
                expectAssertContain(error.message, 'the number of workers exceeds the maximum');
                console.info(`${caseName}: catch error: done`);
              }
              await sleep(100);
              for (let i: number = 0; i < workerInstanceONE.length; i++) {
                workerInstanceONE[i].terminate();
              }
              console.info(`${caseName}: 1-64 worker threads were terminated: done`);
              await sleep(100);
              for (let i: number = 0; i < arkInstance.length; i++) {
                arkInstance2 = testNapi.DeleteArkRuntime(arkInstance[i]);
              }
              console.info(`${caseName}: NAPI threads were deleted, done`);
              await sleep(100);
            } catch (error) {
              console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
            }
            console.info(`${caseName} test end`);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}


