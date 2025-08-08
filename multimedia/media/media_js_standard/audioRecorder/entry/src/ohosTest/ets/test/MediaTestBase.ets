/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import resourceManager from '@ohos.resourceManager';
import { expect } from '@ohos/hypium'
import router, { RouterOptions } from '@system.router'
import fs from '@ohos.file.fs';
import fileio from '@ohos.fileio'
import { UiDriver, BY, PointerMatrix } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import File from '@system.file';

const CODECMIMEVALUE = ['video/avc', 'audio/mp4a-latm', 'audio/mpeg']
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export interface FdObject {
  fileAsset: File | null;
  fdNumber: number | null;
}

export default class MediaTestBase {
  async getPermission(permissionNames: Array<Permissions>) {
    let atManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(globalThis.abilityContext, permissionNames).then((data) => {
      let grantStatus = data.authResults;
      let length = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          return;
        }
      }
      // 授权成功
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }

  async driveFn(num: number) {
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`case come in driveFn 222`)
    console.info(`driver is ${JSON.stringify(driver)}`)
    await this.msleepAsync(2000)
    console.info(`UiDriver start`)
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'))
      if (button == null) {
        let cmd = "hidumper -s WindowManagerService -a'-a'"
        await delegator.executeShellCommand(cmd);
        continue;
      }
      console.info(`button is ${JSON.stringify(button)}`)
      await this.msleepAsync(2000)
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click()
      }
      await this.msleepAsync(2000)
    }
    await this.msleepAsync(2000)
  }

  // File operation
  async getFileDescriptor(fileName: string) {
    let fileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
    await globalThis.abilityContext.resourceManager.getRawFd(fileName)
      .then(async (value: resourceManager.RawFileDescriptor) => {
        fileDescriptor = {
          fd: value.fd, offset: value.offset, length: value.length
        };
      });
    return fileDescriptor;
  }

  async getStageFileDescriptor(fileName: string) {
    let fileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
    await globalThis.abilityContext.resourceManager.getRawFd(fileName)
      .then((value: resourceManager.RawFileDescriptor) => {
        fileDescriptor = {
          fd: value.fd, offset: value.offset, length: value.length
        };
        console.log('case getRawFileDescriptor success fileName: ' + fileName);
      })
      .catch((error: BusinessError) => {
        console.log('case getRawFileDescriptor err: ' + error);
      });
    return fileDescriptor;
  }

  async closeFileDescriptor(fileName: string) {
    await globalThis.abilityContext.resourceManager.closeRawFd(fileName)
      .then(() => {
        console.log('case closeRawFileDescriptor ' + fileName);
      })
      .catch((error: BusinessError) => {
        console.log('case closeRawFileDescriptor err: ' + error);
      });
  }

  isFileOpen(fileDescriptor: resourceManager.RawFileDescriptor | number, done: Function) {
    if (fileDescriptor == undefined) {
      expect().assertFail();
      console.info('case error fileDescriptor undefined, open file fail');
      done();
    }
  }

  async getFdRead(pathName: string, done: Function) {
    let fdReturn: number | undefined;
    pathName = globalThis.abilityContext.filesDir + '/' + pathName;

    await fileio.open(pathName).then((fdNumber) => {
      this.isFileOpen(fdNumber, done)
      fdReturn = fdNumber;
      console.info('[fileio]case open fd success, fd is ' + fdReturn);
    })
    return fdReturn;
  }

  async closeFdNumber(fdNumber: number) {
    await fileio.close(fdNumber);
  }

  // wait synchronously
  async msleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  printError(error: BusinessError, done: Function) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
    done();
  }

  assertErr(opera: string, err: BusinessError, done: Function) {
    console.info(`case ${opera} error,errMessage is ${err.message}`);
    expect().assertFail();
    done();
  }

  // callback function for promise call back error
  failureCallback(error: BusinessError) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
  }

  // callback function for promise catch error
  catchCallback(error: BusinessError) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
  }

  checkDescription(actualDescription: Array<media.MediaDescription>, descriptionKey: Array<string>,
    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: string = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: string = descriptionValue[i]
      console.info('case key is  ' + descriptionKey[i]);
      console.info('case actual value is  ' + property);
      console.info('case hope value is  ' + tmpDescriptionValue);
      if (descriptionKey[i] == 'codec_mime') {
        console.info('CODECMIMEVALUE[descriptionValue[i]] value is  ' + CODECMIMEVALUE[tmpDescriptionValue]);
        if (property == "video/x-h264") {
          console.info('property attribute is:' + property);
        } else {
          expect(property).assertEqual(CODECMIMEVALUE[tmpDescriptionValue]);
        }
      } else if (descriptionKey[i] == 'bitrate') {
        expect(Math.abs(Number(property) - Number(tmpDescriptionValue))).assertLess(500);
      } else {
        expect(property).assertEqual(tmpDescriptionValue);
      }

    }
  }

  checkPlaybackInfo(actualDescription: Array<media.MediaDescription>, descriptionKey: Array<string>,
    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: string = actualDescription[descriptionKey[i]];
      console.info('case key is  ' + descriptionKey[i]);
      console.info('case actual value is  ' + property);
      console.info('case hope value is  ' + descriptionValue[i]);
      expect(property).assertEqual(descriptionValue[i]);
    }
  }

  checkOldDescription(actualDescription: media.MediaDescription, descriptionKey: Array<string>,
    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: string = descriptionValue[i]
      console.info('case key is  ' + descriptionKey[i]);
      console.info('case actual value is  ' + property);
      console.info('case hope value is  ' + tmpDescriptionValue);
      if (descriptionKey[i] == 'bitrate') {
        expect(Math.abs(Number(property) - Number(tmpDescriptionValue))).assertLess(500);
        return;
      }
      expect(property).assertEqual(tmpDescriptionValue);
    }
  }

  printDescription(obj: media.MediaDescription) {
    console.info('obj is  ' + obj);
  }

  async toNewPage(pagePath1: string, pagePath2: string, page: number) {
    let path = '';
    if (page == 0) {
      path = pagePath1;
    } else {
      path = pagePath2;
    }
    let options: RouterOptions = {
      uri: path,
    }
    try {
      await router.push(options);
    } catch {
      console.info('case route failed');
    }
  }

  async clearRouter() {
    await router.clear();
  }

  async getFd(pathName: string) {
    console.info('case come in getFd')
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    }

    pathName = globalThis.abilityContext.filesDir + "/" + pathName

    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);

    return fdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
  }
}