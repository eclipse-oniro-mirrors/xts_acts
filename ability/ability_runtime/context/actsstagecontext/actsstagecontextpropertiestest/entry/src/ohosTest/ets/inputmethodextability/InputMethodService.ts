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

import Want from '@ohos.app.ability.Want';
import InputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility';
import keyboardController from './model/KeyboardController';
import commonEvent from '@ohos.commonEventManager';
import fs from '@ohos.file.fs';

export default class InputDemoService extends InputMethodExtensionAbility {

  onCreate(want: Want): void {
    console.info("ActsStageContextPropertiesTest InputDemoService onCreate");
    keyboardController.onCreate(this.context);
    let filesDir = this.context.filesDir;
    let appfilesDir = this.context.getApplicationContext().filesDir;
    let commonEventData = {
      parameters:{
        filesDir: filesDir,
        appfilesDir: appfilesDir
      }
    };
    commonEvent.publish('ACTS_INPUTMETHOD_CONTEXT_EVENT', commonEventData, (err) => {
      console.log('ACTS_INPUTMETHOD_CONTEXT_EVENT publish err: ' + JSON.stringify(err));
    });

    let file1 = fs.openSync(filesDir + '/inputTest1.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen = fs.writeSync(file1.fd, "Try to write str in the inputTest1.");
    fs.closeSync(file1);

    let file2 = fs.openSync(appfilesDir + '/inputTest2.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let writeLen2 = fs.writeSync(file2.fd, "Try to write str inputTest2.");
    fs.closeSync(file2);
  }

  onDestroy(): void {
    console.log("ActsStageContextPropertiesTest InputDemoService onDestroy.");
    keyboardController.onDestroy();
  }
}