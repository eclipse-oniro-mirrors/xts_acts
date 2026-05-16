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
import { Driver, ON } from '@ohos.UiTest';
import { ComponentInfo, RectInfo } from './Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static copyRawFileToSandbox(rawFileName: string): string {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let context = abilityDelegator.getAppContext();
    let dir = context.filesDir + "/";
    let rawFilePath = dir + rawFileName;
    try {
      let arrayBuffer = context.resourceManager.getRawFileContentSync(rawFileName);
      let file = fs.openSync(rawFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, arrayBuffer.buffer);
      fs.closeSync(file);
      console.log(`[copyRawFileToSandbox] ${rawFileName} is copy success`);
    } catch (error) {
      console.info("[copyRawFileToSandbox] getRawFileDescriptor api run failed" + error);
    }
    console.info("[copyRawFileToSandbox] sandbox path:" + dir);
    return rawFilePath
  }

  static getSandboxFileDir() {
    let sandboxFileDir = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + "/"
    console.log(`[getSandboxFileDir] return ${sandboxFileDir}`);
    return sandboxFileDir;
  }

  static stressingLog(functionName: string, current: number, total: number) {
    if ((current % 50) == 0) {
      console.log(`${functionName} ==> stressing:${current}/${total}`)
    }
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await component.click();
  }

  static async triggerKey(id: number) {
    let driver = Driver.create();
    await driver.triggerKey(id);
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: number,
                           done: Function, expectFunction: Function) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
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
      events_emitter.on(innerEvent, callBack)
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: Function) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
      (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
  }

  static registerContainEvent(testCaseName: string, expectedValue: Object, eventId: number, done: Function) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
      (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertContain(expected);
      });
  }

  static emitEvent(actualValue: boolean | string | number | object, eventId: number) {
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

  static registerEventPage(callBack: Function) {
    events_emitter.on({
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }, (eventData: events_emitter.EventData) => {
      console.info("web page valueChangeCallBack");
      if (eventData != null) {
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        callBack(eventData)
      }
    })
  }

  static unRegisterEventPage() {
    events_emitter.off(10)
  }

  static emitEventPage(testCaseName: string, callBackId: number, stressTimes: number, testButtonKey: string) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          "CASE_NAME": testCaseName,
          "CALL_BACK_ID": callBackId,
          "STRESS_TIMES": stressTimes,
          "BUTTON_KEY": testButtonKey
        }
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("webFlag start to emit page state");
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info("webFlag emit page state err: " + JSON.stringify(err));
    }
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

  static getRectHorizontalCenterX(rect: RectInfo): number {
    return (rect.right - rect.left) / 2 + rect.left;
  }

  static getRectVerticalCenterY(rect: RectInfo): number {
    return (rect.bottom - rect.top) / 2 + rect.top;
  }

  static async doIt(testCaseName: string, callBackId: number, stressTimes: number,
                    testButtonKey: string, registerEvents: Function) {
    Utils.emitEventPage(testCaseName, callBackId, stressTimes, testButtonKey)
    await Utils.sleep(2000);
    registerEvents(testCaseName, callBackId)
    sendEventByKey(testButtonKey, 10, '');
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

  static async waitAndClickComponent(driver: Driver, componentId: string): Promise<void> {
    let retryTimes: number = 0;
    let retry: boolean = true;
    while (retry && retryTimes <= 3) {
      retry = false;
      try {
        const buttonComponent = await driver.waitForComponent(ON.id(componentId), 10000);
        if (!buttonComponent) {
          console.error(`error: buttonConmponent is null.`);
          retry = true;
          await Utils.sleep(500);
          retryTimes++;
          console.log('retryTimes = ' + retryTimes);
          continue;
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
}