/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

export default class MainAbility extends Ability {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("MainAbility3 onCreate");
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("MainAbility3 onDestroy");
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        // Main window is created, set main page for this ability
        console.log("MainAbility3 onWindowStageCreate");
        AppStorage.setOrCreate<common.UIAbilityContext>("ability3Context", this.context);
        windowStage.loadContent("pages/index3", null);
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("MainAbility3 onWindowStageDestroy");
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("MainAbility3 onForeground");
        let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        Delegator.startAbility(
            {
                bundleName: 'com.example.aacommand07',
                abilityName: 'MainAbility2'
            },()=> {
            console.log("====>ACTS_AACommand_test_0700 startAbility end====>");
        })
    }

    onBackground() {
        // Ability has back to background
        console.log("MainAbility3 onBackground");
    }
}
