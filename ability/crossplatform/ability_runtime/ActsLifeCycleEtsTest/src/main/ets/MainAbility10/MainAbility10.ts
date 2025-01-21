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

export default class MainAbility10 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility10 onCreate")
        globalThis.abilityWant10 = want;
        var listKey10 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                listKey10.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey10:" + JSON.stringify(listKey10));
            },
            onWindowStageCreate(ability, windowStage) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                listKey10.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey10:" + JSON.stringify(listKey10));
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
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                listKey10.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey10:" + JSON.stringify(listKey10));
            },
            onAbilityDestroy(ability) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                listKey10.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey10:" + JSON.stringify(listKey10));
            },
            onAbilityForeground(ability) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                listKey10.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey10:" + JSON.stringify(listKey10));
            },
            onAbilityBackground(ability) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                listKey10.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey10:" + JSON.stringify(listKey10));
            },
            onAbilityContinue(ability) {
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback10 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                listKey10.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey10:" + JSON.stringify(listKey10));
            }
        }
        globalThis.applicationContext10 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext10.on('abilityLifecycle', AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback10 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] registerAbilityLifecycleCallback10 listKey: " + JSON.stringify(listKey10));
            globalThis.list10 = listKey10;
            globalThis.callbackid10 = lifecycleid;
        }, 1500);
    }

    onDestroy() {
        console.log("[Demo] MainAbility10 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility10 onWindowStageCreate")
        globalThis.ability10 = this.context;

        windowStage.loadContent('TestAbility/pages/index10', (err, data) => {
            if (err.code) {
                console.log('MainAbility10 loadContent error');
                return;
            }
            console.log('MainAbility10 loadContent success');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility10 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility10 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility10 onBackground")
    }
};
