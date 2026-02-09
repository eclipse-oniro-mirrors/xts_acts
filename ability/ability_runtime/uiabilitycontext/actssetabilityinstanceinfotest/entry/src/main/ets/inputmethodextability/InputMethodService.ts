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
    console.info("ActsGetgroupdirTest InputDemoService onCreate");
    keyboardController.onCreate(this.context);
    this.context.getGroupDir("context_test1", (err, data) => {
      if (!err) {
        let result = true;
        try {
          let file = fs.openSync(data + '/contextTest1.txt', fs.OpenMode.READ_WRITE);
          fs.closeSync(file);
        } catch (error) {
          result = false;
        }

        this.context.getGroupDir("context_hap2", (err, data) => {
          if (!err) {
            let result1 = true;
            try {
              let file = fs.openSync(data + '/contextTest2.txt', fs.OpenMode.READ_WRITE);
              fs.closeSync(file);
            } catch (error) {
              result1 = false;
            }
            let commonEventData = {
              parameters:{
                result: result,
                result1: result1
              }
            };
            commonEvent.publish('ACTS_INPUTMETHOD_GETGROUP_EVENT', commonEventData, (err) => {
              console.log('getgroupdirtest inputmethod getGroupDir publish err: ' + JSON.stringify(err));
            });
          }
        })

      }
    })
  }

  onDestroy(): void {
    console.log("ActsGetgroupdirTest InputDemoService onDestroy.");
    keyboardController.onDestroy();
  }
}