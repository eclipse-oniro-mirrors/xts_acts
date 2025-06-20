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

export default class MainAbility8 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility8 onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        console.log("[Demo] MainAbility8 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility8 onWindowStageCreate")
        globalThis.ability8 = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/index8", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility8 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility8 onForeground")
        var listKey8 = [];
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
                listKey8.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 1listKey8:" + JSON.stringify(listKey8));
            },
            onWindowStageActive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageActive");
                listKey8.push(abilityname + " onWindowStageActive");
                console.log("[Demo] 2listKey8:" + JSON.stringify(listKey8));
            },
            onWindowStageInactive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageInactive");
                listKey8.push(abilityname + " onWindowStageInactive");
                console.log("[Demo] 3listKey8:" + JSON.stringify(listKey8));
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                listKey8.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 4listKey8:" + JSON.stringify(listKey8));
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
        globalThis.applicationContext8 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext8.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] AbilityLifecycleCallback8 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] AbilityLifecycleCallback8 listKey: " + JSON.stringify(listKey8));
            globalThis.list8 = listKey8;
            globalThis.callbackid8 = lifecycleid;
        }, 1500);

    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility8 onBackground")
    }
};
