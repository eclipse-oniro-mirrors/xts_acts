/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default class CalledAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'CalledAbility onCreate');

    console.log('=====> first app CalledAbility =====>');

    const TIMEOUT = 50;

    globalThis.terminateCalledAbility = (str) => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info('====>terminateSelf' + JSON.stringify(str) + ' end');
        }).catch((err) => {
          console.info('====>terminateSelf ' + JSON.stringify(str) + ' err:' + JSON.stringify(err));
        });
      }, TIMEOUT);
    };

    if (want.action === 'Acts_ShareExtensionAbility_1000') {
      this.context.terminateSelf();
    }

    if (want.action === 'Acts_ShareExtensionAbility_1100') {
      this.context.terminateSelf();
    }

    if (want.action === 'Acts_ShareExtensionAbility_1300') {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'SHARE'
          }
        }
      }, (err) => {
        console.log('=====> Acts_ShareExtensionAbility_1300 CalledAbilityCallBack terminateSelfWithResult =====>' + err.code);
      });
    }

    if (want.action === 'Acts_ShareExtensionAbility_1400') {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'SHARE'
          }
        }
      }, (err) => {
        console.log('=====> Acts_ShareExtensionAbility_1400 CalledAbilityCallBack terminateSelfWithResult =====>' + err.code);
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
