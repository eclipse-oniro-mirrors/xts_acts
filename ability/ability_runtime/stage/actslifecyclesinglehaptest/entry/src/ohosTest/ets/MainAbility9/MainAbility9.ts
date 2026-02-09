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

export default class MainAbility9 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility9 onCreate")
        globalThis.abilityWant9 = want;
        let listKey9 = [];
        let abilityName = "";
        let count = 0;
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                listKey9.push(abilityName + " onAbilityCreate");
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                listKey9.push(abilityName + " onWindowStageCreate");
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
                listKey9.push(abilityName + " onAbilityForeground");
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                listKey9.push(abilityName + " onAbilityBackground");
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                listKey9.push(abilityName + " onWindowStageDestroy");
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                listKey9.push(abilityName + " onAbilityDestroy");
                if (abilityName === 'Hap1MainAbility2') {
                  count++;
                }
                if (count === 2) {
                  commonEvent.publish('Hap1MainAbility2_onAbilityDestroy', (err, data) => {
                    console.log('Hap1MainAbility2 onForeground publish succeed' + JSON.stringify(err) + JSON.stringify(data));
                  })
                }
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                listKey9.push(abilityName + " onAbilityContinue");
            }
        }
        globalThis.applicationContext9 = this.context.getApplicationContext();
        let callBackId = globalThis.applicationContext9
            .registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        globalThis.mainAbility9ListKey = listKey9
        globalThis.mainAbility9CallBackId = callBackId
        console.log("listKey is :" + listKey9);
        console.log("callBackId is :" + callBackId);
    }

    onDestroy() {
        console.log("[Demo] MainAbility9 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility9 onWindowStageCreate");
        globalThis.ability9 = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/index9", null);
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility9 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility9 onForeground");
        setTimeout(function () {
          commonEvent.publish('MainAbility9_onForground', (err, data) => {
            console.log('MainAbility9 onForeground publish succeed' + JSON.stringify(err) + JSON.stringify(data));
          })
        }, 500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility9 onBackground")
    }
};
