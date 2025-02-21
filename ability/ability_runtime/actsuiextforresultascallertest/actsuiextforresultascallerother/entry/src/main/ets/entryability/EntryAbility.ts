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
import window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info('====> [OtherCalledAbility] oncCreate.');

    if (want.parameters.parameter == 'StartAbilityForResultAsCaller_0200') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0200', commonEventData, (err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [StartAbilityForResultAsCaller_0200]' +
        'publish: ' + JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [UIExtensionForResultAsCallerCalledAbility] [StartAbilityForResultAsCaller_0200]' +
        'terminateSelf: ' + JSON.stringify(err));
      });
    } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0700_2') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0700_2', commonEventData, (err) => {
        console.info('====> [OtherAbliity] [StartAbilityForResultAsCaller_0700] onCreate publish: ' +
        JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [OtherAbliity] [StartAbilityForResultAsCaller_0700] onCreate terminateSelf: ' +
        JSON.stringify(err));
      })
    } else {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'ACTION'
          }
        }
      }, (err) => {
        console.log('====> [UIExtensionForResultAsCallerCalledAbility] [0600] terminateSelfWithResult err:' + err.code);
      });
    }
  }
  onNewWant(want, launchParam){
    if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0700_2') {
      let commonEventData = {
        code: 0
      };
      commonEvent.publish('0700_2', commonEventData, (err) => {
        console.info('====> [OtherAbliity] [StartAbilityForResultAsCaller_0700] onNewWant publish: ' +
        JSON.stringify(err));
      });
      this.context.terminateSelf().catch((err) => {
        console.info('====> [OtherAbliity] [StartAbilityForResultAsCaller_0700] onNewWant terminateSelf: ' +
        JSON.stringify(err));
      });
    } else {
      this.context.terminateSelfWithResult({
        resultCode: 0,
        want: {
          parameters: {
            action: 'ACTION'
          }
        }
      }, (err) => {
        console.log('====> [UIExtensionForResultAsCallerCalledAbility] [0600] terminateSelfWithResult err:' + err.code);
      });
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
