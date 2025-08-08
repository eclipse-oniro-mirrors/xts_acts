/**
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
 
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';

const TAG = "launchRule:Assistant1Ability"

export default class Assistant1Ability extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log(TAG, 'AssistantAbility onCreate');
    console.log(TAG, 'want param:' + JSON.stringify(want) ?? '');
    console.log(TAG, 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  onDestroy() {
    console.log(TAG, 'AssistantAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log(TAG, 'AssistantAbility onWindowStageCreate');
    windowStage.loadContent('Assistant1Ability/pages/Index', (err, data) => {
      if (err.code) {
        console.log(TAG, JSON.stringify(err) ?? '');
        return;
      }
      console.log(TAG, JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    console.log(TAG, 'AssistantAbility onWindowStageDestroy');
  }

  onForeground() {
    console.log(TAG, 'AssistantAbility onForeground');
  }

  onBackground() {
    console.log(TAG, 'AssistantAbility onBackground');
  }
}