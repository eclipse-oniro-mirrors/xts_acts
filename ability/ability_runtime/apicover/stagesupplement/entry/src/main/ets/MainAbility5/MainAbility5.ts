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

let printLog5 = "Stage:MainAbility5:";
let listPush5 = "Stage_MainAbility5_";

export default class MainAbility5 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info(printLog5 + "onCreate");

    // @ts-ignore
    let isTerminating = this.context.isTerminating();
    let createIsTerminating = {
      parameters: {
        isTerminating: isTerminating
      }
    }
    commonEvent.publish(listPush5 + "onCreate", createIsTerminating, (err) => {
      console.info(printLog5 + listPush5 + "onCreate");
    });

    setTimeout(() => {
      this.context.terminateSelf()
        .then((data) => {
          console.info(printLog5 + "terminateSelf data = " + JSON.stringify(data));
        })
        .catch((err) => {
          console.info(printLog5 + "terminateSelf err = " + JSON.stringify(err));
        });
    }, 3000)
  }

  onDestroy() {
    console.info(printLog5 + "onDestroy");

    // @ts-ignore
    let isTerminating = this.context.isTerminating();
    let destroyIsTerminating = {
      parameters: {
        isTerminating: isTerminating
      }
    }
    commonEvent.publish(listPush5 + "onDestroy", destroyIsTerminating, (err) => {
      console.info(printLog5 + listPush5 + "onDestroy");
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info(printLog5 + "onWindowStageCreate");

    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.info(printLog5 + "onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.info(printLog5 + "onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.info(printLog5 + "onBackground");
  }
}
