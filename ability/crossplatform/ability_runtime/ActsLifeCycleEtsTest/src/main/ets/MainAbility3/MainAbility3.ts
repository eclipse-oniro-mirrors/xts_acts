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
        globalThis.abilityWant3 = want;

        console.log("[Demo] MainAbility3 context: " + JSON.stringify(this.context));
        globalThis.list3 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                globalThis.list3.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey3:" + JSON.stringify(globalThis.list3));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback3 onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                globalThis.list3.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey3:" + JSON.stringify(globalThis.list3));
            },
            onWindowStageActive(ability, windowStage) {
                let abilityname = ability.context.abilityInfo.name;
                console.log(abilityname + " onWindowStageActive")
            },
            onWindowStageInactive(ability, windowStage) {
                let abilityname = ability.context.abilityInfo.name;
                console.log(abilityname + " onWindowStageInactive")
            },
            onWindowStageDestroy(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback3 onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                globalThis.list3.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey3:" + JSON.stringify(globalThis.list3));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                globalThis.list3.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey3:" + JSON.stringify(globalThis.list3));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                globalThis.list3.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey3:" + JSON.stringify(globalThis.list3));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                globalThis.list3.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey3:" + JSON.stringify(globalThis.list3));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                globalThis.list3.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey3:" + JSON.stringify(globalThis.list3));
            }
        }
        globalThis.applicationContext3 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext3.on('abilityLifecycle', AbilityLifecycleCallback);
        globalThis.callbackid3 = lifecycleid;
        console.log("[Demo] registerAbilityLifecycleCallback3 number: " + JSON.stringify(lifecycleid));
    }

    onDestroy() {
        console.log("[Demo] MainAbility3 onDestroy")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility3onDestroy');
        }, 800);
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility3 onWindowStageCreate")
        globalThis.ability3 = this.context

        windowStage.loadContent('TestAbility/pages/index3', (err, data) => {
            if (err.code) {
                console.log('MainAbility3 loadContent error');
                return;
            }
            console.log('MainAbility3 loadContent success');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility3onForeground');
        }, 800);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};
