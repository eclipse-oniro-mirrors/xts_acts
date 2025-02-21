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
import commonEventManager from '@ohos.commonEventManager';
let onWindowStageRestoreResult = false;

export default class ThreeAbility extends UIAbility {

  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onCreate want ' + JSON.stringify(want));
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onCreate launchParam ' + JSON.stringify(launchParam))
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onCreate want 1111');
    let storage : LocalStorage = new LocalStorage();
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onCreate want 2222');
    this.context.restoreWindowStage(storage)
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onCreate want 3333');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onDestroy');
    commonEventManager.publish('ACTS_GetWindowStage', {
      parameters: {
        onWindowStageRestoreResult: onWindowStageRestoreResult,
      }
    }, (err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== commonEventManager publish end' + JSON.stringify(err));
    })
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onWindowStageCreate');
    windowStage.loadContent('WindowStageAbility/pages/three');
  }

  onWindowStageRestore() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onWindowStageRestore');
    if (this.context.windowStage) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onWindowStageRestore windowStage exit');
      onWindowStageRestoreResult = true;
    }
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'ThreeAbility== onForeground');
    setTimeout(()=>{
      this.context.terminateSelf();
    }, 1500)
  }
}