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

export default class MainAbility12 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility12 onCreate")
        globalThis.abilityWant = want;
        globalThis.list12 = [];
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
                globalThis.list12.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 1listKey12:" + JSON.stringify(globalThis.list12));
            },
            onWindowStageActive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageActive");
                globalThis.list12.push(abilityname + " onWindowStageActive");
                console.log("[Demo] 2listKey12:" + JSON.stringify(globalThis.list12));
            },
            onWindowStageInactive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageInactive");
                globalThis.list12.push(abilityname + " onWindowStageInactive");
                console.log("[Demo] 3listKey12:" + JSON.stringify(globalThis.list12));
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                globalThis.list12.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 4listKey12:" + JSON.stringify(globalThis.list12));
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
        globalThis.ability12 = this.context;
        globalThis.applicationContext12 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext12.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback12 number: " + JSON.stringify(lifecycleid));
        globalThis.callbackid12 = lifecycleid;
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility12.onCreate", ()=>{
                console.log("[Demo] MainAbility12 onCreate")
            });
        }, 1500)
    }

    onDestroy() {
        console.log("[Demo] MainAbility12 onDestroy")
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility12.onDestroy", ()=>{
                console.log("[Demo] MainAbility12 onDestroy")
            });
        }, 1000)
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility12 onWindowStageCreate")
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
