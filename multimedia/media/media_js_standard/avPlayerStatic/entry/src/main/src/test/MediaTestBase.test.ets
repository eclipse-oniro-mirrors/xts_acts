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
import { expect } from "../../../hypium/index";
import fileIo from '@ohos.file.fs'
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'; // Permissions
import { Permissions } from 'permissions';
import { BusinessError } from '@ohos.base';
import media from '@ohos.multimedia.media';
import { Hypium } from "../../../hypium/index";
import Utils, { globalThis } from './Util.test';
import PermissionRequestResult from 'security.PermissionRequestResult';
const CODECMIMEVALUE = ['video/avc', 'audio/mp4a-latm', 'audio/mpeg']
const delegator = abilityDelegatorRegistry.getAbilityDelegator();

export interface FdObject {
  fileAsset: fileIo.File | null;
  fdNumber: number | null;
}

export default class MediaTestBase {
  async getPermission(permissionNames: Array<Permissions>) {
    let atManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(globalThis.abilityContext!!, permissionNames).then((data: PermissionRequestResult) => {
      let grantStatus: Array<int> = data.authResults;
      let length: int = grantStatus.length as int;
      for (let i: int = 0; i < length; i++) {
        let authResultGrant: int = 0;
        let ret: int = grantStatus.$_get(i) as int
        if (ret == authResultGrant) {
          // 用户授权，可以继续访问目标操作
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          // return;
        }
      }
      // 授权成功
    }).catch((err: Error) => {
      console.error(`Failed to request permissions from user. Code is ${JSON.stringify(err)}`);
    })
  }

  async getStageFileDescriptor(fileName: string): Promise<resourceManager.RawFileDescriptor> {
    return new Promise<resourceManager.RawFileDescriptor>((resolve, reject) => {
      let g_context: common.UIAbilityContext;
      g_context = globalThis.getContext()
      if (!g_context.resourceManager) {
        console.error('Global context or resource manager is not ready');
        return;
      }
      !g_context.resourceManager!!.getRawFd(fileName)
        .then((value: resourceManager.RawFileDescriptor) => {
          const fileDescriptor: resourceManager.RawFileDescriptor = {
            fd: value.fd, offset: value.offset, length: value.length
          };
          console.log('case getRawFileDescriptor success fileName: ' + fileName);
          resolve(fileDescriptor);
        })
        .catch((error: Error) => {
          console.log('case getRawFileDescriptor err: ' + error);
          reject(error);
        });
    });
  }

  isFileOpen(fileDescriptor: media.AVFileDescriptor | number | undefined | null, done: () => void) {
    if (!fileDescriptor) {
      expect().assertFail();
      console.info('case error fileDescriptor undefined, open file fail');
      done();
    }
  }

  async getFdRead(pathName: string, done: () => void): Promise<number> {
    let fdReturn: number = 0;
    let g_context: common.UIAbilityContext;
    g_context = globalThis.getContext();
    pathName = g_context?.filesDir + '/' + pathName;
    console.log("pathName is " + pathName)
    await fileIo.open(pathName).then((fdNumber: fileIo.File) => {
      this.isFileOpen(fdNumber.fd, done)
      fdReturn = fdNumber.fd;
      console.info('[fileIo]case open fd success, fd is ' + fdReturn);
    })
    return new Promise<number>((resolve, reject) => {
      resolve(fdReturn)
    });
  }

  async closeFdNumber(fdNumber: number) {
    await fileIo.close(fdNumber.toInt());
  }

  // wait asynchronously
  async msleepAsync(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok");
      }, time.toInt());
    }).then(() => {
      console.info(`sleep ${time} over...`);
    });
  }

  printError(error: BusinessError, done: () => void) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
    done();
  }

  assertErr(opera: string, err: BusinessError, done: () => void) {
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
  catchCallback(error: Error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
  }

  checkDescription(actualDescription: media.MediaDescription, descriptionKey: Array<string>,
                   descriptionValue: Array<number>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object | undefined = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: int = descriptionValue[i].toInt()
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
        expect(Math.abs(Number(property!! as number) - Number(tmpDescriptionValue))).assertLess(500);
      } else {
        expect(property).assertEqual(tmpDescriptionValue);
      }
    }
  }

  checkPlaybackInfo(actualDescription: media.PlaybackInfo, descriptionKey: Array<string>,
                    descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object | undefined = actualDescription[descriptionKey[i]];
      console.log('descriptionValue[i] is ' + descriptionValue[i])
      let tmpDescriptionValue: number | string = Number(descriptionValue[i]);
      if (descriptionValue[i] == '') {
        tmpDescriptionValue = '';
      }
      console.info('case key is  ' + descriptionKey[i]);
      console.info('case actual value is  ' + property);
      console.info('case hope value is  ' + tmpDescriptionValue);
      expect(property).assertEqual(tmpDescriptionValue);
    }
  }

  checkOldDescription(actualDescription: media.MediaDescription, descriptionKey: Array<string>,
                      descriptionValue: Array<string>) {
    for (let i = 0; i < descriptionKey.length; i++) {
      let property: Object | undefined = actualDescription[descriptionKey[i]];
      let tmpDescriptionValue: string = descriptionValue[i]
      console.info('case key is  ' + descriptionKey[i]);
      console.info('case actual value is  ' + property);
      console.info('case hope value is  ' + tmpDescriptionValue);
      if (descriptionKey[i] == 'bitrate') {
        expect(Math.abs(Number(property!! as number) - Number(tmpDescriptionValue))).assertLess(500);
        return;
      }
      if (property != tmpDescriptionValue) {
        expect().assertFail()
      }
    }
  }

  printDescription(obj: media.MediaDescription) {
    console.info('obj is  ' + obj);
  }

  async clearRouter() {
    // router.clear();
  }

  async getFd(pathName: string) {
    console.info('case come in getFd')
    let fdObject: FdObject = {
      fileAsset: null,
      fdNumber: null
    }
    pathName = globalThis.abilityContext?.filesDir + "/" + pathName

    let file = fileIo.openSync(pathName, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);

    return fdObject;
  }

  async closeFd(fdNumber: number | null) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fileIo.closeSync(fdNumber.toInt());
    } else {
      console.info('[fileIo.closeSync] case fdNumber is null');
    }
  }

  async getFileDescriptorFromFileDir(filename: string, done: () => void): Promise< media.AVFileDescriptor> {
    let fileDescriptor: media.AVFileDescriptor;
    let fd = await this.getFdRead(filename, done)
    fileDescriptor = {
      fd: fd as int
    }
    return new Promise<media.AVFileDescriptor>((resolve, reject) => {
      resolve(fileDescriptor)
    });
  }
}