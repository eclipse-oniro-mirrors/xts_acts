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
import { expect } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Component } from '@ohos.UiTest';
import { ComponentInfo, RectInfo } from './Interfaces';
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('ok')
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static copyRawFileToSandbox(rawFileName: string): string {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let context = abilityDelegator.getAppContext();
    let dir = context.filesDir + '/';
    let rawFilePath = dir + rawFileName;
    try {
      let arrayBuffer = context.resourceManager.getRawFileContentSync(rawFileName);
      let file = fs.openSync(rawFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, arrayBuffer.buffer);
      fs.closeSync(file);
      console.log(`[copyRawFileToSandbox] ${rawFileName} is copy success`);
    } catch (error) {
      console.info('[copyRawFileToSandbox] getRawFileDescriptor api run failed' + error);
    }
    console.info('[copyRawFileToSandbox] sandbox path:' + dir);
    return rawFilePath
  }

  static getSystemTime() {
    return systemDateTime.getTime(true) / 1000
  }

  static getSandboxFileDir() {
    let sandboxFileDir = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/'
    console.log(`[getSandboxFileDir] return ${sandboxFileDir}`);
    return sandboxFileDir;
  }

  static getSandboxCacheDir() {
    let sandboxCacheDir = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().cacheDir + '/'
    console.log(`[getSandboxCacheDir] return ${sandboxCacheDir}`);
    return sandboxCacheDir;
  }

  static createFileToSandboxSync(filePath: string, fileName: string, mode?: number) {
    try {
      if (!Utils.isFileExist(filePath)) {
        fs.mkdirSync(filePath);
      }
      fs.openSync(filePath + fileName, mode);
      console.log('[createFileToSandboxSync] success, sandbox path:' + filePath + fileName);
    } catch (error) {
      console.info('[createFileToSandboxSync] api run failed ' + error);
      console.info('[createFileToSandboxSync] api run failed path:' + filePath + fileName);
    }
  }

  static deleteFile(filePath: string) {
    console.info('[deleteFile] filePath:' + filePath);
    try {
      fs.unlinkSync(filePath)
    } catch (error) {
      console.info('[deleteFile] error:' + error);
    }
  }

  static deleteDir(dirPath: string) {
    console.info('[deleteDir] dirPath:' + dirPath);
    try {
      fs.rmdirSync(dirPath)
    } catch (error) {
      console.info('[deleteDir] error:' + error);
    }
  }

  static listFile(dirPath: string): string[] {
    console.info('[listFile] dirPath:' + dirPath);
    try {
      let files = fs.listFileSync(dirPath)
      for (let i = 0; i < files.length; i++) {
        console.info(`The name of file: ${files[i]}`);
      }
      return files;
    } catch (error) {
      console.info('[listFile] error:' + error);
      return [];
    }
  }

  static isFileExist(filePath: string): boolean {
    console.info('[isFileExist] filePath:' + filePath);
    try {
      let fileExist = fs.accessSync(filePath)
      console.info('[isFileExist] return:' + fileExist);
      return fileExist
    } catch (error) {
      console.info('[isFileExist] error:' + error);
      return false
    }
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    await component.click();
  }

  static async pinchInComponent(id: string) {
    let driver: Driver = Driver.create();
    let image: Component = await driver.findComponent(ON.id(id));
    await image.pinchIn(0.5);
  }

  static async triggerKey(id: number) {
    let driver = Driver.create();
    await driver.triggerKey(id);
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
          'ACTION': actualValue
        }
      }
      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      console.info('webFlag start to emit action state');
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      console.info('webFlag emit action state err: ' + JSON.stringify(err));
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
    return Number.parseInt(Number((rect.right - rect.left) / 2 + rect.left).toFixed(0));
  }

  static getRectVerticalCenterY(rect: RectInfo): number {
    return Number.parseInt(Number((rect.bottom - rect.top) / 2 + rect.top).toFixed(0));
  }
}