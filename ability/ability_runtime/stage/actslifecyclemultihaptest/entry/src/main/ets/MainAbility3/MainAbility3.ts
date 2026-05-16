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
import commonEvent from '@ohos.commonEvent';
import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility3 onCreate")
        globalThis.abilityWant = want;

        var getauxMainAbilityContext = {
            events: ["auxMainAbilityContext"]
        }


        var a;

        function SubscribeCallBackContext(err, data) {
            console.log(" Subscribe CallBack data:" + JSON.stringify(data));
            a = data.parameters;
            if (data.event != "") {
                for (var key in data.parameters) {
                    console.log("data.parameters[key] is :" + data.parameters[key])
                }
            }
        }

        commonEvent.createSubscriber(getauxMainAbilityContext).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            var Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBackContext);
        });

        var listKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                listKey.push(abilityName + " onAbilityCreate");
                console.log("listKey is :" + listKey);
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                listKey.push(abilityName + " onWindowStageCreate");
                console.log("listKey is :" + listKey);
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
                listKey.push(abilityName + " onAbilityForeground");
                console.log("listKey is :" + listKey);
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                listKey.push(abilityName + " onAbilityBackground");
                console.log("listKey is :" + listKey);
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                listKey.push(abilityName + " onWindowStageDestroy");
                console.log("listKey is :" + listKey);
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                listKey.push(abilityName + " onAbilityDestroy");
                console.log("listKey is :" + listKey);
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                listKey.push(abilityName + " onAbilityContinue");
                console.log("listKey is :" + listKey);
            }
        }

        setTimeout(() => {
            console.log("mainAbility3ListKey a is : " + JSON.stringify(a))
            //TODO:
            globalThis.ApplicationContext3 = this.context.getApplicationContext();
            var callBackId = globalThis.ApplicationContext3.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
            console.log("mainAbility3ListKey callBackId is : " + callBackId)
            globalThis.mainAbility3ListKey = listKey
            console.log("mainAbility3ListKey mainAbility3ListKey is : " + globalThis.mainAbility3ListKey)
            globalThis.mainAbility3CallBackId = callBackId
            console.log("mainAbility3ListKey listKey is :" + listKey);
            console.log("mainAbility3ListKey globalThis.callBackId is :" + globalThis.callBackId);
        }, 3000)

    }

    onDestroy() {
        console.log("[Demo] MainAbility3 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility3 onWindowStageCreate")

        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility3_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility3 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility3 onBackground")
    }
};
