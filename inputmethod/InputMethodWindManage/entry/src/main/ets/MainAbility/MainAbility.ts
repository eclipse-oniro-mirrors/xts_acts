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

export default class MainAbility extends Ability {
    onCreate(want,launchParam){
        // Ability is creating, initialize resources for this ability
        console.info("ImExtAbility onCreate");
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.info("ImExtAbility onDestroy");
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.info("ImExtAbility onWindowStageCreate");
        globalThis.abilityContext = this.context;
        windowStage.setUIContent(this.context, "pages/index/index", null);
        console.info("ImExtAbility onWindowStageCreate finish");
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.info("ImExtAbility onWindowStageDestroy");
    }

    onForeground() {
        // Ability has brought to foreground
        console.info("ImExtAbility onForeground");
    }

    onBackground() {
        // Ability has back to background
        console.info("ImExtAbility onBackground");
    }
};