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
    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0100') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0100', commonEventData, (err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [0100] publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [0100] terminateSelf: ' + JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0300') {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'ACTION'
          }
        }
      }, (err) => {
        console.log('====> [UIExtensionForResultAsCallerCalledAbility] [0300] terminateSelfWithResult err:' + err.code);
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1400') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('1400', commonEventData, (err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [1400] publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [1400] terminateSelf: ' + JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1500') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('1500', commonEventData, (err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [1500] publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [1500] terminateSelf: ' + JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1900') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('1900', commonEventData, (err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [1900] publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf()
    }
  }

  onNewWant(want, launchParam) {
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
