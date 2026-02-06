/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

// @ts-nocheck
import DateTimeUtil from './DateTimeUtil';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { Camera_MediaType } from './Constants';

export default class MediaUtils {
  private static instance: MediaUtils = new MediaUtils();

  public static getInstance() {
    if (this.instance === undefined) {
      this.instance = new MediaUtils();
    }
    return this.instance;
  }

  async createAndGetUriVideo() {
    console.info('1128xmj createAndGetUriVideo');
    let dateTimeUtil = new DateTimeUtil();
    let pathName;
    await featureAbility.getContext().getFilesDir().then((fileDir) => {
        console.info("case file dir is" + JSON.stringify(fileDir));
        pathName = fileDir + '/' + pathName;
        console.info("case pathName is" + pathName);
    });
    let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`
    let path = pathName + 'VID_' + name + '.mp4';
    let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    console.info('1128xmj fd : ' + file.fd);
    return file.fd;
  }
  
  // picture format
    onChangePhotoFormat() {
        if (globalThis.settingDataObj.photoFormat == 0) {
            return 'png';
        }
        if (globalThis.settingDataObj.photoFormat == 1) {
            return 'jpg';
        }
        if (globalThis.settingDataObj.photoFormat == 2) {
            return 'bmp';
        }
        if (globalThis.settingDataObj.photoFormat == 3) {
            return 'webp';
        }
        if (globalThis.settingDataObj.photoFormat == 4) {
            return 'jpeg';
        }
    }

    async createAndGetUriVideoNew(mediaType: number, mContext) {
        console.info('1128xmj createAndGetUriVideo');
        let info = this.getInfoFromTypeNew(mediaType)
        let dateTimeUtil = new DateTimeUtil()
        let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`
        let tmp = `/`
        let displayName = `${tmp}${info.prefix}${name}${info.suffix}`
        console.info('1128xmj createAndGetUri displayName : ' + displayName);
    
        let filesDirPath  = mContext.filesDir + displayName;
        // let filesDirPath  = AppStorage.get('pathDir') + "/" + displayName;
        console.info('1128xmj createAndGetUri filesDirPath : ' + JSON.stringify(filesDirPath));
        let file = fs.openSync(filesDirPath , fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        console.info('1128xmj fd : ' + file.fd);
        return file.fd;
      }
    
    getInfoFromTypeNew(mediaType: number) {
        let result = {
          prefix: '', suffix: ''
        };
        switch (mediaType) {
          case Camera_MediaType.IMAGE:
            result.prefix = 'IMG_';
            result.suffix = `.${this.onChangePhotoFormat()}`;
            break;
          case Camera_MediaType.VIDEO:
            result.prefix = 'VID_';
            result.suffix = '.mp4';
            break;
          default:
            break;
        }
        return result;
      }
}