/*
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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';

export default class CalledAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onCreate');

    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0800_2') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0800', commonEventData, (err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0800_2] onCreate publish: ' +
        JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0800_2] terminateSelf: ' +
        JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0900') {
      console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0900] onCreate : ' +
      JSON.stringify(want));
      let wantString = JSON.stringify(want).split('"ohos.aafwk.param.callerBundleName":"');
      let result = wantString[1].split('"');
      console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0900] onCreate2 : ' + result[0]);
      let commonEventData = {
        parameters: {
          str: result[0]
        }
      };
      commonEvent.publish('0900', commonEventData, (err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0900] onCreate publish: ' +
        JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====>[StartAbilityForResultAsCaller_0900] terminateSelf: ' + JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1000') {
      console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_1000] onCreate : ' +
      JSON.stringify(want));
      let wantString = JSON.stringify(want).split('"ohos.aafwk.param.callerBundleName":"');
      let result = wantString[1].split('"');
      console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_1000] onCreate2 : ' + result[0]);
      let commonEventData = {
        parameters: {
          str: result[0]
        }
      };
      commonEvent.publish('1000', commonEventData, (err) => {
        console.info('====>[StartAbilityForResultAsCaller_1000] onCreate publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_1000] terminateSelf: ' +
        JSON.stringify(err));
      });
    }
  }

  onNewWant(want, launchParam) {
    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0800_2') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0800', commonEventData, (err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0800_2] onNewWant publish: ' +
        JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [OtherAbilityCalledAbility] [StartAbilityForResultAsCaller_0800_2] terminateSelf: ' +
        JSON.stringify(err));
      });
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/PageTwo', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onBackground');
  }
}
