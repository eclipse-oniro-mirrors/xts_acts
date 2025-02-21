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

export default class MainAbility12 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility12 onCreate")
        globalThis.abilityWant = want;
        var listKey12 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityCreate ability:"
                + JSON.stringify(ability));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                listKey12.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 1listKey12:" + JSON.stringify(listKey12));
            },
            onWindowStageActive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageActive");
                listKey12.push(abilityname + " onWindowStageActive");
                console.log("[Demo] 2listKey12:" + JSON.stringify(listKey12));
            },
            onWindowStageInactive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageInactive");
                listKey12.push(abilityname + " onWindowStageInactive");
                console.log("[Demo] 3listKey12:" + JSON.stringify(listKey12));
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                listKey12.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 4listKey12:" + JSON.stringify(listKey12));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityDestroy ability:"
                + JSON.stringify(ability));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityForeground ability:"
                + JSON.stringify(ability));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityBackground ability:"
                + JSON.stringify(ability));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityContinue ability:"
                + JSON.stringify(ability));
            }
        }
        globalThis.applicationContext12 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext12.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback12 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] registerAbilityLifecycleCallback12 listKey: " + JSON.stringify(listKey12));
            globalThis.list12 = listKey12;
            globalThis.callbackid12 = lifecycleid;
        }, 1700);
    }

    onDestroy() {
        console.log("[Demo] MainAbility12 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility12 onWindowStageCreate")
        globalThis.ability12 = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/index12", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility12 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility12 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility12 onBackground")
    }
};
