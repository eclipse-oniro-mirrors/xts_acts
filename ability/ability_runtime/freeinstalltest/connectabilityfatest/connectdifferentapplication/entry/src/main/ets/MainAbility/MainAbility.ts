/**
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

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] diffentry MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        console.log("[Demo] diffentry MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] diffentry MainAbility onWindowStageCreate")
        globalThis.different = this.context;
        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] diffentry MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] diffentry MainAbility onForeground")
        setTimeout(function () {
            globalThis.different.terminateSelf()
                .then((data) => {
                    console.info('[Demo] myapp2 terminateself succeeded: ' + data);
                }).catch((error) => {
                console.error('[Demo] myapp2 terminateself failed. Cause: ' + error);
            })
        }, 3200);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] diffentry MainAbility onBackground")
    }
};
