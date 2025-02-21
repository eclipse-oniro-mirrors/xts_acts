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

let onForegroundResult1: boolean = false;
let onForegroundResult2: boolean = false;
let onBackgroundResult: boolean = false;
let onNewWantResult: boolean = false;

export default class TwoAbility extends UIAbility {
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TwoAbility onDestroy');
    commonEventManager.publish('ACTS_GetWindowStage', {
      parameters: {
        onForegroundResult1: onForegroundResult1,
        onForegroundResult2: onForegroundResult2,
        onBackgroundResult: onBackgroundResult,
        onNewWantResult: onNewWantResult
      }
    }, (err) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'OneAbility commonEventManager publish end' + JSON.stringify(err));
    })
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TwoAbility onWindowStageCreate');
    this.context.windowStage.loadContent('WindowStageAbility/pages/two');
  }

  onNewWant() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TwoAbility onNewWant');
    if (this.context.windowStage) {
      hilog.info(0x0000, 'testTag', '%{public}s', ' onNewWant windowstage is exit.');
      onNewWantResult = true;
    }
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TwoAbility onForeground');
    if (this.context.windowStage) {
      if (onForegroundResult1) {
        onForegroundResult2 = true;
      }
      onForegroundResult1 = true;
    }
    setTimeout(()=>{
      commonEventManager.publish('ACTS_GetWindowStage_onForeground', (err) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager publish onForeground ' + JSON.stringify(err));
      })
    }, 1000)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TwoAbility onBackground');
    if (this.context.windowStage) {
      onBackgroundResult = true;
    }
    setTimeout(()=>{
      commonEventManager.publish('ACTS_GetWindowStage_onBackground', (err) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager publish onBackground ' + JSON.stringify(err));
      })
    }, 1000)
  }
}