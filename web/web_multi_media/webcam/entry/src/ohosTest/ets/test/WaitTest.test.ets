/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
  * Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an 'AS IS' BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  */

import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  }).then(() => {
    console.info(`debug wait for sleep ${time} over...`)
  } )
}

export async function waitForExist<T> (
  stateGetter: () => T,
  testsuite: string,
  expectValue: string | number | null | boolean = null,
  interval=3000,
  tryTime=20
):Promise<T>{
  let nums = 0;
  let isSuccess = false;
  while (nums < tryTime) {
    const currentValue = await new Promise<T>((done) => {
      setTimeout(()=>done(stateGetter()), 0);
    })
    console.log(testsuite + ' debug wait for exist' + nums + ' times, currentValue: ' + currentValue
      + ',expectValue ' + expectValue)

    if (expectValue == null) {
      if (currentValue != null) {
        console.log(testsuite + ' debug wait for success exist');
        isSuccess = true;
        return currentValue
      }
    } else {
      if (currentValue == expectValue) {
        console.log(testsuite + ' debug wait for success exist');
        isSuccess = true;
        return currentValue
      }
    }
    nums++;
    await sleep(interval);
  }
  if (!isSuccess) {
    console.log(testsuite + ' debug wait for failed')
  }
  const currentValue = await new Promise<T>((result) => {
    setTimeout(() => result(stateGetter()), 0);
  });
  console.log(testsuite + ' debug wait for failed exist ' + currentValue);
  return currentValue;
}

export async function waitForComponent(componentName:string) {
  let driver = Driver.create();
  await driver.waitForComponent(ON.id(componentName), 10000);
  console.info("waitForComponent", componentName, '==>');
}

export async function waitAndClickComponent(driver: Driver, componentId: string, logFlag: string): Promise<void> {
  let retryTimes: number = 0;
  let retry: boolean = true;
  while (retry && retryTimes <= 3) {
    retry = false;
    try {
      const buttonComponent = await driver.waitForComponent(ON.id(componentId), 10000);
      if (!buttonComponent) {
        console.error(`${logFlag} error: buttonConmponent is null.`);
        retry = true;
        await sleep(1000);
        retryTimes++;
        console.log(logFlag + ' retryTimes = ' + retryTimes);
      }
      await buttonComponent.click();
    } catch (e) {
      const error = e as BusinessError;
      console.error(`${logFlag} ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      if (error.code === 17000002) {
        retry = true;
        await sleep(1000);
        retryTimes++;
        console.log(logFlag + ' retryTimes = ' + retryTimes);
      }
    }
  }
}
