/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

let printLog1 = "Stage:MainAbility:";
let listPush1 = "Stage_MainAbility_";
let launchWant;
let lastRequestWant;

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info(printLog1 + "onCreate");

    launchWant = this.launchWant
    lastRequestWant = this.lastRequestWant
    commonEvent.publish(listPush1 + "onCreate", (err) => {
      console.info(printLog1 + listPush1 + "onCreate");
    });

    setTimeout(() => {
      this.context.terminateSelf()
        .then((data) => {
          console.info(printLog1 + "terminateSelf data = " + JSON.stringify(data));
        })
        .catch((err) => {
          console.info(printLog1 + "terminateSelf err = " + JSON.stringify(err));
        });
    }, 6000);
  }

  onDestroy() {
    console.info(printLog1 + "onDestroy");

    commonEvent.publish(listPush1 + "onDestroy", (err) => {
      console.info(printLog1 + listPush1 + "onDestroy");
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info(printLog1 + "onWindowStageCreate");

    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.info(printLog1 + "onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.info(printLog1 + "onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.info(printLog1 + "onBackground");
  }

  dump(param) {
    console.info(printLog1 + "dump = " + JSON.stringify(param));
    let CommonEventPublishData = {
      parameters: {
        dumpParam: param,
        lastRequestWant: lastRequestWant,
        launchWant: launchWant
      }
    }
    commonEvent.publish(listPush1 + "Dump", CommonEventPublishData, (err) => {
      console.info(printLog1 + listPush1 + "Dump");
    });

    return ["MainAbility"];
  }
}
