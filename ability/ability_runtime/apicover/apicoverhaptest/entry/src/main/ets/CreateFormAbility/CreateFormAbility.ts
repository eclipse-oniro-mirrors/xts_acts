/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
export default class CreateFormAbility extends Ability {

    onCreate(want, launchParam) {
        console.log("[Demo] CreateFormAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.applicationContext = this.context.getApplicationContext();
        globalThis.isCreateForm = want.parameters["createForm"];
    }

    onDestroy() {
        console.log("[Demo] CreateFormAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] CreateFormAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;
        windowStage.setUIContent(this.context, "CreateFormAbility/pages/MainAbility_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] CreateFormAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] CreateFormAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] SecondAbility onBackground")
    }
};