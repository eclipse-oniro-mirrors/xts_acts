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

export default class MainAbility extends Ability {

    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.applicationContext = this.context.getApplicationContext();
    }

    onDestroy() {
        console.log("[Demo] MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility_pages", null)
    }

    onWindowStageRestore(windowStage){
      console.log("[Demo] MainAbility onWindowStageRestore")
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }

    onContinue(wantParam){
      console.log("[Demo] MainAbility onContinue")
      return undefined;
    }

    onBackPressed(){
      return false
    }

    onConfigurationUpdate(config) {
        console.log('[Demo] MainAbility onConfigurationUpdate: ' + this.context.config.language)
        console.log('[Demo] MainAbility onConfigurationUpdate: ' + config.language)
        if (globalThis.UpdateConfiguration_0200_prepare_resolve) {
            globalThis.UpdateConfiguration_0200_prepare_resolve();
        }

        if (!globalThis.UpdateConfiguration_0200_resolve) {
            console.log("[Demo] MainAbility invalid resolve")
            return;
        }

        if (!globalThis.UpdateConfiguration_0200_reject) {
            console.log("[Demo] MainAbility invalid reject")
            return;
        }

        if (this.context.config.language == "English" && config.language == "zh-Hans") {
            globalThis.UpdateConfiguration_0200_resolve();
        } else {
            globalThis.UpdateConfiguration_0200_reject();
        }
    }
};
