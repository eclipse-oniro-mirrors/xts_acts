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

import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`);
    })
  }

  static registerEvent(testCaseName: string, expectedValue: ESObject, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data?.ACTION).assertEqual(expectedValue);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.once(innerEvent, callBack);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static emitEvent(actualValue: ESObject, eventId: number) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "ACTION": actualValue
        }
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("webFlag start to emit action state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerEventTwo(testCaseName: string, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data?.actualValue).assertLarger(backData.data?.expectedValue - 100);
          expect(backData.data?.actualValue).assertLess(backData.data?.expectedValue - (-100));
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static emitEventTwo(expectedValue: ESObject, actualValue: ESObject, eventId: number) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "expectedValue": expectedValue,
          "actualValue": actualValue
        }
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("webFlag start to emit action state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerContainEvent(testCaseName: string, expectedValue: ESObject, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data?.ACTION).assertContain(expectedValue);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static commitKey(emitKey: string) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "ACTION": emitKey
        }
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("start send emitKey");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("emit emitKey  err: " + JSON.stringify(err));
    }
  }

  static registerLargerEvent(testCaseName: string, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data?.actualValue).assertLarger(backData.data?.expectedValue);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static async waitAndClickComponent(componentId: string ,driver: Driver): Promise<void> {
    let retryTimes: number = 0;
    let retry: boolean = true;
    while (retry && retryTimes <= 3) {
      retry = false;
      try {
        const buttonComponent = await driver.waitForComponent(ON.id(componentId), 10000);
        if (!buttonComponent) {
          console.error(`error: buttonConmponent is null.`);
          return;
        }
        await buttonComponent.click();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        if (error.code === 17000002) {
          retry = true;
          await Utils.sleep(500);
          retryTimes++;
          console.log('retryTimes = ' + retryTimes);
        }
      }
    }
  }
  static async findAndClickComponent(componentId: string ,driver: Driver): Promise<void> {
    let retryTimes: number = 0;
    let retry: boolean = true;
    while (retry && retryTimes <= 3) {
        const buttonComponent = await driver.findComponent(ON.text(componentId));
        await buttonComponent.click();
        await Utils.sleep(500);
    }
  }
}