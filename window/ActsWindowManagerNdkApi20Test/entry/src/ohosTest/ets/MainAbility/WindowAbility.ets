/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { AbilityConstant, UIAbility } from '@kit.AbilityKit';
import widnowndkapi20 from 'libwindowndkapi20.so';

const TAG: string = '[createWindow]';

export default class WindowAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // Ability is creating, initialize resources for this ability
    console.log(`${TAG} WindowAbility onCreate`);
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log(`${TAG} WindowAbility onDestroy`);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log(`${TAG} WindowAbility onWindowStageCreate windowStage=` + windowStage);
    windowStage.loadContent('MainAbility/pages/Window/Window', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    //Main window is destroyed, release UI related resources
    console.log(`${TAG} WindowAbility onWindowStageDestroy`);
  }

  onForeground() {
    // Ability has brought to foreground
    console.log(`${TAG} WindowAbility onForeground`);
  }

  onBackground() {
    // Ability has back to background
    console.log(`${TAG} WindowAbility onBackground`);
  }
};