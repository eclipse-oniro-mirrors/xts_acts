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

let abilityName = null;
function recordLife(ownList, abilityName, lifeName) {
    ownList.push(abilityName + ' ' + lifeName);
}

export default class MainAbility2 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility2 onCreate")
        abilityName = want.abilityName
        globalThis.list2 = [];
        recordLife(globalThis.list2, abilityName, 'onCreate');
    }

    onDestroy() {
        console.log("[Demo] MainAbility2 onDestroy")
        recordLife(globalThis.list2, abilityName, 'onDestroy');
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility2 onWindowStageCreate")
        globalThis.ability2context = this.context;
        recordLife(globalThis.list2, abilityName, 'onWindowStageCreate');

        windowStage.loadContent('TestAbility/pages/Index2', (err, data) => {
            if (err.code) {
                console.log('MainAbility2 loadContent error');
                return;
            }
            console.log('MainAbility2 loadContent success');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility2 onWindowStageDestroy")
        recordLife(globalThis.list2, abilityName, 'onWindowStageDestroy');
    }

    onForeground() {
        console.log("[Demo] MainAbility2 onForeground")
        recordLife(globalThis.list2, abilityName, 'onForeground');
        setTimeout(function () {
            console.log("[Demo] MainAbility2 onForeground after 1500ms")
            globalThis.ability2context.terminateSelf()
                .then((data) => {
                    console.info('[Demo] MainAbility2 terminateself succeeded: ' + data);
                }).catch((error) => {
                console.error('[Demo] MainAbility2 terminateself failed. Cause: ' + error);
            })
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility2 onBackground")
        recordLife(globalThis.list2, abilityName, 'onBackground');
    }
};
