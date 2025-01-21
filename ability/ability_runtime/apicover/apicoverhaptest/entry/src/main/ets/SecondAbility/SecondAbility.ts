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
import commonEvent from '@ohos.commonEvent';
export default class SecondAbility extends Ability {

    onCreate(want, launchParam) {
        console.log("[Demo] SecondAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.applicationContext = this.context.getApplicationContext();
        globalThis.SecondLaunchParm = launchParam;
    }

    onDestroy() {
        console.log("[Demo] SecondAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] SecondAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;
        windowStage.setUIContent(this.context, "SecondAbility/pages/MainAbility_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] SecondAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] SecondAbility onForeground")
        var CommonEventPublishData = {
            parameters: {
                "Life": "onForeground"
            }
        }
        commonEvent.publish("Form_StartAbility", CommonEventPublishData, (err) => {
            console.info("Form_StartAbility onCreate");
        });
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] SecondAbility onBackground")
    }
};
