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

export default class MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility3 onCreate")
        globalThis.abilityWant = want;

        console.log("[Demo] MainAbility3 context: " + JSON.stringify(this.context));
        var listKey3 = [];
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
                listKey3.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 1listKey3:" + JSON.stringify(listKey3));
            },
            onWindowStageActive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageActive");
                listKey3.push(abilityname + " onWindowStageActive");
                console.log("[Demo] 2listKey3:" + JSON.stringify(listKey3));
            },
            onWindowStageInactive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageInactive");
                listKey3.push(abilityname + " onWindowStageInactive");
                console.log("[Demo] 3listKey3:" + JSON.stringify(listKey3));
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                listKey3.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 4listKey3:" + JSON.stringify(listKey3));
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
        globalThis.applicationContext3 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext3.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback3 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] registerAbilityLifecycleCallback3 listKey : " + JSON.stringify(listKey3));
            globalThis.list3 = listKey3;
            globalThis.callbackid3 = lifecycleid;
        }, 2000);
    }

    onDestroy() {
        console.log("[Demo] MainAbility3 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility3 onWindowStageCreate")
        globalThis.ability3 = this.context
        windowStage.setUIContent(this.context, "MainAbility/pages/index3", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};
