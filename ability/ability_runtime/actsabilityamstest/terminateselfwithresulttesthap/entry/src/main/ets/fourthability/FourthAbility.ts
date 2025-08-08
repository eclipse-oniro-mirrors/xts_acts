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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import commonEventManger from '@ohos.commonEventManager';
import { common, StartOptions, Want, wantConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default class FourthAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'FourthAbility onCreate');
  }

  onDestroy() {
    let onBackground = AppStorage.get<boolean>('onBackground');
    let onDestroy = true;
    let commonEventData: commonEventManger.CommonEventPublishData = {
      parameters: {
        data: {
          onBackground: onBackground,
          onDestroy: onDestroy
        }
      }
    };
    commonEventManger.publish('onDestroyCallback2', commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', `onConnect, 50 == ${JSON.stringify(result)}`);
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index', (err, data) => {
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
    let want: Want = {
      bundleName: 'com.example.terminateselfwithresulttesthap2',
      abilityName: 'EntryAbility'
    }
    let options: StartOptions = {
      windowMode: 100
    }
    try {
      let commonEventData: commonEventManger.CommonEventPublishData = {
        parameters: {
          data: {}
        }
      };
      commonEventManger.publish('onForegroundCallback', commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', `onConnect, 50 == ${JSON.stringify(result)}`);
        setTimeout(() => {
          this.context.terminateSelf();
        }, 5000);
      });
      this.context.startAbility(want, options).then(async () => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'startAbility successful');
      }).catch((err: BusinessError) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'startAbility error');
      });
    } catch (error) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'startAbility error');
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    AppStorage.SetOrCreate<boolean>('onBackground', true);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
