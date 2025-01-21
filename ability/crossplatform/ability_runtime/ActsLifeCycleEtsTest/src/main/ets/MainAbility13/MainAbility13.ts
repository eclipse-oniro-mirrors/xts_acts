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

export default class MainAbility13 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility13 onCreate")
        globalThis.abilityWant1 = want;
        console.log("[Demo] MainAbility13 context: " + JSON.stringify(this.context));
        globalThis.list13 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                globalThis.list13.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey1:" + JSON.stringify(globalThis.list13));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                globalThis.list13.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey1:" + JSON.stringify(globalThis.list13));
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
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                globalThis.list13.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey1:" + JSON.stringify(globalThis.list13));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                globalThis.list13.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey1:" + JSON.stringify(globalThis.list13));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                globalThis.list13.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey1:" + JSON.stringify(globalThis.list13));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                globalThis.list13.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey1:" + JSON.stringify(globalThis.list13));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                globalThis.list13.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey1:" + JSON.stringify(globalThis.list13));
            }
        }

        globalThis.otherList13 = [];
        let AbilityLifecycleCallback2 = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                globalThis.otherList13.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey2:" + JSON.stringify(globalThis.otherList13));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                globalThis.otherList13.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey2:" + JSON.stringify(globalThis.otherList13));
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
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                globalThis.otherList13.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey2:" + JSON.stringify(globalThis.otherList13));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                globalThis.otherList13.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey2:" + JSON.stringify(globalThis.otherList13));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                globalThis.otherList13.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey2:" + JSON.stringify(globalThis.otherList13));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                globalThis.otherList13.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey2:" + JSON.stringify(globalThis.otherList13));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                globalThis.otherList13.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey2:" + JSON.stringify(globalThis.otherList13));
            }
        }

        globalThis.ability13 = this.context;
        globalThis.applicationContext13 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext13.on('abilityLifecycle', AbilityLifecycleCallback);
        globalThis.callbackid13 = lifecycleid;
        let lifecycleid2 = globalThis.applicationContext13.on('abilityLifecycle', AbilityLifecycleCallback2);
        console.log("[Demo] registerAbilityLifecycleCallback1 number: " + JSON.stringify(lifecycleid));
        globalThis.otherCallbackid13 = lifecycleid2;
    }

    onDestroy() {
        console.log("[Demo] MainAbility13 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility13 onWindowStageCreate")
        globalThis.ability1context = this.context;

        windowStage.loadContent('TestAbility/pages/index1', (err, data) => {
            if (err.code) {
                console.log('MainAbility13 loadContent error');
                return;
            }
            console.log('MainAbility13 loadContent success');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility13 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility13 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility13 onBackground")
    }
};
