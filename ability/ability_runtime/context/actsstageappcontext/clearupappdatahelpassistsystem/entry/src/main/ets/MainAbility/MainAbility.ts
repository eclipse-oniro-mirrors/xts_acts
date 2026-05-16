/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import fs from '@ohos.file.fs';
import commonEventManager from '@ohos.commonEventManager';

let TAG = 'clearUpApplicationDataHelpStystem';
let clearUpApplicationData = (context, startType): void => {
  console.log(TAG + 'clearUpApplicationData');
  if (startType === 'Promise') {
    context.getApplicationContext().clearUpApplicationData()
      .then((data) => {
        console.log(TAG + ' --- data', data);
      })
      .catch((err) => {
        console.error(TAG + '  err.code: ' + JSON.stringify(err));
      });
  }
  if (startType === 'Callback') {
    context.getApplicationContext().clearUpApplicationData((err) => {
      console.error(TAG + '  err.code: ' + JSON.stringify(err));
    });
  }
};

export default class MainAbility extends Ability {
  async onCreate(want, launchParam) {
    let startType = want.parameters?.startType;
    let createFile = want.parameters?.createFile;
    let notClear = want.parameters?.notClear;
    console.log(TAG + `onCreate option  startType:${startType}; createFile:${createFile}; notClear:${notClear};`);
    let context = this.context;
    let filePathName = '/test.txt';
    let cacheDirPath = context.cacheDir + filePathName;
    let filesDirPath = context.filesDir + filePathName;
    let preferencesDirPath = context.preferencesDir + filePathName;
    let databaseDirPath = context.databaseDir + filePathName;
    if (createFile) {
      console.log(TAG + ' ---try create file  ');
      try {
        let file1 = fs.openSync(cacheDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let file2 = fs.openSync(filesDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let file3 = fs.openSync(preferencesDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let file4 = fs.openSync(databaseDirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.closeSync(file1);
        fs.closeSync(file2);
        fs.closeSync(file3);
        fs.closeSync(file4);
      } catch (error) {
        console.error(TAG + 'error ', JSON.stringify(error));
      }
    }
    let options = {
      parameters: {
        result: false
      }
    }
    if (fs.accessSync(cacheDirPath) && fs.accessSync(filesDirPath) && fs.accessSync(preferencesDirPath) && fs.accessSync(databaseDirPath)) {
      options.parameters.result = true;
    }
    commonEventManager.publish('clearUpApplicationDataEventSystem', options, (err) => {
      console.log(TAG + ' --- create file and send msg ishave file', options.parameters.result);
    });
    !notClear && clearUpApplicationData(context, startType);
    notClear && this.context.terminateSelf();
  }

  onWindowStageCreate(windowStage) {
    console.log('MainAbility onWindowStageCreate')
    windowStage.setUIContent(this.context, 'pages/index', null)
  }

};