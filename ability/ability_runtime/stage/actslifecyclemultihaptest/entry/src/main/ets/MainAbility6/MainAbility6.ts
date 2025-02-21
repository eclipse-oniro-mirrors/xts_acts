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

export default class MainAbility6 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility6 onCreate")
        globalThis.abilityWant = want;

        globalThis.mainAbility6ListKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                globalThis.mainAbility6ListKey.push(abilityName + " onAbilityCreate");
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageCreate");
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
                globalThis.mainAbility6ListKey.push(abilityName + " onAbilityForeground");
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                globalThis.mainAbility6ListKey.push(abilityName + " onAbilityBackground");
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageDestroy");
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                globalThis.mainAbility6ListKey.push(abilityName + " onAbilityDestroy");
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                globalThis.mainAbility6ListKey.push(abilityName + " onAbilityContinue");
            }
        }
        globalThis.ApplicationContext6 = this.context.getApplicationContext();
        globalThis.abilityContext6 = this.context;
        globalThis.mainAbility6CallBackId = globalThis.ApplicationContext6.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
    }

    onDestroy() {
        console.log("[Demo] MainAbility6 onDestroy")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility6onDestroy');
        }, 1500);
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility6 onWindowStageCreate")

        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility6_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility6 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility6 onForeground")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility6onForeground');
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility6 onBackground")
    }
};
