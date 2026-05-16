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

export default class MainAbility5 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility5 onCreate")
        globalThis.abilityWant = want;
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility5.onCreate", ()=>{
                console.log("[Demo] MainAbility5 onCreate")
            });
        }, 1500)
    }

    onDestroy() {
        console.log("[Demo] MainAbility5 onDestroy")
        setTimeout(()=>{
            commonEvent.publish("com.example.windowstagelifecycle_xts.MainAbility5.onDestroy", ()=>{
                console.log("[Demo] MainAbility5 onDestroy")
            });
        }, 1500)
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility5 onWindowStageCreate")
        globalThis.ability5 = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/index5", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility5 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility5 onForeground")
        setTimeout(function () {
            globalThis.ability5.terminateSelf()
                .then((data) => {
                    console.info('[Demo] MainAbility5 terminateself succeeded: ' + data);
                }).catch((error) => {
                console.error('[Demo] MainAbility5 terminateself failed. Cause: ' + error);
            })
        }, 2000);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility5 onBackground")
    }
};
