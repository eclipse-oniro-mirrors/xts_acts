/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { Driver, ON, PointerMatrix, Component } from '@ohos.UiTest';
import { ComponentInfo, RectInfo } from './Interfaces';
import { BusinessError } from '@kit.BasicServicesKit';
export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    })
  }

  static registerEvent(testCaseName: string, expectedValue: ESObject, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: ESObject) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data.ACTION).assertEqual(expectedValue);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      };
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
      };
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      };
      console.info("webFlag start to emit action state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerEventTwo(testCaseName: string, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: ESObject) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data.actualValue).assertLarger(backData.data.expectedValue - 100);
          expect(backData.data.actualValue).assertLess(backData.data.expectedValue - (-100));
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      };
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
      };
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      };
      console.info("webFlag start to emit action state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerContainEvent(testCaseName: string, expectedValue: ESObject, eventId: number, done: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: ESObject) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expect(backData.data.ACTION).assertContain(expectedValue);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      };
      events_emitter.once(innerEvent, callBack);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static commitKey(emitKey: ESObject) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "ACTION": emitKey
        }
      };
      let backEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      };
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

  static async fingerZoom(key: string, isOut: boolean) {
    let rect = Utils.getComponentRect(key);
    let centerX = Utils.getRectHorizontalCenterX(rect)
    let centerY = Utils.getRectVerticalCenterY(rect)
    let fingerUpCenterY = centerY - 100;
    let fingerDownCenterY = centerY + 100;
    let driver: Driver = Driver.create();
    let pointers: PointerMatrix = PointerMatrix.create(2, 3);
    pointers.setPoint(0, 0, {
      x: centerX, y: fingerUpCenterY - (isOut ? 40 : 120)
    });
    pointers.setPoint(0, 1, {
      x: centerX, y: fingerUpCenterY - 80
    });
    pointers.setPoint(0, 2, {
      x: centerX, y: fingerUpCenterY - (isOut ? 120 : 40)
    });
    pointers.setPoint(1, 0, {
      x: centerX, y: fingerDownCenterY + (isOut ? 40 : 120)
    });
    pointers.setPoint(1, 1, {
      x: centerX, y: fingerDownCenterY + 80
    });
    pointers.setPoint(1, 2, {
      x: centerX, y: fingerDownCenterY + (isOut ? 120 : 40)
    });
    await driver.injectMultiPointerAction(pointers);
  }

  static getRectHorizontalCenterX(rect: RectInfo): number {
    return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0));
  }

  static getRectVerticalCenterY(rect: RectInfo): number {
    return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0));
  }

  static getComponentRect(key: string): RectInfo {
    let strJson = getInspectorByKey(key);
    let obj: ComponentInfo = JSON.parse(strJson);
    console.info('[getInspectorByKey] key is: ' + key);
    return Utils.getComponentRectByObj(obj);
  }

  static getComponentRectByObj(obj: ComponentInfo): RectInfo {
    console.info('[getInspectorByKey] current component is: ' + obj.$type);
    let rectInfo: Object[] = JSON.parse('[' + obj.$rect + ']');
    let rect_value: RectInfo = {
      left: JSON.parse('[' + rectInfo[0] + ']')[0],
      top: JSON.parse('[' + rectInfo[0] + ']')[1],
      right: JSON.parse('[' + rectInfo[1] + ']')[0],
      bottom: JSON.parse('[' + rectInfo[1] + ']')[1]
    };
    console.info(JSON.stringify(rect_value));
    return rect_value;
  }

  static async pinchInComponent(id: string) {
    let driver: Driver = Driver.create();
    let image: Component = await driver.findComponent(ON.id(id));
    await image.pinchIn(0.5);
  }

  static async waitForExist<T> (
    stateGetter: () => T,
    testsuite: string,
    expectValue: string | number | boolean | null = null,
    interval=3000,
    tryTime=20
  ):Promise<T>{
    let nums = 0;
    let isSuccess = false;
    while (nums < tryTime) {
      const currentValue = await new Promise<T>((done) => {
        setTimeout(()=>done(stateGetter()), 0);
      })

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
      await Utils.sleep(interval);
      nums++;
      console.log(testsuite + ' debug wait for exist ' + nums + ' times, currentValue: ' + currentValue
        + ', expectValue ' + expectValue);
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

  static async waitAndClickComponent(driver: Driver, componentId: string, logFlag: string): Promise<void> {
    let retryTimes: number = 0;
    let retry: boolean = true;
    while (retry && retryTimes <= 3) {
      retry = false;
      try {
        const buttonComponent = await driver.waitForComponent(ON.id(componentId), 10000);
        if (!buttonComponent) {
          console.error(`${logFlag} error: buttonConmponent is null.`);
          retry = true;
          await Utils.sleep(1000);
          retryTimes++;
          console.log(logFlag + ' retryTimes = ' + retryTimes);
        }
        await buttonComponent.click();
      } catch (e) {
        const error = e as BusinessError;
        console.error(`${logFlag} ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        if (error.code === 17000002) {
          retry = true;
          await Utils.sleep(1000);
          retryTimes++;
          console.log(logFlag + ' retryTimes = ' + retryTimes);
        }
      }
    }
  }
}