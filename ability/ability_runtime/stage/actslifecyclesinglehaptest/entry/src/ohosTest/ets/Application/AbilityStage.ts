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
import AbilityStage from "@ohos.app.ability.AbilityStage";
import commonEvent from '@ohos.commonEvent';

export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.log("[Demo] MyAbilityStage onCreate")
        console.log("[Demo] MyAbilityStage stagecontext: " + JSON.stringify(this.context));
        var listKey = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                listKey.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey:" + JSON.stringify(listKey));
            },
            onWindowStageCreate(ability, windowStage) {
                console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageCreate");
                listKey.push(abilityname + " onWindowStageCreate");
                console.log("[Demo] 2listKey:" + JSON.stringify(listKey));
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
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onWindowStageDestroy");
                listKey.push(abilityname + " onWindowStageDestroy");
                console.log("[Demo] 3listKey:" + JSON.stringify(listKey));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                listKey.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey:" + JSON.stringify(listKey));
                if (abilityname === 'MainAbility2') {
                  commonEvent.publish('MainAbility2_onAbilityDestroy', (err, data) => {
                    console.log('MainAbility2_onAbilityDestroy publish succeed' + JSON.stringify(err) + JSON.stringify(data));
                  })
                }
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                listKey.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey:" + JSON.stringify(listKey));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                listKey.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey:" + JSON.stringify(listKey));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                listKey.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey:" + JSON.stringify(listKey));
            }
        }
        globalThis.applicationContext = this.context.getApplicationContext();
        console.log("[Demo] stage applicationContext: " + JSON.stringify(globalThis.applicationContext));
        let lifecycleid = globalThis.applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] AbilityLifecycleCallback listKey : " + JSON.stringify(listKey));
            globalThis.list = listKey;
            globalThis.callbackid = lifecycleid;
        }, 2000);
    }
}