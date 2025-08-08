/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';

let printLog4 = "Stage:MainAbility4:";
let listPush4 = "Stage_MainAbility4_";
function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
export default class MainAbility4 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info(printLog4 + "onCreate");

    let screenDensity = this.context.config.screenDensity;
    let CommonEventPublishData = {
      parameters: {
        screenDensity: screenDensity
      }
    }
    commonEvent.publish(listPush4 + "onCreate", CommonEventPublishData, (err) => {
      console.info(printLog4 + listPush4 + "onCreate");
    });

    setTimeout(() => {
      this.context.terminateSelf()
        .then((data) => {
          console.info(printLog4 + "terminateSelf data = " + JSON.stringify(data));
        })
        .catch((err) => {
          console.info(printLog4 + "terminateSelf err = " + JSON.stringify(err));
        });
    }, 2000);
  }

  async onDestroy(): Promise<void>{
    console.info(printLog4 + "onDestroy")

    commonEvent.publish(listPush4 + "onDestroy", (err) => {
      console.info(printLog4 + listPush4 + "onDestroy");
    });
    await sleep(1000);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info(printLog4 + "onWindowStageCreate");

    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.info(printLog4 + "onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.info(printLog4 + "onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.info(printLog4 + "onBackground");
  }
}
