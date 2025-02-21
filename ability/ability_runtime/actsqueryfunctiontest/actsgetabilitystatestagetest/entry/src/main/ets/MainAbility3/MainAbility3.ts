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

function publishCallBackOne() {
  console.log("====MainAbility3 Publish CallBack GetCurrentTopAbility");
}
export default class MainAbility3 extends Ability {

    onCreate(want, launchParam) {
        console.log("MainAbility3 onCreate")
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("MainAbility3 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("MainAbility3 onWindowStageCreate");
        windowStage.setUIContent(this.context, "pages/index", null);
        globalThis.ability3Context = this.context;
        windowStage.on('windowStageEvent', (data) => {
          console.log(`ActsGetAbilityStatestAgeTest onWindwoStageMainAbilty3 is : ${JSON.stringify(data)}`);
          if (data == 2 ) {
            console.log(`ActsGetAbilityStatestAgeTest getWindowStageActiveMainAbility3 is sucess`);
            commonEvent.publish("GetCurrentTopAbility", publishCallBackOne);
          }
        })
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("MainAbility3 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("MainAbility3 onBackground")
    }
};
