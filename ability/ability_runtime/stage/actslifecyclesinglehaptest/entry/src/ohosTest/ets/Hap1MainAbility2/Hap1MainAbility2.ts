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

export default class Hap1MainAbility2 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] Hap1MainAbility2 onCreate")
        globalThis.ability2Hap1Want = want;
        globalThis.ability2Hap1 = this.context;
    }

    onDestroy() {
        console.log("[Demo] Hap1MainAbility2 onDestroy");
        setTimeout(function () {
          commonEvent.publish('Hap1MainAbility2_onDestroy', (err, data) => {
            console.log(' Hap1MainAbility2 onDestroy publish succeed' + JSON.stringify(err) + JSON.stringify(data));
          })
        }, 500);
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] Hap1MainAbility2 onWindowStageCreate")

        windowStage.setUIContent(this.context, "MainAbility/pages/indexh1a2", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] Hap1MainAbility2 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] Hap1MainAbility2 onForeground");
        setTimeout(function () {
          globalThis.ability2Hap1.terminateSelf().then((data) => {
            console.log("Hap1MainAbility2 EventTest terminateSelf data: " + JSON.stringify(data));
        }).catch((error) => {
            console.log("Hap1MainAbility2 EventTest terminateSelf error: " + JSON.stringify(error));
        })
        }, 500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] Hap1MainAbility2 onBackground")
    }
};