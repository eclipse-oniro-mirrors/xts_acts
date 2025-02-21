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
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageCreate");
                console.log("listKey is :" + globalThis.mainAbility6ListKey);
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageActive");
                console.log("listKey is :" + globalThis.mainAbility6ListKey);
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageInactive");
                console.log("listKey is :" + globalThis.mainAbility6ListKey);
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                globalThis.mainAbility6ListKey.push(abilityName + " onWindowStageDestroy");
                console.log("listKey is :" + globalThis.mainAbility6ListKey);
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
            }
        }
        globalThis.abilityContext6 = this.context;
        globalThis.ApplicationContext6 = this.context.getApplicationContext();
        var callBackId = globalThis.ApplicationContext6.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("callBackId is aaa :" + callBackId);
        globalThis.mainAbility6CallBackId = callBackId
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
