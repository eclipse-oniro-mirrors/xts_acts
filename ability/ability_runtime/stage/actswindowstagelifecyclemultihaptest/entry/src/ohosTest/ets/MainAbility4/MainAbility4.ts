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

export default class MainAbility4 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility4 onCreate")
        globalThis.abilityWant = want;

        globalThis.mainAbility4ListKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                globalThis.mainAbility4ListKey.push(abilityName + " onWindowStageCreate");
                console.log("listKey is :" + globalThis.mainAbility4ListKey);
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
                globalThis.mainAbility4ListKey.push(abilityName + " onWindowStageActive");
                console.log("listKey is :" + globalThis.mainAbility4ListKey);
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
                globalThis.mainAbility4ListKey.push(abilityName + " onWindowStageInactive");
                console.log("listKey is :" + globalThis.mainAbility4ListKey);
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                globalThis.mainAbility4ListKey.push(abilityName + " onWindowStageDestroy");
                console.log("listKey is :" + globalThis.mainAbility4ListKey);
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
        globalThis.ApplicationContext4 = this.context.getApplicationContext();
        globalThis.mainAbility4CallBackId = globalThis.ApplicationContext4.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("callBackId is aaa :" + globalThis.mainAbility4CallBackId);
    }

    onDestroy() {
        console.log("[Demo] MainAbility4 onDestroy")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility4onDestroy');
        }, 1500);
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility4 onWindowStageCreate")
        globalThis.ability4context = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility4_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility4 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility4 onForeground")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility4onForeground');
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility4 onBackground")
    }
};
