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

export default class MainAbility2 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility2 onCreate")
        globalThis.abilityWant = want;

        globalThis.mainAbility2ListKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                globalThis.mainAbility2ListKey.push(abilityName + " onAbilityCreate");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                globalThis.mainAbility2ListKey.push(abilityName + " onWindowStageCreate");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
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
                globalThis.mainAbility2ListKey.push(abilityName + " onAbilityForeground");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                globalThis.mainAbility2ListKey.push(abilityName + " onAbilityBackground");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                globalThis.mainAbility2ListKey.push(abilityName + " onWindowStageDestroy");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                globalThis.mainAbility2ListKey.push(abilityName + " onAbilityDestroy");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                globalThis.mainAbility2ListKey.push(abilityName + " onAbilityContinue");
                console.log("listKey is :" + globalThis.mainAbility2ListKey);
            }
        }

        globalThis.ApplicationContext2 = this.context.getApplicationContext();
        globalThis.mainAbility2CallBackId = globalThis.ApplicationContext2.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
    }

    onDestroy() {
        console.log("[Demo] MainAbility2 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility2 onWindowStageCreate")
        globalThis.ability3Context = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility2_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility2 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility2 onForeground")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility2onForeground');
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};
