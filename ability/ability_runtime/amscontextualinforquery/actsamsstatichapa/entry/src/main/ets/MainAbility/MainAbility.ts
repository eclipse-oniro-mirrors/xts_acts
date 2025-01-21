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
import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("ACTS_getAbilityInfo_0400 MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("ACTS_getAbilityInfo_0400 MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("ACTS_getAbilityInfo_0400 MainAbility onWindowStageCreate")
        globalThis.abilityContext = this.context
        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("ACTS_getAbilityInfo_0400 MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("ACTS_getAbilityInfo_0400 MainAbility onForeground")
        if (globalThis.abilityWant.action == 'startHapA') {
            globalThis.abilityContext.startAbility({
                bundleName: "com.example.staticinformationmultihappackage",
                abilityName: "com.example.feature.MainAbility",
                action: "startHapB"
            }, (error, data) => {
                console.log('ACTS_getAbilityInfo_0400 MainAbility onForeground - startAbility restart singleton: '
                + JSON.stringify(error) + ", " + JSON.stringify(data))
            })
            commonEvent.publish("MainAbility_Start_CommonEvent_multi_hap_entry", {
                parameters: {
                    hapModuleInfo: JSON.stringify(globalThis.abilityContext.currentHapModuleInfo),
                    applicationInfo: JSON.stringify(globalThis.abilityContext.applicationInfo),
                    abilityInfo: JSON.stringify(globalThis.abilityContext.abilityInfo)
                }
            }, (err) => {
                console.log("ACTS_getAbilityInfo_0400 MainAbility Publish CallBack onForeground")
            });
        }
        console.log("ACTS_getAbilityInfo_0400 MainAbility onForeground")

        if (globalThis.abilityWant.action == 'multiple') {
            commonEvent.publish("MainAbility_Start_CommonEvent_multiple_hap_entry", {
                parameters: {
                    hapModuleInfo: JSON.stringify(globalThis.abilityContext.currentHapModuleInfo),
                    applicationInfo: JSON.stringify(globalThis.abilityContext.applicationInfo),
                    abilityInfo: JSON.stringify(globalThis.abilityContext.abilityInfo)
                }
            }, (err) => {
                console.log("ACTS_getAbilityInfo_0400 MainAbility Publish CallBack onForeground")
            });
        }
    }

    onBackground() {
        // Ability has back to background
        console.log("ACTS_getAbilityInfo_0400 MainAbility onBackground")
    }
};
