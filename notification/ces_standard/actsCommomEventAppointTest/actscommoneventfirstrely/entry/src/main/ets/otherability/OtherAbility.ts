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
import commonEvent from '@ohos.commonEventManager';

export default class OtherAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.log('=====> CommonEventFirstRely OtherAbility onCreate =====>');
    globalThis.want = want;
  }

  onDestroy() {
    console.log('=====> CommonEventFirstRely OtherAbility onDestroy =====>');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log('=====> CommonEventFirstRely OtherAbility onWindowStageCreate =====>');
    windowStage.loadContent('pages/IndexOther', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('=====> CommonEventFirstRely OtherAbility onWindowStageDestroy =====>');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('=====> CommonEventFirstRely OtherAbility onForeground =====>');
    if (globalThis.want.action === 'Acts_CommonEventTest_0300') {
      commonEvent.publish('Acts_CommonEventSame_Test', (err) => {
        console.info('====>Acts_CommonEventTest_0300 OtherAbility publish err: ' + JSON.stringify(err));
        this.context.terminateSelf();
      });
    }
  }

  onBackground() {
    // Ability has back to background
    console.log('=====> CommonEventFirstRely OtherAbility onBackground =====>');
  }
}
