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

        var listKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                listKey.push(abilityName + " onWindowStageCreate");
                console.log("listKey is :" + listKey);
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
                listKey.push(abilityName + " onWindowStageActive");
                console.log("listKey is :" + listKey);
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
                listKey.push(abilityName + " onWindowStageInactive");
                console.log("listKey is :" + listKey);
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                listKey.push(abilityName + " onWindowStageDestroy");
                console.log("listKey is :" + listKey);
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

        globalThis.ApplicationContext2 = this.context.getApplicationContext();
        var callBackId = globalThis.ApplicationContext2.registerAbilityLifecycleCallback(AbilityLifecycleCallback);

        setTimeout(() => {
            globalThis.mainAbility2ListKey = listKey
            globalThis.mainAbility2CallBackId = callBackId
            console.log("listKey is :" + listKey);
            console.log("callBackId is :" + callBackId);
        }, 3000)
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
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};
