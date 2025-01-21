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

export default class Hap4MainAbility1 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] Hap4MainAbility1 onCreate")
        globalThis.abilityWant = want;

        setTimeout(()=>{
            this.context.terminateSelf().then((data) => {
                console.log("[Demo] Hap4MainAbility1 terminateSelf windowStage data: " + JSON.stringify(data))
            }).catch((error) => {
                console.log("[Demo] Hap4MainAbility1 terminateSelf windowStage error: " + JSON.stringify(error))
            })
        }, 2000)
    }

    onDestroy() {
        console.log("[Demo] Hap4MainAbility1 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] Hap4MainAbility1 onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/Hap4MainAbility1_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] Hap4MainAbility1 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] Hap4MainAbility1 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] Hap4MainAbility1 onBackground")
    }
};
