/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { Driver,ON } from '@ohos.UiTest'

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  }).then(() => {
    console.info(`debug wait for sleep ${time} over...`)
  } )
}

function emitEvent<T>(actualValue: T, eventId: number) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        'ACTION': actualValue
      }
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    console.info('webFlag start to emit action state debug wait for');
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info('webFlag emit action state debug wait for err: ' + JSON.stringify(err));
  }
}

export async function waitForAssert<T,U>(
  stateGetter:() => T,
  check:(v1: T, v2: U) => boolean,
  expectValue: U,
  eventId: number,
  testsuite: string,
  interval=3000,
  tryTime=20): Promise<T>{
  let nums = 0;
  let isSuccess = false;
  while(nums < tryTime) {
    await sleep(interval);
    const currentValue = await new Promise<T>((done) => {
      setTimeout(()=>done(stateGetter()), 0);
    });
    console.log(testsuite + ' debug wait for ' + nums + ' times, currentValue:' + currentValue
      + ', expectValue:' + expectValue);
    if (check(currentValue, expectValue)) {
      console.log(testsuite + ' debug wait for success ' + nums + ' times, currentValue:' + currentValue
        + ', expectValue: ' + expectValue);
      isSuccess = true;
      emitEvent(expectValue, eventId);
      return currentValue;
    }
    nums++;
  }
  if (!isSuccess) {
    console.log(testsuite + ' debug wait for failed');
  }
  const currentValue = await new Promise<T>((result)=>{
    setTimeout(()=> result(stateGetter()), 0);
  });
  console.log(testsuite + ' debug wait for failed, currentValue:' + currentValue + ', expectValue:' + expectValue);
  emitEvent(currentValue, eventId);
  return currentValue;
}

export async function waitForExist<T> (
  stateGetter: () => T,
  testsuite: string,
  expectValue: string | number | null = null,
  interval=3000,
  tryTime=20
):Promise<T>{
  let nums = 0;
  let isSuccess = false;
  while (nums < tryTime) {
    await sleep(interval);
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