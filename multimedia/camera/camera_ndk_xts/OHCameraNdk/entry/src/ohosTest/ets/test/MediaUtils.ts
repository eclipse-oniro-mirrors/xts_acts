/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
}