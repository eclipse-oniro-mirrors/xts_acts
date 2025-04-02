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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import commonEventManager from '@ohos.commonEventManager';
import contextConstant from '@ohos.app.ability.contextConstant';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let areaMode = want.parameters?.areaMode;
    let isPublish = want.parameters?.isPublish;
    hilog.info(0x0000, 'testTag', '%{public}s', 'onCreate areaMode' + JSON.stringify(areaMode));
    if (areaMode === 'el3') {
      this.context.area = contextConstant.AreaMode.EL3;
    } else if (areaMode === 'el4') {
      this.context.area = contextConstant.AreaMode.EL4;
    }
    if (isPublish) {
      try {
        this.context.getGroupDir('context_test1').then(data => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getGroupDir context_test1 ====> result data' + JSON.stringify(data));
          let options = {
            parameters: {
              result: data
            }
          };
          commonEventManager.publish('getGroupDirEvent1', options, () => {
            hilog.info(0x0000, 'testTag', '%{public}s', '--- create file success and send msg ');
          });
        }).catch((error) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getGroupDir context_test1 ====> result error' + JSON.stringify(error));
        });

        this.context.getGroupDir('context_test2').then(data => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getGroupDir context_test2 ====> result data' + JSON.stringify(data));
          let options = {
            parameters: {
              result: data
            }
          };
          commonEventManager.publish('getGroupDirEvent2', options, () => {
            hilog.info(0x0000, 'testTag', '%{public}s', '--- create file success and send msg ');
          });
        }).catch((error) => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'getGroupDir context_test2 ====> result error' + JSON.stringify(error));
        });
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'getGroupDir ====> result err' + JSON.stringify(error));
      }
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