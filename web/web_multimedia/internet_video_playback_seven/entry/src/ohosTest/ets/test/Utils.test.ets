/**
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
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import webview from '@ohos.web.webview';
import { waitForComponents } from './WaitTest.test';
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
  
  static getSystemTime() {
      return systemDateTime.getTime(true) / 1000
  }
  
  static deletFile(filePath: string) {
      console.info("[deleteFile] filePath:" + filePath);
      try {
          fs.unlinkSync(filePath)
      } catch (error) {
          console.info("[deleteFile] error:" + error);
      }
  }

  static isPC(controller: webview.WebviewController) {
    let userAgent: string = controller.getUserAgent();
    console.info("userAgent" + userAgent);

    try {
      let isPc: boolean = userAgent.includes('PC') || userAgent.toLowerCase().includes('pc') || userAgent.includes("2in1")
      console.log('device is pc:' + isPc)
      return isPc
    } catch (error) {
      console.info("userAgent error:" + error);
      return true
    }
  }
  
  static deleteDir(dirPath: string) {
      console.info("[deleteFile] dirPath:" + dirPath);
      try {
          fs.rmdirSync(dirPath)
      } catch (error) {
          console.info("[deleteFile] error:" + error);
      }
  }
  
  static listFile(dirPath: string): string[] {
      console.info("[listFile] dirPath:" + dirPath);
      try {
          let files = fs.listFileSync(dirPath)
          for ( let i = 0; i < files.length; i++) {
              console.info('The name of file: ${files[i]}');
          }
          return files;
      } catch (error) {
          console.info("[listFile] error:" + error);
          return [];
      }
  }
  
  static isFileExist(filePath: string): boolean {
      console.info("[isFileExist] filePath:" + filePath);
      try {
          let fileExist = fs.accessSync(filePath)
          console.info("[isFileExist] return:" + fileExist);
          return fileExist
      } catch (error) {
          console.info("[isFileExist] error:" + error);
          return false;
      }
  }

  static async clickComponent(id: string) {
      let component = await waitForComponents(id);
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
      events_emitter.once(innerEvent, callBack)
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }
  
  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: Function) {
      Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
      });
  }
  
  static registerContainEvent(testCaseName: string, expectedValue: Object, eventId: number, done: Function) {
      Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
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
