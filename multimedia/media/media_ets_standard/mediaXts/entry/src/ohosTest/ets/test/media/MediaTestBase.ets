/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { expect } from '@ohos/hypium';
import router, { RouterOptions } from '@system.router';
import { BY, UiDriver } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { fileIo as fs } from '@kit.CoreFileKit';
import { JSON } from '@kit.ArkTS';
import { LOG_TAG, SLEEP_TIME_2000 } from '../Constants';

const TAG = LOG_TAG + 'MediaTestBase';
const CODECMIMEVALUE = ['video/avc', 'audio/mp4a-latm', 'audio/mpeg'];
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export interface FdObject {
  fileAsset: fs.File | null;
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
      console.error(TAG, `Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })
  }

  async driveFn(num: number) {
    console.info(TAG, 'driveFn begin.');
    let driver = await UiDriver.create();
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    await this.msleepAsync(SLEEP_TIME_2000);
    console.info(TAG, `UiDriver start`);
    for (let i = 0; i < num; i++) {
      let button = await driver.findComponent(BY.text('允许'));
      if (button == null) {
        let cmd = "hidumper -s WindowManagerService -a'-a'";
        await delegator.executeShellCommand(cmd);
        continue;
      }
      console.info(TAG, `button is ${JSON.stringify(button)}`);
      await this.msleepAsync(SLEEP_TIME_2000);
      if (await driver.findComponent(BY.text('允许')) != null) {
        await button.click();
      }
      await this.msleepAsync(SLEEP_TIME_2000);
    }
    await this.msleepAsync(SLEEP_TIME_2000);
  }

  // File operation
  async getFileDescriptor(fileName: string) {
    let fileDescriptor: resourceManager.RawFileDescriptor | undefined | null = undefined;
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
        console.info(TAG, 'case getRawFileDescriptor success fileName: ' + fileName);
      })
      .catch((error: BusinessError) => {
        console.info(TAG, 'case getRawFileDescriptor err: ' + error);
      });
    return fileDescriptor;
  }

  async closeFileDescriptor(fileName: string) {
    await globalThis.abilityContext.resourceManager.closeRawFd(fileName)
      .then(() => {
        console.info(TAG, 'case closeRawFileDescriptor ' + fileName);
      })
      .catch((error: BusinessError) => {
        console.info(TAG, 'case closeRawFileDescriptor err: ' + error);
      });
  }

  isFileOpen(fileDescriptor: media.AVFileDescriptor | number | undefined | null, done: Function) {
    if (!fileDescriptor) {
      expect().assertFail();
      console.info(TAG, 'case error fileDescriptor undefined, open file fail');
      done();
    }
  }

  async getFdRead(pathName: string, done: Function) {
    let fdReturn: number = 0;
    pathName = globalThis.abilityContext.filesDir + '/' + pathName;
    console.log(TAG, 'pathName is ' + pathName);
    let file = await fs.openSync(pathName);
    this.isFileOpen(file, done);
    fdReturn = file.fd;
    console.info(TAG, 'case open fd success, fd is ' + fdReturn);
    return fdReturn;
  }

  async closeFdNumber(fdNumber: number) {
    await fs.close(fdNumber);
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time);
    }).then(() => {
      console.info(TAG, `sleep ${time} over...`);
    });
  }

  printError(error: BusinessError, done: Function) {
    expect().assertFail();
    console.error(TAG, `case error called, error: ${error.code}, msg: ${error.message}`);
    done();
  }

  assertErr(opera: string, error: BusinessError, done: Function) {
    console.error(TAG, `case ${opera} error, error: ${error.code}, msg: ${error.message}`);
    expect().assertFail();
    done();
  }

  // callback function for promise call back error
  failureCallback(error: BusinessError) {
    console.error(TAG, `failureCallback case error called, error: ${error.code}, msg: ${error.message}`);
    expect().assertFail();
  }

  // callback function for promise catch error
  catchCallback(error: BusinessError) {
    console.error(TAG, `catchCallback case error called, error: ${error.code}, msg: ${error.message}`);
    expect().assertFail();
  }

  checkDescription(actualDescription: media.MediaDescription, descriptionKey: Array<string>,
    descriptionValue: Array<number>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: number = descriptionValue[i];
      console.info(TAG, 'case key is  ' + descriptionKey[i]);
      console.info(TAG, 'case actual value is  ' + property);
      console.info(TAG, 'case hope value is  ' + tmpDescriptionValue);
      if (descriptionKey[i] == 'codec_mime') {
        console.info(TAG, 'CODECMIMEVALUE[descriptionValue[i]] value is  ' + CODECMIMEVALUE[tmpDescriptionValue]);
        if (property == "video/x-h264") {
          console.info(TAG, 'property attribute is:' + property);
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

  checkPlaybackInfo(actualDescription: media.PlaybackInfo, descriptionKey: Array<string>,
    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object = actualDescription[descriptionKey[i]];
      console.info(TAG, 'descriptionValue[i] is ' + descriptionValue[i]);
      let tmpDescriptionValue: number | string = Number(descriptionValue[i]);
      if (descriptionValue[i] == '') {
        tmpDescriptionValue = '';
      }
      console.info(TAG, 'case key is  ' + descriptionKey[i]);
      console.info(TAG, 'case actual value is  ' + property);
      console.info(TAG, 'case hope value is  ' + tmpDescriptionValue);
      expect(property).assertEqual(tmpDescriptionValue);
    }
  }

  checkOldDescription(actualDescription: media.MediaDescription, descriptionKey: Array<string>,
    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: string = descriptionValue[i];
      console.info(TAG, 'case key is  ' + descriptionKey[i]);
      console.info(TAG, 'case actual value is  ' + property);
      console.info(TAG, 'case hope value is  ' + tmpDescriptionValue);
      if (descriptionKey[i] == 'bitrate') {
        expect(Math.abs(Number(property) - Number(tmpDescriptionValue))).assertLess(500);
        return;
      }
      if (property != tmpDescriptionValue) {
        expect().assertFail();
      }
    }
  }

  printDescription(obj: media.MediaDescription) {
    console.info(TAG, 'obj is  ' + obj);
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
      router.push(options);
    } catch {
      console.info(TAG, 'case route failed');
    }
  }

  async getFd(pathName: string) {
    console.info(TAG, 'case come in getFd');
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    }

    pathName = globalThis.abilityContext.filesDir + "/" + pathName;

    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info(TAG, 'case getFd number is: ' + fdObject.fdNumber);

    return fdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info(TAG, 'case come in closeFd');
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info(TAG, '[fs.closeSync] case fdNumber is null');
    }
  }

  async getFileDescriptorFromFileDir(filename: string, done: Function): Promise<media.AVFileDescriptor> {
    let fileDescriptor: media.AVFileDescriptor;
    let fd = await this.getFdRead(filename, done);
    fileDescriptor = {
      fd: fd
    };
    return fileDescriptor;
  }
  
  checkPlaybackStatisticMetrics(actualStatisticMetrics: media.PlaybackMetrics, statisticMetricsKey: Array<string>) {
    console.info(`${TAG} checkPlaybackStatisticMetrics enter${JSON.stringify(actualStatisticMetrics)}`);
    for (let i = 0; i < statisticMetricsKey.length; i++) {
      let property: Object = actualStatisticMetrics[statisticMetricsKey[i]];
      console.info(TAG, 'case key is  ' + statisticMetricsKey[i]);
      console.info(TAG, 'case actual value is  ' + property);
      expect(property).assertLargerOrEqual(0);
    }
  }
}