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

export default class MainAbility1 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility1 onCreate")
        globalThis.abilityWant = want;
        console.log("[Demo] MainAbility1 context: " + JSON.stringify(this.context));
        globalThis.list1 = [];
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
                globalThis.list1.push(abilityname + " onWindowStageCreate");
            },
            onWindowStageActive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageActive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageActive");
                globalThis.list1.push(abilityname + " onWindowStageActive");
            },
            onWindowStageInactive(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageInactive abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageInactive");
                globalThis.list1.push(abilityname + " onWindowStageInactive");
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                globalThis.list1.push(abilityname + " onWindowStageDestroy");
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
        globalThis.ability1context = this.context;
        globalThis.applicationContext1 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext1.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback1 number: " + JSON.stringify(lifecycleid));
        globalThis.callbackid1 = lifecycleid;

        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility1.onCreate", ()=>{
                console.log("[Demo] MainAbility1 onCreate")
            });
        }, 1500)
    }

    onDestroy() {
        console.log("[Demo] MainAbility1 onDestroy")
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility1.onDestroy", ()=>{
                console.log("[Demo] MainAbility1 onDestroy")
            });
        }, 1500)
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility1 onWindowStageCreate")
        windowStage.setUIContent(this.context, "MainAbility/pages/index1", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility1 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility1 onForeground")
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility1.onForeground", ()=>{
                console.log("[Demo] MainAbility1 onForeground")
            });
        }, 1500)
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility1 onBackground")
    }
};
