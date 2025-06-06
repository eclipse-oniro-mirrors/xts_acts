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
import { AbilityConstant, Want } from '@kit.AbilityKit';

export default class TestWantShowModeOtherFullAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    }

    onDestroy() {
        setTimeout(()=>{
          commonEventManager.publish('ACTS_START_ABILITY', (err) => {
            hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager publish onForeground ' + JSON.stringify(err));
          })
        }, 500)
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('testability/pages/Index4', (err, data) => {
            if (err.code) {
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        setTimeout(()=>{
          this.context.terminateSelf();
        }, 500)
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }

    onBackground() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
}
