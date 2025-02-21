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
import Ability from '@ohos.app.ability.UIAbility';
import commonEvent from '@ohos.commonEvent';

export default class MainAbility1 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility1 onCreate")
        globalThis.abilityWant1 = want;
        console.log("[Demo] MainAbility1 context: " + JSON.stringify(this.context));
        var listKey1 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                listKey1.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey1:" + JSON.stringify(listKey1));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                listKey1.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey1:" + JSON.stringify(listKey1));
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
                listKey1.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                listKey1.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey1:" + JSON.stringify(listKey1));
                if (abilityname === 'MainAbility2') {
                  commonEvent.publish('MainAbility2_onAbilityDestroy', (err, data) => {
                    console.log('MainAbility2_onAbilityDestroy publish succeed' + JSON.stringify(err) + JSON.stringify(data));
                  })
                }
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                listKey1.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                listKey1.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                listKey1.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey1:" + JSON.stringify(listKey1));
            }
        }
        globalThis.applicationContext1 = this.context.getApplicationContext();
        let lifecycleid = globalThis.applicationContext1.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback1 number: " + JSON.stringify(lifecycleid));
        console.log("[Demo] registerAbilityLifecycleCallback1 listKey: " + JSON.stringify(listKey1));
        globalThis.list1 = listKey1;
        globalThis.callbackid1 = lifecycleid;
    }

    onDestroy() {
        console.log("[Demo] MainAbility1 onDestroy");
        setTimeout(function () {
          commonEvent.publish('MainAbility1_onDestroy', (err, data) => {
            console.log('MainAbility1 onDestroy publish succeed' + JSON.stringify(err) + JSON.stringify(data));
          })
        }, 500);
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility1 onWindowStageCreate")
        globalThis.ability1context = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/index1", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility1 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility1 onForeground");
        setTimeout(function () {
          commonEvent.publish('MainAbility1_onForground', (err, data) => {
            console.log('MainAbility1 onForeground publish succeed' + JSON.stringify(err) + JSON.stringify(data));
          })
      }, 500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility1 onBackground")
    }
};
